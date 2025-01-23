Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729C9C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 04:53:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4511.1737608022276808973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 20:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3118843f91=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N3amjh006862
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 20:53:41 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqjg9ctb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 20:53:41 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 22 Jan 2025 20:53:40 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 22 Jan 2025 20:53:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 7/9] gcc-configure-common.inc: add multlib support for i686/i586/x86_64 nativesdk gcc
Date: Thu, 23 Jan 2025 12:53:39 +0800
Message-ID: <20250123045339.2443875-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121085526.1370937-7-hongxu.jia@windriver.com>
References: <20250121085526.1370937-7-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YmNYIyn1rUyL0Fdv5R8UOu_XHMXfiHze
X-Proofpoint-ORIG-GUID: YmNYIyn1rUyL0Fdv5R8UOu_XHMXfiHze
X-Authority-Analysis: v=2.4 cv=d7QPyQjE c=1 sm=1 tr=0 ts=6791cb55 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=Tbfw_gsP-Ju5u_ygCQQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_01,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 04:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210174

We have patch 0016-handle-sysroot-support-for-nativesdk-gcc.patch to handle
sysroot support for nativesdk-gcc, and add %r target_relocatable_prefix
into spec file for nativesdk-gcc relocation. It was used for injected
paths SYSTEMLIBS_DIR

Due to the supported SDKMACHINE includes:

  aarch64, i586, i686, loongarch64, ppc64, ppc64le, riscv64, x86_64

Only i586 and x86_64, i686 and x86_64 have multilib relationship,
for i586,i686 and x86_64, this commit:

- Tweak target_relocatable_prefix, set ${root_prefix} to it , and tweak
libdir32 based on ${root_prefix} prefix with "/lib" suffix

- For i686 and i586, hard code `lib' to 32bit osdirname, `lib64' to
libdir64 and 64bit osdirname, whether multlib or not

- For x86_64, use variable baselib to set libdir64 and 64bit osdirnames,
baselib is set to `lib64' for multilib, and `lib' for non multilib

Above setting also covers gcc-nativesdk without multilib

For other situation, the configuration is the same as usual

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
Changed in v2, 
Fix `cargo build' failded in SDK, the interpreter of dynamical loader
is not right

$ rustc build.rs
$ ./build
./build: cannot execute: required file not found
$ file build
build: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter sdk-path-to/sysroots/x86_64-pokysdk-linux/lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=4e012c629e30ebc91c3252eb0fd40358cc5b2dfa, not stripped
$ ls sdk-path-to/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
sdk-path-to/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2

For x86_64, use variable baselib to set libdir64 and 64bit osdirnames,
baselib is set to `lib64' for multilib, and `lib' for non multilib

 meta/recipes-devtools/gcc/gcc-configure-common.inc    |  9 +++++++++
 meta/recipes-devtools/gcc/gcc-multilib-config.inc     | 11 +++++++++++
 ...016-handle-sysroot-support-for-nativesdk-gcc.patch |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 5c79936242..bd5c953334 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -73,6 +73,14 @@ SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
+def tune_target_relocatable_prefix(d):
+    if d.getVar("SDK_ARCH") in ["x86_64", "i686", "i586"]:
+        return d.getVar("root_prefix")
+    else:
+        return d.getVar("SYSTEMLIBS")
+TARGET_RELOCATE_PREFIX = "${SYSTEMLIBS}"
+TARGET_RELOCATE_PREFIX:class-nativesdk = "${@tune_target_relocatable_prefix(d)}"
+
 do_configure:prepend () {
 	# teach gcc to find correct target includedir when checking libc ssp support
 	mkdir -p ${B}/gcc
@@ -83,6 +91,7 @@ do_configure:prepend () {
 #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
 #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
 #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
+#define TARGET_RELOCATE_PREFIX "${TARGET_RELOCATE_PREFIX}"
 #endif /* ! GCC_DEFAULTS_H */
 _EOF
 	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 2dbbc23c94..997bb6029b 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -172,6 +172,17 @@ python gcc_multilib_setup() {
     target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlprefix
                     else d.getVar('TARGET_ARCH'))
     if pn == "nativesdk-gcc":
+        sdk_arch = d.getVar('SDK_ARCH')
+        if sdk_arch in ['x86_64', 'i686', 'i586']:
+            libdir32 = '%r/lib'
+            if sdk_arch == 'x86_64':
+                libdir64 = '%r/' + d.getVar('baselib')
+                osdirnames = ['../'+d.getVar('baselib') ,'../lib']
+            else:
+                libdir64 = '%r/lib64'
+                osdirnames = ['../lib64', '../lib']
+            target_config_files = gcc_target_config_files[d.getVar("SDK_ARCH")]
+            write_config(builddir, target_config_files, ['m64', 'm32'], ['64', '32'], osdirnames)
         header_config_files = gcc_header_config_files[d.getVar("SDK_ARCH")]
         write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
         return
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
index edd100ee46..7d96a42027 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -389,7 +389,7 @@ index e3e9374d1cc..b080609341b 100644
  #endif
  static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
  
-+static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = TARGET_RELOCATE_PREFIX;
 +
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
-- 
2.34.1


