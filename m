Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6080DC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:05 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.10817.1652193598850686493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2pyZlOBm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id c11so16907384plg.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gLN/bLW3ZrBEAeZqvGuQzkcTsaoA8fI0eK1Gft+yCp8=;
        b=2pyZlOBmBT+dY3okMDr9DJAvybupycBbMfpxIH17PUpS+BkvaQjk9pe9c4kigPxpj8
         aa6nMax0JeO35+nsTmede8B7N1cXtTQE3evWkuG9Xo5vlewiE3thGD8veVMfuBp8Z4xi
         Rvh9drqnWJzuVQsj9Z3j9tTW/J3T9I3WsWGXKjcp2dmQMwHY8qivr2mdANQQ6ZIUkwBz
         IE5AdxJJK/6LGV9klNjCQoREvU7pAo2ZKZmuk9LdrLbtfOiTrXVjRkoS3/qD8CIPQ6lE
         j/NIeKK1zOtkuXDU/N7riwl0O6ebPoq0FJgvGa3gjVKHCSSR077VpKnoF2Fcjcl7wnME
         L9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gLN/bLW3ZrBEAeZqvGuQzkcTsaoA8fI0eK1Gft+yCp8=;
        b=KOBZoHNEW399DryrdsmT5WB/NmEX71v1KVFoKDJ1QkblrAKUoQ0EzjAEx+pVqOVXMA
         +XMUU+rlJX3il9MtcrgVZ2PKEM5kHgMC4xWPBcxMCQ9rlX+Ee3A67eL+oM0q+tGXNS4l
         37pMl6DGhMstOlSg0cfg11F3Q2G4bvkBgxG1+zd1BCvoChoWhzzSSCNmV6ZS63lb8miE
         j8Jw+APPKGzxsVhX4UOY2LMVuZ9p38ECKSyG7c34GVMUZ/FKCu7x3ymPkJvFeE9jqSUW
         Db+y42H/ns78Z2zsYQwRqIdEmxo8POLi2AzwSd/4dbEUaButZZD5OAUiKctVbEoyw4gT
         gp+w==
X-Gm-Message-State: AOAM530OIliv/GXCUD4O0sTTA77NIIG8vECLMXlG4VcZKWZ4FMylj1Em
	ZwYqrnjdOkTRKgQMliW7c9df7IrUUmaeSUQH
X-Google-Smtp-Source: 
 ABdhPJxxmzbpRU3dFQVLKAC5hkj/HzqUbcGSiVz4HUgBoxjqgelTfeH0A77Fsr2mt6+1WsX3Xan+Gg==
X-Received: by 2002:a17:902:f60c:b0:156:82c9:e44b with SMTP id
 n12-20020a170902f60c00b0015682c9e44bmr21111299plg.106.1652193597638;
        Tue, 10 May 2022 07:39:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/40] cve-check: fix symlinks where link and
 output path are equal
Date: Tue, 10 May 2022 04:37:11 -1000
Message-Id: 
 <2fd7f3b7dc964b59b268dd4a34761f9f71f61c25.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165449

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
index c74c717235..24ddb865ea 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -121,10 +121,11 @@ python cve_save_summary_handler () {
 
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
@@ -198,10 +199,12 @@ python cve_check_write_rootfs_manifest () {
 
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


