Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2D54D771C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475604"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:44:58 +1200
Message-Id: <dbeb7d00387bbabce81bcb54029be23597d2a797.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/10] gen-lockedsig-cache: ensure symlinks are dereferenced
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:28 -0000

If you set up a local mirror in SSTATE_MIRRORS then you can end up with
symlinks in SSTATE_DIR rather than real files. We don't want these
symlinks in the sstate-cache prodcued by gen-lockedsig-cache, so
dereference any symlinks before copying.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/gen-lockedsig-cache | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index de8a20c..49de74e 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -57,13 +57,14 @@ for f in files:
     destdir = os.path.dirname(dst)
     mkdir(destdir)
 
+    src = os.path.realpath(f)
     if os.path.exists(dst):
         os.remove(dst)
-    if (os.stat(f).st_dev == os.stat(destdir).st_dev):
+    if (os.stat(src).st_dev == os.stat(destdir).st_dev):
         print('linking')
-        os.link(f, dst)
+        os.link(src, dst)
     else:
         print('copying')
-        shutil.copyfile(f, dst)
+        shutil.copyfile(src, dst)
 
 print('Done!')
-- 
2.5.5


