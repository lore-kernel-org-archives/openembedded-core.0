Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6655977846
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 04:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489983394; x=1521519394;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6GS8JB+mHT+WfRr//Avlwwmq2b7JPobw3FoO42qoKeU=;
	b=T5EKRgc8lwspvw2J1usMci/b6ik+8CKbiI0fdziaoFNqoyRPlGeg+kgU
	CUvEFEtIZcEapPqLV59QM0nu+XFUYQ==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2017 21:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,191,1486454400"; d="scan'208";a="238130034"
Received: from cloy-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.161.201])
	by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2017 21:16:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:16:20 +1300
Message-Id: <23a6304054effdca8fb9dd43557aa1ac70bebd32.1489983267.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489983267.git.paul.eggleton@linux.intel.com>
References: <cover.1489983267.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] devtool: tidy up handling of parse failures
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
X-List-Received-Date: Mon, 20 Mar 2017 04:16:32 -0000

Since the tinfoil2 refactoring, if an error occurred during parsing, we
were showing a traceback and not correctly exiting (since we weren't
calling shutdown()). Fix both of these issues.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 91111e1..8c385be 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -114,8 +114,15 @@ def setup_tinfoil(config_only=False, basepath=None, tracking=False):
 
         import bb.tinfoil
         tinfoil = bb.tinfoil.Tinfoil(tracking=tracking)
-        tinfoil.prepare(config_only)
-        tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        try:
+            tinfoil.prepare(config_only)
+            tinfoil.logger.setLevel(logger.getEffectiveLevel())
+        except bb.tinfoil.TinfoilUIException:
+            tinfoil.shutdown()
+            raise DevtoolError('Failed to start bitbake environment')
+        except:
+            tinfoil.shutdown()
+            raise
     finally:
         os.chdir(orig_cwd)
     return tinfoil
-- 
2.9.3


