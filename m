Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5d0-0003Re-LF
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 14:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="748097312"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2011 14:44:10 -0700
Message-Id: <bfcbeb1e42471e4728cae50ba7786ce1a855797b.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 19:06:21 +0800
Date: Mon, 16 May 2011 14:44:10 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 10/14] Add a new task checklicense and fix some bugs in distro_check.py
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
X-List-Received-Date: Mon, 16 May 2011 21:47:04 -0000

From: Mei Lei <lei.mei@intel.com>

distro_check.py: Create a new function called create_log_file to reduce a lot of repeat code in distrodata.bbclass.
                 We needn't to create log file in function save_distro_check_result, because the log file has been generated in check_eventhandler.
                 Another bug is that we maybe access the /tmp/Meego-1.0 before we create this file.
                 Add a judge statement to decide whether we need to create this file firstly.
distrodata.bbclass: Add a new task checklicense to collect missing text license information.
                    This can help package-report system to know how many recipes are missing license text.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/classes/distrodata.bbclass |  177 ++++++++++++++++++++++-----------------
 meta/lib/oe/distro_check.py     |   27 ++++--
 2 files changed, 119 insertions(+), 85 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 905dad7..f24cff8 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -4,19 +4,9 @@ addhandler distro_eventhandler
 python distro_eventhandler() {
 
     if bb.event.getName(e) == "BuildStarted":
-	"""initialize log files."""
-	logpath = bb.data.getVar('LOG_DIR', e.data, 1)
-	bb.utils.mkdirhier(logpath)
-	logfile = os.path.join(logpath, "distrodata.%s.csv" % bb.data.getVar('DATETIME', e.data, 1))
-	if not os.path.exists(logfile):
-		slogfile = os.path.join(logpath, "distrodata.csv")
-		if os.path.exists(slogfile):
-			os.remove(slogfile)
-		os.system("touch %s" % logfile)
-		os.symlink(logfile, slogfile)
-		bb.data.setVar('LOG_FILE', logfile, e.data)
-
-	lf = bb.utils.lockfile(logfile + ".lock")
+	import oe.distro_check as dc
+	logfile = dc.create_log_file(e.data, "distrodata.csv")
+	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
 	f.write("Package,Description,Owner,License,ChkSum,Status,VerMatch,Version,Upsteam,Non-Update,Reason,Recipe Status\n")
         f.close()
@@ -33,9 +23,9 @@ python do_distrodata_np() {
         bb.note("Package Name: %s" % pn)
 
         import oe.distro_check as dist_check
-        tmpdir = bb.data.getVar('TMPDIR', d, 1)
+        tmpdir = bb.data.getVar('TMPDIR', d, True)
         distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = bb.data.getVar('DATETIME', localdata, 1)
+        datetime = bb.data.getVar('DATETIME', localdata, True)
         dist_check.update_distro_data(distro_check_dir, datetime)
 
 	if pn.find("-native") != -1:
@@ -111,15 +101,15 @@ python do_distrodata_np() {
 addtask distrodata
 do_distrodata[nostamp] = "1"
 python do_distrodata() {
-	logpath = bb.data.getVar('LOG_DIR', d, 1)
+	logpath = bb.data.getVar('LOG_DIR', d, True)
 	bb.utils.mkdirhier(logpath)
 	logfile = os.path.join(logpath, "distrodata.csv")
 
         import oe.distro_check as dist_check
 	localdata = bb.data.createCopy(d)
-        tmpdir = bb.data.getVar('TMPDIR', d, 1)
+        tmpdir = bb.data.getVar('TMPDIR', d, True)
         distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = bb.data.getVar('DATETIME', localdata, 1)
+        datetime = bb.data.getVar('DATETIME', localdata, True)
         dist_check.update_distro_data(distro_check_dir, datetime)
 
         pn = bb.data.getVar("PN", d, True)
@@ -189,7 +179,7 @@ python do_distrodata() {
         # do the comparison
         result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
 
-	lf = bb.utils.lockfile(logfile + ".lock")
+	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
 	f.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s," % \
 		  (pname, pdesc, maintainer, plicense, pchksum, hasrstatus, vermatch, pcurver, pupver, noupdate, noupdate_reason, rstatus))
@@ -211,19 +201,10 @@ do_distrodataall() {
 addhandler checkpkg_eventhandler
 python checkpkg_eventhandler() {
     if bb.event.getName(e) == "BuildStarted":
-	"""initialize log files."""
-	logpath = bb.data.getVar('LOG_DIR', e.data, 1)
-	bb.utils.mkdirhier(logpath)
-	logfile = os.path.join(logpath, "checkpkg.%s.csv" % bb.data.getVar('DATETIME', e.data, 1))
-	if not os.path.exists(logfile):
-		slogfile = os.path.join(logpath, "checkpkg.csv")
-		if os.path.exists(slogfile):
-			os.remove(slogfile)
-		os.system("touch %s" % logfile)
-		os.symlink(logfile, slogfile)
-		bb.data.setVar('LOG_FILE', logfile, e.data)
-
-	lf = bb.utils.lockfile(logfile + ".lock")
+	import oe.distro_check as dc
+	logfile = dc.create_log_file(e.data, "checkpkg.csv")
+
+	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
 	f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tPriority\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\n")
         f.close()
@@ -304,7 +285,7 @@ python do_checkpkg() {
 		Clear internal url cache as it's a temporary check. Not doing so will have 
 		bitbake check url multiple times when looping through a single url
 		"""
-		fn = bb.data.getVar('FILE', d, 1)
+		fn = bb.data.getVar('FILE', d, True)
 		bb.fetch2.urldata_cache[fn] = {}
 
 		"""
@@ -335,7 +316,7 @@ python do_checkpkg() {
 	Return new version if success, or else error in "Errxxxx" style
 	"""
 	def check_new_dir(url, curver, d):
-		pn = bb.data.getVar('PN', d, 1)
+		pn = bb.data.getVar('PN', d, True)
 		f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-1-" % pn)
 		status = internal_fetch_wget(url, d, f)
 		fhtml = f.read()
@@ -394,7 +375,7 @@ python do_checkpkg() {
 		"""possible to have no version in pkg name, such as spectrum-fw"""
 		if not re.search("\d+", curname):
 			return pcurver
-		pn = bb.data.getVar('PN', d, 1)
+		pn = bb.data.getVar('PN', d, True)
 		f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-2-" % pn)
 		status = internal_fetch_wget(url, d, f)
 		fhtml = f.read()
@@ -437,35 +418,35 @@ python do_checkpkg() {
 		f.close()
 		"""if host hasn't directory information, no need to save tmp file"""
 		if status != "ErrHostNoDir" and re.match("Err", status):
-			logpath = bb.data.getVar('LOG_DIR', d, 1)
+			logpath = bb.data.getVar('LOG_DIR', d, True)
 			os.system("cp %s %s/" % (f.name, logpath))
 		os.unlink(f.name)
 		return status
 
 	"""first check whether a uri is provided"""
-	src_uri = bb.data.getVar('SRC_URI', d, 1)
+	src_uri = bb.data.getVar('SRC_URI', d, True)
 	if not src_uri:
 		return
 
 	"""initialize log files."""
-	logpath = bb.data.getVar('LOG_DIR', d, 1)
+	logpath = bb.data.getVar('LOG_DIR', d, True)
 	bb.utils.mkdirhier(logpath)
 	logfile = os.path.join(logpath, "checkpkg.csv")
 
 	"""generate package information from .bb file"""
-	pname = bb.data.getVar('PN', d, 1)
-	pdesc = bb.data.getVar('DESCRIPTION', d, 1)
-	pgrp = bb.data.getVar('SECTION', d, 1)
-	pversion = bb.data.getVar('PV', d, 1)
-	plicense = bb.data.getVar('LICENSE',d,1)
-	psection = bb.data.getVar('SECTION',d,1)
-	phome = bb.data.getVar('HOMEPAGE', d, 1)
-	prelease = bb.data.getVar('PR',d,1)
-	ppriority = bb.data.getVar('PRIORITY',d,1)
-	pdepends = bb.data.getVar('DEPENDS',d,1)
-	pbugtracker = bb.data.getVar('BUGTRACKER',d,1)
-	ppe = bb.data.getVar('PE',d,1)
-	psrcuri = bb.data.getVar('SRC_URI',d,1)
+	pname = bb.data.getVar('PN', d, True)
+	pdesc = bb.data.getVar('DESCRIPTION', d, True)
+	pgrp = bb.data.getVar('SECTION', d, True)
+	pversion = bb.data.getVar('PV', d, True)
+	plicense = bb.data.getVar('LICENSE', d, True)
+	psection = bb.data.getVar('SECTION', d, True)
+	phome = bb.data.getVar('HOMEPAGE', d, True)
+	prelease = bb.data.getVar('PR', d, True)
+	ppriority = bb.data.getVar('PRIORITY', d, True)
+	pdepends = bb.data.getVar('DEPENDS', d, True)
+	pbugtracker = bb.data.getVar('BUGTRACKER', d, True)
+	ppe = bb.data.getVar('PE', d, True)
+	psrcuri = bb.data.getVar('SRC_URI', d, True)
 
 	found = 0
 	for uri in src_uri.split():
@@ -483,9 +464,9 @@ python do_checkpkg() {
 
 	(type, host, path, user, pswd, parm) = bb.decodeurl(uri)
 	if type in ['http', 'https', 'ftp']:
-		pcurver = bb.data.getVar('PV', d, 1)
+		pcurver = bb.data.getVar('PV', d, True)
 	else:
-		pcurver = bb.data.getVar("SRCREV", d, 1)
+		pcurver = bb.data.getVar("SRCREV", d, True)
 
 	if type in ['http', 'https', 'ftp']:
 		newver = pcurver
@@ -509,7 +490,7 @@ python do_checkpkg() {
 			newver = check_new_dir(alturi, dirver, d)
 			altpath = path
 			if not re.match("Err", newver) and dirver != newver:
-				altpath = altpath.replace(dirver, newver, 1)
+				altpath = altpath.replace(dirver, newver, True)
 				
 		"""Now try to acquire all remote files in current directory"""
 		if not re.match("Err", newver):
@@ -625,7 +606,7 @@ python do_checkpkg() {
 		pstatus += ":%s%s" % (host, path)
 
 	"""Read from manual distro tracking fields as alternative"""
-	pmver = bb.data.getVar("RECIPE_LATEST_VERSION", d, 1)
+	pmver = bb.data.getVar("RECIPE_LATEST_VERSION", d, True)
 	if not pmver:
 		pmver = "N/A"
 		pmstatus = "ErrNoRecipeData"
@@ -639,7 +620,7 @@ python do_checkpkg() {
 	psrcuri = psrcuri.split()[0]
 	pdepends = "".join(pdepends.split("\t"))
 	pdesc = "".join(pdesc.split("\t"))
-	lf = bb.utils.lockfile(logfile + ".lock")
+	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
 	f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
 		  (pname,pversion,pupver,plicense,psection, phome,prelease, ppriority,pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer))
@@ -654,25 +635,12 @@ do_checkpkgall() {
 	:
 }
 
-#addhandler check_eventhandler
-python check_eventhandler() {
+addhandler distro_check_eventhandler
+python distro_check_eventhandler() {
     if bb.event.getName(e) == "BuildStarted":
-        import oe.distro_check as dc
-        tmpdir = bb.data.getVar('TMPDIR', e.data, 1)
-        distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = bb.data.getVar('DATETIME', e.data, 1)
         """initialize log files."""
-        logpath = bb.data.getVar('LOG_DIR', e.data, 1)
-        bb.utils.mkdirhier(logpath)
-        logfile = os.path.join(logpath, "distrocheck.%s.csv" % bb.data.getVar('DATETIME', e.data, 1))
-        if not os.path.exists(logfile):
-                slogfile = os.path.join(logpath, "distrocheck.csv")
-                if os.path.exists(slogfile):
-                        os.remove(slogfile)
-                os.system("touch %s" % logfile)
-                os.symlink(logfile, slogfile)
-                bb.data.setVar('LOG_FILE', logfile, e.data)
-
+        import oe.distro_check as dc
+        result_file = dc.create_log_file(e.data, "distrocheck.csv")
     return
 }
 
@@ -681,18 +649,23 @@ do_distro_check[nostamp] = "1"
 python do_distro_check() {
     """checks if the package is present in other public Linux distros"""
     import oe.distro_check as dc
+    import bb
+    import shutil
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
-    tmpdir = bb.data.getVar('TMPDIR', d, 1)
+    tmpdir = bb.data.getVar('TMPDIR', d, True)
     distro_check_dir = os.path.join(tmpdir, "distro_check")
-    datetime = bb.data.getVar('DATETIME', localdata, 1)
+    logpath = bb.data.getVar('LOG_DIR', d, True)
+    bb.utils.mkdirhier(logpath)
+    result_file = os.path.join(logpath, "distrocheck.csv")
+    datetime = bb.data.getVar('DATETIME', localdata, True)
     dc.update_distro_data(distro_check_dir, datetime)
 
     # do the comparison
     result = dc.compare_in_distro_packages_list(distro_check_dir, d)
 
     # save the results
-    dc.save_distro_check_result(result, datetime, d)
+    dc.save_distro_check_result(result, datetime, result_file, d)
 }
 
 addtask distro_checkall after do_distro_check
@@ -701,3 +674,55 @@ do_distro_checkall[nostamp] = "1"
 do_distro_checkall() {
 	:
 }
+#
+#Check Missing License Text.
+#Use this task to generate the missing license text data for pkg-report system,
+#then we can search those recipes which license text isn't exsit in common-licenses directory
+#
+addhandler checklicense_eventhandler
+python checklicense_eventhandler() {
+    if bb.event.getName(e) == "BuildStarted":
+        """initialize log files."""
+        import oe.distro_check as dc
+        logfile = dc.create_log_file(e.data, "missinglicense.csv")
+        lf = bb.utils.lockfile("%s.lock" % logfile)
+        f = open(logfile, "a")
+        f.write("Package\tLicense\tMissingLicense\n")
+        f.close()
+        bb.utils.unlockfile(lf)
+    return
+}
+
+addtask checklicense
+do_checklicense[nostamp] = "1"
+python do_checklicense() {
+    import os
+    import bb
+    import shutil
+    logpath = bb.data.getVar('LOG_DIR', d, True)
+    bb.utils.mkdirhier(logpath)
+    pn = bb.data.getVar('PN', d, True)
+    logfile = os.path.join(logpath, "missinglicense.csv")
+    generic_directory = bb.data.getVar('COMMON_LICENSE_DIR', d, True)
+    license_types = bb.data.getVar('LICENSE', d, True)
+    for license_type in ((license_types.replace('+', '').replace('|', '&')
+                          .replace('(', '').replace(')', '').replace(';', '')
+                          .replace(',', '').replace(" ", "").split("&"))):
+        if not os.path.isfile(os.path.join(generic_directory, license_type)):
+            lf = bb.utils.lockfile("%s.lock" % logfile)
+            f = open(logfile, "a")
+            f.write("%s\t%s\t%s\n" % \
+                (pn,license_types,license_type))
+            f.close()
+            bb.utils.unlockfile(lf)
+    return
+}
+
+addtask checklicenseall after do_checklicense
+do_checklicenseall[recrdeptask] = "do_checklicense"
+do_checklicenseall[nostamp] = "1"
+do_checklicenseall() {
+	:
+}
+
+
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index c85d4fb..55cdcad 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -73,7 +73,8 @@ def clean_package_list(package_list):
 def get_latest_released_meego_source_package_list():
     "Returns list of all the name os packages in the latest meego distro"
 
-    
+    if not os.path.isfile("/tmp/Meego-1.0"):
+        os.mknod("/tmp/Meego-1.0")
     f = open("/tmp/Meego-1.0", "r")
     package_names = []
     for line in f:
@@ -341,7 +342,22 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     bb.note("Matching: %s" % matching_distros)
     return matching_distros
 
-def save_distro_check_result(result, datetime, d):
+def create_log_file(d, logname):
+    logpath = bb.data.getVar('LOG_DIR', d, True)
+    bb.utils.mkdirhier(logpath)
+    logfn, logsuffix = os.path.splitext(logname)
+    logfile = os.path.join(logpath, "%s.%s%s" % (logfn, bb.data.getVar('DATETIME', d, True), logsuffix))
+    if not os.path.exists(logfile):
+            slogfile = os.path.join(logpath, logname)
+            if os.path.exists(slogfile):
+                    os.remove(slogfile)
+            os.system("touch %s" % logfile)
+            os.symlink(logfile, slogfile)
+            bb.data.setVar('LOG_FILE', logfile, d)
+    return logfile
+
+
+def save_distro_check_result(result, datetime, result_file, d):
     pn = bb.data.getVar('PN', d, True)
     logdir = bb.data.getVar('LOG_DIR', d, True)
     if not logdir:
@@ -349,16 +365,9 @@ def save_distro_check_result(result, datetime, d):
         return
     if not os.path.isdir(logdir):
         os.makedirs(logdir)
-    result_file = os.path.join(logdir, "distrocheck.%s.csv" % datetime)
     line = pn
     for i in result:
         line = line + "," + i
-    if not os.path.exists(result_file):
-        sresult_file = os.path.join(logdir, "distrocheck.csv")
-	if os.path.exists(sresult_file):
-	    os.remove(sresult_file)
-	os.system("touch %s" % result_file)
-	os.symlink(result_file, sresult_file)
     f = open(result_file, "a")
     import fcntl
     fcntl.lockf(f, fcntl.LOCK_EX)
-- 
1.7.1.1



