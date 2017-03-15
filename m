Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF2C6776A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:35:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16601447"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Mar 2017 17:35:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C1C1849F9A69;
	Wed, 15 Mar 2017 17:35:47 +0800 (CST)
Received: from localhost.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 15 Mar 2017 17:35:46 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 02:35:37 +0800
Message-ID: <1489602937-9554-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: C1C1849F9A69.AA0A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [jethro][PATCH] gcc-multilib-config: make aarch64 support multilib
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
X-List-Received-Date: Wed, 15 Mar 2017 09:35:50 -0000
Content-Type: text/plain

  Fixed:
  MACHINE = qemuarm64
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

  $ bitbake core-image-minimal -cpopulate_sdk

  WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64
  WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64

  [YOCTO #8638]

  (From OE-Core rev: 0ae52c8b2c1d7d7cdbcfeeae6ff42e64f16bc41d)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 1c0a45a..a0a2ac0 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -29,6 +29,9 @@ python gcc_multilib_setup() {
     bb.utils.remove(build_conf_dir, True)
     ml_globs = ('%s/*/t-linux64' % src_conf_dir,
                 '%s/*/linux64.h' % src_conf_dir,
+                '%s/aarch64/t-aarch64' % src_conf_dir,
+                '%s/aarch64/aarch64.h' % src_conf_dir,
+                '%s/aarch64/aarch64-cores.def' % src_conf_dir,
                 '%s/*/linux.h' % src_conf_dir,
                 '%s/linux.h' % src_conf_dir)
 
@@ -130,6 +133,8 @@ python gcc_multilib_setup() {
         'mips64'    : ['gcc/config/mips/t-linux64'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
+        'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
+        'arm'       : ['gcc/config/aarch64/t-aarch64'],
     }
 
     gcc_header_config_files = {
@@ -140,6 +145,8 @@ python gcc_multilib_setup() {
         'mips64'    : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
+        'aarch64'   : ['gcc/config/aarch64/aarch64.h'],
+        'arm'       : ['gcc/config/aarch64/aarch64.h'],
     }
 
     libdir32 = 'SYSTEMLIBS_DIR'
-- 
2.7.4




