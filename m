Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 931097241D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:45:01 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so5382784wid.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FfYvmeWFaDaf3AP5iVKZHVw5o8KXzZcCxKjuSTsEF+0=;
	b=a0eSin/1PLMR4R8Kp/x8XZkwfa+XUlSZ+WxRkkuiOAKLR5kmnqRiaJ+PsxN/UfXNed
	tHnE2qiuqBRt/s7iFyCxSO8NZT6iqvJeivjT9/sQZ2nAa5eOgoxfUx33nx/iR6/ltsHW
	/RUoeoI4djWa78j3U9VZoPXHmTYZrjkfwV7LUOhfmMMJorhr5xcFPp8o3KGbMjk0azXJ
	DPxRqsycx7WatscO+ckt4eEQLbDm2Wy9gLFLuKKmiilY88lpyCrQfCEIIP11qYMo4py0
	zkkqT+cFid7cs1FxbdPtQojglpoOxbLLiLQKtKv/DuM7JDWmXXEnSVg2VX3x5vYnF7vF
	NiUA==
X-Gm-Message-State: ALoCoQnYn/Xoi3xMvNrtRabB+rrtgmFqg38pW3AQJ7+Zp5vCuVhc/qwXFXPSKuOu0cbKxI5CLU3u
X-Received: by 10.180.78.9 with SMTP id x9mr13910898wiw.39.1418222701805;
	Wed, 10 Dec 2014 06:45:01 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id p15sm6130963wjr.18.2014.12.10.06.45.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:45:01 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 7627A561166; Wed, 10 Dec 2014 14:45:00 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 14:44:59 +0000
Message-Id: <1418222699-17402-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 01/13] toaster.bbclass: trigger event for other image files
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
X-List-Received-Date: Wed, 10 Dec 2014 14:45:07 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Toaster will log all the files that it can find in the
deploy images directory, and list them, considering that
they may be artifacts of the current build not logged
anywhere else.

[YOCTO #6836]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index a7dd0aa..55d0d28 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -149,14 +149,26 @@ python toaster_image_dumpdata() {
     image_name = d.getVar('IMAGE_NAME', True);
 
     image_info_data = {}
+    artifact_info_data = {}
 
+    # collect all artifacts
     for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
         for fn in filenames:
-            if fn.startswith(image_name):
-                image_output = os.path.join(dirpath, fn)
-                image_info_data[image_output] = os.stat(image_output).st_size
+            try:
+                if fn.startswith(image_name):
+                    image_output = os.path.join(dirpath, fn)
+                    image_info_data[image_output] = os.stat(image_output).st_size
+                else:
+                    import stat
+                    artifact_path = os.path.join(dirpath, fn)
+                    filestat = os.stat(artifact_path)
+                    if stat.S_ISREG(filestat.st_mode):
+                        artifact_info_data[artifact_path] = filestat.st_size
+            except OSError as e:
+                bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
     bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
+    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize",artifact_info_data), d)
 }
 
 
-- 
1.9.1


