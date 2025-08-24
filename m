Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59377CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 16:56:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.20475.1756054575507248603
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 09:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aKL8NP99;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250824165610f5298129e232f86a71-bweyzj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250824165610f5298129e232f86a71
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 18:56:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8oYGSmxQfg+LAOmSaygDwDvu+4YTI2LLSYVUgremgNo=;
 b=aKL8NP99lYy49fW6PLZrHluQIyMF4/74NkzF7c1tBTmfGzRdeM2uidWcC+CYwR1/ynYax6
 XKDlIK7vrcZBaShlSX11dSaPsZHLehhIhT52WxBTlVbGhfIqKHz42nNq9FpwWj7kDtNJNine
 1i2T15fncD+fG0KFWKFeLI0oMxF0FZ66XvYPBX+MKZB1FaBGLKWezRsG3gUota0ou1CRJOzT
 +olbG1Z4HMQPc3DXeIG4mxcefKAAeOMmLu+0yfBqYjlWWHJ67thDrZRyt/NIYWy5Uq2BnU01
 hzp3dF+j2cPO/jhYw/uhvckeKp1Kow/XZIGtZnngWF5IN8Ic6IRShTEg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] recipes: cleanup CVE_STATUS which are resolved now
Date: Sun, 24 Aug 2025 18:55:22 +0200
Message-Id: <20250824165523.1114365-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 16:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222389

From: Peter Marko <peter.marko@siemens.com>

The don't show up in CVE metrics anymore since they were either fixed
upstream or recipe version was upgraded meanwhile.

* bind CVE-2019-6470: cpe got corrected in nvd db
* libxml2 CVE-2023-45322: version is now higher than NVD cpe
* zlib CVE-2023-45853: version is now higher than NVD cpe
* gcc CVE-2021-37322: version is now higher than NVD cpe
* python3
  * CVE-2007-4559: version is now higher than NVD cpe
  * CVE-2019-18348: version is now higher than NVD cpe
  * CVE-2020-15523: version is now higher than NVD cpe
  * CVE-2022-26488: version is now higher than NVD cpe
  * CVE-2015-20107: version is now higher than NVD cpe
  * CVE-2023-36632: version is now higher than NVD cpe
* rust
  * CVE-2024-24576: NVD has no cpe, but we have newer version as fix
  * CVE-2024-43402: version is now higher than NVD cpe
* cups CVE-2021-25317: version is now higher than NVD cpe
* ghostscript CVE-2023-38559: version is now higher than NVD cpe
* libtirpc CVE-2021-46828: version is now higher than NVD cpe
* unzip CVE-2008-0888: version is now higher than NVD cpe
* ffmpeg CVE-2023-39018: cpe got corrected in nvd db
* libxslt CVE-2022-29824: version is now higher than NVD cpe
* libyaml
  * CVE-2024-35325: CVE is now rejected in NVD DB
  * CVE-2024-35326: CVE is now rejected in NVD DB
  * CVE-2024-35328: CVE is now rejected in NVD DB

Also add comment for iputils regarding reports for FKIE/NVD2.

Also remove some trailing spaces in python recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/bind/bind_9.20.11.bb     |  4 ----
 meta/recipes-core/libxml/libxml2_2.14.5.bb         |  3 ---
 meta/recipes-core/zlib/zlib_1.3.1.bb               |  2 --
 meta/recipes-devtools/gcc/gcc-15.2.inc             |  1 -
 meta/recipes-devtools/python/python3_3.13.7.bb     | 14 +++-----------
 meta/recipes-devtools/rust/rust-source.inc         |  3 ---
 meta/recipes-extended/cups/cups.inc                |  1 -
 .../ghostscript/ghostscript_10.05.1.bb             |  1 -
 meta/recipes-extended/iputils/iputils_20250605.bb  |  1 +
 meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb   |  2 --
 meta/recipes-extended/unzip/unzip_6.0.bb           |  2 --
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb     |  7 -------
 meta/recipes-support/libxslt/libxslt_1.1.43.bb     |  2 --
 meta/recipes-support/libyaml/libyaml_0.2.5.bb      |  4 ----
 14 files changed, 4 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.11.bb b/meta/recipes-connectivity/bind/bind_9.20.11.bb
index 8d230f6e95..832ab3fdcd 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.11.bb
@@ -26,10 +26,6 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(\d*[02468])+(\.\d+)+(-P\d+)*)/"
 
-# Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
-# so the issue doesn't affect us.
-CVE_STATUS[CVE-2019-6470] = "not-applicable-config: Issue only affects dhcpd with recent bind versions and we don't ship dhcpd anymore."
-
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-alternatives
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
diff --git a/meta/recipes-core/libxml/libxml2_2.14.5.bb b/meta/recipes-core/libxml/libxml2_2.14.5.bb
index f60a46e187..e82fa16fe1 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.5.bb
@@ -24,9 +24,6 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
 SRC_URI[archive.sha256sum] = "03d006f3537616833c16c53addcdc32a0eb20e55443cba4038307e3fa7d8d44b"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
-# Disputed as a security issue, but fixed in d39f780
-CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail"
-
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python"
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index a313e5aed1..592b7f1422 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -49,7 +49,5 @@ do_install_ptest() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-CVE_STATUS[CVE-2023-45853] = "not-applicable-config: we don't build minizip"
-
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
index 41e4c004dd..452879fa91 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -111,5 +111,4 @@ EXTRA_OECONF_INITIAL = "\
     --disable-libssp \
 "
 
