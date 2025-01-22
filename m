Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9FCC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 04:49:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35639.1737521368418178216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 20:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31178f137b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M3jadP011856
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 04:49:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw049k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 04:49:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 20:49:26 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 21 Jan 2025 20:49:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 9/9] selftest/multiconfig: test multiconfig multlib nativesdk gcc
Date: Wed, 22 Jan 2025 12:49:24 +0800
Message-ID: <20250122044924.3707575-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <181CA95499CB47A3.27121@lists.openembedded.org>
References: <181CA95499CB47A3.27121@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=679078d7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=QwBK0ae2jYoiLzhCIBIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PIyypiZXKKZFz48hc5uOSGPpCWY9mOpa
X-Proofpoint-ORIG-GUID: PIyypiZXKKZFz48hc5uOSGPpCWY9mOpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_01,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 04:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210132

Add 2 cases to test multiconfig multlib nativesdk gcc

1. test_multiconfig_64bit_gcc_suport_32bit_multilib
Build 64bit x86_64 buildtools-tarball with package nativesdk-multiconfig-multlib-toolchain-packager-x86.
The recipe nativesdk-multiconfig-multlib-toolchain-packager trigger a x86 multiconfig
build to generate 32bit x86 buildtools-tarball which contains minimal 32bit toolchains
libraries and include files. The package nativesdk-multiconfig-multlib-toolchain-packager-x86
extract 32bit x86 buildtools-tarball and installed it to 64bit x86_64 nativesdk sysroot.
Then use 64bit gcc to compile 32bit and 64bit hello world program

2. test_multiconfig_32bit_gcc_suport_64bit_multilib
Build 32bit i686 buildtools-tarball with package nativesdk-multiconfig-multlib-toolchain-packager-x86_64.
The recipe nativesdk-multiconfig-multlib-toolchain-packager trigger a x86_64 multiconfig
build to generate 64bit x86_64 buildtools-tarball which contains minimal 64bit toolchains
libraries and include files. The package nativesdk-multiconfig-multlib-toolchain-packager-x86_64
extract 64bit x86_64 buildtools-tarball and installed it to 64bit x86_64 nativesdk sysroot.
Then use 32bit gcc to compile 32bit and 64bit hello world program

...
2025-01-20 22:08:15,003 - oe-selftest - INFO -  ... ok
2025-01-20 22:08:15,004 - oe-selftest - INFO - test_multiconfig_32bit_gcc_suport_64bit_multilib (multiconfig.MultiConfig)
2025-01-20 22:17:13,046 - oe-selftest - INFO -  ... ok
2025-01-20 22:17:13,047 - oe-selftest - INFO - test_multiconfig_64bit_gcc_suport_32bit_multilib (multiconfig.MultiConfig)
...

Skip test case if BUILD_ARCH != 'x86_64'

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---

Changed in v2:
- Skip test case if BUILD_ARCH != 'x86_64'

 meta/lib/oeqa/selftest/cases/multiconfig.py | 142 +++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index f509cbf607..823375ab83 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -7,7 +7,8 @@
 import os
 import textwrap
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake
+from oeqa.utils.commands import bitbake, runCmd, get_bb_vars
+from oeqa.core.decorator.data import skipIfNotDataVar
 
 class MultiConfig(OESelftestTestCase):
 
@@ -85,3 +86,142 @@ BBMULTICONFIG = "muslmc"
 
         # Build a core-image-minimal, only dry run needed to check config is present
         bitbake('mc:muslmc:bash -n')
