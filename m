Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBCDC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 19:36:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.78988.1701718584214658065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 11:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aIBhjq2g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07022e53a9=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B4JVDSs009837
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 19:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=GlYYQ
	VIlqCVq3ORXt/w4sRRYfkz8S8bh+N3kjaxi+7g=; b=aIBhjq2gtX8Wm+nOiZnsr
	zY4RBeNs7ozpw2B6ZJICVAzmg0cYhmH/NncXauTjs31veo8hKIQvuvhkzTX8xRc2
	UAQ+pRxbBjMGczAoYURZHTPbGLvay6uyPKMsl3dFz+CW+35LZp/s9dABs2ElxwKO
	yGbnX5JJOGFJ7hBm3XBEwXZObDheTy6zH0uAa86DPaXUo0XVQjR5N2UHWEZqzqzr
	ad5O1O7/N8rKMHu5Ow2IE5UX4gYXuEFniUpq5RffDlkJoyOQ0mnUwVlwk02GRmP1
	dODgT6S8Rm+Tf+Yi9Zl33d38gY8y5INeueZocNotr1LQiFKFvA3jTUF0GLhcJOAl
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uqssxa2eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 19:36:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 11:36:25 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 11:36:25 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][oe-core][PATCH 1/1] gnutls: update to version 3.8.2
Date: Mon, 4 Dec 2023 11:36:21 -0800
Message-ID: <20231204193621.3974827-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3n4ppIlOo2Mfb6B_dq17tjFVSTo10-7J
X-Proofpoint-ORIG-GUID: 3n4ppIlOo2Mfb6B_dq17tjFVSTo10-7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311060001 definitions=main-2312040152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 19:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191768

From: Joe Slater <joe.slater@windriver.com>

De-fuzz existing patches.
Do not update PACKAGECONFIG to match master.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...ile-should-be-excuted-in-target-envi.patch |  2 --
 .../gnutls/gnutls/Add-ptest-support.patch     | 10 ++-----
 .../gnutls/gnutls/arm_eabi.patch              |  6 ++--
 .../{gnutls_3.8.0.bb => gnutls_3.8.2.bb}      | 30 +++++++++++--------
 4 files changed, 22 insertions(+), 26 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.0.bb => gnutls_3.8.2.bb} (79%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 4bdc40d932..da89d7faa1 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -11,8 +11,6 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  lib/Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 6d4e8d2..24ef108 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
 @@ -206,8 +206,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index f87cf536fa..b9b75888ff 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -12,8 +12,6 @@ Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
  tests/Makefile.am | 6 ++++++
  3 files changed, 11 insertions(+)
 
-diff --git a/Makefile.am b/Makefile.am
-index 843193f..816b09f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -191,6 +191,9 @@ dist-hook:
@@ -26,11 +24,9 @@ index 843193f..816b09f 100644
  .PHONY: abi-check abi-dump-versioned abi-dump-latest pic-check symbol-check local-code-coverage-output files-update AUTHORS
  
  include $(top_srcdir)/cligen/cligen.mk
-diff --git a/configure.ac b/configure.ac
-index b25ba14..860ddef 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1194,6 +1194,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -39,11 +35,9 @@ index b25ba14..860ddef 100644
  AC_DEFINE([GNUTLS_INTERNAL_BUILD], 1, [We allow temporarily usage of deprecated functions - until they are removed.])
  
  hw_features=
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d530ad0..71c592f 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -648,6 +648,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -657,6 +657,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
index 2b61a703cb..2de9258a8a 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -14,11 +14,9 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  tests/seccomp.c | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/tests/seccomp.c b/tests/seccomp.c
-index a3148fe..443bc5f 100644
 --- a/tests/seccomp.c
 +++ b/tests/seccomp.c
-@@ -52,7 +52,9 @@ int disable_system_calls(void)
+@@ -55,7 +55,9 @@ int disable_system_calls(void)
  
  	ADD_SYSCALL(nanosleep, 0);
  	ADD_SYSCALL(clock_nanosleep, 0);
@@ -27,4 +25,4 @@ index a3148fe..443bc5f 100644
 +#endif
  	ADD_SYSCALL(getpid, 0);
  	ADD_SYSCALL(gettimeofday, 0);
- # if defined(HAVE_CLOCK_GETTIME)
+ #if defined(HAVE_CLOCK_GETTIME)
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
similarity index 79%
rename from meta/recipes-support/gnutls/gnutls_3.8.0.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.2.bb
index 7ddd2420bd..dc975317c8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
-DEPENDS:append:libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
@@ -26,24 +25,31 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5"
+SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
+# do not use the updated default PACKAGECONFIG from master branch
+#
+# PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
+PACKAGECONFIG ??= "libidn ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
 PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
-PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
+PACKAGECONFIG[libtasn1] = "--without-included-libtasn1,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR}"
+PACKAGECONFIG[dane] = "--enable-libdane,--disable-libdane,unbound"
+# Certificate compression
+PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
 EXTRA_OECONF = " \
     --enable-doc \
-    --disable-libdane \
     --disable-rpath \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
@@ -54,14 +60,16 @@ EXTRA_OECONF = " \
 # Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
 export POSIX_SHELL="${base_bindir}/sh"
 
-LDFLAGS:append:libc-musl = " -largp"
-
 do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
 }
 
+do_compile_ptest() {
+    oe_runmake -C tests buildtest-TESTS
+}
+
 do_install:append:class-target() {
         if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
           install -d ${D}${bindir}/bin
@@ -69,13 +77,11 @@ do_install:append:class-target() {
         fi
 }
 
-do_compile:append() {
-        oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
-}
-
-PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
+PACKAGES =+ "${PN}-dane ${PN}-openssl ${PN}-xx ${PN}-fips"
 
 FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
+
+FILES:${PN}-dane = "${libdir}/libgnutls-dane.so.*"
 FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
 FILES:${PN}-fips = "${bindir}/fipshmac"
-- 
2.25.1


