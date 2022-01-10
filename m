Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DF2C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 01:54:54 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.26095.1641779692832800694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 17:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DutH0WyM;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id AA37E20B7179; Sun,  9 Jan 2022 17:54:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA37E20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1641779691;
	bh=wbR/RbbqxVAIixY+TQSnMrRVVRyzO13iEMX0RdSvR3o=;
	h=From:To:Subject:Date:From;
	b=DutH0WyMAveksbNfRURvUA1R1cIJtSP99bL+/PaXsKkPpEKVJdWWdSWRa9wj+i1L0
	 zPuNF6kj61dwxelnHlriVoiYFL9DYpll9zhJHd9CzZAqSVd5W8mP1BTGmfFDUIQeKL
	 hJsuAHrGnCczYyC7/U1GyVFTVPgT4MFO2ORPB2Ok=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/create-spdx: handle if IMAGE_LINK_NAME is empty
Date: Sun,  9 Jan 2022 17:54:49 -0800
Message-Id: 
 <1641779689-5549-1-git-send-email-paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 01:54:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160318

From: Paul Eggleton <paul.eggleton@microsoft.com>

If IMAGE_LINK_NAME is set to "" (supported in other classes) then skip
creating symlinks for the spdx manifest files.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/create-spdx.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 0a4db80..e44a204 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -870,8 +870,9 @@ python image_combine_spdx() {
     with image_spdx_path.open("wb") as f:
         doc.to_json(f, sort_keys=True)
 
-    image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
-    image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
+    if image_link_name:
+        image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
+        image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
 
     num_threads = int(d.getVar("BB_NUMBER_THREADS"))
 
@@ -942,8 +943,9 @@ python image_combine_spdx() {
             tar.addfile(info, fileobj=index_str)
 
     def make_image_link(target_path, suffix):
-        link = imgdeploydir / (image_link_name + suffix)
-        link.symlink_to(os.path.relpath(target_path, link.parent))
+        if image_link_name:
+            link = imgdeploydir / (image_link_name + suffix)
+            link.symlink_to(os.path.relpath(target_path, link.parent))
 
     make_image_link(spdx_tar_path, ".spdx.tar.zst")
 
-- 
1.8.3.1


