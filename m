Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA9726F595
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 11:27:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s37BRT7l029651
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 04:27:30 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Apr 2014 04:27:29 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Apr 2014 19:27:19 +0800
Message-ID: <1396870039-26834-3-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] binconfig.bbclass: fix multilib file conflicts
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
X-List-Received-Date: Mon, 07 Apr 2014 11:27:28 -0000
Content-Type: text/plain

In most cases binconfig files conflict among multilib packages, to avoid
that, use update-alternatives link *-config from real path with a
PACKAGE_ARCH suffix.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/binconfig.bbclass | 65 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 7158c8c..c5503b7 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -1,4 +1,4 @@
-FILES_${PN}-dev += "${bindir}/*-config"
+FILES_${PN}-dev += "${bindir}/*-config.${PACKAGE_ARCH}"
  
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
@@ -31,14 +31,21 @@ BINCONFIG_GLOB ?= "*-config"
 PACKAGE_PREPROCESS_FUNCS += "binconfig_package_preprocess"
 
 binconfig_package_preprocess () {
-	for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
-		sed -i \
-		    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
-		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
-		    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
-		    -e 's:${STAGING_DATADIR}:${datadir}:' \
-		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
-                    $config
+	for config in `find ${PKGD}${bindir} -name '${BINCONFIG_GLOB}'`; do
+		if [ -h $config ]; then
+			real_config=`readlink $config`
+			unlink $config
+			( cd ${PKGD}${bindir} ; ln -sf $real_config.${PACKAGE_ARCH} $config.${PACKAGE_ARCH} )
+		else
+			sed -i \
+			    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
+			    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
+			    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
+			    -e 's:${STAGING_DATADIR}:${datadir}:' \
+			    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
+			    $config
+			mv $config $config.${PACKAGE_ARCH}
+		fi
 	done
 	for lafile in `find ${PKGD} -name "*.la"` ; do
 		sed -i \
@@ -51,6 +58,46 @@ binconfig_package_preprocess () {
 	done	    
 }
 
+BINCONFIG_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])}"
+
+PACKAGESPLITFUNCS_prepend = "populate_packages_binconfig "
+
+#
+# Fix binconfig conflicts among multilib packages
+#
+python populate_packages_binconfig () {
+    import os, glob
+
+    pkg = d.getVar('PN', True) + '-dev'
+    dvar = d.getVar('PKGD', True)
+    bindir = d.getVar('bindir', True)
+    binconfig_glob = d.getVar('BINCONFIG_GLOB', True)
+    binconfig_priority = d.getVar('BINCONFIG_PRIORITY', True)
+    binconfig_setup_links = ""
+    binconfig_remove_links = ""
+    for file in glob.glob(dvar + bindir + os.sep + binconfig_glob + '.' + d.getVar('PACKAGE_ARCH', True)):
+        binconfig_target = os.path.basename(file)
+        binconfig_name = binconfig_target[:binconfig_target.find('.')]
+        binconfig_link = bindir + os.sep + binconfig_name
+        binconfig_setup_links += '\tupdate-alternatives --install %s %s %s %s\n' % (binconfig_link, binconfig_name, binconfig_target, binconfig_priority)
+        binconfig_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (binconfig_name, binconfig_target)
+
+        if binconfig_setup_links:
+            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
+            if provider:
+                d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)
+
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or '#!/bin/sh\n'
+            postinst += binconfig_setup_links
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or '#!/bin/sh\n'
+            postrm += binconfig_remove_links
+            d.setVar('pkg_postrm_%s' % pkg, postrm)
+}
+
 SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
 
 binconfig_sysroot_preprocess () {
-- 
1.8.4.1


