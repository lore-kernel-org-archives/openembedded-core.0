Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFD66A5AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 15:17:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r56FHcsl008231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 08:17:38 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 6 Jun 2013 08:17:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 10:25:07 -0500
Message-ID: <1370532307-14473-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1370532307-14473-1-git-send-email-mark.hatle@windriver.com>
References: <1370532307-14473-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH RFC] base.bbclass: Add buildcfg multilib values
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
X-List-Received-Date: Thu, 06 Jun 2013 15:17:37 -0000
Content-Type: text/plain

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
---
 meta/classes/base.bbclass | 16 +++++++++++++++-
 meta/conf/bitbake.conf    |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b1642a2..67261f2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -277,7 +277,7 @@ def get_layers_branch_rev(d):
     return layers_branch_rev
 
 
-BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
+BUILDCFG_FUNCS ??= "buildcfg_vars buildcfg_multilibs get_layers_branch_rev buildcfg_neededvars"
 BUILDCFG_FUNCS[type] = "list"
 
 def buildcfg_vars(d):
@@ -287,6 +287,20 @@ def buildcfg_vars(d):
         if value is not None:
             yield '%-17s = "%s"' % (var, value)
 
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
index 174236d..27a56c0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -632,7 +632,7 @@ export PATCH_GET="0"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING DISTRO DISTRO_VERSION MACHINE DEFAULTTUNE TARGET_SYS TUNE_FEATURES TARGET_FPU"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
-- 
1.8.3.rc1.25.g423ecb0


