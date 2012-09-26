Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TGsKv-0002Iq-MM
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:11:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2012 06:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; d="scan'208";a="149345927"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Sep 2012 06:57:40 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 17:00:10 +0300
Message-Id: <1348668010-7206-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: Added explicit network error status in SanityCheckFailed event
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
X-List-Received-Date: Wed, 26 Sep 2012 14:11:37 -0000

If we fail a network test, a special flag is set in the SanityChekFailed
event. This helps Hob identify the network error properly and display
a special message to the user.

[YOCTO #3025]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/classes/sanity.bbclass |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 385d733..86b8003 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -4,9 +4,12 @@
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
 
-def raise_sanity_error(msg, d):
+def raise_sanity_error(msg, d, network_error=False):
     if d.getVar("SANITY_USE_EVENTS", True) == "1":
-        bb.event.fire(bb.event.SanityCheckFailed(msg), d)
+        try:
+            bb.event.fire(bb.event.SanityCheckFailed(msg, network_error), d)
+        except TypeError:
+            bb.event.fire(bb.event.SanityCheckFailed(msg), d)
         return
 
     bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
@@ -119,8 +122,9 @@ def check_sanity_tmpdir_change(tmpdir, data):
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = check_create_long_filename(tmpdir, "TMPDIR")
     # Check that we can fetch from various network transports
+    errmsg = check_connectivity(data)
     testmsg = testmsg + check_connectivity(data)
-    return testmsg
+    return testmsg, errmsg == ""
         
 def check_sanity_version_change(data):
     # Sanity checks to be done when SANITY_VERSION changes
@@ -475,16 +479,18 @@ def check_sanity(sanity_data):
                 last_sstate_dir = line.split()[1]
     
     sanity_version = int(sanity_data.getVar('SANITY_VERSION', True) or 1)
+    network_error = False
     if last_sanity_version < sanity_version: 
         messages = messages + check_sanity_version_change(sanity_data)
-        messages = messages + check_sanity_tmpdir_change(tmpdir, sanity_data)
+        err, network_error = check_sanity_tmpdir_change(tmpdir, sanity_data)
+        messages = messages + err
         messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
     else: 
         if last_tmpdir != tmpdir:
-            messages = messages + check_sanity_tmpdir_change(tmpdir, sanity_data)
+            err, network_error = check_sanity_tmpdir_change(tmpdir, sanity_data)
+            messages = messages + err
         if last_sstate_dir != sstate_dir:
             messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
-
     if os.path.exists("conf") and not messages:
         f = file(sanityverfile, 'w')
         f.write("SANITY_VERSION %s\n" % sanity_version) 
@@ -555,7 +561,7 @@ def check_sanity(sanity_data):
         messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
 
     if messages != "":
-        raise_sanity_error(sanity_data.expand(messages), sanity_data)
+        raise_sanity_error(sanity_data.expand(messages), sanity_data, network_error)
 
 # Create a copy of the datastore and finalise it to ensure appends and 
 # overrides are set - the datastore has yet to be finalised at ConfigParsed
-- 
1.7.9.5



