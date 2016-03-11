Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24919731EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 02:21:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2016 18:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,318,1455004800"; d="scan'208";a="931449359"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2016 18:21:12 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 18:07:36 -0800
Message-Id: <1457662056-18208-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457662056-18208-1-git-send-email-juro.bystricky@intel.com>
References: <1457662056-18208-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] ncurses_6: Fix an install race condition
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
X-List-Received-Date: Fri, 11 Mar 2016 02:21:12 -0000

Both targets install.libs and install.includes install the same
files, resulting in a race condition when running parallel make.
This race is addressed in a patch file, making sure only one
of the targets (install.includes) installes the include files.
This will work properly (i.e.ncurses will install as intended
by the recipe) as long as we always install both targets.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../ncurses/files/fix-include-files-race.patch     | 32 ++++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.0+20160213.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/fix-include-files-race.patch

diff --git a/meta/recipes-core/ncurses/files/fix-include-files-race.patch b/meta/recipes-core/ncurses/files/fix-include-files-race.patch
new file mode 100644
index 0000000..6f22e98
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/fix-include-files-race.patch
@@ -0,0 +1,32 @@
+There is a race condition when running 
+
+    $ make install.libs install.includes
+    
+As both targets install identical files. The remedy is to either prevent
+parallel make of install.libs and install.includes, or ensure only one 
+target installs the files. 
+The second approch will only work if we always install both libs and 
+includes (which we do).
+
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: git/mk-hdr.awk
+===================================================================
+--- a/mk-hdr.awk
++++ b/mk-hdr.awk
+@@ -73,11 +73,13 @@ BEGIN	{
+ END	{
+ 		if ( count > 0 )
+ 		{
++			print" # patched here: Removed install.libs due the race "
+ 			print "${INCLUDEDIR} :"
+ 			print "	mkdir -p $@"
+ 			print ""
++			print "install.libs :: ;"
++			print ""
+ 			print "install \\"
+-			print "install.libs \\"
+ 			print "install.includes :: ${AUTO_SRC} ${INCLUDEDIR} \\"
+ 
+ 			for (i = 0; i < count - 1; ++i) {
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb b/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
index 0d56481..fef4e0f 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
@@ -2,6 +2,7 @@ require ncurses.inc
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
+            file://fix-include-files-race.patch \
 "
 # commit id corresponds to the revision in package version
 SRCREV = "a25949ff653ac5ae7a204381a3ebfd800feeaa01"
-- 
1.9.1


