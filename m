Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Ty1wu-0003k1-LE
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 16:09:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2013 06:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,523,1355126400"; d="scan'208";a="247483412"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 23 Jan 2013 06:53:38 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 16:54:28 +0200
Message-Id: <1358952868-14495-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 2/3] prs: change PRSERV_HOST semantics
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
X-List-Received-Date: Wed, 23 Jan 2013 15:09:32 -0000

- remove PRSERV_PORT variable
- use 'hostname:port' as PRSERV_HOST format
- remove USE_PR_SERV variable
- one can activate PRS by setting PRSERV_HOST

[YOCTO #3744]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/package.bbclass |  8 +++-----
 meta/classes/prserv.bbclass  |  2 +-
 meta/conf/bitbake.conf       |  7 +------
 meta/lib/oe/prservice.py     | 18 ++++++++----------
 4 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8e07168..60d3df7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -396,15 +396,13 @@ def runtime_mapping_rename (varname, d):
 #
 
 python package_get_auto_pr() {
-    # per recipe PRSERV_HOST PRSERV_PORT
+    # per recipe PRSERV_HOST
     pn = d.getVar('PN', True)
     host = d.getVar("PRSERV_HOST_" + pn, True)
-    port = d.getVar("PRSERV_PORT_" + pn, True)
     if not (host is None):
         d.setVar("PRSERV_HOST", host)
-    if not (port is None):
-        d.setVar("PRSERV_PORT", port)
-    if d.getVar('USE_PR_SERV', True) != "0":
+
+    if d.getVar('PRSERV_HOST', True):
         try:
             auto_pr=prserv_get_pr_auto(d)
         except Exception as e:
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
index 33547f9..b440d86 100644
--- a/meta/classes/prserv.bbclass
+++ b/meta/classes/prserv.bbclass
@@ -3,7 +3,7 @@ def prserv_get_pr_auto(d):
     import re
 
     pv = d.getVar("PV", True)
-    if d.getVar('USE_PR_SERV', True) != "1":
+    if not d.getVar('PRSERV_HOST', True):
         if 'AUTOINC' in pv:
             d.setVar("PKGV", pv.replace("AUTOINC", "0"))
         bb.warn("Not using network based PR service")
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dc50ca..aa12753 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -207,11 +207,6 @@ SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -crosssdk -cross-cana
 BPN = "${@base_prune_suffix(d.getVar('PN', True), d.getVar('SPECIAL_PKGSUFFIX', True).split(), d)}"
 BP = "${BPN}-${PV}"
 
-#
-# network based PR service
-#
-USE_PR_SERV = "${@[1,0][((not d.getVar('PRSERV_HOST', True)) or (not d.getVar('PRSERV_PORT', True))) and (not d.getVar('PRSERV_LOCKDOWN', True))]}"
-
 # Package info.
 
 SECTION = "base"
@@ -781,7 +776,7 @@ BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
-    PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
+    PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER \
     DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK \
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index c3fb76a..57fb39a 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,11 +1,10 @@
 
 def prserv_make_conn(d, check = False):
     import prserv.serv
-    host = d.getVar("PRSERV_HOST",True)
-    port = d.getVar("PRSERV_PORT",True)
+    host_params = filter(None, (d.getVar("PRSERV_HOST", True) or '').split(':'))
     try:
         conn = None
-        conn = prserv.serv.PRServerConnection(host,int(port))
+        conn = prserv.serv.PRServerConnection(host_params[0], int(host_params[1]))
         if check:
             if not conn.ping():
                 raise Exception('service not available')
@@ -16,7 +15,7 @@ def prserv_make_conn(d, check = False):
     return conn
 
 def prserv_dump_db(d):
-    if d.getVar('USE_PR_SERV', True) != "1":
+    if not d.getVar('PRSERV_HOST', True):
         bb.error("Not using network based PR service")
         return None
 
@@ -35,7 +34,7 @@ def prserv_dump_db(d):
     return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
 
 def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksum=None):
-    if d.getVar('USE_PR_SERV', True) != "1":
+    if not d.getVar('PRSERV_HOST', True):
         bb.error("Not using network based PR service")
         return None
 
@@ -115,14 +114,13 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     bb.utils.unlockfile(lf)
 
 def prserv_check_avail(d):
-    host = d.getVar("PRSERV_HOST",True)
-    port = d.getVar("PRSERV_PORT",True)
+    host_params = filter(None, (d.getVar("PRSERV_HOST", True) or '').split(':'))
     try:
-        if not host:
+        if len(host_params) != 2:
             raise TypeError
         else:
-            port = int(port)
+            int(host_params[1])
     except TypeError:
-        bb.fatal("Undefined or incorrect values of PRSERV_HOST or PRSERV_PORT")
+        bb.fatal('Undefined/incorrect PRSERV_HOST value. Format: "host:port"')
     else:
         prserv_make_conn(d, True)
-- 
1.7.11.7



