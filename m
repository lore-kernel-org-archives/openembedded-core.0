Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DBD7471CAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:39 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546500"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:32 +0200
Message-Id: <e1961a93d396cbc9ea0f183dda4d0aa49f6cd4ad.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/36] package.bbclass: fix locations of debugedit and rpmdeps utilities
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:40 -0000

rpm4 installs them in different locations than rpm5. This also replaces
our custom rpmdeps-oecore with standard rpmdeps; I'm not seeing a
significant performance penalty.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ac2d71cfa44..17029451e36 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -345,7 +345,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     dvar = d.getVar('PKGD')
     objcopy = d.getVar("OBJCOPY")
-    debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
+    debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/debugedit")
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
@@ -1436,7 +1436,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps-oecore --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
 
 # Collect perfile run-time dependency metadata
 # Output:
-- 
2.11.0


