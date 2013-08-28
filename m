Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 821A46BC80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 04:30:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7S4U7n7002469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 21:30:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 27 Aug 2013 21:30:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2013 12:30:01 +0800
Message-ID: <08dbbf71b281261919744307654a91bf3d452d18.1377660850.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377660850.git.hongxu.jia@windriver.com>
References: <cover.1377660850.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] list-packageconfig-flags.py: fix searching bitbake module failed
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
X-List-Received-Date: Wed, 28 Aug 2013 04:30:06 -0000
Content-Type: text/plain

Run list-packageconfig-flags.py on wrlinux's platform in which
the oe-core layer and bitbake layer in different directories:
----
../layers/oe-core/scripts/contrib/list-packageconfig-flags.py
Traceback (most recent call last):
  File "../layers/oe-core/scripts/contrib/list-packageconfig-flags.py", line 28, in <module>
    import bb.cache
ImportError: No module named bb.cache
----

The script import bb module from bitbake lib dir, the previous
lib dir was hardcode and only worked on poky but not for others.

In this situation, look for bitbake/bin dir in PATH could fix this issue.

[YOCTO #5060]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/contrib/list-packageconfig-flags.py | 32 ++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 149922d..371033a 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -23,8 +23,26 @@ import sys
 import getopt
 import os
 
+def search_bitbakepath():
+    bitbakepath = ""
+
+    # Search path to bitbake lib dir in order to load bb modules
+    if os.path.exists(os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib/bb')):
+        bitbakepath = os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib')
+        bitbakepath = os.path.abspath(bitbakepath)
+    else:
+        # Look for bitbake/bin dir in PATH
+        for pth in os.environ['PATH'].split(':'):
+            if os.path.exists(os.path.join(pth, '../lib/bb')):
+                bitbakepath = os.path.abspath(os.path.join(pth, '../lib'))
+                break
+        if not bitbakepath:
+            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+            sys.exit(1)
+    return bitbakepath
+
 # For importing the following modules
-sys.path.insert(0, os.path.join(os.path.abspath(os.path.dirname(sys.argv[0])), '../../bitbake/lib'))
+sys.path.insert(0, search_bitbakepath())
 import bb.cache
 import bb.cooker
 import bb.providers
@@ -39,12 +57,12 @@ OPTION:
   -p, --prefer  list pkgs with preferred version
 
 EXAMPLE:
-list-packageconfig-flags.py poky/meta poky/meta-yocto
-list-packageconfig-flags.py -f poky/meta poky/meta-yocto
-list-packageconfig-flags.py -a poky/meta poky/meta-yocto
-list-packageconfig-flags.py -p poky/meta poky/meta-yocto
-list-packageconfig-flags.py -f -p poky/meta poky/meta-yocto
-list-packageconfig-flags.py -a -p poky/meta poky/meta-yocto
+list-packageconfig-flags.py
+list-packageconfig-flags.py -f
+list-packageconfig-flags.py -a
+list-packageconfig-flags.py -p
+list-packageconfig-flags.py -f -p
+list-packageconfig-flags.py -a -p
 '''
 
 def usage():
-- 
1.8.1.2


