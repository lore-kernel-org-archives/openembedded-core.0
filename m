Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1R4YA6-0001Lb-Cu
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:08:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Sep 2011 06:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,393,1312182000"; d="scan'208";a="54454500"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2011 06:03:36 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 21:01:53 +0800
Message-Id: <fba73a58180dc94cc9883c8f51eb8ff8b1b0167e.1316177782.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4d2f36c3f695ed2ad6d38c9f97e30eec306156ba.1316177782.git.lianhao.lu@intel.com>
References: <4d2f36c3f695ed2ad6d38c9f97e30eec306156ba.1316177782.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1316177782.git.lianhao.lu@intel.com>
References: <cover.1316177782.git.lianhao.lu@intel.com>
Subject: [PATCH 3/3] image/package.bbclass: Revise multilib support for DEBIAN_NAME.
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
X-List-Received-Date: Fri, 16 Sep 2011 13:08:58 -0000

[YOCTO #1486]
1. image.bbclass: In multilib_sanity_check, duplicated files except
those matching to MULTILIBRE_ALLOW_REP are allowed if they're equal.

2. pacakge.bbclass: Allow DEBIAN_NOAUTONAMES variable to be
automatically mapped in multilib case.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/image.bbclass   |   17 +++++------------
 meta/classes/package.bbclass |    2 +-
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3cd5e7a..f17e989 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -213,7 +213,6 @@ log_check() {
 }
 
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|"
-MULTILIBRE_FORCE_SAME =. "${sysconfdir}|${datadir}|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
@@ -223,7 +222,6 @@ import sys, os, os.path
 import re,filecmp
 
 allow_rep=re.compile(re.sub("\|$","","${MULTILIBRE_ALLOW_REP}"))
-force_same=re.compile(re.sub("\|$","","${MULTILIBRE_FORCE_SAME}"))
 error_promt="Multilib check error:"
 
 files={}
@@ -236,19 +234,14 @@ for dir in dirs.split():
 
       valid=True;
       if files.has_key(key):
-        #check whether files are the same
-        if force_same.match(key):
+        #check whether the file is allow to replace
+        if allow_rep.match(key):
+          valid=True
+        else:
           if not filecmp.cmp(files[key],item):
              valid=False
-             print("%s %s is not the same as %s\n" % (error_promt, item, files[key]))
+             print("%s duplicate files %s %s is not the same\n" % (error_promt, item, files[key]))
              sys.exit(1)
-        #check whether the file is allow to replace
-        elif allow_rep.match(key):
-          valid=True
-        else: 
-          valid=False
-          print("%s duplicated files %s %s not allowed\n" % (error_promt, item, files[key]))
-          sys.exit(1)
 
       #pass the check, add to list
       if valid:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 73e8f63..0e08394 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1622,7 +1622,7 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package 
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME"
 
 def gen_packagevar(d):
     ret = []
-- 
1.7.0.4



