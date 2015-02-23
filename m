Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9499571633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537352"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:35 +0000
Message-Id: <83bc89edac904864b231a61f6c7d4ae02be1007c.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] gen-lockedsig-cache: Allow cross-filesystem copies.
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:48 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

Since this previously always tried to use hardlinks you couldn't have
the source and destination be on different devices. This change allows
for that and also prevents failure in situations where the files already
existed.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 scripts/gen-lockedsig-cache | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index dfb282e..c93b2c0 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -35,6 +35,12 @@ for s in sigs:
 
 for f in files:
     dst = f.replace(sys.argv[2], sys.argv[3])
-    mkdir(os.path.dirname(dst))
-    os.link(f, dst)
+    destdir = os.path.dirname(dst)
+    mkdir(destdir)
 
+    if os.path.exists(dst):
+        os.remove(dst)
+    if (os.stat(f).st_dev == os.stat(destdir).st_dev):
+        os.link(f, dst)
+    else:
+        shutil.copyfile(f, dst)
-- 
1.9.3


