Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qe3HM-00062U-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:54:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2011 03:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="21667594"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2011 03:51:05 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:51:33 +0800
Message-Id: <45841c4839cd851e5f0b7b0c3346da8daba49409.1309862610.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
References: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1309862610.git.lianhao.lu@intel.com>
References: <cover.1309862610.git.lianhao.lu@intel.com>
Subject: [MULTILIB_SUBTASK4 4/5] image.bbclass: Added variables for multilib support.
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
X-List-Received-Date: Tue, 05 Jul 2011 10:54:56 -0000

1. Added MULTILIB_PACKAGE_INSTALL for multilib instances of packages to
be installed in the rootfs.

2. MULTILIBRE_ALLOW_REP contains the regular expression to match the
files allow to be replaced by the conflicting files.

3. MULTILIBRE_FORCE_SAME contains the regular expression to match the
files allow to be replaced only if the conflicting files are identical.

4. Added shell function multilib_sanity_check() to check whether the
overwring for multilib situation is allowed.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/image.bbclass |   54 +++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 53 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2469442..3aa3251 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,13 +5,15 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-RDEPENDS += "${IMAGE_INSTALL}"
+MULTILIB_IMAGE_INSTALL ?= ""
+RDEPENDS += "${IMAGE_INSTALL} ${MULTILIB_IMAGE_INSTALL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL}"
+export MULTILIB_PACKAGE_INSTALL ?= "${MULTILIB_IMAGE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= ""
 
 # Images are generally built explicitly, do not need to be part of world.
@@ -86,6 +88,7 @@ do_build[nostamp] = "1"
 fakeroot do_rootfs () {
 	#set -x
 	rm -rf ${IMAGE_ROOTFS}
+	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
 
@@ -161,6 +164,55 @@ log_check() {
 	done
 }
 
+MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|"
+MULTILIBRE_FORCE_SAME =. "${sysconfdir}|${datadir}|"
+MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
+MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
+
+multilib_generate_python_file() {
+  cat >${MULTILIB_CHECK_FILE} <<EOF
+import sys, os, os.path
+import re,filecmp
+
+allow_rep=re.compile(re.sub("\|$","","${MULTILIBRE_ALLOW_REP}"))
+force_same=re.compile(re.sub("\|$","","${MULTILIBRE_FORCE_SAME}"))
+error_promt="Multilib check error:"
+
+files={}
+dirs=raw_input()
+for dir in dirs.split():
+  for root, subfolers, subfiles in os.walk(dir):
+    for file in subfiles:
+      item=os.path.join(root,file)
+      key=str(os.path.join("/",os.path.relpath(item,dir)))
+
+      valid=True;
+      if files.has_key(key):
+        #check whether files are the same
+        if force_same.match(key):
+          if not filecmp.cmp(files[key],item):
+             valid=False
+             print("%s %s is not the same as %s\n" % (error_promt, item, files[key]))
+             sys.exit(1)
+        #check whether the file is allow to replace
+        elif allow_rep.match(key):
+          valid=True
+        else: 
+          valid=False
+          print("%s duplicated files %s %s not allowed\n" % (error_promt, item, files[key]))
+          sys.exit(1)
+
+      #pass the check, add to list
+      if valid:
+        files[key]=item
+EOF
+}
+
+multilib_sanity_check() {
+  multilib_generate_python_file
+  echo $@ | python ${MULTILIB_CHECK_FILE}
+}
+
 # set '*' as the rootpassword so the images
 # can decide if they want it or not
 
-- 
1.7.0.4



