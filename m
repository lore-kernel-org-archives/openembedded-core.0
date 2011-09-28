Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8sWH-0003Em-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:41:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2011 04:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56721567"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2011 04:36:17 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 19:44:27 +0800
Message-Id: <a5236fd298387bfcd294229c238c8fe0edecf2a5.1317209357.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317209357.git.dongxiao.xu@intel.com>
References: <cover.1317209357.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317209357.git.dongxiao.xu@intel.com>
References: <cover.1317209357.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/6] multilib: remove the multilib handling to allarch
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
X-List-Received-Date: Wed, 28 Sep 2011 11:41:46 -0000

currently we have allarch type of recipes, which may still have
architecture dependency, like x11-common. So we need to drop the
handling to allarch in multilib case.

Also remove the PV postfix in python-pygobject DEPENDS, since multilib
code will treat a native package multilib capable.

[YOCTO #1497]
[YOCTO #1498]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass                      |    2 +-
 meta/classes/multilib_global.bbclass               |    2 +-
 meta/conf/multilib.conf                            |    7 +++++++
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 0ea1038..6c0dd37 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -8,7 +8,7 @@ python multilib_virtclass_handler () {
         return
 
     # There should only be one kernel in multilib configs
-    if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('allarch', e.data):
+    if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data):
         raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
 
     if bb.data.inherits_class('image', e.data):
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index cd22163..2da66a5 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -5,7 +5,7 @@ python multilib_virtclass_handler_global () {
     variant = e.data.getVar("BBEXTENDVARIANT", True)
 
     if isinstance(e, bb.event.RecipeParsed) and not variant:
-        if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('allarch', e.data):
+        if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data):
             variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()
 
             # Process PROVIDES
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 3133bf1..b9da33a 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -452,3 +452,10 @@ BBCLASSEXTEND_append_pn-zip = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zypper = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libsdl = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-qemu-config = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-x11-common = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-avahi-ui = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-python-pycairo = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-python-pygtk = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-python-pygobject = " ${MULTILIBS}"
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index 9ff2fe7..fd696a5 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python GObject bindings"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-DEPENDS = "python python-pygobject-native-${PV} glib-2.0"
+DEPENDS = "python python-pygobject-native glib-2.0"
 DEPENDS_virtclass-native = "glib-2.0-native"
 RDEPENDS_virtclass-native = ""
 PR = "r2"
-- 
1.7.1



