Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4912673167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122173"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:04 +1300
Message-Id: <d9d0824228f56fe7ff65a32d292abd1ea9a7bdb9.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/9] devtool: add: delete externalsrc files on npm recipe do_install
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:33 -0000

The npm class just installs whatever is in ${S}; if you're using
externalsrc in conjunction with it the symlinks (oe-workdir and oe-logs
by default) plus singletask.lock will end up in the final package, which
isn't really right. Introduce a variable so we know the path the files
will be installed into within npm.bbclass, and append to do_install
within the workspace bbappend to delete the files.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/npm.bbclass        |  6 ++++--
 scripts/lib/devtool/standard.py | 11 +++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index b5db99d..33ff5e3 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -1,6 +1,8 @@
 DEPENDS_prepend = "nodejs-native "
 S = "${WORKDIR}/npmpkg"
 
+NPM_INSTALLDIR = "${D}${libdir}/node_modules/${PN}"
+
 npm_do_compile() {
 	# changing the home directory to the working directory, the .npmrc will
 	# be created in this directory
@@ -14,8 +16,8 @@ npm_do_compile() {
 }
 
 npm_do_install() {
-	mkdir -p ${D}${libdir}/node_modules/${PN}/
-	cp -a ${S}/* ${D}${libdir}/node_modules/${PN}/ --no-preserve=ownership
+	mkdir -p ${NPM_INSTALLDIR}/
+	cp -a ${S}/* ${NPM_INSTALLDIR}/ --no-preserve=ownership
 }
 
 python populate_packages_prepend () {
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7600a8f..9ac2ad5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -238,6 +238,17 @@ def add(args, config, basepath, workspace):
             f.write('    rm -f ${D}/singletask.lock\n')
             f.write('}\n')
 
+        if bb.data.inherits_class('npm', rd):
+            f.write('do_install_append() {\n')
+            f.write('    # Remove files added to source dir by devtool/externalsrc\n')
+            f.write('    rm -f ${NPM_INSTALLDIR}/singletask.lock\n')
+            f.write('    rm -rf ${NPM_INSTALLDIR}/.git\n')
+            f.write('    rm -rf ${NPM_INSTALLDIR}/oe-local-files\n')
+            f.write('    for symlink in ${EXTERNALSRC_SYMLINKS} ; do\n')
+            f.write('        rm -f ${NPM_INSTALLDIR}/${symlink%%:*}\n')
+            f.write('    done\n')
+            f.write('}\n')
+
     _add_md5(config, recipename, appendfile)
 
     logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
-- 
2.5.5


