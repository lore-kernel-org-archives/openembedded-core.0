Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 92E7E79BEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 09:50:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42dsFm2gKtz1qyB7;
	Mon, 22 Oct 2018 11:50:20 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42dsFm1tL1z1qql7;
	Mon, 22 Oct 2018 11:50:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id q-tZWCxgIeH5; Mon, 22 Oct 2018 11:50:18 +0200 (CEST)
X-Auth-Info: zqVC4SDw8rV1zIRo1i4lABeI1c39jg3yw8jyLS2iUlt9YeztrGAy4JiJQ8DoNSXw
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-35.customer.izb-online.de [141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 22 Oct 2018 11:50:18 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 09:50:08 +0000
Message-Id: <20181022095008.19578-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <8d31e8cc-f8ad-b752-0240-b0d0976e3851@denx.de>
References: <8d31e8cc-f8ad-b752-0240-b0d0976e3851@denx.de>
Cc: Marek Vasut <marex@denx.de>, Anders Darander <anders@chargestorm.se>,
	Joshua Lock <joshua.g.lock@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH v2] npm: change install directory to upstream default
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
X-List-Received-Date: Mon, 22 Oct 2018 09:50:21 -0000

The node binary searches for packages in a number of locations, the last
of which is $PREFIX/lib/node (here: /usr/lib/node) from the list of
GLOBAL_FOLDERS [1]. So change the installation directory for all
packages depending on npm.bbclass to that location. This removes the
need to define the NODE_PATH variable to the non-standard
/usr/lib/node_modules value.

While the Tips for Package Managers [2] discusses installing packages to
/usr/lib/node_modules/<name>/<version>, this has several drawbacks:

 * it does not work for the REPL as mentioned in the documentation
 * it also does not work for any code _not_ installed as a global
   package under /usr/lib/node_modules (e.g. /usr/share/foo.js will not
   find any packages below /usr/lib)
 * using the non-default location and then having to set NODE_PATH
   barely saves any time: there are only two file-system lookups (to the
   legacy $HOME/.node_modules and $HOME/.node_libraries) directories
   before the library would be found

And the suggestion was made in the context of deduping the node_modules
tree by installing all packages in a flat hierarchy and using symlinks
to the correct version of each dependency. This is not what OpenEmbedded
does, so none of those benefits (deduping, cleaner packages) are being
had by shifting the installation directory to /usr/lib/node_modules.

The choice of a "proper" installation path is not helped by npm
installing to /usr/lib/node_modules if asked to install globally. Still,
using the location expected by nodejs (/usr/lib/node) seems the right
choice.

[1]: https://nodejs.org/api/modules.html#modules_loading_from_the_global_folders
[2]: https://nodejs.org/api/modules.html#modules_addenda_package_manager_tips

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta/classes/npm.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index c351ff0866..30febcffb2 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -10,7 +10,7 @@ def node_pkgname(d):
 
 NPMPN ?= "${@node_pkgname(d)}"
 
-NPM_INSTALLDIR = "${D}${libdir}/node_modules/${NPMPN}"
+NPM_INSTALLDIR = "${libdir}/node/${NPMPN}"
 
 # function maps arch names to npm arch names
 def npm_oe_arch_map(target_arch, d):
@@ -52,9 +52,10 @@ npm_do_install() {
 	# changing the home directory to the working directory, the .npmrc will
 	# be created in this directory
 	export HOME=${WORKDIR}
-	mkdir -p ${NPM_INSTALLDIR}/
+	mkdir -p ${D}${libdir}/node_modules
 	npm pack .
 	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPMPN}-${PV}.tgz
+	mv ${D}${libdir}/node_modules ${D}${libdir}/node
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
@@ -62,13 +63,13 @@ npm_do_install() {
 }
 
 python populate_packages_prepend () {
-    instdir = d.expand('${D}${libdir}/node_modules/${NPMPN}')
+    instdir = d.expand('${D}${NPM_INSTALLDIR}')
     extrapackages = oe.package.npm_split_package_dirs(instdir)
     pkgnames = extrapackages.keys()
     d.prependVar('PACKAGES', '%s ' % ' '.join(pkgnames))
     for pkgname in pkgnames:
         pkgrelpath, pdata = extrapackages[pkgname]
-        pkgpath = '${libdir}/node_modules/${NPMPN}/' + pkgrelpath
+        pkgpath = '${NPM_INSTALLDIR}/' + pkgrelpath
         # package names can't have underscores but npm packages sometimes use them
         oe_pkg_name = pkgname.replace('_', '-')
         expanded_pkgname = d.expand(oe_pkg_name)
@@ -84,7 +85,7 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN} += " \
-    ${libdir}/node_modules/${NPMPN} \
+    ${NPM_INSTALLDIR} \
 "
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.11.0


