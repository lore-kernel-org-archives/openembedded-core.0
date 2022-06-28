Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6390DC43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 13:29:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.55352.1656422977014859154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C57D4152B;
	Tue, 28 Jun 2022 06:29:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 256F03F5A1;
	Tue, 28 Jun 2022 06:29:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] busybox: fix CVE-2022-30065
Date: Tue, 28 Jun 2022 14:29:34 +0100
Message-Id: <20220628132934.1024433-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 13:29:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167337

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../busybox/busybox/CVE-2022-30065.patch      | 29 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-30065.patc=
h

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch b/met=
a/recipes-core/busybox/busybox/CVE-2022-30065.patch
new file mode 100644
index 00000000000..25ad653b256
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
@@ -0,0 +1,29 @@
+Fix use-after-free in awk.
+
+CVE: CVE-2022-30065
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2=
022-June/089768.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+fixes https://bugs.busybox.net/show_bug.cgi?id=3D14781
+
+Signed-off-by: Natanael Copa <ncopa at alpinelinux.org>
+---
+ editors/awk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 079d0bde5..728ee8685 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -3128,6 +3128,9 @@ static var *evaluate(node *op, var *res)
+=20
+ 		case XC( OC_MOVE ):
+ 			debug_printf_eval("MOVE\n");
++			/* make sure that we never return a temp var */
++			if (L.v =3D=3D TMPVAR0)
++				L.v =3D res;
+ 			/* if source is a temporary string, jusk relink it to dest */
+ 			if (R.v =3D=3D TMPVAR1
+ 			 && !(R.v->type & VF_NUMBER)
+--=20
+2.36.1
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.35.0.bb
index f2f1b35902d..edf896485ec 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys=
-ne.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characte=
rs-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printa=
ble.patch \
+           file://CVE-2022-30065.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
=20
--=20
2.25.1


