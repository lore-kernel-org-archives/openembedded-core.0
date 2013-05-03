Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UYGGU-0004ES-MA
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 15:43:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2013 06:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,604,1363158000"; d="scan'208";a="307497521"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.224])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2013 06:25:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 14:21:59 +0100
Message-Id: <1367587319-29339-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/image: allow complementary package globs to be extended
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 13:43:23 -0000

Make it easy for the wildcard specifications for complementary package
features to be extended outside of image.bbclass. For example, to add a
new "foo-pkgs" item that could be added to IMAGE_FEATURES that would
cause *-foo packages to be installed for all packages currently in the
image, you can now use this line at the global level:

COMPLEMENTARY_GLOB[foo-pkgs] = "*-foo"

Implements [YOCTO #4228].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ffb372a..5bc0ca2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,7 +33,7 @@ NORMAL_FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages
 
 def normal_groups(d):
     """Return all the IMAGE_FEATURES, with the exception of our special package groups"""
-    extras = set(['dev-pkgs', 'staticdev-pkgs', 'doc-pkgs', 'dbg-pkgs', 'ptest-pkgs'])
+    extras = set(d.getVarFlags('COMPLEMENTARY_GLOB').keys())
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
     return features.difference(extras)
 
@@ -43,20 +43,19 @@ PACKAGE_GROUP_splash = "${SPLASH}"
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
+COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
+COMPLEMENTARY_GLOB[staticdev-pkgs] = '*-staticdev'
+COMPLEMENTARY_GLOB[doc-pkgs] = '*-doc'
+COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
+COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest'
+
 def complementary_globs(featurevar, d):
+    all_globs = d.getVarFlags('COMPLEMENTARY_GLOB')
     globs = []
     features = set((d.getVar(featurevar, True) or '').split())
-    for feature in features:
-        if feature == 'dev-pkgs':
-            globs.append('*-dev')
-        elif feature == 'staticdev-pkgs':
-            globs.append('*-staticdev')
-        elif feature == 'doc-pkgs':
-            globs.append('*-doc')
-        elif feature == 'dbg-pkgs':
-            globs.append('*-dbg')
-        elif feature == 'ptest-pkgs':
-            globs.append('*-ptest')
+    for name, glob in all_globs.items():
+        if name in features:
+            globs.append(glob)
     return ' '.join(globs)
 
 IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
-- 
1.8.1.2



