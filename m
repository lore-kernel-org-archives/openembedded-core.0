Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVd-0001me-Kq
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2011 22:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="433405018"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 22:26:27 -0700
Message-Id: <5b4f5ac5548dc44f88eaf9b7994b2fec77a7baf5.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Wed, 22 Sep 2010 13:59:21 -0700
MIME-Version: 1.0
Date: Mon, 09 May 2011 22:26:27 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 28/30] oe/patch.py: Remove series file during Clean()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 05:29:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Currently if there is a failed do_patch the series files get appended
so if there were two patches

a.patch
b.patch
and b.patch failed during next run it would append a.patch again
a.patch
b.patch
a.patch

and this would keep growing.

We can remove series file in Clean() because we populate it in Import()
anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Chris Larson <chris_larson@mentor.com>
Acked-by: Eric Bénard <eric@eukrea.com>
---
 meta/lib/oe/patch.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 16d3d08..1406e19 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -198,6 +198,7 @@ class QuiltTree(PatchSet):
     def Clean(self):
         try:
             self._runcmd(["pop", "-a", "-f"])
+            oe.path.remove(os.path.join(self.dir, "patches","series"))
         except Exception:
             pass
         self.initialized = True
-- 
1.7.1.1



