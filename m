Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMR-0008DJ-Cw
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:45:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195252"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:22 -0700
Message-Id: <1f6e2cd4edd48c30bf52c4287f16b06b0b6bd153.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 06/19] distrodata: fix distro_check code
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
X-List-Received-Date: Wed, 21 Sep 2011 09:45:00 -0000

This fixes a problem with package names from inherits showing up

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/distrodata.bbclass |   19 +++++++++++++++++--
 meta/lib/oe/distro_check.py     |    8 ++++----
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index e91200d..ce7b931 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -8,7 +8,7 @@ python distro_eventhandler() {
 	logfile = dc.create_log_file(e.data, "distrodata.csv")
 	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
-	f.write("Package,Description,Owner,License,ChkSum,Status,VerMatch,Version,Upsteam,Non-Update,Reason,Recipe Status\n")
+	f.write("Package,Description,Owner,License,ChkSum,Status,VerMatch,Version,Upsteam,Non-Update,Reason,Recipe Status,Distro 1,Distro 2,Distro 3\n")
         f.close()
         bb.utils.unlockfile(lf)
 
@@ -34,12 +34,24 @@ python do_distrodata_np() {
 	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
 	    bb.data.update_data(localdata)
 
+	if pn.find("-nativesdk") != -1:
+	    pnstripped = pn.split("-nativesdk")
+	    bb.note("Native Split: %s" % pnstripped)
+	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
+	    bb.data.update_data(localdata)
+
 	if pn.find("-cross") != -1:
 	    pnstripped = pn.split("-cross")
 	    bb.note("cross Split: %s" % pnstripped)
 	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
 	    bb.data.update_data(localdata)
 
+	if pn.find("-crosssdk") != -1:
+	    pnstripped = pn.split("-crosssdk")
+	    bb.note("cross Split: %s" % pnstripped)
+	    bb.data.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + bb.data.getVar('OVERRIDES', d, True), localdata)
+	    bb.data.update_data(localdata)
+
 	if pn.find("-initial") != -1:
 	    pnstripped = pn.split("-initial")
 	    bb.note("initial Split: %s" % pnstripped)
@@ -181,7 +193,7 @@ python do_distrodata() {
 
 	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
-	f.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s," % \
+	f.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s" % \
 		  (pname, pdesc, maintainer, plicense, pchksum, hasrstatus, vermatch, pcurver, pupver, noupdate, noupdate_reason, rstatus))
         line = ""
         for i in result:
@@ -671,6 +683,9 @@ python do_distro_check() {
     import oe.distro_check as dc
     import bb
     import shutil
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk',d):
+        return
+
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
     tmpdir = bb.data.getVar('TMPDIR', d, True)
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 55cdcad..4721355 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -73,9 +73,9 @@ def clean_package_list(package_list):
 def get_latest_released_meego_source_package_list():
     "Returns list of all the name os packages in the latest meego distro"
 
-    if not os.path.isfile("/tmp/Meego-1.0"):
-        os.mknod("/tmp/Meego-1.0")
-    f = open("/tmp/Meego-1.0", "r")
+    if not os.path.isfile("/tmp/Meego-1.1"):
+        os.mknod("/tmp/Meego-1.1")
+    f = open("/tmp/Meego-1.1", "r")
     package_names = []
     for line in f:
         package_names.append(line[:-1] + ":" + "main") # Also strip the '\n' at the end
@@ -303,7 +303,7 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     bb.note("Recipe: %s" % recipe_name)
     tmp = bb.data.getVar('DISTRO_PN_ALIAS', localdata, True)
 
-    distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "WindRiver":'Windriver', "OSPDT":'OSPDT Approved', "Poky":'poky'})
+    distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "Windriver":'Windriver', "OSPDT":'OSPDT Approved', "Poky":'poky'})
 
     if tmp:
         list = tmp.split(' ')
-- 
1.7.6



