Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4303ECAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11590.1757995777475184418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lBsHOpPm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G2nKAX1619279;
	Tue, 16 Sep 2025 04:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GYo7Wu11hEUBDuVBl01XfDI+hu2CPp3DRILKf1iCoh8=; b=
	lBsHOpPmsoX7d8Wwcng0yWXwI0zT+9wrydVF7hD5WxJThIiFYNT0tPaL2eHTAgZi
	Zc8THtCWoW6bnAMcZvV2SQ5SnpRGcSRjX2nYOuH1gu2Yckpkm4pqXYNhGVwVZjni
	Eq+RUF868WnS2ZckBFrbqFoAuwmLb0YHJ/Q2c4HSbSzv713wLR5KB0VWf2n8zfX5
	qWIKp5Phk/Nr2nTyiRIT1gwda2dVS+xBE32H37NptKI7dEzf05mM1NT077QTd5EE
	W5fKWYWn8nMgYR5m3mw53hwbz04hHJo5dnPWlZuFh/Afd/fh7qaLL5aWXNbxbwXF
	cqusRpR2I2saujuRww+THg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu130yr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:33 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 4/8] debug_build.inc: collect debug build tuning configuration
Date: Tue, 16 Sep 2025 12:09:23 +0800
Message-ID: <20250916040927.103722-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KeqpdJRnb6I9ureu7x3M41f3zQKaCU_S
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c8e2fe cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8
 a=p_J065krOJSGb3ilSzMA:9 a=IDjme54_S0fX3SJZ:21 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KeqpdJRnb6I9ureu7x3M41f3zQKaCU_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfXzl8KAETObjkL
 vMoIe8G0dG9oqt8vIoqRIUJwaoyU9u1mWl5xgf0viyx+Kv0SaaW4yzrJJBPIzQmhMjFiUPxElGB
 Ttp+jgnxhpZe5pvhRLVx3g9ATRcosgQDntyBmZgqaPxFcidby6RjJZJxyuGGnoraKTlzHD9MwQa
 TneiGyTkPs4aaK4gALaC4hjQLJzUAaSBiTt36Cj0Vo6RspasH5iNX5e2kLqiTnMbAakxVh8nLcG
 9kcNwrdnIZ4xc9MOxs0G2i1hg2s6a8MChlh5lJu6p+mBJG0reURkUJeEaHm/dgHb+vW2ox5UzQx
 qAwNTs0Koei3i53r+xJdt93ApnwferCVcDBtA1no/Fojfa3AeZbnXDmxGJ2B7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223519

The modern compilers and code seem to require extra steps to avoid DEBUG errors,
Move debug tuning configuration from recipes to an include file to address these
errors.

Introduce separate variables to avoid the :remove operations, such DEBUG_OPTLEVEL,
BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/debug_build.inc      | 37 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    | 10 -----
 .../debugedit/debugedit_5.2.bb                |  2 -
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 --
 .../python/python3-lxml_6.0.1.bb              | 12 ------
 meta/recipes-extended/bash/bash_5.3.bb        |  3 --
 meta/recipes-extended/mdadm/mdadm_4.4.bb      |  2 -
 .../jpeg/libjpeg-turbo_3.1.2.bb               |  3 --
 .../vulkan-validation-layers_1.4.321.0.bb     |  2 -
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |  1 -
 meta/recipes-kernel/perf/perf.bb              |  2 -
 meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  3 +-
 meta/recipes-support/vim/vim_9.1.bb           |  2 +-
 13 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index a9222a442a..ae6dc7f4c6 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -5,3 +5,40 @@ SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
 # compiler flags for native/nativesdk
 BUILD_OPTLEVEL = "-Og"
 BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL} -g"
