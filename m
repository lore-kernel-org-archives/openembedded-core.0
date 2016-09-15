Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62A12771F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:21:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 15 Sep 2016 04:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,339,1470726000"; d="scan'208";a="1030459714"
Received: from lvernat-mobl7.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.23.81])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2016 04:21:27 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 14:21:26 +0300
Message-Id: <1473938486-12891-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] sanity.bbclass: split out config re-parse check
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
X-List-Received-Date: Thu, 15 Sep 2016 11:21:27 -0000

Split out the functionality doing configuration re-parse check into a
separate event handler that is hooked into ConfigParsed event. This will
make config re-parsing actually work. Re-parsing in bitbake is triggered
by setting BB_INVALIDCONF whose value is checked after configuration has
been parsed (after ConfigParsed event). However, previously
BB_INVALIDCONF was set in SanityCheck event handler which caused
re-parsing never to happen.

[YOCTO #10188]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sanity.bbclass | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f17e2d4..7682ffb 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -135,8 +135,7 @@ is a good way to visualise the changes."""
         bb.note("Your conf/bblayers.conf has been automatically updated.")
         return
 
-        if not status.reparse:
-            status.addresult()
+        status.addresult()
 
     elif current_lconf == 6 and lconf_version > 6:
         # Handle rename of meta-yocto -> meta-poky
@@ -557,20 +556,17 @@ def check_perl_modules(sanity_data):
         return "Required perl module(s) not found: %s\n\n%s\n" % (ret, errresult)
     return None
 
-def sanity_check_conffiles(status, d):
+def sanity_check_conffiles(d):
     funcs = d.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
     for func in funcs:
         conffile, current_version, required_version, func = func.split(":")
         if check_conf_exists(conffile, d) and d.getVar(current_version, True) is not None and \
                 d.getVar(current_version, True) != d.getVar(required_version, True):
-            success = True
             try:
                 bb.build.exec_func(func, d, pythonexception=True)
             except NotImplementedError as e:
-                success = False
-                status.addresult(str(e))
-            if success:
-                status.reparse = True
+                bb.fatal(e)
+            d.setVar("BB_INVALIDCONF", True)
 
 def sanity_handle_abichanges(status, d):
     #
@@ -746,7 +742,7 @@ def check_sanity_version_change(status, d):
             status.addresult("You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n")
 
     bbpaths = d.getVar('BBPATH', True).split(":")
-    if ("." in bbpaths or "./" in bbpaths or "" in bbpaths) and not status.reparse:
+    if ("." in bbpaths or "./" in bbpaths or "" in bbpaths):
         status.addresult("BBPATH references the current directory, either through "    \
                 "an empty entry, a './' or a '.'.\n\t This is unsafe and means your "\
                 "layer configuration is adding empty elements to BBPATH.\n\t "\
@@ -796,8 +792,6 @@ def check_sanity_everybuild(status, d):
 
     sanity_check_locale(d)
 
-    sanity_check_conffiles(status, d)
-
     paths = d.getVar('PATH', True).split(":")
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
@@ -943,7 +937,6 @@ def check_sanity(sanity_data):
         def __init__(self):
             self.messages = ""
             self.network_error = False
-            self.reparse = False
 
         def addresult(self, message):
             if message:
@@ -999,7 +992,6 @@ def check_sanity(sanity_data):
 
     if status.messages != "":
         raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
-    return status.reparse
 
 # Create a copy of the datastore and finalise it to ensure appends and 
 # overrides are set - the datastore has yet to be finalised at ConfigParsed
@@ -1008,15 +1000,20 @@ def copy_data(e):
     sanity_data.finalize()
     return sanity_data
 
+addhandler config_reparse_eventhandler
+config_reparse_eventhandler[eventmask] = "bb.event.ConfigParsed"
+python config_reparse_eventhandler() {
+    sanity_check_conffiles(e.data)
+}
+
 addhandler check_sanity_eventhandler
 check_sanity_eventhandler[eventmask] = "bb.event.SanityCheck bb.event.NetworkTest"
 python check_sanity_eventhandler() {
     if bb.event.getName(e) == "SanityCheck":
         sanity_data = copy_data(e)
+        check_sanity(sanity_data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
-        reparse = check_sanity(sanity_data)
-        e.data.setVar("BB_INVALIDCONF", reparse)
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
     elif bb.event.getName(e) == "NetworkTest":
         sanity_data = copy_data(e)
-- 
2.6.6


