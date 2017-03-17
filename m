Return-Path: <brian.avery@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDD36FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 19:59:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 17 Mar 2017 12:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,178,1486454400"; d="scan'208";a="1124140446"
Received: from echidna.jf.intel.com ([10.54.77.142])
	by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2017 12:59:06 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 05:49:57 -0700
Message-Id: <87cadaf74138965f72d0943a39cd266ba942b69c.1489754655.git.brian.avery@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1489754655.git.brian.avery@intel.com>
References: <cover.1489754655.git.brian.avery@intel.com>
Subject: [PATCH 1/1] gen-lockedsig-cache: catch os.link error V2
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
X-List-Received-Date: Fri, 17 Mar 2017 19:59:05 -0000

We do a hard link to speed up sdk creation but if your sstate-cache is
across a file system boundary, this tries and fails. This patch catches
that error and does a copy instead.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/gen-lockedsig-cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 49de74ed..6765891 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -62,7 +62,11 @@ for f in files:
         os.remove(dst)
     if (os.stat(src).st_dev == os.stat(destdir).st_dev):
         print('linking')
-        os.link(src, dst)
+        try:
+            os.link(src, dst)
+        except OSError as e:
+            print('hard linking failed, copying')
+            shutil.copyfile(src, dst)
     else:
         print('copying')
         shutil.copyfile(src, dst)
--
2.7.4

