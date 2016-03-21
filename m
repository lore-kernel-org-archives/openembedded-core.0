Return-Path: <william.c.randle@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EFEED60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 20:24:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 21 Mar 2016 13:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="768513775"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.6.123])
	by orsmga003.jf.intel.com with ESMTP; 21 Mar 2016 13:24:49 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 13:24:33 -0700
Message-Id: <1458591873-25879-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] sanity.bbclass cleanup
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
X-List-Received-Date: Mon, 21 Mar 2016 20:24:51 -0000

Limit search for a version var name to start at the beginning of a line,
otherwise, if the var name is used in a comment, that comment line will
be replaced, rather than the desired assignment line.
Move bblayer update message into function where it's actually updated,
rather than assuming all successful config file update are to the
bblayers.conf file.
Replace a stray tab with spaces for consistency.

[Fixes YOCTO #9318]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/classes/sanity.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4873e64..597f3de 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -20,7 +20,7 @@ def sanity_conf_find_line(pattern, lines):
         if re.search(pattern, line)), (None, None))
 
 def sanity_conf_update(fn, lines, version_var_name, new_version):
-    index, line = sanity_conf_find_line(version_var_name, lines)
+    index, line = sanity_conf_find_line(r"^%s" % version_var_name, lines)
     lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
     with open(fn, "w") as f:
         f.write(''.join(lines))
@@ -117,12 +117,14 @@ is a good way to visualise the changes.""" % (current_lconf, lconf_version)
 
         current_lconf += 1
         sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        bb.note("Your conf/bblayers.conf has been automatically updated.")
         return
 
     elif current_lconf == 5 and lconf_version > 5:
         # Null update, to avoid issues with people switching between poky and other distros
         current_lconf = 6
         sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        bb.note("Your conf/bblayers.conf has been automatically updated.")
         return
 
         if not status.reparse:
@@ -133,7 +135,7 @@ is a good way to visualise the changes.""" % (current_lconf, lconf_version)
         # This marks the start of separate version numbers but code is needed in OE-Core
         # for the migration, one last time.
         layers = d.getVar('BBLAYERS', True).split()
-	layers = [ os.path.basename(path) for path in layers ]
+        layers = [ os.path.basename(path) for path in layers ]
         if 'meta-yocto' in layers:
             found = False
             while True:
@@ -152,9 +154,11 @@ is a good way to visualise the changes.""" % (current_lconf, lconf_version)
                 raise NotImplementedError(failmsg)
             with open(bblayers_fn, "w") as f:
                 f.write(''.join(lines))
+            bb.note("Your conf/bblayers.conf has been automatically updated.")
             return
         current_lconf += 1
         sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        bb.note("Your conf/bblayers.conf has been automatically updated.")
         return
 
     raise NotImplementedError(failmsg)
@@ -556,7 +560,6 @@ def sanity_check_conffiles(status, d):
                 success = False
                 status.addresult(e.msg)
             if success:
-                bb.note("Your conf/bblayers.conf has been automatically updated.")
                 status.reparse = True
 
 def sanity_handle_abichanges(status, d):
-- 
2.5.0


