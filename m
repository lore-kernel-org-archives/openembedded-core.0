Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D582C4332F
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.418.1652293221582786093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QWiEZDWV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id n10so2967837pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ddf5Ryz0TUkQCgmCoWpn01Akyx0R9Y4zg+yhvtJM1qA=;
        b=QWiEZDWVsFL7ZFkFwRMxX1TZTGLN1vbUba0K28TPKkquVHvdA5sE2IOhpTDjk6lNKQ
         sQ9GkvNhKZyedooJLWZNFCX+8h2Q86toUYKiOLHeOlhq+4ocEUaOxFgOYk3FcPJ9Uf5T
         2IT4qIMRg7XG8BNZdY1k2sMSlK9sQ17YIM6bIQM8krX7AvjLRrLoxapo0uyNvgOeyFtM
         2TtOQIkRUOj2x0W20X9tPHjjHu/O2MnIJM0uQldKiadC8L0LSc48UfBL/AiL10abBH7f
         4MgnzqoZpPZiW3CXQpzi61GAlGv/pmsNflWBDaXQXKdsCZs7s6wCZWiqpSZvgY0dn0QP
         RtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ddf5Ryz0TUkQCgmCoWpn01Akyx0R9Y4zg+yhvtJM1qA=;
        b=UWb59GXwoKMkinTMqi8l4lh3SJrEU84KMUYnozwYKIgSRu292IGQbgN00WVlreDC+y
         ZgNfv6c/Dtz9XMaKsqWv3gzJposajh1zG66pZEHRbdz8uctWY6NM+k7FgDy0UKAxzG+V
         47kcwC62oHQmiCiv2BwaAshViHwUnRT5aw6m+ah5ueVGTBvWe8sp3y8va9BcGwN02yn2
         zDroA3BrB0Jpc0zWvSApJz+FdZUGNv7zAMCXZHydvJFG6lPqxUTBV/wgrd4PpvRSZ6NQ
         TpcP0o4DeQAah0ayZg/otYJUYSVDLVHU3SCfloWuyw8pWNI1uPEdc5ZbCEd+l/gvstey
         u1og==
X-Gm-Message-State: AOAM53322qjcY7L8EXsPojPxq48tK10VM0kFM79zSrBpD5qTfopbTmJx
	Tuca2W+HQFnnre6xDXndGtW7KkOAhsKKTOay
X-Google-Smtp-Source: 
 ABdhPJwqAdJKuK/Hp3gbPu8znBoEs4Fk6qxKVVc9jtt5OKytUQYoV8udaMkbYQD1hLtUKwSPK8K+Dg==
X-Received: by 2002:a17:90b:4b42:b0:1dc:15f8:821b with SMTP id
 mi2-20020a17090b4b4200b001dc15f8821bmr6721956pjb.131.1652293220416;
        Wed, 11 May 2022 11:20:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] rootfs-postcommands: fix symlinks where link
 and output path are equal
Date: Wed, 11 May 2022 08:19:30 -1000
Message-Id: 
 <e3672b5ccd6e0f130b1657017802db130a859d20.1652292852.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165517

From: Davide Gardenal <davidegarde2000@gmail.com>

When creating the manifest and the testdata.json links, if the link
name is equal to the output name the link is not created, otherwise
it is. This prevents a link-to-self in the first case.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bed63756c56f296ff3d5a7eef66e978bd19f1008)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c43b9a9823..0fef52af40 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -267,9 +267,10 @@ python write_image_manifest () {
 
     if os.path.exists(manifest_name) and link_name:
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.lexists(manifest_link):
-            os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
+        if manifest_link != manifest_name:
+            if os.path.lexists(manifest_link):
+                os.remove(manifest_link)
+            os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
 # Can be used to create /etc/timestamp during image construction to give a reasonably
@@ -339,9 +340,10 @@ python write_image_test_data() {
 
     if os.path.exists(testdata_name) and link_name:
         testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
-        if os.path.lexists(testdata_link):
-            os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata_name), testdata_link)
+        if testdata_link != testdata_name:
+            if os.path.lexists(testdata_link):
+                os.remove(testdata_link)
+            os.symlink(os.path.basename(testdata_name), testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.25.1


