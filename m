Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B3AC433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:22 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.426.1652293216736051389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QLRZ7uxe;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id l11so2469493pgt.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rMucJn9CzeEvjvAov73DePIsAR17A64WAdQ2vKL5wSo=;
        b=QLRZ7uxejYt7Aubme9mLQ0bp6nxDvXsr4IapI4JGAxdZQFQTqOPFfjKhobx/EtxJIa
         8NGqhyyVPIwh8x1KM7MwLP4gApt/ZzFm0StPTqAckSfMhLAM7+ZFClPMrn6RVdmSKqYX
         j0wzfYvQEiKZWlfefWFrKerfMwUgsC4jeBerRAcfrdBFV9fOw5eVf6NDRS5noxL+hU3I
         xKGxFcpYVQRBxOKfkP3V5TSFk6hLZ/fOwYSuzTka/5hT2RwUIj6z5JY9E3hZKKqkzU4r
         r9LuGYR5n1XxLdqn1TGkDF2qOOu3s8IgJColfPunAE4vn/HQXbUW1fu3XhM8C8ywYyXk
         RVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMucJn9CzeEvjvAov73DePIsAR17A64WAdQ2vKL5wSo=;
        b=aDPzpi1cP0PRJSoQ5nzEvTtouH1MAiQ9ZfKTvW6t/uFWQV0f1MsY89kU9v8DgxCDXC
         vdwPnnLk2QSsSJhRkcGy9WkFiS12XTSGuzeFTNwMYAfRjZLY1liCoJAbX8WmzsaF5Cmy
         XY1Ntn0Yg1oCv6jM8ayogb4EkQNnN7kJGUIzqNCqsGqZh3pxceoOW5zxNdCOErPgPKrz
         5zYiFSo/Q93nlVOoZXZgjsRQG5rgMum8fj6u/U88pq43D8eG2JgCNf+7in0VGBzMi7cB
         N+HlfxL57+MYs4C0ZAwJc/EsE2SgdT8y/qqA9fds1rhBT3e76EyhiJ9MxXHtG9suv/5R
         /Mqg==
X-Gm-Message-State: AOAM530mAcspC8mBnRp0+PQvhEgMSMkxmX129dM9m+c21NvsqyQA0Evu
	3pMHXGyIb1Qwn9DTVuqAmfePpnJvojJVOWsK
X-Google-Smtp-Source: 
 ABdhPJzq9RHjj0Pn36P7yj+wZJXDEpkDS1gswvlHC6/JaDUJCTribY8GFhTIq/D0Jm/N4GHt0YnWYA==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id
 j16-20020aa783d0000000b0050ceb2b8e8amr26382279pfn.31.1652293215582;
        Wed, 11 May 2022 11:20:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] cve-check: fix symlinks where link and
 output path are equal
Date: Wed, 11 May 2022 08:19:28 -1000
Message-Id: 
 <62965ca8ca7077c12d75dac37efe204d7159cddd.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165515

From: Davide Gardenal <davidegarde2000@gmail.com>

An if statement now checks if the link and output path are
the same, if they are then the link is not created,
otherwise it is.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 2f024c0236c4806f0e59e4ce51a42f6b80fdf1b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 350ed8ec39..ac9f0fb22c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -117,10 +117,11 @@ python cve_save_summary_handler () {
 
         if cve_summary_file and os.path.exists(cve_summary_file):
             cvefile_link = os.path.join(cvelogpath, cve_summary_name)
-
-            if os.path.exists(os.path.realpath(cvefile_link)):
-                os.remove(cvefile_link)
-            os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+            # if the paths are the same don't create the link
+            if cvefile_link != cve_summary_file:
+                if os.path.exists(os.path.realpath(cvefile_link)):
+                    os.remove(cvefile_link)
+                os.symlink(os.path.basename(cve_summary_file), cvefile_link)
 
         json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
         json_summary_name = os.path.join(cvelogpath, "%s-%s.json" % (cve_summary_name, timestamp))
@@ -193,10 +194,12 @@ python cve_check_write_rootfs_manifest () {
 
         if manifest_name and os.path.exists(manifest_name):
             manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
-            # If we already have another manifest, update symlinks
-            if os.path.exists(os.path.realpath(manifest_link)):
-                os.remove(manifest_link)
-            os.symlink(os.path.basename(manifest_name), manifest_link)
+            # if they are the same don't create the link
+            if manifest_link != manifest_name:
+                # If we already have another manifest, update symlinks
+                if os.path.exists(os.path.realpath(manifest_link)):
+                    os.remove(manifest_link)
+                os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
 
         link_path = os.path.join(deploy_dir, "%s.json" % link_name)
-- 
2.25.1


