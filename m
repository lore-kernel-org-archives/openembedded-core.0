Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TgB1u-0004Ew-9T
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 10:12:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2012 00:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,220,1355126400"; d="scan'208";a="176376328"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2012 00:58:08 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 10:58:58 +0200
Message-Id: <1354697938-19969-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/2] prs: use the PRServer to replace the BB_URI_LOCALCOUNT functionality
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
X-List-Received-Date: Wed, 05 Dec 2012 09:12:38 -0000

- adapt the PRServer to generate an incremental number for every revision set
associated with a (PN, PV)
- use one incrementing value rather than several
- PV becomes 0.1+gitAUTOINC+deadbeefdecafbad_decafbaddeadbeef
- if PV contains 'AUTOINC' set PKGV to the same thing with AUTOINC replaced
with the "auto PR" value
- if the PRServer isn't running replace AUTOINC with 0 (no package feeds, but usual
image creation would work)
- use the PR table with "AUTOINC-${PV-without-SRCREVs}" as key
- modify prexport/primport to address the generated srcrev entries
- this patch addresses the following proposal:
http://lists.linuxtogo.org/pipermail/bitbake-devel/2012-November/003878.html

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/package.bbclass  |  4 ++++
 meta/classes/prexport.bbclass | 10 ++++++++++
 meta/classes/prserv.bbclass   | 22 +++++++++++++++++-----
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3278d37..993ce98 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -411,6 +411,10 @@ python package_get_auto_pr() {
                 bb.fatal("Can NOT get PRAUTO from remote PR service")
             return
         d.setVar('PRAUTO',str(auto_pr))
+    else:
+        pv = d.getVar("PV", True)
+        if 'AUTOINC' in pv:
+            d.setVar("PKGV", pv.replace("AUTOINC", "0"))
 }
 
 LOCALEBASEPN ??= "${PN}"
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index b990c2b..6b9d540 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -24,6 +24,16 @@ python prexport_handler () {
             bb.warn("prexport_handler: No AUTOPR values found for %s" % ver)
             return
         oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
+        if 'AUTOINC' in ver:
+            import re
+            srcpv =  bb.fetch2.get_srcrev(e.data)
+            base_ver = "AUTOINC-%s" % ver[:ver.find(srcpv)]
+            e.data.setVar('PRSERV_DUMPOPT_VERSION', base_ver)
+            retval = oe.prservice.prserv_dump_db(e.data)
+            if not retval:
+                bb.fatal("prexport_handler: export failed!")
+            (metainfo, datainfo) = retval
+            oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
     elif isinstance(e, bb.event.ParseStarted):
         import bb.utils
         import oe.prservice
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
index 0825306..33547f9 100644
--- a/meta/classes/prserv.bbclass
+++ b/meta/classes/prserv.bbclass
@@ -1,6 +1,11 @@
 def prserv_get_pr_auto(d):
     import oe.prservice
+    import re
+
+    pv = d.getVar("PV", True)
     if d.getVar('USE_PR_SERV', True) != "1":
+        if 'AUTOINC' in pv:
+            d.setVar("PKGV", pv.replace("AUTOINC", "0"))
         bb.warn("Not using network based PR service")
         return None
 
@@ -8,14 +13,21 @@ def prserv_get_pr_auto(d):
     pkgarch = d.getVar("PACKAGE_ARCH", True)
     checksum = d.getVar("BB_TASKHASH", True)
 
+    conn = d.getVar("__PRSERV_CONN", True)
+    if conn is None:
+        conn = oe.prservice.prserv_make_conn(d)
+        if conn is None:
+            return None
+
+    if "AUTOINC" in pv:
+        srcpv = bb.fetch2.get_srcrev(d)
+        base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
+        value = conn.getPR(base_ver, pkgarch, srcpv)
+        d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
+
     if d.getVar('PRSERV_LOCKDOWN', True):
         auto_rev = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
     else:
-        conn = d.getVar("__PRSERV_CONN", True)
-        if conn is None:
-            conn = oe.prservice.prserv_make_conn(d)
-            if conn is None:
-                return None
         auto_rev = conn.getPR(version, pkgarch, checksum)
 
     return auto_rev
-- 
1.7.11.7