+
+    def _run_multilib_nativesdk_gcc(self, environment_script_path, c_example_src):
+        def runCmdEnv(cmd):
+            cmd = '/bin/sh -c ". %s > /dev/null && %s"' % (
+                environment_script_path, cmd)
+            self.logger.debug(cmd)
+            result = runCmd(cmd)
+            self.logger.debug(f"ret: {result.status}, output {result.output}")
+            return result
+
+        runCmdEnv('which gcc')
+        self.logger.debug(f"c_example_src {c_example_src}")
+        result = runCmdEnv("gcc -m32 %s -o main-32 && ./main-32" % (c_example_src))
+        self.assertEqual("Hello world!", result.output, "Compile 32 bit program failed")
+        result = runCmdEnv("gcc -m64 %s -o main-64 && ./main-64" % (c_example_src))
+        self.assertEqual("Hello world!", result.output, "Compile 64 bit program failed")
+
+    @skipIfNotDataVar('BUILD_ARCH', 'x86_64', 'SDK was built for ix86 hosts')
+    def test_multiconfig_64bit_gcc_suport_32bit_multilib(self):
+        """
+        Build 64bit x86_64 buildtools-extended-tarball with package nativesdk-multiconfig-multlib-toolchain-packager-x86.
+        The recipe nativesdk-multiconfig-multlib-toolchain-packager trigger a x86 multiconfig
+        build to generate 32bit x86 buildtools-tarball which contains minimal 32bit toolchains
+        libraries and include files. The package nativesdk-multiconfig-multlib-toolchain-packager-x86
+        extract 32bit x86 buildtools-tarball and installed it to 64bit x86_64 nativesdk sysroot.
+        Then use 64bit gcc to compile 32bit and 64bit hello world program
+        """
+
+        config = """
+BBMULTICONFIG = "x86 x86_64"
+# Unify the same SDKPATHNATIVE for two multiconfig, otherwise
+# nativesdk relocation will fail
+SDKPATHNATIVE = "${SDKPATH}/sysroots/x86_64${SDK_VENDOR}-${SDK_OS}"
+"""
+        self.write_config(config)
+
+        x86config = """
+SDKMACHINE = "i686"
+TMPDIR = "${TOPDIR}/tmp-mc-x86"
+# Only install 32bit toolchains library and include files to buildtools-tarball
+TOOLCHAIN_HOST_TASK:pn-buildtools-tarball = "nativesdk-libgcc nativesdk-libgcc-dev nativesdk-glibc nativesdk-glibc-dev nativesdk-sdk-provides-dummy nativesdk-buildtools-perl-dummy"
+# Do not add relocate script to buildtools-tarball
+SDK_RELOCATE_AFTER_INSTALL:pn-buildtools-tarball = "0"
+"""
+        self.write_config(x86config, 'x86')
+
+        x86_64config = """
+SDKMACHINE = "x86_64"
+TMPDIR = "${TOPDIR}/tmp-mc-x86_64"
+TOOLCHAIN_HOST_TASK:append:pn-buildtools-extended-tarball = " nativesdk-multiconfig-multlib-toolchain-packager-x86"
+# lib64 in 64bit nativesdk sysroot, avoid conflict with 32bit lib
+baselib:class-nativesdk= "lib64"
+baselib:class-crosssdk= "lib64"
+libdir_nativesdk = "${prefix_nativesdk}/lib64"
+base_libdir_nativesdk = "/lib64"
+"""
+        self.write_config(x86_64config, 'x86_64')
+
+        bitbake('mc:x86_64:buildtools-extended-tarball')
+
+        needed_vars = ['TOPDIR', 'DISTRO_VERSION', 'COREBASE', 'SDK_VENDOR']
+        bb_vars = get_bb_vars(needed_vars)
+
+        c_example_src = os.path.join(
+            bb_vars['COREBASE'],
+            'meta-skeleton/recipes-skeleton/hello-single/files/helloworld.c'
+        )
+        sdk_name = 'x86_64-buildtools-extended-nativesdk-standalone-%s.sh' % bb_vars['DISTRO_VERSION']
+        sdk_path = os.path.join(bb_vars['TOPDIR'], 'tmp-mc-x86_64/deploy/sdk', sdk_name)
+        self.logger.debug(f"sdk_path {sdk_path}")
+        runCmd('sh %s -y -d "%s"' % (sdk_path, './sdk-test'))
+
+        environment_script = 'environment-setup-x86_64%s-linux' % (bb_vars['SDK_VENDOR'])
+        environment_script_path = os.path.join('./sdk-test', environment_script)
+
+        self._run_multilib_nativesdk_gcc(environment_script_path, c_example_src)
+
+    @skipIfNotDataVar('BUILD_ARCH', 'x86_64', 'SDK was built for ix86 hosts')
+    def test_multiconfig_32bit_gcc_suport_64bit_multilib(self):
+        """
+        Build 32bit i686 buildtools-extended-tarball with package nativesdk-multiconfig-multlib-toolchain-packager-x86_64.
+        The recipe nativesdk-multiconfig-multlib-toolchain-packager trigger a x86_64 multiconfig
+        build to generate 64bit x86_64 buildtools-tarball which contains minimal 64bit toolchains
+        libraries and include files. The package nativesdk-multiconfig-multlib-toolchain-packager-x86_64
+        extract 64bit x86_64 buildtools-tarball and installed it to 64bit x86_64 nativesdk sysroot.
+        Then use 64bit gcc to compile 32bit and 64bit hello world program
+        """
+
+        config = """
+BBMULTICONFIG = "x86 x86_64"
+# Unify the same SDKPATHNATIVE for two multiconfig, otherwise
+# nativesdk relocation will fail
+SDKPATHNATIVE = "${SDKPATH}/sysroots/i686${SDK_VENDOR}-${SDK_OS}"
+"""
+        self.write_config(config)
+
+        x86config = """
+SDKMACHINE = "i686"
+TMPDIR = "${TOPDIR}/tmp-mc-x86"
+TOOLCHAIN_HOST_TASK:append:pn-buildtools-extended-tarball = " nativesdk-multiconfig-multlib-toolchain-packager-x86_64"
+"""
+        self.write_config(x86config, 'x86')
+
+        x86_64config = """
+SDKMACHINE = "x86_64"
+TMPDIR = "${TOPDIR}/tmp-mc-x86_64"
+# Only install 64bit toolchains library and include files to buildtools-tarball
+TOOLCHAIN_HOST_TASK:pn-buildtools-tarball = "nativesdk-libgcc nativesdk-libgcc-dev nativesdk-glibc nativesdk-glibc-dev nativesdk-sdk-provides-dummy nativesdk-buildtools-perl-dummy"
+# Do not add relocate script to buildtools-tarball
+SDK_RELOCATE_AFTER_INSTALL:pn-buildtools-tarball = "0"
+
+# lib64 in 64bit nativesdk sysroot, avoid conflict with 32bit lib
+baselib:class-nativesdk= "lib64"
+baselib:class-crosssdk= "lib64"
+libdir_nativesdk = "${prefix_nativesdk}/lib64"
+base_libdir_nativesdk = "/lib64"
+"""
+        self.write_config(x86_64config, 'x86_64')
+
+        bitbake('mc:x86:buildtools-extended-tarball')
+
+        needed_vars = ['TOPDIR', 'DISTRO_VERSION', 'COREBASE', 'SDK_VENDOR']
+        bb_vars = get_bb_vars(needed_vars)
+
+        c_example_src = os.path.join(
+            bb_vars['COREBASE'],
+            'meta-skeleton/recipes-skeleton/hello-single/files/helloworld.c'
+        )
+        sdk_name = 'i686-buildtools-extended-nativesdk-standalone-%s.sh' % bb_vars['DISTRO_VERSION']
+
+        sdk_path = os.path.join(bb_vars['TOPDIR'], 'tmp-mc-x86/deploy/sdk', sdk_name)
+        self.logger.debug(f"sdk_path {sdk_path}")
+        runCmd('sh %s -y -d "%s"' % (sdk_path, './sdk-test'))
+
+        environment_script = 'environment-setup-i686%s-linux' % (bb_vars['SDK_VENDOR'])
+        environment_script_path = os.path.join('./sdk-test', environment_script)
+
+        self._run_multilib_nativesdk_gcc(environment_script_path, c_example_src)
+
-- 
2.34.1


