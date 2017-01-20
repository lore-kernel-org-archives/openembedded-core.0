Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B65E0772E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5EYl019639; Fri, 20 Jan 2017 18:05:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4xfGtyUnfiAn; Fri, 20 Jan 2017 18:05:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5A5T019618
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000uT-Hb; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:04:58 +0000
Message-Id: <1484935506-3419-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/14] image.bbclass: put .env files to ${STAGING_DIR}/imgdata/
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
X-List-Received-Date: Fri, 20 Jan 2017 18:05:17 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

As STAGING_DIR_TARGET started to point to a recipe specific
sysroot wic is not able to add .env files when .wks file refers
to multiple rootfs recipes.

Used STAGING_DIR instead of STAGING_DIR_TARGET to make the
directory with .env files the same for all recipes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass       | 2 +-
 meta/classes/image_types.bbclass | 2 +-
 meta/lib/oeqa/selftest/wic.py    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 021c432..59a7688 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -342,7 +342,7 @@ python do_rootfs_wicenv () {
     if not wicvars:
         return
 
-    stdir = d.getVar('STAGING_DIR_TARGET')
+    stdir = d.getVar('STAGING_DIR')
     outdir = os.path.join(stdir, 'imgdata')
     bb.utils.mkdirhier(outdir)
     basename = d.getVar('IMAGE_BASENAME')
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index bac7ff5..5b1746a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -216,7 +216,7 @@ IMAGE_CMD_wic () {
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
 
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 	rm -rf "$out/"
 }
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 77f1bdc..6a61ba6 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -332,7 +332,7 @@ class Wic(oeSelfTest):
         """Generate and obtain the path to <image>.env"""
         if image not in self.wicenv_cache:
             self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
-            stdir = get_bb_var('STAGING_DIR_TARGET', image)
+            stdir = get_bb_var('STAGING_DIR', image)
             self.wicenv_cache[image] = os.path.join(stdir, 'imgdata')
         return self.wicenv_cache[image]
 
-- 
2.7.4


