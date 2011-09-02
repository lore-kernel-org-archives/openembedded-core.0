Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QzPgT-0003UB-SZ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:05:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2011 02:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,317,1312182000"; d="scan'208";a="48031606"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2011 02:00:14 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:03:36 +0800
Message-Id: <ebfc24b94166e681b4edad8db4df57fff1d5e79b.1314953755.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/5] multilib: set NO_MULTILIB for kernel recipes
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
X-List-Received-Date: Fri, 02 Sep 2011 09:05:10 -0000

Kernel in a Linux system shouldn't be multilib, thus setting NO_MULTILIB
flag for kernel.bbclass. Besides if other recipes have dependency on
virtual/kernel or kernel-module-*, we don't extend name for them.

Some part of the commit is derived from Ke's prototype in:
http://bugzilla.pokylinux.org/show_bug.cgi?id=1361

[YOCTO #1361]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/kernel.bbclass   |    1 +
 meta/classes/multilib.bbclass |   11 +++++++++++
 meta/conf/multilib.conf       |    1 -
 3 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bc1baa0..d522b4c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -9,6 +9,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
+NO_MULTILIB = "1"
 
 python __anonymous () {
     kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5d975fd..1908aa1 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -6,6 +6,11 @@ python multilib_virtclass_handler () {
     variant = e.data.getVar("BBEXTENDVARIANT", True)
     if cls != "multilib" or not variant:
         return
+
+    if e.data.getVar("NO_MULTILIB", True) == "1":
+        bb.warn("NO_MULTILIB is set for %s, using the default instead." % e.data.getVar("PN", True))
+        return
+
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
     for name in save_var_name.split():
         val=e.data.getVar(name, True)
@@ -28,7 +33,13 @@ STAGINGCC_prepend = "${BBEXTENDVARIANT}-"
 python __anonymous () {
     variant = d.getVar("BBEXTENDVARIANT", True)
 
+    if d.getVar("NO_MULTILIB", True) == "1":
+        bb.warn("NO_MULTILIB is set for %s, using the default instead." % d.getVar("PN", True))
+        return
+
     def extend_name(name):
+        if name == "virtual/kernel" or name.startswith("kernel-module"):
+            return name
         if name.startswith("virtual/"):
             subs = name.split("/", 1)[1]
             if not subs.startswith(variant):
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 36793d2..9fca715 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -237,7 +237,6 @@ BBCLASSEXTEND_append_pn-libxxf86vm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libzypp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lighttpd = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-linux-yocto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-logrotate = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lrzsz = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsb = " ${MULTILIBS}"
-- 
1.7.1



