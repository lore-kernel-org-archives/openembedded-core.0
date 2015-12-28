Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 356E86FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7F8UW013856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:08 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:36 -0800
Message-ID: <5c5953cbc44c7532650cb9e3c877fa86c9d0f242.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 28/40] scripts/gen-lockedsig-cache: improve output
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:07 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

* Print some status when running
* When incorrect number of arguments specified, print usage text

(From OE-Core master rev: ac38d245878b618ddf56f9a68834d344500e45a6)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/gen-lockedsig-cache |   13 ++++++++++---
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
1.7.9.5


