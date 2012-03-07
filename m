Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S5Bct-0000At-FA
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 08:49:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Mar 2012 23:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="74574495"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2012 23:40:58 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 15:36:45 +0800
Message-Id: <985672cba7c76c5357200575e206024a940430f3.1331105701.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1331105701.git.lianhao.lu@intel.com>
References: <cover.1331105701.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] prservice: Added sanity check for prservice connection.
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
X-List-Received-Date: Wed, 07 Mar 2012 07:49:35 -0000

Fixed bug [YOCTO #2052]. Added sanity check for variables of PRSERV_HOST
and PRSERV_PORT, also for the connection availabity of prservice.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/prexport.bbclass |    4 +++-
 meta/classes/primport.bbclass |    3 +++
 meta/lib/oe/prservice.py      |   18 +++++++++++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index 5b5b707..2b16a66 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -21,11 +21,13 @@ python prexport_handler () {
             bb.fatal("prexport_handler: export failed!")
         (metainfo, datainfo) = retval
         if not datainfo:
-            bb.error("prexport_handler: No AUROPR values found for %s" % ver)
+            bb.warn("prexport_handler: No AUROPR values found for %s" % ver)
             return
         oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
     elif isinstance(e, bb.event.ParseStarted):
         import bb.utils
+        import oe.prservice
+        oe.prservice.prserv_check_avail(e.data)
         #remove dumpfile
         bb.utils.remove(e.data.getVar('PRSERV_DUMPFILE', True))
     elif isinstance(e, bb.event.ParseCompleted):
diff --git a/meta/classes/primport.bbclass b/meta/classes/primport.bbclass
index 08e5a8f..37b0d6b 100644
--- a/meta/classes/primport.bbclass
+++ b/meta/classes/primport.bbclass
@@ -12,6 +12,9 @@ python primport_handler () {
 
         for (version, pkgarch, checksum, value) in imported:
             bb.note("imported (%s,%s,%s,%d)" % (version, pkgarch, checksum, value))
+    elif isinstance(e, bb.event.ParseStarted):
+        import oe.prservice
+        oe.prservice.prserv_check_avail(e.data)
 }
 
 addhandler primport_handler
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index fa6718e..16785ce 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,12 +1,15 @@
 import bb
 
-def prserv_make_conn(d):
+def prserv_make_conn(d, check = False):
     import prserv.serv
     host = d.getVar("PRSERV_HOST",True)
     port = d.getVar("PRSERV_PORT",True)
     try:
         conn = None
         conn = prserv.serv.PRServerConnection(host,int(port))
+        if check:
+            if not conn.ping():
+                raise Exception('service not available')
         d.setVar("__PRSERV_CONN",conn)
     except Exception, exc:
         bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
@@ -111,3 +114,16 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
                 f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
     f.close()
     bb.utils.unlockfile(lf)
+
+def prserv_check_avail(d):
+    host = d.getVar("PRSERV_HOST",True)
+    port = d.getVar("PRSERV_PORT",True)
+    try:
+        if not host:
+            raise TypeError
+        else:
+            port = int(port)
+    except TypeError:
+        bb.fatal("Undefined or incorrect values of PRSERV_HOST or PRSERV_PORT")
+    else:
+        prserv_make_conn(d, True)
-- 
1.7.0.4



