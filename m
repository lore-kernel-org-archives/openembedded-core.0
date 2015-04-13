Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0784B73D4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:45:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 13 Apr 2015 08:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,570,1422950400"; d="scan'208";a="679381171"
Received: from padice-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.91])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2015 08:45:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 16:44:52 +0100
Message-Id: <abe2d51f35b85dcbbd43c61d9309bfd7e38d3244.1428939870.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1428939870.git.paul.eggleton@linux.intel.com>
References: <cover.1428939870.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1428939870.git.paul.eggleton@linux.intel.com>
References: <cover.1428939870.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/package: clarify installed-vs-shipped message
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
X-List-Received-Date: Mon, 13 Apr 2015 15:45:25 -0000

Based on the number of times I've had to explain it over the years it
seems that a lot of new users don't immediately realise what is meant
by "shipped" here (nor should we expect them to) so let's at least
mention packaging and briefly tell the user what they need to do. (I was
going to go into more detail in the message, but there is really more
detail than can be covered succinctly here.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 5558d0d..9790e9d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1132,12 +1132,13 @@ python populate_packages () {
                 unshipped.append(path)
 
     if unshipped != []:
-        msg = pn + ": Files/directories were installed but not shipped"
+        msg = pn + ": Files/directories were installed but not shipped in any package:"
         if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
             bb.note("Package %s skipping QA tests: installed-vs-shipped" % pn)
         else:
             for f in unshipped:
                 msg = msg + "\n  " + f
+            msg = msg + "\nPlease either set FILES such that these items are packaged, or alternatively delete them within do_install"
             package_qa_handle_error("installed-vs-shipped", msg, d)
 }
 populate_packages[dirs] = "${D}"
-- 
2.1.0


