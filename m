Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A95C63682
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.8223.1650463755412893270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sRCaldGv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id bg9so1710724pgb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SsX4v0aYyOhJ3TrPP5/tUWFpDmwkq7CfsHJ8kH///B8=;
        b=sRCaldGvYlfbiusgL/0WmNl+uHaA+OQbcZ3CurqhRGhsVBSyUJRsDiZIBXt1P2RFEf
         oR8oIipo7yVINYvQI2wu97YbfpWs2zFc7LXwo5LZ/FpSg/1KUxsTg7i4wRSjGZPiv/Ki
         XrftpbiMcri7ghZfx67sTq93DBEnqmyLNmS77UQkAoaUJjdtFps8grEbcrlEe8zZHaDo
         8352mhJJlO28YnZkhewfPc120ppwI+emw4QakgDcW4msE/9L5QSNpDSeEF8b5+jDSedY
         cIel0TO8qr5pSR8n9CcZJIbPDQ16WE/v0MLfw7hgHdxZQDieYZc2N5eLzNy1lK8ElpaQ
         pRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SsX4v0aYyOhJ3TrPP5/tUWFpDmwkq7CfsHJ8kH///B8=;
        b=cwxMV6vU57csviFLBNK7WNk6oLwudYqfZoh2VBKkuxH+9v6V5p6MHKxwBQbcGvo4zD
         724JLmZ9hHHwPMLPUWA11MAovnCxBov/tgJeK1g5fri8TxH8CjopHJFYYlOZ3IzEvsfs
         PzAA6z7NaOeulYX3/YmH5GQLpNUQvETrpjlGlhntjZJVQ4w/QS0bKB/DTiIonXR+Bs5r
         UnZxZdE1LvqysWaaVlV/udrfmp8hS0wFBgn+CtJ8zNPaNs23zudMTqsRGEuv4btCNe6U
         NgCk9XFSUQZffyF0qPDxJtH8ExnPN2nKRU9bZXVHPjhP46eelbc4vxkhw9IP/sI25xsb
         2uyg==
X-Gm-Message-State: AOAM532FeYto+3FQ+7W9RIX5EXNRwDpTb4UPK80WS/JpqXR+kp4eJ0Sl
	m8B5gQNxXVEXFGklv5z/JSLi8KDBc+kXbWYzuyE=
X-Google-Smtp-Source: 
 ABdhPJwZgOdecW4rXq1HEyNpClm8SxTLZb066XBuNeuWnmMZECEkKr++eMV58LZaYwHep9hBDst/yw==
X-Received: by 2002:a65:4c4e:0:b0:39d:21c4:2381 with SMTP id
 l14-20020a654c4e000000b0039d21c42381mr19585641pgr.566.1650463754270;
        Wed, 20 Apr 2022 07:09:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/27] create-spdx: fix error when symlink cannot
 be created
Date: Wed, 20 Apr 2022 04:08:03 -1000
Message-Id: 
 <c924065ecaff718ebf0f6e6ac182488b2798b02f.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164683

From: Davide Gardenal <davidegarde2000@gmail.com>

If IMAGE_NAME and IMAGE_LINK_NAME are the same an
exception is raised in image_combine_spdx because
it cannot create a symlink with the same exact
path of the original file. In that case there is
no point in creating a link in the first place.

Refactor image_combine_spdx to avoid code duplication

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 88f76bba705007a7fcda506c79f743060d8f2e52)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


