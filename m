Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBE5C63707
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:57 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.11725.1649942996967945218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 06:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oT87cWp8;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id t25so6348517edt.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N995feYPLyJMAafeRoF4UW6YYM4FW/vMplTk3wJMd3Y=;
        b=oT87cWp8ehoZZh52IFjfI+1AwJ7W7l3VY62mzR1rkHBVvmzWEOVpWfCW1WMXgqQMj0
         CBmo2DxraqEPbC130PE+Bz5UKvcV914XeBi0grVT7+zo2pNSg22cmghLcizbubfTUXMH
         cZsFHBLOnEqfS+xx/Bis6FHQuwzNRxp4UsVAkcZv7FqcCjki1kETN9wsRMFfUENmlMHe
         pcilNpiGKNLNQVFdlFOw1HmwYb/vq/nYRB1hE7VuZ4vFVZJHhqQR19NoeRxYL4J5h/Dw
         Z3ZrkKV4XgWt6bZkKitHDzax6EnnMLTuyZNEJn1R0MH4BK6gjPob/BW66LXWHyBi+3pn
         T4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N995feYPLyJMAafeRoF4UW6YYM4FW/vMplTk3wJMd3Y=;
        b=vOC4ahJEL+BbE4y/6nwaOOh4h/AlYIU+QqfHrGMXlAmApABIz5IJEBEewYuhQWrWLu
         r7oy5y4H+sK6ZziY0suZxjQEWC5CEzgMYN3SFamdrLlDCdcgYkk2wFdALSxpqwYfWMp/
         SVhXyy7Skm06D1szfWxE4spbkXV5aztFhx9W08KwN9YqkLE/ZBUfSDKGJerB3XAqJwG7
         GNx0bp+CtpXl0P9y1HB+d3lVzyT1Lfy2aONzj0N+SX8D+NSehbvfAnuLoQFCv7GIfuw7
         rqXxUWYUbRwEdarQYoCPw9mgy1Z6GtQ9mjzaiRP4cj2p+v7jLj5qXC37i9YcaFKjbBsb
         IV4g==
X-Gm-Message-State: AOAM533hC4/uM/Znl1ivRmWdHZRmUsxv6RMZ8OkJONBBBHuRGq3cu2gs
	7KJkB6KPXittWLOdl8DqhdesiQ/+g/M=
X-Google-Smtp-Source: 
 ABdhPJz1W5IL3Vn7iRwiBRRGmSf53HRNIUcDM7QZNBsrL4KXk7Vx5dPiz8ZtX3+o+jMxqfy7zN7GfA==
X-Received: by 2002:aa7:d8d5:0:b0:41d:836d:858 with SMTP id
 k21-20020aa7d8d5000000b0041d836d0858mr3021883eds.214.1649942995112;
        Thu, 14 Apr 2022 06:29:55 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-5.retail.telecomitalia.it. [87.5.19.5])
        by smtp.gmail.com with ESMTPSA id
 qb21-20020a1709077e9500b006e892b4062dsm612963ejc.215.2022.04.14.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 06:29:54 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [PATCH] create-spdx: fix error when symlink cannot be created
Date: Thu, 14 Apr 2022 15:27:47 +0200
Message-Id: <20220414132746.478098-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164408

If IMAGE_NAME and IMAGE_LINK_NAME are the same an
exception is raised in image_combine_spdx because
it cannot create a symlink with the same exact
path of the original file. In that case there is
no point in creating a link in the first place.

Refactor image_combine_spdx to avoid code duplication

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/classes/create-spdx.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 137db81a5b..47a8764bf0 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -835,16 +835,14 @@ python image_combine_spdx() {
 
     combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages)
 
-    if image_link_name:
-        image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
-        image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
-        image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
-
     def make_image_link(target_path, suffix):
         if image_link_name:
             link = imgdeploydir / (image_link_name + suffix)
-            link.symlink_to(os.path.relpath(target_path, link.parent))
+            if link != target_path:
+                link.symlink_to(os.path.relpath(target_path, link.parent))
 
+    image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
+    make_image_link(image_spdx_path, ".spdx.json")
     spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
     make_image_link(spdx_tar_path, ".spdx.tar.zst")
     spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
-- 
2.32.0


