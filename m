Return-Path: <irina.patru@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4286D12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 12:34:00 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Nov 2013 04:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="319802839"
Received: from irina-vostro-460.rb.intel.com ([10.237.105.149])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Nov 2013 04:34:01 -0800
From: Irina Patru <irina.patru@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 14:35:19 +0200
Message-Id: <1384173319-22148-1-git-send-email-irina.patru@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/3] distrodata.bbclass: Add fetch2 handlers to svn case in checkpkg
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
X-List-Received-Date: Mon, 11 Nov 2013 12:34:01 -0000

---
 meta/classes/distrodata.bbclass |   43 ++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 085575a..e481027 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -751,34 +751,25 @@ python do_checkpkg() {
                                 if not tmp3:
                                         bb.plain("#DEBUG# Package %s: current version (%s) doesn't match the usual pattern" %(pname, pversion))
         elif type == 'svn':
-                options = []
-                if user:
-                        options.append("--username %s" % user)
-                if pswd:
-                        options.append("--password %s" % pswd)
-                svnproto = 'svn'
-                if 'proto' in parm:
-                        svnproto = parm['proto']
-                if 'rev' in parm:
-                        pcurver = parm['rev']
-
-                svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), svnproto, host, path, parm["module"])
-                print svncmd
-                svninfo = os.popen(svncmd).read()
-                if "Can't connect to host " in svninfo or "Connection timed out" in svninfo:
-                        svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), "http",
-                                       host, path, parm["module"])
-                        svninfo = os.popen(svncmd).read()
-                for line in svninfo.split("\n"):
-                        if re.search("^Last Changed Rev:", line):
-                                pupver = line.split(" ")[-1]
-                                if pupver in pversion:
-                                        pstatus = "MATCH"
-                                else:
-                                        pstatus = "UPDATE"
+                ud = bb.fetch2.FetchData(uri, d)
 
-                if re.match("Err", pstatus):
+                svnFetcher = bb.fetch2.svn.Svn(d)
+                svnFetcher.urldata_init(ud, d)
+                try:
+                        pupver = svnFetcher.latest_revision(uri, ud, d, ud.names[0])
+                except bb.fetch2.FetchError:
+                        pstatus = "ErrSvnAccess"
+                
+                if pupver:
+                        if pupver in pversion:
+                                pstatus = "MATCH"
+                        else:
+                                pstatus = "UPDATE"
+                else:
                         pstatus = "ErrSvnAccess"
+                
+                if 'rev' in ud.parm:
+                        pcurver = ud.parm['rev']
 
                 if pstatus != "ErrSvnAccess":
                         tag = pversion.rsplit("+svn")[0]
-- 
1.7.9.5


