Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE646D4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:25:27 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 0120AA02EB8; Wed, 20 Nov 2013 17:26:51 -0600 (CST)
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2013 17:26:51 -0600
Message-Id: <698408480f816c3b6a8bfd76f2a166a93f6fbc59.1384989468.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1384989468.git.peter.seebach@windriver.com>
References: <cover.1384989468.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1384989468.git.peter.seebach@windriver.com>
References: <cover.1384989468.git.peter.seebach@windriver.com>
Subject: [PATCH 1/1] sanity.bbclass: Failure might be an option.
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
X-List-Received-Date: Wed, 20 Nov 2013 23:25:27 -0000

Matching up with corresponding changes in bitbake, we now use
the SanityCheck event instead of piggybacking the sanity checks
on ConfigParsed. The SanityCheck event can indicate to us whether
we should use events to provide feedback, and whether failures
are acceptable. This allows a build tool which wants to evaluate
a configuration even if it fails sanity testing to do so; the
most obvious example is bitbake -e, but bitbake-layers show_layers
might also want to be adapted to use this.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass |   38 +++++++++++++++++++++++++-------------
 1 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6807a23..ca9e146 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -74,7 +74,7 @@ python oecore_update_bblayers() {
     sys.exit()
 }
 
-def raise_sanity_error(msg, d, network_error=False):
+def raise_sanity_error(msg, d, network_error=False, failure_is_an_option=False):
     if d.getVar("SANITY_USE_EVENTS", True) == "1":
         try:
             bb.event.fire(bb.event.SanityCheckFailed(msg, network_error), d)
@@ -82,11 +82,15 @@ def raise_sanity_error(msg, d, network_error=False):
             bb.event.fire(bb.event.SanityCheckFailed(msg), d)
         return
 
-    bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
+    msg = (""" OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
     Following is the list of potential problems / advisories:
     
     %s""" % msg)
+    if failure_is_an_option:
+        bb.error(msg)
+    else:
+        bb.fatal(msg)
 
 # Check a single tune for validity.
 def check_toolchain_tune(data, tune, multilib):
@@ -677,7 +681,7 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
-def check_sanity(sanity_data):
+def check_sanity(sanity_data, failure_is_an_option = False):
     import subprocess
 
     class SanityStatus(object):
@@ -730,7 +734,10 @@ def check_sanity(sanity_data):
     sanity_handle_abichanges(status, sanity_data)
 
     if status.messages != "":
-        raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
+        sanity_data.setVar("SANITY_CHECK_FAILED", "1")
+        raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error, failure_is_an_option)
+    else:
+        sanity_data.setVar("SANITY_CHECK_FAILED", "0")
     return status.reparse
 
 # Create a copy of the datastore and finalise it to ensure appends and 
@@ -741,18 +748,23 @@ def copy_data(e):
     return sanity_data
 
 addhandler check_sanity_eventhandler
-check_sanity_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.SanityCheck bb.event.NetworkTest"
+check_sanity_eventhandler[eventmask] = "bb.event.SanityCheck bb.event.NetworkTest"
 python check_sanity_eventhandler() {
-    if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
+    if bb.event.getName(e) == "SanityCheck":
         sanity_data = copy_data(e)
-        reparse = check_sanity(sanity_data)
+        if e._use_events:
+            sanity_data.setVar("SANITY_USE_EVENTS", "1")
+        reparse = check_sanity(sanity_data, e._failure_is_an_option)
         e.data.setVar("BB_INVALIDCONF", reparse)
-    elif bb.event.getName(e) == "SanityCheck":
-        sanity_data = copy_data(e)
-        sanity_data.setVar("SANITY_USE_EVENTS", "1")
-        reparse = check_sanity(sanity_data)
-        e.data.setVar("BB_INVALIDCONF", reparse)
-        bb.event.fire(bb.event.SanityCheckPassed(), e.data)
+        failed = sanity_data.getVar("SANITY_CHECK_FAILED", True)
+        if e._use_events:
+            if failed == "0":
+                bb.event.fire(bb.event.SanityCheckPassed(), e.data)
+        else:
+            # If we got here, failure must have been an option,
+            # so we are continuing, we'd better make sure the caller
+            # can see what happened.
+            e.data.setVar("SANITY_CHECK_FAILED", failed)
     elif bb.event.getName(e) == "NetworkTest":
         sanity_data = copy_data(e)
         bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
-- 
1.7.1


