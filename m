Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF63674DAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:39:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P2dJ3B026184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:39:34 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:39:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:06 +0800
Message-ID: <56d696e2a24b5ba066cbb2a02af31bb4496eaa07.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/24] base.bbclass: Add buildcfg multilib values
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
X-List-Received-Date: Fri, 25 May 2018 02:39:43 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

When displaying the buildcfg for the end user, add in processing
of the multilib variants.  Only the items that are not the same as
the DEFAULTTUNE are displayed.

I.e.:
Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "CentOS-6.4"
DISTRO_VERSION    = "oe-core.0"
MACHINE           = "qemux86-64"
DEFAULTTUNE       = "x86-64"
TARGET_SYS        = "x86_64-oe-linux"
TUNE_FEATURES     = "m64"
TARGET_FPU        = ""
lib32:  DEFAULTTUNE       = "x86"
lib32:  TARGET_SYS        = "i586-oe-linux"
lib32:  TUNE_FEATURES     = "m32"
meta              = "master:1975f3d7bbeb184489a5d0a2e0de231f317d3e1b"

The order of the displayed elements was changed slightly to group the
host information together, as well as group the target information
together.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 16 +++++++++++++++-
 meta/conf/bitbake.conf    |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7c42cf9..fa5c24b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -188,7 +188,7 @@ def get_layers_branch_rev(d):
     return layers_branch_rev
 
 
-BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
+BUILDCFG_FUNCS ??= "buildcfg_vars buildcfg_multilibs get_layers_branch_rev buildcfg_neededvars"
 BUILDCFG_FUNCS[type] = "list"
 
 def buildcfg_vars(d):
@@ -198,6 +198,20 @@ def buildcfg_vars(d):
         if value is not None:
             yield '%-20s = "%s"' % (var, value)
 
+def buildcfg_multilibs(d):
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for variant in variants.split():
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+        localdata.setVar("OVERRIDES", overrides)
+        bb.data.update_data(localdata)
+        statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
+        for var in statusvars:
+            origvalue = d.getVar(var, True)
+            variantvalue = localdata.getVar(var, True)
+            if origvalue is not None and variantvalue is not None and origvalue != variantvalue:
+                yield '%-7s %-17s = "%s"' % (variant + ":", var, variantvalue)
+
 def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
     pesteruser = []
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6ecf78b..73686ea 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -699,7 +699,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING DISTRO DISTRO_VERSION MACHINE DEFAULTTUNE TARGET_SYS TUNE_FEATURES TARGET_FPU"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
-- 
2.7.4


