Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BD7CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:07:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20848.1757693269415562077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 09:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mrcOQjmj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13506f3714=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58CEuERm1827269
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=J0EUx/o+YDxs0TWqL15dtSRh+QiKbJBTfoHn0jU3Pg8=; b=
	mrcOQjmjNPlD/8Z4m7RzjLQ/iHhzI5P7gfgQXXlVAzNWRtRfAicU0ZFVY7rNl/V1
	R+3fTaD6bpP1e9JPcdtdzZfdCnBCNSI+Ixkto/z1lrsFNI8Ad53U//ykRPJMo1xV
	N+eYAnfKiTXddORgN4k9SVHy5FFvwZ6UQO3WfW3aLOFvh783mJ2q8/tcADupj3XW
	VoxvGRNM7cJdDq2UI2/um8Fn3o5lpKLTNyOtMIss19DM1ejQXRQvem2r3ETvrtgO
	XNyFOwxVtQA5ePnEVMqelp7cAErGpagi3iMM0hi4YV+Hybw1c3erzBYsqWFugD+5
	gpCSjrgCHhZ5tgE7GAN3rQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494nqg037r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:07:44 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 12 Sep 2025 09:07:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 2/5] distro/include: Add debug_build_tune.inc, collect debug tuning configuration
Date: Sat, 13 Sep 2025 00:07:38 +0800
Message-ID: <20250912160741.346809-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912160741.346809-1-hongxu.jia@windriver.com>
References: <20250912160741.346809-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZLcX88O5WVGBOXs8a3eg0V0s6IIeqDjP
X-Proofpoint-GUID: ZLcX88O5WVGBOXs8a3eg0V0s6IIeqDjP
X-Authority-Analysis: v=2.4 cv=VuIjA/2n c=1 sm=1 tr=0 ts=68c44554 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=QfmRm4ko8Nfc8m8ysWEA:9
 a=erNOxfUQL8SZZ4XR:21 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE1MCBTYWx0ZWRfXwmCChKj5ME7n
 MoD5Nmhc9j8D3qkJZcT18+b6L2OBiDwiHQ13vXuzFpO43jlbSpBiZVVqpa9+zIkP9JbFaJxDPcU
 O0d4NB5twlSdYh9opGICmwBQPvPDREJx+IIIbR+yO42BHe8MjF5Ky86bbKl3ScFXW4ykNlN7AlU
 9XoHagEmwvP5WQcdRHxUhnr/5iFmNEbt19vbdn2pJW6Sfoyvk62SApKwgVRQZE9/RO6hc7jnYQF
 fU5XcrC5Qh4hqYzTeajL3fSZdNz4ZzI7nWGsy3qpEAXtfQuVxTcksyXu8L12Xdpiyr3DOg7MtDq
 4dVBYEuwRh1ta2Mroeo5XEXMLDhdL8smB4V1x43O9MG5sNw9ScM1zmm/wFKgps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223329

The modern compilers and code seem to require extra steps to avoid DEBUG errors,
Move debug tuning configuration from recipes, add an include file to collect them
to address these errors. Require the include file when DEBUG_BUILD is enabled.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf                        |  2 +
 meta/conf/distro/include/debug_build_tune.inc | 45 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    | 10 -----
 .../debugedit/debugedit_5.2.bb                |  2 -
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 --
 .../python/python3-lxml_6.0.1.bb              | 12 -----
 meta/recipes-extended/bash/bash_5.3.bb        |  3 --
 meta/recipes-extended/mdadm/mdadm_4.4.bb      |  2 -
 .../jpeg/libjpeg-turbo_3.1.2.bb               |  3 --
 .../vulkan-validation-layers_1.4.321.0.bb     |  2 -
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |  1 -
 meta/recipes-kernel/perf/perf.bb              |  2 -
 meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  2 +-
 meta/recipes-support/vim/vim_9.1.bb           |  2 +-
 14 files changed, 49 insertions(+), 42 deletions(-)
 create mode 100644 meta/conf/distro/include/debug_build_tune.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e90c7bbc85..193a8377cf2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -831,6 +831,8 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
