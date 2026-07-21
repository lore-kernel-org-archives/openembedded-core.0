Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9BCC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:15:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26891.1784650522225123601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QwKETc4v;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C858152B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:15:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 720C63F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784650521; bh=ntWYYhMI9tyhX6KJ1PSPFU/vjw9SUPI/I2zr+WP4HnA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QwKETc4v7jowsffz1OHVHtPXSAOH+T1366s9jDAVEU4H2ZBgZnTAhXdmaectMIORF
	 Y5iwWkvwnGmH2i7qugIeRWnShdDer6GaaYytCh9n5yAedENMDVOpLsSHhfkd9YsdJO
	 DU0CMYhRziV/T2JIBmEeufGn8ejMngLl/zvRTPDM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd: no need to use qemu for hwdb update
Date: Tue, 21 Jul 2026 17:15:11 +0100
Message-ID: <20260721161511.2946619-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721161511.2946619-1-ross.burton@arm.com>
References: <20260721161511.2946619-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 16:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241556

Now that systemd-tools-native gives us a native systemd-hwdb, and the
database format is known to be hardware-agnostic, we can simply run
systemd-hwdb directly instead of running it inside qemu-user if we're
using systemd instead of eudev.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_259.5.bb   |  6 ++----
 scripts/postinst-intercepts/update_udev_hwdb | 18 +++++++++---------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
index 858605d9a4d..0bd67b56523 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -915,12 +915,10 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
=20
-PACKAGE_WRITE_DEPS +=3D "qemuwrapper-cross"
-
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=3D$=
{MLPREFIX} binprefix=3D${MLPREFIX} \
-			rootlibexecdir=3D"${nonarch_libdir}" PREFERRED_PROVIDER_udev=3D"${PRE=
FERRED_PROVIDER_udev}" base_bindir=3D"${base_bindir}"
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=3D$=
{MLPREFIX} \
+			PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
 	else
 		systemd-hwdb update
 	fi
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/posti=
nst-intercepts/update_udev_hwdb
index 8b3f5de791f..5b84adfe872 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -7,19 +7,19 @@ set -e
=20
 case "${PREFERRED_PROVIDER_udev}" in
 	systemd)
-		UDEV_EXTRA_ARGS=3D"--usr"
-		UDEVLIBDIR=3D"${rootlibexecdir}"
-		UDEVADM=3D"${base_bindir}/udevadm"
+		echo Updating HWDB with native systemd-hwdb...
+		systemd-hwdb update --root $D --usr
 		;;
=20
 	*)
-		UDEV_EXTRA_ARGS=3D""
+		echo Updating HWDB with udevadm...
+
 		UDEVLIBDIR=3D"${sysconfdir}"
 		UDEVADM=3D"${bindir}/udevadm"
+
+		rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
+		PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --up=
date --root $D ||
+			PSEUDO_UNLOAD=3D1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root=
 $D
+		chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
 		;;
 esac
-
-rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
-PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --upda=
te --root $D ${UDEV_EXTRA_ARGS} ||
-	PSEUDO_UNLOAD=3D1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $=
D ${UDEV_EXTRA_ARGS}
-chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
--=20
2.43.0


