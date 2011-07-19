Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3X-0001do-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396944"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:00 -0700
Message-Id: <1224b568bdebfb2bb48325d38dae748dc575dbc3.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/22] sanity, base: remove gcc3 check since qemu doesn't need it any more
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:52 -0000

From: Phil Blundell <philb@gnu.org>

Recent versions of qemu seem to be happy enough building with gcc 4.x, and indeed most modern distributions aren't shipping gcc3 any more, so there is no point checking for its presence as part of sanity.

Also remove the check_gcc3 function from base since nothing else uses it.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/base.bbclass   |   10 ----------
 meta/classes/sanity.bbclass |    8 --------
 2 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0c2c546..3ca4e47 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -397,16 +397,6 @@ python () {
             bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN", True))
 }
 
-def check_gcc3(data):
-
-	gcc3_versions = 'gcc-3.4.6 gcc-3.4.7 gcc-3.4 gcc34 gcc-3.4.4 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
-
-	for gcc3 in gcc3_versions.split():
-		if check_app_exists(gcc3, data):
-			return gcc3
-	
-	return False
-
 addtask cleansstate after do_clean
 python do_cleansstate() {
         sstate_clean_cachefiles(d)
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b586de9..bbaa9d3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -217,14 +217,6 @@ def check_sanity(e):
 
     required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg chrpath wget cpio"
 
-    # qemu-native needs gcc 3.x
-    if "qemu-native" not in assume_provided and "gcc3-native" in assume_provided:
-        gcc_version = commands.getoutput("${BUILD_PREFIX}gcc --version | head -n 1 | cut -f 3 -d ' '")
-
-        if not check_gcc3(e.data) and gcc_version[0] != '3':
-            messages = messages + "gcc3-native was in ASSUME_PROVIDED but the gcc-3.x binary can't be found in PATH"
-            missing = missing + "gcc-3.x (needed for qemu-native),"
-
     if "qemu-native" in assume_provided:
         if not check_app_exists("qemu-arm", e.data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
-- 
1.7.3.4



