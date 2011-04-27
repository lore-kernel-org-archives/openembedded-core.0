Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liping.ke@intel.com>) id 1QEzdG-0006VC-9g
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:57:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684562476"
Received: from lke-nhm.sh.intel.com (HELO localhost) ([10.239.36.48])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:54:21 -0700
Message-Id: <904d24a2315fcb32d56e0c166ce27d99106a3d9e.1303889896.git.liping.ke@intel.com>
In-Reply-To: <cover.1303889896.git.liping.ke@intel.com>
References: <cover.1303889896.git.liping.ke@intel.com>
Old-Date: Wed, 27 Apr 2011 14:49:29 +0800
Date: Wed, 27 Apr 2011 15:45:11 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Liping Ke <liping.ke@intel.com>
Subject: [PATCH 1/1] Image Creator: Make bitbake server type configuration (xmlrpc, none)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 07:57:58 -0000

From: Liping Ke <liping.ke@intel.com>

Add -t parameters for configuring xmlrpc or none server.

Signed-off-by: Liping Ke <liping.ke@intel.com>
---
 bitbake/bin/bitbake |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
index 6d05289..754517a 100755
--- a/bitbake/bin/bitbake
+++ b/bitbake/bin/bitbake
@@ -39,8 +39,6 @@ import bb.msg
 from bb import cooker
 from bb import ui
 from bb import server
-from bb.server import none
-#from bb.server import xmlrpc
 
 __version__ = "1.11.0"
 logger = logging.getLogger("BitBake")
@@ -71,7 +69,7 @@ def get_ui(config):
         return getattr(module, interface).main
     except AttributeError:
         sys.exit("FATAL: Invalid user interface '%s' specified.\n"
-                 "Valid interfaces: depexp, goggle, ncurses, knotty [default]." % interface)
+                 "Valid interfaces: depexp, goggle, ncurses, hob, knotty [default]." % interface)
 
 
 # Display bitbake/OE warnings via the BitBake.Warnings logger, ignoring others"""
@@ -161,6 +159,9 @@ Default BBFILES are the .bb files in the current directory.""")
     parser.add_option("-u", "--ui", help = "userinterface to use",
                action = "store", dest = "ui")
 
+    parser.add_option("-t", "--servertype", help = "choose which server to user, none or xmlrpc",
+               action = "store", dest = "servertype")
+
     parser.add_option("", "--revisions-changed", help = "Set the exit code depending on whether upstream floating revisions have changed or not",
                action = "store_true", dest = "revisions_changed", default = False)
 
@@ -175,8 +176,17 @@ Default BBFILES are the .bb files in the current directory.""")
     loghandler = event.LogHandler()
     logger.addHandler(loghandler)
 
-    #server = bb.server.xmlrpc
-    server = bb.server.none
+    # Server type could be xmlrpc or none currently, if nothing is specified,
+    # default server would be none
+    if configuration.servertype:
+        server_type = configuration.servertype
+    else:
+        server_type = 'none'
+
+    module = __import__("bb.server", fromlist = [server_type])
+    server = getattr(module, server_type)
+
+    print ("lke: servertype: ", server_type)
 
     # Save a logfile for cooker into the current working directory. When the
     # server is daemonized this logfile will be truncated.
-- 
1.7.0.4



