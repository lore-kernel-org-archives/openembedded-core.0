Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE15F6D99B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:33:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 06:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920202"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:33:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:47 +0000
Message-Id: <a12bf47a601a1547b8a0739e1d9ccc0ae942f8e4.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/11] classes/pkg_distribute: remove
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
X-List-Received-Date: Wed, 13 Nov 2013 14:33:05 -0000

This appears to be a very old way of archiving recipes and associated
files. We have better ways of doing this now, and nobody appears to be
using this class - even OE-Classic had no current references to it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/pkg_distribute.bbclass | 29 -----------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta/classes/pkg_distribute.bbclass

diff --git a/meta/classes/pkg_distribute.bbclass b/meta/classes/pkg_distribute.bbclass
deleted file mode 100644
index 9f249a0..0000000
--- a/meta/classes/pkg_distribute.bbclass
+++ /dev/null
@@ -1,29 +0,0 @@
-PKG_DISTRIBUTECOMMAND[func] = "1"
-python do_distribute_packages () {
-	cmd = d.getVar('PKG_DISTRIBUTECOMMAND', True)
-	if not cmd:
-		raise bb.build.FuncFailed("Unable to distribute packages, PKG_DISTRIBUTECOMMAND not defined")
-	bb.build.exec_func('PKG_DISTRIBUTECOMMAND', d)
-}
-
-addtask distribute_packages before do_build after do_fetch
-
-PKG_DIST_LOCAL ?= "symlink"
-PKG_DISTRIBUTEDIR ?= "${DEPLOY_DIR}/packages"
-
-PKG_DISTRIBUTECOMMAND () {
-	p=`dirname ${FILE}`
-	d=`basename $p`
-	mkdir -p ${PKG_DISTRIBUTEDIR}
-	case "${PKG_DIST_LOCAL}" in
-		copy)
-			# use this weird tar command to copy because we want to 
-			# exclude the BitKeeper directories
-			test -e ${PKG_DISTRIBUTEDIR}/${d} || mkdir ${PKG_DISTRIBUTEDIR}/${d};
-			(cd ${p}; tar -c --exclude SCCS -f - . ) | tar -C ${PKG_DISTRIBUTEDIR}/${d} -xpf -
-			;;
-		symlink)
-			ln -sf $p ${PKG_DISTRIBUTEDIR}/
-			;;
-	esac
-}
-- 
1.8.1.2


