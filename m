Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 740F571DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 20:59:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 13:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="94327314"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 01 May 2017 13:59:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:59:04 -0700
Message-Id: <1493672344-21965-7-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2 6/6] image.bbclass: support binary reproducibility
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
X-List-Received-Date: Mon, 01 May 2017 20:59:06 -0000

Added a new task "reproducible_final_image_task".
If binary reproducibility is desired ($BUILD_REPRODUCIBLE_BINARIES" = "1"),
then recursivley modify mtimes of all files to a reproducible vale.
The value is obtained via REPRODUCIBLE_TIMESTAMP_ROOTFS.
This task is executed as the very last step in image creation, once all
the files in the image have been finalized.

[YOCTO#11176]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..c311de5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -617,3 +617,15 @@ do_bundle_initramfs () {
 	:
 }
 addtask bundle_initramfs after do_image_complete
+
+reproducible_final_image_task () {
+    if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+        if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1 --pretty=%ct`
+        fi
+        # Set mtime of all files to a reproducible value
+        bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
+        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
+    fi
+}
+IMAGE_PREPROCESS_COMMAND_append = " reproducible_final_image_task; "
-- 
2.7.4


