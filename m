Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3E00C731D3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 05:06:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2016 21:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,539,1449561600"; d="scan'208";a="901929338"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2016 21:06:33 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 21:06:29 -0800
Message-Id: <9ba79aa4b445a9863b83d1dff8865faa2f7c44d6.1457154293.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457154293.git.randy.e.witt@linux.intel.com>
References: <cover.1457154293.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1457154293.git.randy.e.witt@linux.intel.com>
References: <cover.1457154293.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] uninative.bbclass: Set UNINATIVE_LIBDIR if uninative is enabled
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
X-List-Received-Date: Sat, 05 Mar 2016 05:06:34 -0000

Set a variable so other metadata can easily tell where uninative is
located.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/uninative.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 7f242de..99dee20 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -80,9 +80,12 @@ python uninative_event_enable() {
     loader = d.getVar("UNINATIVE_LOADER", True)
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
+
+        uninative_dir = "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux"
+        d.setVar("UNINATIVE_LIBDIR", "%s${libdir_native}" % uninative_dir)
         d.setVar("NATIVELSBSTRING", "universal")
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
-        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
+        d.prependVar("PATH", "%s${bindir_native}:" % uninative_dir)
 }
 
 python uninative_changeinterp () {
-- 
2.5.0


