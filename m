Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A59B770CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 00:21:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 16:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="868528148"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2016 16:20:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 13:20:24 +1300
Message-Id: <f51afe22a8c067fda84994789496b96500d230bd.1453767579.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453767579.git.paul.eggleton@linux.intel.com>
References: <cover.1453767579.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453767579.git.paul.eggleton@linux.intel.com>
References: <cover.1453767579.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] gen-lockedsig-cache: fix bad destination path joining
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
X-List-Received-Date: Tue, 26 Jan 2016 00:21:03 -0000

When copying the sstate-cache into the extensible SDK, if the source
path had a trailing / and the destination path did not, there would be a
missing / between the path and the subdirectory name, and you'd end up
with subdirectories like "sstate-cacheCentOS-6.7". There are functions
in os.path for this sort of thing so let's just use them and avoid the
problem.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/gen-lockedsig-cache | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index a4e9ded..0986a21 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -41,7 +41,7 @@ for f in files:
         # Most likely a temp file, skip it
         print('skipping')
         continue
-    dst = f.replace(sys.argv[2], sys.argv[3])
+    dst = os.path.join(sys.argv[3], os.path.relpath(f, sys.argv[2]))
     destdir = os.path.dirname(dst)
     mkdir(destdir)
 
-- 
2.5.0


