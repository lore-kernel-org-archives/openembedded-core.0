Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB2906082D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:38:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2015 18:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,335,1444719600"; d="scan'208";a="857558553"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2015 18:38:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:37:36 +1300
Message-Id: <7c35b9f62d039dc69aaf90c8427abc14504deda2.1448246218.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] scripts/gen-lockedsig-cache: improve output
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
X-List-Received-Date: Mon, 23 Nov 2015 02:38:07 -0000

* Print some status when running
* When incorrect number of arguments specified, print usage text

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/gen-lockedsig-cache | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 806c1e4..9c16506 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -1,7 +1,4 @@
 #!/usr/bin/env python
-#
-# gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir>
-#
 
 import os
 import sys
@@ -18,14 +15,17 @@ def mkdir(d):
 
 if len(sys.argv) < 3:
     print("Incorrect number of arguments specified")
+    print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir>")
     sys.exit(1)
 
+print('Reading %s' % sys.argv[1])
 sigs = []
 with open(sys.argv[1]) as f:
     for l in f.readlines():
         if ":" in l:
             sigs.append(l.split(":")[2].split()[0])
 
+print('Gathering file list')
 files = set()
 for s in sigs:
     p = sys.argv[2] + "/" + s[:2] + "/*" + s + "*"
@@ -33,10 +33,13 @@ for s in sigs:
     p = sys.argv[2] + "/*/" + s[:2] + "/*" + s + "*"
     files |= set(glob.glob(p))
 
+print('Processing files')
 for f in files:
+    sys.stdout.write('Processing %s... ' % f)
     _, ext = os.path.splitext(f)
     if not ext in ['.tgz', '.siginfo', '.sig']:
         # Most likely a temp file, skip it
+        print('skipping')
         continue
     dst = f.replace(sys.argv[2], sys.argv[3])
     destdir = os.path.dirname(dst)
@@ -45,6 +48,10 @@ for f in files:
     if os.path.exists(dst):
         os.remove(dst)
     if (os.stat(f).st_dev == os.stat(destdir).st_dev):
+        print('linking')
         os.link(f, dst)
     else:
+        print('copying')
         shutil.copyfile(f, dst)
+
+print('Done!')
-- 
2.1.0


