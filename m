Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF3E17D1D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 15:38:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2019 08:38:23 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2019 08:38:23 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 23:38:22 +0800
Message-Id: <1559749102-44872-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic/engine: include .wks.in in wic search and list
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
X-List-Received-Date: Wed, 05 Jun 2019 15:38:23 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

allow wic to list and search for kickstart file in .wks.in extension.
basename show by wic list images to fully exclude extension.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/engine.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 42e93c3..61939ad1 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -75,7 +75,8 @@ def find_canned_image(scripts_path, wks_file):
             for fname in files:
                 if fname.endswith("~") or fname.endswith("#"):
                     continue
-                if fname.endswith(".wks") and wks_file + ".wks" == fname:
+                if ((fname.endswith(".wks") and wks_file + ".wks" == fname) or \
+                   (fname.endswith(".wks.in") and wks_file + ".wks.in" == fname)):
                     fullpath = os.path.join(canned_wks_dir, fname)
                     return fullpath
     return None
@@ -92,7 +93,7 @@ def list_canned_images(scripts_path):
             for fname in files:
                 if fname.endswith("~") or fname.endswith("#"):
                     continue
-                if fname.endswith(".wks"):
+                if fname.endswith(".wks") or fname.endswith(".wks.in"):
                     fullpath = os.path.join(canned_wks_dir, fname)
                     with open(fullpath) as wks:
                         for line in wks:
@@ -101,7 +102,7 @@ def list_canned_images(scripts_path):
                             if idx != -1:
                                 desc = line[idx + len("short-description:"):].strip()
                                 break
-                    basename = os.path.splitext(fname)[0]
+                    basename = fname.split('.')[0]
                     print("  %s\t\t%s" % (basename.ljust(30), desc))
 
 
-- 
2.7.4


