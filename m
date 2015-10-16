Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDAA76FDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:35:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 16 Oct 2015 03:34:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,688,1437462000"; d="scan'208";a="794711876"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.9.47])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2015 03:34:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 11:34:39 +0100
Message-Id: <f4abfbb82600e47c5f2fd70bc9f43b533a6439c2.1444991643.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444991643.git.paul.eggleton@linux.intel.com>
References: <cover.1444991643.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444991643.git.paul.eggleton@linux.intel.com>
References: <cover.1444991643.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] scripts/gen-lockedsig-cache: fix race with temp file creation
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
X-List-Received-Date: Fri, 16 Oct 2015 10:35:00 -0000

As part of populating the sstate-cache with an artifact (.tgz file) we
create a temp file and then atomically move it to the final name. Due to
the glob used in this script such temp files were being matched, and
between the time they were matched and the time the script started
copying files, the temp file may have vanished.

This fixes random "No such file or directory" failures building the
extensible SDK on build setups where the sstate-cache directory is shared
amongst multiple build machines.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/gen-lockedsig-cache | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index c93b2c0..806c1e4 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -34,6 +34,10 @@ for s in sigs:
     files |= set(glob.glob(p))
 
 for f in files:
+    _, ext = os.path.splitext(f)
+    if not ext in ['.tgz', '.siginfo', '.sig']:
+        # Most likely a temp file, skip it
+        continue
     dst = f.replace(sys.argv[2], sys.argv[3])
     destdir = os.path.dirname(dst)
     mkdir(destdir)
-- 
2.1.0


