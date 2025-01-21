Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9752EC02187
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11923.1737449735034207757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31163e49e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L6eCPG010269
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:34 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 448cpq28yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:34 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 00:55:34 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 21 Jan 2025 00:55:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 7/9] gcc-configure-common.inc: add multlib support for i686/i586/x86_64 nativesdk gcc
Date: Tue, 21 Jan 2025 16:55:24 +0800
Message-ID: <20250121085526.1370937-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121085526.1370937-1-hongxu.jia@windriver.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ukU6-XzxVduKJI0uycmlh9MjFQdFfUAo
X-Proofpoint-GUID: ukU6-XzxVduKJI0uycmlh9MjFQdFfUAo
X-Authority-Analysis: v=2.4 cv=TdtstQQh c=1 sm=1 tr=0 ts=678f6106 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=45OZM_v20GHH4WQ5mVsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210079

We have patch 0016-handle-sysroot-support-for-nativesdk-gcc.patch to handle
sysroot support for nativesdk-gcc, and add %r target_relocatable_prefix
into spec file for nativesdk-gcc relocation. It was used for injected
paths SYSTEMLIBS_DIR

Due to the supported SDKMACHINE includes:

  aarch64, i586, i686, loongarch64, ppc64, ppc64le, riscv64, x86_64

Only i586 and x86_64, i686 and x86_64 have multilib relationship,
for i586,i686 and x86_64, this commit:

- Tweak target_relocatable_prefix, set ${root_prefix} to it, and tweak
libdir32 and libdir64 based on ${root_prefix} prefix with "/lib" and
"/lib64" suffix.

- Harcode dirnames ['m64', 'm32'] and osdirnames ['../lib64', '../lib']

Above setting also covers gcc-nativesdk without multilib

For other situation, the configuration is the same as usual

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc       | 9 +++++++++
 meta/recipes-devtools/gcc/gcc-multilib-config.inc        | 5 +++++
 .../0016-handle-sysroot-support-for-nativesdk-gcc.patch  | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

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
index 2dbbc23c94..31336f75eb 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -172,6 +172,11 @@ python gcc_multilib_setup() {
     target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlprefix
                     else d.getVar('TARGET_ARCH'))
     if pn == "nativesdk-gcc":
+        if d.getVar('SDK_ARCH') in ['x86_64', 'i686', 'i586']:
+            libdir32 = '%r/lib'
+            libdir64 = '%r/lib64'
+            target_config_files = gcc_target_config_files[d.getVar("SDK_ARCH")]
+            write_config(builddir, target_config_files, ['m64', 'm32'], ['64', '32'], ['../lib64', '../lib'])
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


