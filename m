Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9FF6B8B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010196"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:33 +0000
Message-Id: <866a50e8c9ca424327448e1341788415143c4063.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 37/38] classes/package: set SUMMARY in do_split_packages()
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:37 -0000

do_split_packages() is commonly used to split out plugin/module packages
dynamically within recipes. If it doesn't set SUMMARY for each of these
packages then they get a generic SUMMARY from the recipe, which isn't
particularly useful; so add a parameter to set this and default it from
the current description parameter (it ought to have been the other way
around, but the description parameter is what we currently have in use
by all recipes that use this function.)

Fixes [YOCTO #5406].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index eb4cf44..9b4f11a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -72,7 +72,7 @@ def legitimize_package_name(s):
     # Remaining package name validity fixes
     return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
 
-def do_split_packages(d, root, file_regex, output_pattern, description, postinst=None, recursive=False, hook=None, extra_depends=None, aux_files_pattern=None, postrm=None, allow_dirs=False, prepend=False, match_path=False, aux_files_pattern_verbatim=None, allow_links=False):
+def do_split_packages(d, root, file_regex, output_pattern, description, postinst=None, recursive=False, hook=None, extra_depends=None, aux_files_pattern=None, postrm=None, allow_dirs=False, prepend=False, match_path=False, aux_files_pattern_verbatim=None, allow_links=False, summary=None):
     """
     Used in .bb files to split up dynamically generated subpackages of a
     given package, usually plugins or modules.
@@ -116,6 +116,8 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
                       package name. Can be a single string item or a list
                       of strings for multiple items. Must include %s.
     allow_links    -- True to allow symlinks to be matched - default False
+    summary        -- Summary to set for each package. Must include %s;
+                      defaults to description if not set.
 
     """
 
@@ -161,6 +163,9 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     if extra_depends == None:
         extra_depends = d.getVar("PN", True)
 
+    if not summary:
+        summary = description
+
     for o in sorted(objs):
         import re, stat
         if match_path:
@@ -206,6 +211,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             if extra_depends != '':
                 d.appendVar('RDEPENDS_' + pkg, ' ' + extra_depends)
             d.setVar('DESCRIPTION_' + pkg, description % on)
+            d.setVar('SUMMARY_' + pkg, summary % on)
             if postinst:
                 d.setVar('pkg_postinst_' + pkg, postinst)
             if postrm:
-- 
1.8.1.2


