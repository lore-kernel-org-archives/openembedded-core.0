Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5F870772AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:31:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="740710355"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:31:58 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 12:31:41 -0800
Message-Id: <7ed41d0d5ada1b41e1093fc332a190bc0af3e707.1454614198.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/5] copy_buildsystem.py: Pass the nativelsb argument to gen-lockedsig-cache
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
X-List-Received-Date: Thu, 04 Feb 2016 20:31:58 -0000

If the nativelsb argument is not used, then create_locked_sstate_cache()
can get collisions when moving the files from the input_sstate_cache
to the output_sstate_cache.

The specific case where this was encountered was when a "universal"
nativelsb directory already existed in the input_sstate_cache.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index fb51b51..0627461 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -154,4 +154,11 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
     if fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
-            os.rename(nativedir, output_sstate_cache + '/' + fixedlsbstring)
+            destdir = os.path.join(output_sstate_cache, fixedlsbstring)
+            bb.utils.mkdirhier(destdir)
+
+            dirlist = os.listdir(nativedir)
+            for i in dirlist:
+                src = os.path.join(nativedir, i)
+                dest = os.path.join(destdir, i)
+                os.rename(src, dest)
-- 
2.5.0


