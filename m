Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlqWa-0001EC-2A
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:54:52 +0200
Received: by rex (Postfix, from userid 1000)
	id 4897320D65; Tue, 26 Jul 2011 23:50:30 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 23:50:27 +0100
Message-Id: <65ac2aa7a645bc137c006df3583c8ff8766f6361.1311720062.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
References: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
References: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] image.bbclass: Added variables for multilib support.
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
X-List-Received-Date: Tue, 26 Jul 2011 22:54:52 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

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
index edfb2d6..1db915b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,13 +5,15 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL}"
+MULTILIB_IMAGE_INSTALL ?= ""
+RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${MULTILIB_IMAGE_INSTALL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL}"
+export MULTILIB_PACKAGE_INSTALL ?= "${MULTILIB_IMAGE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= ""
 
 # Images are generally built explicitly, do not need to be part of world.
@@ -88,6 +90,7 @@ do_rootfs[umask] = 022
 fakeroot do_rootfs () {
 	#set -x
 	rm -rf ${IMAGE_ROOTFS}
+	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
 
@@ -163,6 +166,55 @@ log_check() {
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
1.7.4.1



