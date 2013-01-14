Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1Tug9R-0008Jw-Ef for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 10:16:30 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Jan 2013 01:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,466,1355126400"; d="scan'208";a="190811067"
Received: from ema-vostro-460 (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jan 2013 01:00:45 -0800
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 11:04:33 +0200
Message-Id: <1358154273-4244-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] Updated checkpkg task
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
X-List-Received-Date: Mon, 14 Jan 2013 09:16:39 -0000

bitbake -c checkpkg fetches the latest version for all packages,
including the ones from sourceforge and those that have
ununsual package naming.
Also removed all pn-native/nativesdk-pn entries from the resulting
checkpkg.csv file if the system already reported the latest version
for pn.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |  179 +++++++++++++++++++++++++++------------
 1 file changed, 127 insertions(+), 52 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index ffc1b82..e25eeab 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -1,4 +1,4 @@
-include conf/distro/include/upstream_tracking.inc
+include conf/distro/include/package_regex.inc
 addhandler distro_eventhandler
 python distro_eventhandler() {
 
@@ -198,6 +198,48 @@ do_distrodataall() {
 
 addhandler checkpkg_eventhandler
 python checkpkg_eventhandler() {
+    def parse_csv_file(filename):
+        package_dict = {}
+        fd = open(filename, "r")
+        lines = fd.read().rsplit("\n")
+        fd.close()
+
+        first_line = ''
+        index = 0
+        for line in lines:
+            #Skip the first line
+            if index == 0:
+                first_line = line
+                index += 1
+                continue
+            elif line == '':
+                continue
+            index += 1
+            package_name = line.rsplit("\t")[0]
+            if '-native' in package_name or 'nativesdk-' in package_name:
+                original_name = package_name.rsplit('-native')[0]
+                if original_name == '':
+                    original_name = package_name.rsplit('nativesdk-')[0]
+                if original_name in package_dict:
+                    continue
+                else:
+                    package_dict[package_name] = line
+            else:
+                new_name = package_name + "-native"
+                if not(new_name in package_dict):
+                    new_name = 'nativesdk-' + package_name
+                if new_name in package_dict:
+                    del package_dict[new_name]
+                package_dict[package_name] = line
+
+        fd = open(filename, "w")
+        fd.write("%s\n"%first_line)
+        for el in package_dict:
+            fd.write(package_dict[el] + "\n")
+        fd.close()
+
+        del package_dict
+
     if bb.event.getName(e) == "BuildStarted":
         import oe.distro_check as dc
         logfile = dc.create_log_file(e.data, "checkpkg.csv")
@@ -207,6 +249,13 @@ python checkpkg_eventhandler() {
         f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\n")
         f.close()
         bb.utils.unlockfile(lf)
+    elif bb.event.getName(e) == "BuildCompleted":
+        import os
+        filename = "tmp/log/checkpkg.csv"
+        if os.path.isfile(filename):
+            lf = bb.utils.lockfile("%s.lock"%filename)
+            parse_csv_file(filename)
+            bb.utils.unlockfile(lf)
     return
 }
 
@@ -214,7 +263,6 @@ addtask checkpkg
 do_checkpkg[nostamp] = "1"
 python do_checkpkg() {
         localdata = bb.data.createCopy(d)
-        import sys
         import re
         import tempfile
         import subprocess
@@ -233,16 +281,18 @@ python do_checkpkg() {
                 genext2fs_1.3.orig.tar.gz
                 gst-fluendo-mp3
         """
-        prefix1 = "[a-zA-Z][a-zA-Z0-9]*([\-_][a-zA-Z]\w+)*[\-_]"        # match most patterns which uses "-" as separator to version digits
+        prefix1 = "[a-zA-Z][a-zA-Z0-9]*([\-_][a-zA-Z]\w+)*\+?[\-_]"        # match most patterns which uses "-" as separator to version digits
         prefix2 = "[a-zA-Z]+"                        # a loose pattern such as for unzip552.tar.gz
-        prefix3 = "[0-9a-zA-Z]+"                        # a loose pattern such as for 80325-quicky-0.4.tar.gz
+        prefix3 = "[0-9]+[\-]?[a-zA-Z]+"                        # a loose pattern such as for 80325-quicky-0.4.tar.gz
         prefix = "(%s|%s|%s)" % (prefix1, prefix2, prefix3)
-        #ver_regex = "((\d+[\.\-_]*[a-z]*)+)"#"((\d+[\.\-_[a-z]])+)"
-        suffix = "(tar\.gz|tgz|tar\.bz2|zip|xz|rpm|bz2|orig\.tar\.gz|tar\.xz)"
+        ver_regex = "(([A-Z]*\d+[a-zA-Z]*[\.\-_]*)+)"#"((\d+[\.\-_[a-z]])+)"
+        # src.rpm extension was added only for rpm package. Can be removed if the rpm
+        # packaged will always be considered as having to be manually upgraded
+        suffix = "(tar\.gz|tgz|tar\.bz2|zip|xz|rpm|bz2|orig\.tar\.gz|tar\.xz|src\.tar\.gz|src\.tgz|svnr\d+\.tar\.bz2|stable\.tar\.gz|src\.rpm)"
 
-        suffixtuple = ("tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "src.rpm", "bz2", "orig.tar.gz")
-        sinterstr = "(?P<name>%s?)(?P<ver>.*)" % prefix
-        sdirstr = "(?P<name>%s)\.?(?P<ver>.*)\.(?P<type>%s$)" % (prefix, suffix)
+        suffixtuple = ("tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "bz2", "orig.tar.gz", "src.tar.gz", "src.rpm", "src.tgz", "svnr\d+.tar.bz2", "stable.tar.gz", "src.rpm")
+        sinterstr = "(?P<name>%s?)v?(?P<ver>%s)(source)?" % (prefix, ver_regex)
+        sdirstr = "(?P<name>%s)\.?v?(?P<ver>%s)(source)?[\.\-](?P<type>%s$)" % (prefix, ver_regex, suffix)
 
         def parse_inter(s):
                 m = re.search(sinterstr, s)
@@ -258,6 +308,22 @@ python do_checkpkg() {
                 else:
                         return (m.group('name'), m.group('ver'), m.group('type'))
 
+        def modelate_version(version):
+                if version[0] in ['.', '-']:
+                        if version[1].isdigit():
+                                version = version[1] + version[0] + version[2:len(version)]
+                        else:
+                                version = version[1:len(version)]
+
+                version = re.sub('\-', '.', version)
+                version = re.sub('_', '.', version)
+                version = re.sub('(rc)+', '.-1.', version)
+                version = re.sub('(alpha)+', '.-3.', version)
+                version = re.sub('(beta)+', '.-2.', version)
+                if version[0] == 'v':
+                        version = version[1:len(version)]
+                return version
+
         """
         Check whether 'new' is newer than 'old' version. We use existing vercmp() for the
         purpose. PE is cleared in comparison as it's not for build, and PV is cleared too
@@ -267,18 +333,16 @@ python do_checkpkg() {
                 (on, ov, ot) = old
                 (en, ev, et) = new
                 if on != en or (et and et not in suffixtuple):
-                        return 0
-                ov = re.search("[\d|\.]+[^a-zA-Z]+", ov).group()
-                ev = re.search("[\d|\.]+[^a-zA-Z]+", ev).group()
-                return bb.utils.vercmp(("0", ov, ""), ("0", ev, ""))
-
-        def __vercmp2(old,new):
-                (on,ov,ot) = old
-                (en,ev,et) = new
-                #bb.plain("old n = %s" %(str(ov)))
-                if on != en or (et and et not in suffixtuple):
                         return False
-                return ov < ev
+                ov = modelate_version(ov)
+                ev = modelate_version(ev)
+
+                result = bb.utils.vercmp(("0", ov, ""), ("0", ev, ""))
+                if result < 0:
+                    return True
+                else:
+                    return False
+
         """
         wrapper for fetch upstream directory info
                 'url'        - upstream link customized by regular expression
@@ -335,15 +399,18 @@ python do_checkpkg() {
                         match "*4.1/">*4.1/ where '*' matches chars
                         N.B. add package name, only match for digits
                         """
-                        m = re.search("^%s" % prefix, curver)
+                        regex = d.getVar('REGEX', True)
+                        if regex == '':
+                                regex = "^%s" %prefix
+                        m = re.search("^%s" % regex, curver)
                         if m:
                                 s = "%s[^\d\"]*?(\d+[\.\-_])+\d+/?" % m.group()
                         else:
                                 s = "(\d+[\.\-_])+\d+/?"
                                 
                         searchstr = "[hH][rR][eE][fF]=\"%s\">" % s
-                        reg = re.compile(searchstr)
 
+                        reg = re.compile(searchstr)
                         valid = 0
                         for line in fhtml.split("\n"):
                                 if line.find(curver) >= 0:
@@ -353,7 +420,7 @@ python do_checkpkg() {
                                         ver = m.group().split("\"")[1]
                                         ver = ver.strip("/")
                                         ver = parse_inter(ver)
-                                        if ver and __vercmp(newver, ver) < 0:
+                                        if ver and __vercmp(newver, ver) == True:
                                                 newver = ver
 
                         """Expect a match for curver in directory list, or else it indicates unknown format"""
@@ -384,7 +451,7 @@ python do_checkpkg() {
                 if not re.search("\d+", curname):
                         return pcurver
                 pn = d.getVar('PN', True)
-                newver_regex = d.getVar('RECIPE_NEWVER_REGEX',True)
+                newver_regex = d.getVar('REGEX', True)
                 f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-2-" % pn)
                 status = internal_fetch_wget(url, d, f)
                 fhtml = f.read()
@@ -401,10 +468,20 @@ python do_checkpkg() {
                                 searchstr = "[hH][rR][eE][fF]=\"%s\".*[>\"]" % s
                                 reg = searchstr
                         else:
-                                reg = newver_regex
+                               reg = newver_regex
                         valid = 0
                         count = 0
                         for line in fhtml.split("\n"):
+                                if pn == 'kconfig-frontends':
+                                        m = re.findall(reg, line)
+                                        if m:
+                                            valid = 1
+                                            for match in m:
+                                                    (on, ov, oe) = newver
+                                                    ver = (on, match[0], oe)
+                                                    if ver and __vercmp(newver, ver) == True:
+                                                            newver = ver
+                                        continue
                                 count += 1
                                 m = re.search(reg, line)
                                 if m:
@@ -419,28 +496,15 @@ python do_checkpkg() {
                                                 regular expression in the recipe will extract exacly
                                                 the version """
                                                 (on, ov, oe) = newver
-                                                #HARDCODED MESS
-                                                if pn == 'remake':
-                                                        ver = (on, m.group(1)+m.group(3), oe)
-                                                else:
-                                                        ver = (on, m.group(1), oe)
-                                        pkg_problem = ['jpeg','dhcp','remake','blktool','apmd','nativesdk-openssl','valgrind','net-tools']
-                                        if pn in pkg_problem:
-                                                if ver and __vercmp2(newver,ver) == True:
-                                                        newver = ver
-                                        else:
-                                                if ver and __vercmp(newver, ver) < 0:
-                                                        newver = ver
+                                                ver = (on, m.group('pver'), oe)
+                                        if ver and __vercmp(newver, ver) == True:
+                                                newver = ver
                         """Expect a match for curver in directory list, or else it indicates unknown format"""
                         if not valid:
                                 status = "ErrParseDir"
                         else:
                                 """newver still contains a full package name string"""
-                                status = re.search("(\d+[\.\-_])*(\d+[0-9a-zA-Z]*)", newver[1]).group()
-                                if "_" in status:
-                                        status = re.sub("_",".",status)
-                                elif "-" in status:
-                                        status = re.sub("-",".",status)
+                                status = newver[1]
                 elif not len(fhtml):
                         status = "ErrHostNoDir"
 
@@ -466,11 +530,21 @@ python do_checkpkg() {
         pname = d.getVar('PN', True)
 
         if pname.find("-native") != -1:
+            if d.getVar('BBCLASSEXTEND', True):
+                    return
             pnstripped = pname.split("-native")
             bb.note("Native Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
+        if pname.startswith("nativesdk-"):
+            if d.getVar('BBCLASSEXTEND', True):
+                    return
+            pnstripped = pname.replace("nativesdk-", "")
+            bb.note("NativeSDK Split: %s" % pnstripped)
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+            bb.data.update_data(localdata)
+
         if pname.find("-cross") != -1:
             pnstripped = pname.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
@@ -483,7 +557,7 @@ python do_checkpkg() {
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
-        chk_uri = d.getVar('RECIPE_NEWVER_URI',True)
+        chk_uri = d.getVar('REGEX_URI', True)
         if not chk_uri:
                chk_uri = src_uri
         pdesc = localdata.getVar('DESCRIPTION', True)
@@ -537,14 +611,14 @@ python do_checkpkg() {
         
                         """use new path and remove param. for wget only param is md5sum"""
                         alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
-                        my_uri = d.getVar('RECIPE_NEWVER_URI',True)
+                        my_uri = d.getVar('REGEX_URI', True)
                         if my_uri:
                             newver = d.getVar('PV', True)
                         else:
                             newver = check_new_dir(alturi, dirver, d)
                         altpath = path
                         if not re.match("Err", newver) and dirver != newver:
-                                altpath = altpath.replace(dirver, newver, True)                 
+                                altpath = altpath.replace(dirver, newver, True)
                 # For folder in folder cases - try to enter the folder again and then try parsing
                 """Now try to acquire all remote files in current directory"""
                 if not re.match("Err", newver):
@@ -556,7 +630,8 @@ python do_checkpkg() {
                                 altpath = "/"
                         else:
                                 altpath = m.group()
-                        chk_uri = d.getVar('RECIPE_NEWVER_URI',True)
+
+                        chk_uri = d.getVar('REGEX_URI', True)
                         if not chk_uri:
                                 alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
                         else:
@@ -568,12 +643,12 @@ python do_checkpkg() {
                                 else:
                                         alturi = "/".join(alturi.split("/")[0:-2]) + "/download"
                                         newver = check_new_version(alturi, curname, d)
-                        if not re.match("Err", newver):
-                                pupver = newver
-                                if pupver != pcurver:
-                                        pstatus = "UPDATE"
-                                else:
-                                        pstatus = "MATCH"
+                if not re.match("Err", newver):
+                        pupver = newver
+                        if pupver != pcurver:
+                                pstatus = "UPDATE"
+                        else:
+                                pstatus = "MATCH"
         
                 if re.match("Err", newver):
                         pstatus = newver + ":" + altpath + ":" + dirver + ":" + curname
-- 
1.7.9.5



