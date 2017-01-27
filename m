Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3477B774C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 22:29:21 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 194so25964458pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZRwJsiOQu2OaDlxRWGwwzucj38IjxXh0Rb8GtxBJlhs=;
	b=OsbyeRrYMyvs++SUsCsTeX3orSh3FEDuFfKRIFaJhh5kOXZxXd3sC9QYXHTZaRYc97
	vXQLtcPz666TnpZyiIV/1fDrY9wh1SKE0fxpaxVSQGscA/Kk0PFs00/WXtfRuGR0nhWe
	zGbZsv/9rizXDqWYOMMOW91TgiyuodymuimpHtPI5YnYe+wva3BAdkwVCHGF4PYESmIr
	XQdlhWgxl5Bp4DCKTH0FU7ilL2BCZwYmqUOQ5Bu9QRMtRMFMIlUhkUQQ2oAy3s1ZeNGW
	DD37rr+1wEcNCK9Vj5vrytac/4J5i6Lisc2Gco+t440zbfeQKMNa+F11T86qEz1b6NPy
	TvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZRwJsiOQu2OaDlxRWGwwzucj38IjxXh0Rb8GtxBJlhs=;
	b=hrJc2rAo3ZOF658aeD/rtc4hC9Z0iRBRaKwKwd+aYFOEoVC60NRlLSl4j0yGXLqxs6
	sGnTI4/BcVn6fgC2/tFwz7VC6aqO9+vcXbjLavRWMT91AOT2uNJP+rwU4Gz2bLYroznX
	vxisTjh5mvXV/LtsibuKFDIyHhdQwzoXOMkc43Okp5RWyPtDPoxPPBUSNETNFHgKvnAm
	URJZqSkL8fLiAO/E4pfDzqCiCdW9bNb6cS4ExTTFAwmKhhGpAMjuoerAWL94MEs/ReIl
	h36++mRWdDV5tb2D3ITUFJU1Ge3ETlrhiTOvvrbRL6g3j/15fR7O/9/RgHbdmFSI8qlx
	+Zcw==
X-Gm-Message-State: AIkVDXJ3b5TFai1G6+dBEw4jrOa0ym8DsC2I1ytCgAF4Fp+dF1BSPdtG4e98BTU2yAGRyg==
X-Received: by 10.84.216.91 with SMTP id f27mr15412624plj.92.1485556162566;
	Fri, 27 Jan 2017 14:29:22 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z70sm13688851pff.26.2017.01.27.14.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 14:29:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 14:29:10 -0800
Message-Id: <1485556151-9063-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] bitbake.conf: replace USE_LDCONFIG with new "ldconfig" distro feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2017 22:29:22 -0000

USE_LDCONFIG could previously be set to 0 by distros which do not
require ldconfig or ld.so.conf on the target. Since more and more
recipes may need to respect that option, replace the ad-hoc variable
with a distro feature.

Distros which previously set:

  USE_LDCONFIG = "0"

Should now instead use:

  DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass              | 5 +----
 meta/conf/bitbake.conf                    | 2 +-
 meta/recipes-core/glibc/glibc-package.inc | 9 +++------
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ac2d71c..d5c2d82 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1618,10 +1618,7 @@ python package_do_shlibs() {
     else:
         snap_symlinks = False
 
-    if (d.getVar('USE_LDCONFIG') or "1") == "1":
-        use_ldconfig = True
-    else:
-        use_ldconfig = False
+    use_ldconfig = bb.utils.contains('DISTRO_FEATURES', 'ldconfig', True, False, d)
 
     needed = {}
     shlib_provider = oe.package.read_shlib_providers(d)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e421650..01fd144 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -769,7 +769,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 481a00e..bb8dc2d 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -14,9 +14,6 @@ python __anonymous () {
                                    d.getVar('TARGET_OS'))
 }
 
-# Set this to zero if you don't want ldconfig in the output package
-USE_LDCONFIG ?= "1"
-
 INHIBIT_SYSROOT_STRIP = "1"
 
 PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode ${PN}-utils glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
@@ -37,7 +34,7 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
+FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
@@ -96,8 +93,8 @@ do_install_append () {
 		rm -f ${D}${infodir}/dir
 	fi
 
-	if [ "${USE_LDCONFIG}" != "1" ]; then
-		# We won't ship these files (see FILES above) so let's not install them
+	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', 'true', 'false', d)}; then
+		# The distro doesn't want these files so let's not install them
 		rm -f ${D}${sysconfdir}/ld.so.conf
 		rm -f ${D}${base_sbindir}/ldconfig
 		# This directory will be empty now so remove it too.
-- 
1.9.1


