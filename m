Return-Path: <irina.patru@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 629F065ECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 11:03:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2014 04:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,943,1389772800"; d="scan'208";a="530858164"
Received: from irina-vostro-460.rb.intel.com ([10.237.105.58])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2014 04:03:44 -0700
From: Irina Patru <irina.patru@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 14:08:46 +0300
Message-Id: <1398683326-28006-1-git-send-email-irina.patru@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] distrodata.bbclass: Fix checkpkg functionality
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
X-List-Received-Date: Mon, 28 Apr 2014 11:03:54 -0000

Currently it wasn't working because *COMMAND variables were removed
from fetcher.
Now checkpkg sets the command internally and sends it as a parameter
to _runwget() function from wget fetch.

Signed-off-by: Irina Patru <irina.patru@intel.com>
---
 meta/classes/distrodata.bbclass |   40 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index b47358b..a890de7 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -352,29 +352,14 @@ python do_checkpkg() {
         We don't want to exit whole build due to one recipe error. So handle all exceptions 
         gracefully w/o leaking to outer. 
         """
-        def internal_fetch_wget(url, d, tmpf):
+        def internal_fetch_wget(url, ud, d, tmpf):
                 status = "ErrFetchUnknown"
-                """
-                Clear internal url cache as it's a temporary check. Not doing so will have 
-                bitbake check url multiple times when looping through a single url
-                """
-                fn = d.getVar('FILE', True)
-                bb.fetch2.urldata_cache[fn] = {}
-
-                """
-                To avoid impacting bitbake build engine, this trick is required for reusing bitbake
-                interfaces. bb.fetch.go() is not appliable as it checks downloaded content in ${DL_DIR}
-                while we don't want to pollute that place. So bb.fetch2.checkstatus() is borrowed here
-                which is designed for check purpose but we override check command for our own purpose
-                """
-                ld = bb.data.createCopy(d)
-                d.setVar('CHECKCOMMAND_wget', "/usr/bin/env wget -t 1 --passive-ftp -O %s --user-agent=\"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12\" '${URI}'" \
-                                        % tmpf.name)
-                bb.data.update_data(ld)
 
+                agent = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12"
+                fetchcmd = "/usr/bin/env wget -t 1 --passive-ftp -O %s --user-agent=\"%s\" '%s'" % (tmpf.name, agent, url)
                 try:
-                        fetcher = bb.fetch2.Fetch([url], ld)
-                        fetcher.checkstatus()
+                        fetcher = bb.fetch2.wget.Wget(d)
+                        fetcher._runwget(ud, d, fetchcmd, True)
                         status = "SUCC"
                 except bb.fetch2.BBFetchException, e:
                         status = "ErrFetch"
@@ -388,10 +373,10 @@ python do_checkpkg() {
                 'curver' - current version
         Return new version if success, or else error in "Errxxxx" style
         """
-        def check_new_dir(url, curver, d):
+        def check_new_dir(url, curver, ud, d):
                 pn = d.getVar('PN', True)
                 f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-1-" % pn)
-                status = internal_fetch_wget(url, d, f)
+                status = internal_fetch_wget(url, ud, d, f)
                 fhtml = f.read()
                 if status == "SUCC" and len(fhtml):
                         newver = parse_inter(curver)
@@ -447,14 +432,14 @@ python do_checkpkg() {
                 'curname' - current package name
         Return new version if success, or else error in "Errxxxx" style
         """
-        def check_new_version(url, curname, d):
+        def check_new_version(url, curname, ud, d):
                 """possible to have no version in pkg name, such as spectrum-fw"""
                 if not re.search("\d+", curname):
                         return pcurver
                 pn = d.getVar('PN', True)
                 newver_regex = d.getVar('REGEX', True)
                 f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-2-" % pn)
-                status = internal_fetch_wget(url, d, f)
+                status = internal_fetch_wget(url, ud, d, f)
                 fhtml = f.read()
 
                 if status == "SUCC" and len(fhtml):
@@ -605,6 +590,7 @@ python do_checkpkg() {
 
 
         if type in ['http', 'https', 'ftp']:
+                ud = bb.fetch2.FetchData(uri, d)
                 newver = pcurver
                 altpath = path
                 dirver = "-"
@@ -629,7 +615,7 @@ python do_checkpkg() {
                             else:
                                     newver = d.getVar('PV', True)
                         else:
-                            newver = check_new_dir(alturi, dirver, d)
+                            newver = check_new_dir(alturi, dirver, ud, d)
                         altpath = path
                         if not re.match("Err", newver) and dirver != newver:
                                 altpath = altpath.replace(dirver, newver, True)
@@ -650,13 +636,13 @@ python do_checkpkg() {
                                 alturi = bb.fetch.encodeurl([type, host, altpath, user, pswd, {}])
                         else:
                                 alturi = chk_uri
-                        newver = check_new_version(alturi, curname, d)
+                        newver = check_new_version(alturi, curname, ud, d)
                         while(newver == "ErrHostNoDir"):
                                 if alturi == "/download":
                                         break
                                 else:
                                         alturi = "/".join(alturi.split("/")[0:-2]) + "/download"
-                                        newver = check_new_version(alturi, curname, d)
+                                        newver = check_new_version(alturi, curname, ud, d)
                 if not re.match("Err", newver):
                         pupver = newver
                         if pupver != pcurver:
-- 
1.7.9.5