-CVE_STATUS[CVE-2021-37322] = "cpe-incorrect: Is a binutils 2.26 issue, not gcc"
 CVE_STATUS[CVE-2023-4039] = "fixed-version: Fixed from version 14.0+"
diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipes-devtools/python/python3_3.13.7.bb
index e9eb610949..d4a522d35f 100644
--- a/meta/recipes-devtools/python/python3_3.13.7.bb
+++ b/meta/recipes-devtools/python/python3_3.13.7.bb
@@ -43,14 +43,6 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
-CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
-CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"
-CVE_STATUS[CVE-2020-15523] = "not-applicable-platform: Issue only applies on Windows"
-CVE_STATUS[CVE-2022-26488] = "not-applicable-platform: Issue only applies on Windows"
-# The module will be removed in the future and flaws documented.
-CVE_STATUS[CVE-2015-20107] = "upstream-wontfix: The mailcap module is insecure by design, so this can't be fixed in a meaningful way"
-CVE_STATUS[CVE-2023-36632] = "disputed: Not an issue, in fact expected behaviour"
-
 PYTHON_MAJMIN = "3.13"
 
 S = "${UNPACKDIR}/Python-${PV}"
@@ -199,14 +191,14 @@ do_install:append:class-native() {
         # when they're only used for python called with -O or -OO.
         #find ${D} -name *opt-*.pyc -delete
         # Remove all pyc files. There are a ton of them and it is probably faster to let
-        # python create the ones it wants at runtime rather than manage in the sstate 
+        # python create the ones it wants at runtime rather than manage in the sstate
         # tarballs and sysroot creation.
         find ${D} -name *.pyc -delete
 
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
                 ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
-        
+
         # disable the lookup in user's site-packages globally
         sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
 
@@ -304,7 +296,7 @@ py_package_preprocess () {
         cd -
 
         mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
-        
+
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
 }
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 8f341a0e5b..423b2200fc 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -19,6 +19,3 @@ RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
-
-CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
-CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b8761df0d5..24ebcc4aae 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -23,7 +23,6 @@ CVE_STATUS[CVE-2008-1033] = "not-applicable-platform: Issue only applies to MacO
 CVE_STATUS[CVE-2009-0032] = "cpe-incorrect: Issue affects pdfdistiller plugin used with but not part of cups"
 CVE_STATUS[CVE-2018-6553] = "not-applicable-platform: This is an Ubuntu only issue"
 CVE_STATUS[CVE-2022-26691] = "fixed-version: This is fixed in 2.4.2 but the cve-check class still reports it"
-CVE_STATUS[CVE-2021-25317] = "not-applicable-config: This concerns /var/log/cups having lp ownership, our /var/log/cups is root:root, so this doesn't apply."
 
 LEAD_SONAME = "libcupsdriver.so"
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 1cd6bacff9..417bf52a99 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -74,4 +74,3 @@ COMPATIBLE_HOST = "^(?!arc).*"
 CVE_PRODUCT = "ghostscript gpl_ghostscript"
 
 CVE_STATUS[CVE-2023-38560] = "not-applicable-config: PCL isn't part of the Ghostscript release"
-CVE_STATUS[CVE-2023-38559] = "cpe-incorrect: Issue only appears in versions before 10.02.0"
diff --git a/meta/recipes-extended/iputils/iputils_20250605.bb b/meta/recipes-extended/iputils/iputils_20250605.bb
index 4618fbb29a..31eb51e56d 100644
--- a/meta/recipes-extended/iputils/iputils_20250605.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -14,6 +14,7 @@ SRCREV = "6e1cb146547eb6fbb127ffc8397a9241be0d33c2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 
+# these currently don't show up in CVE metrics for FKIE (as 2000 is not covered by it), but they would show for NVD2
 CVE_STATUS[CVE-2000-1213] = "fixed-version: Fixed in 2000-10-10, but the versioning of iputils breaks the version order."
 CVE_STATUS[CVE-2000-1214] = "fixed-version: Fixed in 2000-10-10, but the versioning of iputils breaks the version order."
 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
index 31521bbcca..c6901839c1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
@@ -18,8 +18,6 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[sha256sum] = "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508"
 
-CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in 1.3.3"
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "\
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index d6289deff7..a07df8c319 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -38,8 +38,6 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
-CVE_STATUS[CVE-2008-0888] = "fixed-version: Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source"
-
 # exclude version 5.5.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
index 4314ab9f31..5a86ad563f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
@@ -26,13 +26,6 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
 SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
 
-# https://nvd.nist.gov/vuln/detail/CVE-2023-39018
-# https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-# https://security-tracker.debian.org/tracker/CVE-2023-39018
-# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
-CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wrapper \
-(Java wrapper around the FFmpeg CLI) and not ffmepg itself."
-
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
index c0699cbce8..3fe32b584b 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -19,8 +19,6 @@ SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-CVE_STATUS[CVE-2022-29824] = "not-applicable-config: Static linking to libxml2 is not enabled."
-
 S = "${UNPACKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 9b77e7cfc8..0d8e8762d5 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -17,8 +17,4 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
-CVE_STATUS[CVE-2024-35325] = "upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303"
-CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
-CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
-
 BBCLASSEXTEND = "native nativesdk"

