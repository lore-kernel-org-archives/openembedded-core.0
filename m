Return-Path: <irina.patru@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB1A6D72E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 09:44:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2013 01:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,691,1378882800"; d="scan'208";a="426746597"
Received: from irina-vostro-460.rb.intel.com ([10.237.105.149])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 01:44:19 -0800
From: Irina Patru <irina.patru@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 11:45:41 +0200
Message-Id: <1384335941-25306-1-git-send-email-irina.patru@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <0001-distrodata.bbclass-Add-fetch2-handlers-to-svn-case-i.patch>
References: <0001-distrodata.bbclass-Add-fetch2-handlers-to-svn-case-i.patch>
Subject: [PATCH v2] distrodata.bbclass: Add fetch2 handlers to svn case in checkpkg
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
X-List-Received-Date: Wed, 13 Nov 2013 09:44:20 -0000

The existing code in checkpkg from distrodata.bbclass had similar
functionality with fetch when searching for latest package version.

For packages that use svn protocol that part was rewrote in order
to use fetcher API.
It now calls latest_revision method from Git class in fetch2 so
that it gets latest version.

[ YOCTO #1813 ]

Signed-off-by: Irina Patru <irina.patru@intel.com>
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


