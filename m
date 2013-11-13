Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F01456D7DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:33:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 06:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920208"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:33:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:48 +0000
Message-Id: <51c325dd01e515117944ba1f46c7b0df8c0217cb.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/11] classes/pkg_metainfo: remove
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
X-List-Received-Date: Wed, 13 Nov 2013 14:33:06 -0000

This is very old, and we now have pkgdata which is much more complete.
Nobody appears to be using this class, and even OE-Classic had no
current references to it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/pkg_metainfo.bbclass | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta/classes/pkg_metainfo.bbclass

diff --git a/meta/classes/pkg_metainfo.bbclass b/meta/classes/pkg_metainfo.bbclass
deleted file mode 100644
index 80f6244..0000000
--- a/meta/classes/pkg_metainfo.bbclass
+++ /dev/null
@@ -1,22 +0,0 @@
-python do_pkg_write_metainfo () {
-    deploydir = d.getVar('DEPLOY_DIR', True)
-    if not deploydir:
-        bb.error("DEPLOY_DIR not defined, unable to write package info")
-        return
-
-    try:
-        infofile = file(os.path.join(deploydir, 'package-metainfo'), 'a')
-    except OSError:
-        raise bb.build.FuncFailed("unable to open package-info file for writing.")
-
-    name = d.getVar('PN', True)
-    version = d.getVar('PV', True)
-    desc = d.getVar('DESCRIPTION', True)
-    page = d.getVar('HOMEPAGE', True)
-    lic = d.getVar('LICENSE', True)
-
-    infofile.write("|| "+ name +" || "+ version + " || "+ desc +" || "+ page +" || "+ lic + " ||\n" ) 
-    infofile.close()
-}
-
-addtask pkg_write_metainfo after do_package before do_build
-- 
1.8.1.2