+
+# The modern compilers and code seem to require extra steps to avoid DEBUG errors,
+# this file collects debug tuning configuration to address DEBUG errors.
+
+DEBUG_OPTIMIZATION:append:pn-perf = " -Wno-error=maybe-uninitialized"
+DEBUG_OPTIMIZATION:append:armv4:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:armv5:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:armv4:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:armv5:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:pn-mdadm = " -Wno-error"
+DEBUG_OPTLEVEL:mips:pn-kea = "-O"
+DEBUG_OPTLEVEL:mipsel:pn-kea = "-O"
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+DEBUG_OPTLEVEL:mips:pn-python3-lxml = "-O"
+DEBUG_OPTLEVEL:mipsel:pn-python3-lxml = "-O"
+# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers = " -Wno-error"
+
+BUILD_OPTLEVEL:mips:pn-kea = "-O"
+BUILD_OPTLEVEL:mipsel:pn-kea = "-O"
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+BUILD_OPTLEVEL:mips:pn-python3-lxml = "-O"
+BUILD_OPTLEVEL:mipsel:pn-python3-lxml = "-O"
+
+CPPFLAGS:append:arm:pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
+
+OECMAKE_WEBKIT_NO_INLINE_HINTS:pn-webkitgtk = "-DWEBKIT_NO_INLINE_HINTS=ON"
+
+EXTRA_OECONF:append:pn-debugedit = " --disable-inlined-xxhash"
+EXTRA_OECONF:append:pn-debugedit-native = " --disable-inlined-xxhash"
+EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
+
+lcl_maybe_fortify:pn-vim = ""
+
+CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index cc34c05093..ead4e98e70 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -34,16 +34,6 @@ INITSCRIPT_PARAMS = "defaults 30"
 SYSTEMD_SERVICE:${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-DEBUG_OPTIMIZATION:remove:mips = " -Og"
-DEBUG_OPTIMIZATION:append:mips = " -O"
-BUILD_OPTIMIZATION:remove:mips = " -Og"
-BUILD_OPTIMIZATION:append:mips = " -O"
-
-DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
-DEBUG_OPTIMIZATION:append:mipsel = " -O"
-BUILD_OPTIMIZATION:remove:mipsel = " -Og"
-BUILD_OPTIMIZATION:append:mipsel = " -O"
-
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
 
 do_configure:prepend() {
diff --git a/meta/recipes-devtools/debugedit/debugedit_5.2.bb b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
index 76c54ba63d..4ac6cab559 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.2.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
@@ -22,8 +22,6 @@ inherit pkgconfig autotools multilib_script
 
 RDEPENDS:${PN} += "bash elfutils-binutils"
 
-EXTRA_OECONF = "${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-xxhash', '', d)}"
-
 BBCLASSEXTEND = "native nativesdk"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/find-debuginfo"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 6c81d30243..f4727ee6db 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -54,9 +54,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 ALLOW_EMPTY:${PN} = "1"
 DEPENDS = "virtual/crypt gcc-runtime virtual/cross-cc"
 
-# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-DEBUG_OPTIMIZATION:append = " -Wno-error"
-
 BBCLASSEXTEND = "nativesdk"
 
 PACKAGES = "${PN} ${PN}-dbg"
diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
index 5d76641675..6bcd399da5 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
@@ -23,18 +23,6 @@ SRC_URI[sha256sum] = "2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
 
-# {standard input}: Assembler messages:
-# {standard input}:1488805: Error: branch out of range
-DEBUG_OPTIMIZATION:remove:mips = " -Og"
-DEBUG_OPTIMIZATION:append:mips = " -O"
-BUILD_OPTIMIZATION:remove:mips = " -Og"
-BUILD_OPTIMIZATION:append:mips = " -O"
-
-DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
-DEBUG_OPTIMIZATION:append:mipsel = " -O"
-BUILD_OPTIMIZATION:remove:mipsel = " -Og"
-BUILD_OPTIMIZATION:append:mipsel = " -O"
-
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "libxml2 libxslt python3-compression"
diff --git a/meta/recipes-extended/bash/bash_5.3.bb b/meta/recipes-extended/bash/bash_5.3.bb
index b50a48d28c..74671f5a56 100644
--- a/meta/recipes-extended/bash/bash_5.3.bb
+++ b/meta/recipes-extended/bash/bash_5.3.bb
@@ -15,9 +15,6 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
 
 SRC_URI[tarball.sha256sum] = "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba"
 
-DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-
 CFLAGS += "-std=gnu17"
 # mkbuiltins.c is built with native toolchain and needs gnu17 as well:
 # http://errors.yoctoproject.org/Errors/Details/853016/
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
index 26a60e4c1a..e81b8fdf3c 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
@@ -39,8 +39,6 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${sys
                 BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}" \
                 SYSROOT="${STAGING_DIR_TARGET}" STRIP='
 
-DEBUG_OPTIMIZATION:append = " -Wno-error"
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install install-systemd
         install -d ${D}/${sysconfdir}/
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
index d4877bb92b..bc9d803f6b 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
@@ -44,9 +44,6 @@ EXTRA_OECMAKE:append:class-target:powerpc = " ${@bb.utils.contains("TUNE_FEATURE
 EXTRA_OECMAKE:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
 EXTRA_OECMAKE:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
 
-DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-
 # libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
 # <instantiation>:13:5: error: invalid token in expression
 # .if $17 != 0
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
index 466e757a90..fa7873b62d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
@@ -26,8 +26,6 @@ EXTRA_OECMAKE = "\
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     "
 
-CXXFLAGS:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}"
-
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..0d4c67f0fa 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -16,7 +16,6 @@ inherit autotools lib_package manpages python3native pkgconfig
 include lttng-platforms.inc
 
 EXTRA_OECONF = "--disable-numa"
-CPPFLAGS:append:arm = "${@oe.utils.vartrue('DEBUG_BUILD', '-DUATOMIC_NO_LINK_ERROR', '', d)}"
 
 DEPENDS = "liburcu util-linux"
 RDEPENDS:${PN}-bin = "python3-core"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e1915207ee..98dffd1cc9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -415,8 +415,6 @@ FILES:${PN}-python = " \
                        "
 FILES:${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
 
-DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
-
 PACKAGESPLITFUNCS =+ "perf_fix_sources"
 
 perf_fix_sources () {
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
index 46031322b9..ba08e8b925 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -86,11 +86,12 @@ PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
 PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
 
+OECMAKE_WEBKIT_NO_INLINE_HINTS ??= "-DWEBKIT_NO_INLINE_HINTS=OFF"
 EXTRA_OECMAKE = " \
                  -DPORT=GTK \
                  ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
                  ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
+                 ${OECMAKE_WEBKIT_NO_INLINE_HINTS} \
                  -DENABLE_MINIBROWSER=ON \
                  -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                  -DUSE_GTK4=ON \
diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9..a24a863ba5 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -20,4 +20,4 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # We override the default in security_flags.inc because vim (not vim-tiny!) will abort
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
-lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+lcl_maybe_fortify = "-D_FORTIFY_SOURCE=1"
-- 
2.34.1


