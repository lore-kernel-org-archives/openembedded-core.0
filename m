Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DEEA56E667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 22:53:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2016 15:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,354,1464678000"; d="scan'208";a="845145075"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga003.jf.intel.com with ESMTP; 12 Jul 2016 15:53:13 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 15:54:28 -0700
Message-Id: <e0d625695ec9757e35c5ca9bfc044d40017e4fea.1468363460.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <3579e2e48364aef2f63e9fc8b4bc04dbfa07bc5d.1468363460.git.brian.avery@intel.com>
References: <3579e2e48364aef2f63e9fc8b4bc04dbfa07bc5d.1468363460.git.brian.avery@intel.com>
In-Reply-To: <cover.1468363460.git.brian.avery@intel.com>
References: <cover.1468363460.git.brian.avery@intel.com>
Subject: [PATCH 2/2] toaster.bbclass: only scan files-in-image.txt if it exists
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
X-List-Received-Date: Tue, 12 Jul 2016 22:53:15 -0000

From: Elliot Smith <elliot.smith@intel.com>

We can reach the method in toaster.bbclass which tries to read from
the files-in-image.txt file via a build which doesn't create that
file (e.g. "bitbake core-image-minimal -c rootfs"). This causes
the build to fail with an exception.

Check that this file exists before trying to read from it.

[YOCTO #9784]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
Signed-off-by: bavery <brian.avery@intel.com>
---
 classes/toaster.bbclass | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/classes/toaster.bbclass b/classes/toaster.bbclass
index 90ea563..972efb9 100644
--- a/classes/toaster.bbclass
+++ b/classes/toaster.bbclass
@@ -288,15 +288,22 @@ python toaster_buildhistory_dump() {
                             images[target][dependsname] = {'size': 0, 'depends' : []}
                         images[target][pname]['depends'].append((dependsname, deptype))
 
-            with open("%s/files-in-image.txt" % installed_img_path, "r") as fin:
-                for line in fin:
-                    lc = [ x for x in line.strip().split(" ") if len(x) > 0 ]
-                    if lc[0].startswith("l"):
-                        files[target]['syms'].append(lc)
-                    elif lc[0].startswith("d"):
-                        files[target]['dirs'].append(lc)
-                    else:
-                        files[target]['files'].append(lc)
+            # files-in-image.txt is only generated if an image file is created,
+            # so the file entries ('syms', 'dirs', 'files') for a target will be
+            # empty for rootfs builds and other "image" tasks which don't
+            # produce image files
+            # (e.g. "bitbake core-image-minimal -c populate_sdk")
+            files_in_image_path = "%s/files-in-image.txt" % installed_img_path
+            if os.path.exists(files_in_image_path):
+                with open(files_in_image_path, "r") as fin:
+                    for line in fin:
+                        lc = [ x for x in line.strip().split(" ") if len(x) > 0 ]
+                        if lc[0].startswith("l"):
+                            files[target]['syms'].append(lc)
+                        elif lc[0].startswith("d"):
+                            files[target]['dirs'].append(lc)
+                        else:
+                            files[target]['files'].append(lc)
 
             for pname in images[target]:
                 if not pname in allpkgs:
-- 
1.9.1


