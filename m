Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEs-00068T-RY
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 May 2011 18:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; 
   d="scan'208";a="1790521"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga002.fm.intel.com with ESMTP; 14 May 2011 18:32:28 -0700
Message-Id: <212bfaaefe0979c155069b6d3a0d42205a398a67.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Wed, 11 May 2011 14:46:05 -0700
Date: Sat, 14 May 2011 18:32:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 11/15] gcc-common.inc: Consider hardfp knob for configuring toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 May 2011 01:35:23 -0000

From: Khem Raj <raj.khem@gmail.com>

pass --with-float=hard|soft depending upon ARM_FP_ABI settings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index a3fa234..8b7c3ad 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -8,10 +8,17 @@ NATIVEDEPS = ""
 inherit autotools gettext
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
-
 def get_gcc_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-        return "--with-float=soft"
+    if bb.data.getVar('TARGET_FPU', d, True) in [ 'soft', 'hard'] and bb.data.getVar('TARGET_OS', d, True).find('linux') >= 0 :
+        # ARM_FP_ABI could be either 'hardfp' or 'softfp'
+        arm_fpabi = bb.data.getVar('ARM_FP_ABI', d, True) or ""
+        if arm_fpabi != "":
+            if arm_fpabi  == "hardfp":
+                # reset it to whatever gcc --with-float configure expects which is either 'softfp' or 'hard'
+                arm_fpabi = "hard"
+            return "--with-float=" + arm_fpabi
+        else:
+            return "--with-float=" + bb.data.getVar('TARGET_FPU', d, True)
     return ""
 
 def get_gcc_mips_plt_setting(bb, d):
-- 
1.7.1.1