+require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build_tune.inc', '', d)}
+
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/distro/include/debug_build_tune.inc
new file mode 100644
index 00000000000..ca43d2b955c
--- /dev/null
+++ b/meta/conf/distro/include/debug_build_tune.inc
@@ -0,0 +1,45 @@
+# The modern compilers and code seem to require extra steps to avoid DEBUG errors,
+# this file collects debug tuning configuration to address DEBUG errors.
+
+DEBUG_OPTIMIZATION:append:pn-perf = " -Wno-error=maybe-uninitialized"
+DEBUG_OPTIMIZATION:append:armv4:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:armv5:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:armv4:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:armv5:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION:append:pn-mdadm = " -Wno-error"
+DEBUG_OPTIMIZATION:remove:mips:pn-kea = " -Og"
+DEBUG_OPTIMIZATION:append:mips:pn-kea = " -O"
+DEBUG_OPTIMIZATION:remove:mipsel:pn-kea = " -Og"
+DEBUG_OPTIMIZATION:append:mipsel:pn-kea = " -O"
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+DEBUG_OPTIMIZATION:remove:mips:pn-python3-lxml = " -Og"
+DEBUG_OPTIMIZATION:append:mips:pn-python3-lxml = " -O"
+DEBUG_OPTIMIZATION:remove:mipsel:pn-python3-lxml = " -Og"
+DEBUG_OPTIMIZATION:append:mipsel:pn-python3-lxml = " -O"
+# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers = " -Wno-error"
+
+BUILD_OPTIMIZATION:remove:mips:pn-kea = " -Og"
+BUILD_OPTIMIZATION:append:mips:pn-kea = " -O"
+BUILD_OPTIMIZATION:remove:mipsel:pn-kea = " -Og"
+BUILD_OPTIMIZATION:append:mipsel:pn-kea = " -O"
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+BUILD_OPTIMIZATION:remove:mips:pn-python3-lxml = " -Og"
+BUILD_OPTIMIZATION:append:mips:pn-python3-lxml = " -O"
+BUILD_OPTIMIZATION:remove:mipsel:pn-python3-lxml = " -Og"
+BUILD_OPTIMIZATION:append:mipsel:pn-python3-lxml = " -O"
+
+CPPFLAGS:append:arm::pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
+
+EXTRA_OECMAKE:remove:pn-webkitgtk = "-DWEBKIT_NO_INLINE_HINTS=OFF"
+EXTRA_OECMAKE:append:pn-webkitgtk = " -DWEBKIT_NO_INLINE_HINTS=ON"
+
+EXTRA_OECONF:pn-debugedit = "--disable-inlined-xxhash"
+EXTRA_OECONF:pn-debugedit-native = "--disable-inlined-xxhash"
+EXTRA_OECONF:pn-nativesdk-debugedit = "--disable-inlined-xxhash"
+
+lcl_maybe_fortify:pn-vim = ""
+
+CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index cc34c05093a..ead4e98e708 100644
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
index 76c54ba63d4..4ac6cab559e 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.2.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
@@ -22,8 +22,6 @@ inherit pkgconfig autotools multilib_script
 
 RDEPENDS:${PN} += "bash elfutils-binutils"
 
-EXTRA_OECONF = "${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-xxhash', '', d)}"
-
 BBCLASSEXTEND = "native nativesdk"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/find-debuginfo"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 6c81d302438..f4727ee6dba 100644
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
index 5d76641675c..6bcd399da54 100644
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
index b50a48d28c9..74671f5a563 100644
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
index 26a60e4c1a3..e81b8fdf3cb 100644
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
index d4877bb92b5..bc9d803f6b9 100644
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
index 466e757a908..fa7873b62d3 100644
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
index 1a15c5b4201..0d4c67f0fa7 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -16,7 +16,6 @@ inherit autotools lib_package manpages python3native pkgconfig
 include lttng-platforms.inc
 
 EXTRA_OECONF = "--disable-numa"
-CPPFLAGS:append:arm = "${@oe.utils.vartrue('DEBUG_BUILD', '-DUATOMIC_NO_LINK_ERROR', '', d)}"
 
 DEPENDS = "liburcu util-linux"
 RDEPENDS:${PN}-bin = "python3-core"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e1915207eed..98dffd1cc99 100644
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
index 46031322b92..616cd353337 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -90,7 +90,7 @@ EXTRA_OECMAKE = " \
                  -DPORT=GTK \
                  ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
                  ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
+                 -DWEBKIT_NO_INLINE_HINTS=OFF \
                  -DENABLE_MINIBROWSER=ON \
                  -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                  -DUSE_GTK4=ON \
diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9a..a24a863ba5c 100644
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


