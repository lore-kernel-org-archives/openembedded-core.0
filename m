Return-Path: <william.c.randle@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BDFCA60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:23:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 22 Mar 2016 10:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="769229910"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.6.123])
	by orsmga003.jf.intel.com with ESMTP; 22 Mar 2016 10:23:24 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 10:23:18 -0700
Message-Id: <1458667398-3399-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] sanity.bbclass: check host tool dependencies on change in NATIVELBSSTRING
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
X-List-Received-Date: Tue, 22 Mar 2016 17:23:25 -0000

When a user upgrades their host distro, it may no longer have all the
required tools installed, but this won't be caught by bitbake resulting
in possible build errors. Rather than check for installed tools on every
startup, use the NATIVELBSSTRING change as indicator to rescan for host
tool dependencies. Store the NATIVELBSSTRING in the sanity_info file.

[YOCTO #8585]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/classes/sanity.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 597f3de..fadad1b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -641,9 +641,9 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
     return testmsg
        
 def check_sanity_version_change(status, d):
-    # Sanity checks to be done when SANITY_VERSION changes
+    # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING changes
     # In other words, these tests run once in a given build directory and then 
-    # never again until the sanity version changes.
+    # never again until the sanity version or host distrubution id/version changes.
 
     # Check the python install is complete. glib-2.0-natives requries
     # xml.parsers.expat
@@ -937,6 +937,7 @@ def check_sanity(sanity_data):
     last_sanity_version = 0
     last_tmpdir = ""
     last_sstate_dir = ""
+    last_nativelsbstr = ""
     sanityverfile = sanity_data.expand("${TOPDIR}/conf/sanity_info")
     if os.path.exists(sanityverfile):
         with open(sanityverfile, 'r') as f:
@@ -947,12 +948,17 @@ def check_sanity(sanity_data):
                     last_tmpdir = line.split()[1]
                 if line.startswith('SSTATE_DIR'):
                     last_sstate_dir = line.split()[1]
+                if line.startswith('NATIVELSBSTRING'):
+                    last_nativelsbstr = line.split()[1]
 
     check_sanity_everybuild(status, sanity_data)
     
     sanity_version = int(sanity_data.getVar('SANITY_VERSION', True) or 1)
     network_error = False
-    if last_sanity_version < sanity_version: 
+    # NATIVELSBSTRING var may have been overridden with "universal", so
+    # get actual host distribution id and version
+    nativelsbstr = lsb_distro_identifier(sanity_data)
+    if last_sanity_version < sanity_version or last_nativelsbstr != nativelsbstr: 
         check_sanity_version_change(status, sanity_data)
         status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
     else: 
@@ -964,6 +970,7 @@ def check_sanity(sanity_data):
             f.write("SANITY_VERSION %s\n" % sanity_version) 
             f.write("TMPDIR %s\n" % tmpdir) 
             f.write("SSTATE_DIR %s\n" % sstate_dir) 
+            f.write("NATIVELSBSTRING %s\n" % nativelsbstr) 
 
     sanity_handle_abichanges(status, sanity_data)
 
-- 
2.5.0


