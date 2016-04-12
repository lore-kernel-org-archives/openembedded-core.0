Return-Path: <william.c.randle@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5A59760043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:22:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2016 08:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,474,1455004800"; d="scan'208";a="783342878"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.0.173])
	by orsmga003.jf.intel.com with ESMTP; 12 Apr 2016 08:22:25 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 08:22:21 -0700
Message-Id: <1460474541-3625-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] package.bbclass: handle links in sorted order
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
X-List-Received-Date: Tue, 12 Apr 2016 15:22:27 -0000

When processing links, the directories are processed in unsorted order
which can result in cases like /var/lock -> /run/lock handled before
/var/run -> /run throwing an error for /var/run because /run already exists.
Change the link processing to ensure links are processed in sorted order of
the destination.

[YOCTO #9430]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/classes/package.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4452e2f..894b729 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -727,6 +727,7 @@ python fixup_perms () {
     dvar = d.getVar('PKGD', True)
 
     fs_perms_table = {}
+    fs_link_table = {}
 
     # By default all of the standard directories specified in
     # bitbake.conf will get 0755 root:root.
@@ -773,24 +774,27 @@ python fixup_perms () {
                     continue
                 entry = fs_perms_entry(d.expand(line))
                 if entry and entry.path:
-                    fs_perms_table[entry.path] = entry
+                    if entry.link:
+                        fs_link_table[entry.link] = entry
+                    else:
+                        fs_perms_table[entry.path] = entry
             f.close()
 
     # Debug -- list out in-memory table
     #for dir in fs_perms_table:
     #    bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))
+    #for link in fs_link_table:
+    #    bb.note("Fixup Perms: %s: %s" % (link, str(fs_link_table[link])))
 
     # We process links first, so we can go back and fixup directory ownership
     # for any newly created directories
-    for dir in fs_perms_table:
-        if not fs_perms_table[dir].link:
-            continue
-
+    # Process in sorted order so /run gets created before /run/lock, etc.
+    for link in sorted(fs_link_table):
+        dir = fs_link_table[link].path
         origin = dvar + dir
         if not (cpath.exists(origin) and cpath.isdir(origin) and not cpath.islink(origin)):
             continue
 
-        link = fs_perms_table[dir].link
         if link[0] == "/":
             target = dvar + link
             ptarget = link
@@ -810,9 +814,6 @@ python fixup_perms () {
         os.symlink(link, origin)
 
     for dir in fs_perms_table:
-        if fs_perms_table[dir].link:
-            continue
-
         origin = dvar + dir
         if not (cpath.exists(origin) and cpath.isdir(origin)):
             continue
-- 
2.5.0


