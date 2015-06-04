Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 759C675811
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 18:41:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jun 2015 11:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,554,1427785200"; d="scan'208";a="737234205"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.173])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2015 11:41:30 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:42:59 -0500
Message-Id: <814ba904a75c25027560113d0317fbc092e9d8b7.1433443273.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 4/4] distrodata: Use Python CSV instead of did by hand
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
X-List-Received-Date: Thu, 04 Jun 2015 18:41:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix CSV generation in distrodata class using Python CSV
module before it some errors happen when read due to
incorrect quoting/delimiters.

[YOCTO #7777]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 125 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 61 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 092c372..0cefa7a 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -2,11 +2,16 @@ addhandler distro_eventhandler
 distro_eventhandler[eventmask] = "bb.event.BuildStarted"
 python distro_eventhandler() {
     import oe.distro_check as dc
+    import csv
     logfile = dc.create_log_file(e.data, "distrodata.csv")
+
     lf = bb.utils.lockfile("%s.lock" % logfile)
-    f = open(logfile, "a")
-    f.write("Package,Description,Owner,License,VerMatch,Version,Upsteam,Reason,Recipe Status,Distro 1,Distro 2,Distro 3\n")
-    f.close()
+    with open(logfile, "a") as f:
+        writer = csv.writer(f)
+        writer.writerow(['Package', 'Description', 'Owner', 'License', 
+            'VerMatch', 'Version', 'Upsteam', 'Reason', 'Recipe Status',
+            'Distro 1', 'Distro 2', 'Distro 3'])
+        f.close()
     bb.utils.unlockfile(lf)
 
     return
@@ -98,6 +103,7 @@ python do_distrodata_np() {
 addtask distrodata
 do_distrodata[nostamp] = "1"
 python do_distrodata() {
+        import csv
         logpath = d.getVar('LOG_DIR', True)
         bb.utils.mkdirhier(logpath)
         logfile = os.path.join(logpath, "distrodata.csv")
@@ -176,14 +182,13 @@ python do_distrodata() {
         result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
 
         lf = bb.utils.lockfile("%s.lock" % logfile)
-        f = open(logfile, "a")
-        f.write("%s,%s,%s,%s,%s,%s,%s,%s,%s" % \
-                  (pname, pdesc, maintainer, plicense, vermatch, pcurver, pupver, noupdate_reason, rstatus))
-        line = ""
-        for i in result:
-            line = line + "," + i
-        f.write(line + "\n")
-        f.close()
+        with open(logfile, "a") as f:
+            row = [pname, pdesc, maintainer, plicense, vermatch, pcurver, pupver, noupdate_reason, rstatus]
+            row.extend(result)
+
+            writer = csv.writer(f)
+            writer.writerow(row)
+            f.close()
         bb.utils.unlockfile(lf)
 }
 
@@ -198,45 +203,33 @@ do_distrodataall() {
 addhandler checkpkg_eventhandler
 checkpkg_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
 python checkpkg_eventhandler() {
+    import csv
+
     def parse_csv_file(filename):
         package_dict = {}
-        fd = open(filename, "r")
-        lines = fd.read().rsplit("\n")
-        fd.close()
-
-        first_line = ''
-        index = 0
-        for line in lines:
-            #Skip the first line
-            if index == 0:
-                first_line = line
-                index += 1
-                continue
-            elif line == '':
-                continue
-            index += 1
-            package_name = line.rsplit("\t")[0]
-            if '-native' in package_name or 'nativesdk-' in package_name:
-                original_name = package_name.rsplit('-native')[0]
-                if original_name == '':
-                    original_name = package_name.rsplit('nativesdk-')[0]
-                if original_name in package_dict:
+
+        with open(filename, "r") as f:
+            reader = csv.reader(f, delimiter='\t')
+            for row in reader:
+                pn = row[0]
+
+                if reader.line_num == 1:
+                    header = row
                     continue
-                else:
-                    package_dict[package_name] = line
-            else:
-                new_name = package_name + "-native"
-                if not(new_name in package_dict):
-                    new_name = 'nativesdk-' + package_name
-                if new_name in package_dict:
-                    del package_dict[new_name]
-                package_dict[package_name] = line
-
-        fd = open(filename, "w")
-        fd.write("%s\n"%first_line)
-        for el in package_dict:
-            fd.write(package_dict[el] + "\n")
-        fd.close()
+
+                if '-native' in pn or 'nativesdk-' in pn:
+                    continue
+
+                if not pn in package_dict.keys():
+                    package_dict[pn] = row
+            f.close()
+
+        with open(filename, "w") as f:
+            writer = csv.writer(f, delimiter='\t')
+            writer.writerow(header)
+            for pn in package_dict.keys():
+                writer.writerow(package_dict[pn])
+            f.close()
 
         del package_dict
 
@@ -245,9 +238,13 @@ python checkpkg_eventhandler() {
         logfile = dc.create_log_file(e.data, "checkpkg.csv")
 
         lf = bb.utils.lockfile("%s.lock" % logfile)
-        f = open(logfile, "a")
-        f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\tNoUpReason\n")
-        f.close()
+        with open(logfile, "a") as f:
+            writer = csv.writer(f, delimiter='\t')
+            headers = ['Package', 'Version', 'Upver', 'License', 'Section',
+                'Home', 'Release', 'Depends', 'BugTracker', 'PE', 'Description',
+                'Status', 'Tracking', 'URI', 'MAINTAINER', 'NoUpReason']
+            writer.writerow(headers)
+            f.close()
         bb.utils.unlockfile(lf)
     elif bb.event.getName(e) == "BuildCompleted":
         import os
@@ -263,6 +260,7 @@ addtask checkpkg
 do_checkpkg[nostamp] = "1"
 python do_checkpkg() {
         localdata = bb.data.createCopy(d)
+        import csv
         import re
         import tempfile
         import subprocess
@@ -375,10 +373,12 @@ python do_checkpkg() {
         pdesc = "".join(pdesc.split("\t"))
         no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON', True)
         lf = bb.utils.lockfile("%s.lock" % logfile)
-        f = open(logfile, "a")
-        f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
-                  (pname,pversion,pupver,plicense,psection, phome,prelease, pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer, no_upgr_reason))
-        f.close()
+        with open(logfile, "a") as f:
+            writer = csv.writer(f, delimiter='\t')
+            writer.writerow([pname, pversion, pupver, plicense, psection, phome, 
+                prelease, pdepends, pbugtracker, ppe, pdesc, pstatus, pmver, 
+                psrcuri, maintainer, no_upgr_reason])
+            f.close()
         bb.utils.unlockfile(lf)
 }
 
@@ -441,12 +441,14 @@ addhandler checklicense_eventhandler
 checklicense_eventhandler[eventmask] = "bb.event.BuildStarted"
 python checklicense_eventhandler() {
     """initialize log files."""
+    import csv
     import oe.distro_check as dc
     logfile = dc.create_log_file(e.data, "missinglicense.csv")
     lf = bb.utils.lockfile("%s.lock" % logfile)
-    f = open(logfile, "a")
-    f.write("Package\tLicense\tMissingLicense\n")
-    f.close()
+    with open(logfile, "a") as f:
+        writer = csv.writer(f, delimiter='\t')
+        writer.writerow(['Package', 'License', 'MissingLicense'])
+        f.close()
     bb.utils.unlockfile(lf)
     return
 }
@@ -454,6 +456,7 @@ python checklicense_eventhandler() {
 addtask checklicense
 do_checklicense[nostamp] = "1"
 python do_checklicense() {
+    import csv
     import shutil
     logpath = d.getVar('LOG_DIR', True)
     bb.utils.mkdirhier(logpath)
@@ -466,10 +469,10 @@ python do_checklicense() {
                           .replace(',', '').replace(" ", "").split("&"))):
         if not os.path.isfile(os.path.join(generic_directory, license_type)):
             lf = bb.utils.lockfile("%s.lock" % logfile)
-            f = open(logfile, "a")
-            f.write("%s\t%s\t%s\n" % \
-                (pn,license_types,license_type))
-            f.close()
+            with open(logfile, "a") as f:
+                writer = csv.writer(f, delimiter='\t')
+                writer.writerow([pn, license_types, license_type])
+                f.close()
             bb.utils.unlockfile(lf)
     return
 }
-- 
1.9.1


