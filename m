Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CED9678842
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 13:37:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2018 05:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,448,1511856000"; d="scan'208";a="200681612"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2018 05:37:21 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 5E45F5802D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 05:37:20 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Feb 2018 15:33:15 +0200
Message-Id: <1517578395-28398-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1517578395-28398-1-git-send-email-maxin.john@intel.com>
References: <1517578395-28398-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] x264: upgrade to latest revision
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
X-List-Received-Date: Fri, 02 Feb 2018 13:37:21 -0000

Change dependency from yasm to nasm following this change:

commit d2b5f4873e2147452a723b61b14f030b2ee760a5
Author: Henrik Gramner <henrik@gramner.com>
Date:   Sat Mar 18 18:50:36 2017 +0100

    x86: Change assembler from yasm to nasm

Refreshed the following patch:
        don-t-default-to-cortex-a9-with-neon.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../don-t-default-to-cortex-a9-with-neon.patch     | 29 ++++++++++++++++------
 meta/recipes-multimedia/x264/x264_git.bb           |  6 ++---
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
index 73f2aac..065e3b3 100644
--- a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
+++ b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
@@ -1,20 +1,33 @@
--march flag is not in CFLAGS so this will always default to -mcpu=cortex-a8
--mfpu=neon.
+From a72bf499a0674fc75eedf15008b424e28f67e4bd Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Fri, 2 Feb 2018 15:10:08 +0200
+Subject: [PATCH] dont default to cortex-a9 with neon
+
+-march flag is not in CFLAGS so this will always default to
+ -mcpu=cortex-a8 -mfpu=neon.
 
 Upstream-Status: Pending
+
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure | 3 ---
+ 1 file changed, 3 deletions(-)
 
 diff --git a/configure b/configure
-index 9d1586c..3109ec4 100755
+index 0e3ef23..955b993 100755
 --- a/configure
 +++ b/configure
-@@ -874,9 +874,6 @@ if [ $asm = auto -a \( $ARCH = X86 -o $ARCH = X86_64 \) ] ; then
+@@ -911,9 +911,6 @@ if [ $asm = auto -a \( $ARCH = X86 -o $ARCH = X86_64 \) ] ; then
  fi
  
  if [ $asm = auto -a $ARCH = ARM ] ; then
 -    # set flags so neon is built by default
--    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
+-    [ $compiler == CL ] || echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
 -
-     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
-         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
-         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
+     cc_check '' '' '__asm__("add r0, r1, r2");' && define HAVE_ARM_INLINE_ASM
+     if [ $compiler = CL ] && cpp_check '' '' 'defined(_M_ARM) && _M_ARM >= 7' ; then
+         define HAVE_ARMV6
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index bc9775a..a669295 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "yasm-native"
+DEPENDS = "nasm-native"
 
 SRC_URI = "git://github.com/mirror/x264;branch=stable \
            file://don-t-default-to-cortex-a9-with-neon.patch \
@@ -14,9 +14,9 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "2b741f81e51f92d053d87a49f59ff1026553a0f6"
+SRCREV = "e9a5903edf8ca59ef20e6f4894c196f135af735e"
 
-PV = "r2731+git${SRCPV}"
+PV = "r2854+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.4.0


