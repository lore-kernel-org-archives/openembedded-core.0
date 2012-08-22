Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T48lC-0006VG-O4
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 13:06:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2012 03:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,808,1336374000"; d="scan'208";a="136782574"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.122])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2012 03:53:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 11:53:06 +0100
Message-Id: <1345632786-10657-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/package: document do_packages_split arguments
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
X-List-Received-Date: Wed, 22 Aug 2012 11:06:07 -0000

This function takes quite a number of arguments and can be tricky to use
properly; this is not made easier if it is undocumented, so document all
of the arguments. (No functional changes, comments only.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |   41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b17fa08..46facf7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -73,6 +73,47 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
     """
     Used in .bb files to split up dynamically generated subpackages of a
     given package, usually plugins or modules.
+
+    Arguments:
+    root           -- the path in which to search
+    file_regex     -- regular expression to match searched files. Use
+                      parentheses () to mark the part of this expression
+                      that should be used to derive the module name (to be
+                      substituted where %s is used in other function
+                      arguments as noted below)
+    output_pattern -- pattern to use for the package names. Must include %s.
+    description    -- description to set for each package. Must include %s.
+    postinst       -- postinstall script to use for all packages (as a
+                      string)
+    recursive      -- True to perform a recursive search - default False
+    hook           -- a hook function to be called for every match. The
+                      function will be called with the following arguments
+                      (in the order listed):
+                        f: full path to the file/directory match
+                        pkg: the package name
+                        file_regex: as above
+                        output_pattern: as above
+                        modulename: the module name derived using file_regex
+    extra_depends  -- extra runtime dependencies (RDEPENDS) to be set for
+                      all packages. The default value of None causes a
+                      dependency on the main package (${PN}) - if you do
+                      not want this, pass '' for this parameter.
+    aux_files_pattern -- extra item(s) to be added to FILES for each
+                      package. Can be a single string item or a list of
+                      strings for multiple items.  Must include %s.
+    postrm         -- postrm script to use for all packages (as a string)
+    allow_dirs     -- True allow directories to be matched - default False
+    prepend        -- if True, prepend created packages to PACKAGES instead
+                      of the default False which appends them
+    match_path     -- match file_regex on the whole relative path to the
+                      root rather than just the file name
+    aux_files_pattern_verbatim -- extra item(s) to be added to FILES for
+                      each package, using the actual derived module name
+                      rather than converting it to something legal for a
+                      package name. Can be a single string item or a list
+                      of strings for multiple items. Must include %s.
+    allow_links    -- True to allow symlinks to be matched - default False
+
     """
 
     ml = d.getVar("MLPREFIX", True)
-- 
1.7.9.5



