Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF196E81DE0
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:22:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10249.1696591324085231713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E878AC15;
	Fri,  6 Oct 2023 04:22:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CECD3F5A1;
	Fri,  6 Oct 2023 04:22:03 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/4] sysvinit-initab: rewrite loop to generate inittab
Date: Fri,  6 Oct 2023 12:21:58 +0100
Message-Id: <20231006112201.1081909-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188757

From: Ross Burton <ross.burton@arm.com>

Instead of one-letter variables and arcane sed expressions, use English
words and 'cut'.

(From OE-Core rev: de9833792dd0cfac6f17d5c733c263b976e89cf6)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/met=
a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index b1f9cb4caa6..e70dc705c05 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -21,14 +21,14 @@ do_install() {
     install -m 0755 ${WORKDIR}/start_getty ${D}${base_bindir}/start_gett=
y
     sed -e 's,/usr/bin,${bindir},g' -i ${D}${base_bindir}/start_getty
=20
-    set -x
-    tmp=3D"${SERIAL_CONSOLES}"
-    for i in $tmp
+    CONSOLES=3D"${SERIAL_CONSOLES}"
+    for s in $CONSOLES
     do
-	j=3D`echo ${i} | sed s/\;/\ /g`
-	l=3D`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
-	label=3D`echo $l | sed 's/.*\(....\)/\1/'`
-	echo "$label:12345:respawn:${base_bindir}/start_getty ${j} vt102" >> ${=
D}${sysconfdir}/inittab
+        speed=3D$(echo $s | cut -d\; -f 1)
+        device=3D$(echo $s | cut -d\; -f 2)
+        label=3D$(echo $device | sed -e 's/tty//' | tail --bytes=3D5)
+
+        echo "$label:12345:respawn:${base_bindir}/start_getty $speed $de=
vice vt102" >> ${D}${sysconfdir}/inittab
     done
=20
     if [ "${USE_VT}" =3D "1" ]; then
--=20
2.34.1


