Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D196F60808
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 15:40:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41FeU6d005086 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 16:40:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ms4e_bwUv1zf
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 16:40:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41FeO5g005044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 16:40:26 +0100
Message-ID: <1398958819.30460.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2014 16:40:19 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-common: Only apply fpu settings to target gcc
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
X-List-Received-Date: Thu, 01 May 2014 15:40:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Within the OE build environment, we supply the correct fpu settings. These
only need to be spelt out for the on-target gcc.

Doing this means the checksums for the core compiler don't depend on the fpu
settings. We exclude the compiler tunes for similar reasons, it doesn't need
to influence the compiler build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 0408e65..e56e598 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -63,7 +63,7 @@ def get_tune_parameters(tune, d):
     retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
     return retdict
 
-get_tune_parameters[vardepsexclude] = "AVAILTUNES"
+get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS"
 
 DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 3cb6ec8..31e3cc4 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -61,7 +61,7 @@ EXTRA_OECONF_append_libc-uclibc        = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_mips64    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 
-EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
+EXTRA_OECONF_FPU ??= ""
 CPPFLAGS = ""
 
 # powerpc needs this to comply with the ABI
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 45a1637..de906d6 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -7,6 +7,8 @@ EXTRA_OECONF_PATHS = " \
     --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
     --with-gxx-include-dir=${includedir}/c++/"
 
+EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
+
 PACKAGES = "\
   ${PN} ${PN}-plugins ${PN}-symlinks \
   g++ g++-symlinks \



