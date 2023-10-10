Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE960CD80CB
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 12:55:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.90238.1696942505144793271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 05:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767CF106F;
	Tue, 10 Oct 2023 05:55:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F2D13F762;
	Tue, 10 Oct 2023 05:55:04 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 3/4] busybox-inittab: fix console handling
Date: Tue, 10 Oct 2023 13:54:57 +0100
Message-Id: <20231010125458.167900-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010125458.167900-1-ross.burton@arm.com>
References: <20231010125458.167900-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 12:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188890

From: Ross Burton <ross.burton@arm.com>

A testing failure meant that the inittab changes made in 6c65544 didn't
actually work.

A copy-paste problems meant that start_getty was being invoked instead
of getty, but start_getty is sysvinit-inittab-specific. Revert this
inittab to calling getty directly.

Remove the terminal type, this wasn't specified in the original inittab.

Busybox's init has non-standard behaviour for the inittab's ID field.
With SysV this is a four-character identifier and nothing more, but with
busybox init this is the controlling terminal (minus /dev).  If the
terminal doesn't exist then busybox doesn't gracefully handle the
failure but instead repeatedly fails to spawn.

As getty will immediately issue a setsid() this isn't needed for getty
entries, so the ID can be empty and ttyrun does the terminal detection.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/busybox/busybox-inittab_1.36.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb b/meta/r=
ecipes-core/busybox/busybox-inittab_1.36.1.bb
index 462c9bb9c5f..8ee88b6aeff 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
@@ -23,7 +23,7 @@ do_install() {
         device=3D$(echo $s | cut -d\; -f 2)
         label=3D$(echo $device | sed -e 's/tty//' | tail --bytes=3D5)
=20
-        echo "$label::respawn:${sbindir}/ttyrun $device ${base_bindir}/s=
tart_getty $speed $device vt102" >> ${D}${sysconfdir}/inittab
+        echo "::respawn:${sbindir}/ttyrun $device ${base_sbindir}/getty =
$speed $device" >> ${D}${sysconfdir}/inittab
     done
=20
 	if [ "${USE_VT}" =3D "1" ]; then
--=20
2.34.1


