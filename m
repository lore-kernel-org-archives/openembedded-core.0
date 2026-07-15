Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48CDC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:02:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3736.1784113365206999285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hzAD/c+y;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A1E31477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 302FF3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784113364; bh=WnY5NkA1omx482xZFMF31erRB/ZMJ1um/l9MUB3ryJM=;
	h=From:To:Subject:Date:From;
	b=hzAD/c+ykaS/tQwb5bRRgOdtjf2fH5wGT6CSE4kf+3n+C6XYsa7d7DPw3PYnj8+mt
	 7wXB8qE/2hkJcHpRbcK3LQrj8QAYIFCPbiQpst/PsAEXRDEhtcUJmoDdHVGX9EDIjA
	 yIqF18WjzyPJrTA0eKxP0PHl6xE1Z8q+fIoaw9nA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] base-files: remove LSB-specific overrides
Date: Wed, 15 Jul 2026 12:02:34 +0100
Message-ID: <20260715110237.1692760-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240944

The linuxstdbase override was used by the poky-lsb distribution, which
aimed to be compatible with the Linux Standard Base specification.

LSB is long-dead and poky-lsb was removed back in 2018 with the thud
release[1].

Clarify the recipe by deleting these obsolete and unused assignments.

[1] meta-yocto 00fdefff55 ("poky-altcfg: Replace poky-lsb with poky-altcf=
g")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../base-files/base-files_3.0.14.bb             | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
index 99ac19eb58f..0cd6600782f 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -47,13 +47,6 @@ dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir}=
 ${base_libdir} \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
=20
-dirs755-lsb =3D "${servicedir} \
-               ${prefix}/local ${prefix}/local/bin ${prefix}/local/games=
 \
-               ${prefix}/local/include ${prefix}/local/lib ${prefix}/loc=
al/sbin \
-               ${prefix}/local/share ${prefix}/local/src \
-               ${prefix}/lib/locale"
-dirs2775-lsb =3D "${localstatedir}/mail"
-
 volatiles =3D "${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs=
-perms-volatile-log.txt', 'log', '', d)} \
              ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-p=
erms-volatile-tmp.txt', 'tmp', '', d)}"
 conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
@@ -145,16 +138,6 @@ do_install_basefilesissue () {
 }
 do_install_basefilesissue[vardepsexclude] +=3D "DATE"
=20
-do_install:append:linuxstdbase() {
-	for d in ${dirs755-lsb}; do
-                install -m 0755 -d ${D}$d
-        done
-
-	for d in ${dirs2775-lsb}; do
-                install -m 2775 -d ${D}$d
-        done
-}
-
 SYSROOT_DIRS +=3D "${sysconfdir}/skel"
=20
 PACKAGES =3D "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
--=20
2.43.0


