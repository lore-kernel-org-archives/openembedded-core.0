Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D16978218
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 11:50:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 04:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="866229294"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2017 04:50:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 39B3A5803A3;
	Fri,  9 Jun 2017 04:50:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 14:49:24 +0300
Message-Id: <1497008964-16342-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory: force writing SRCREV values
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
X-List-Received-Date: Fri, 09 Jun 2017 11:50:30 -0000

Enabling SSTATE_MIRRORS sometimes causes SRCREV values not
to be written/updated in the build history. This happens more
often if SRCREV is set to ${AUTOREV}

Explicitly writing SRCREVs when recipe history is being written
should fix this.

[YOCTO: #10948]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3e907fc..057a3cb 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -336,6 +336,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
         f.write(u"LAYER = %s\n" %  rcpinfo.layer)
 
+    write_latest_srcrev(d, pkghistdir)
 
 def write_pkghistory(pkginfo, d):
     bb.debug(2, "Writing package history for package %s" % pkginfo.name)
@@ -853,7 +854,10 @@ def _get_srcrev_values(d):
 do_fetch[postfuncs] += "write_srcrev"
 do_fetch[vardepsexclude] += "write_srcrev"
 python write_srcrev() {
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
+    write_latest_srcrev(d, d.getVar('BUILDHISTORY_DIR_PACKAGE'))
+}
+
+def write_latest_srcrev(d, pkghistdir):
     srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
 
     srcrevs, tag_srcrevs = _get_srcrev_values(d)
@@ -891,4 +895,3 @@ python write_srcrev() {
     else:
         if os.path.exists(srcrevfile):
             os.remove(srcrevfile)
-}
-- 
2.1.4


