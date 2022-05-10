Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BCAC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.10783.1652193601627968110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7/9sf+SW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id x18so16927109plg.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fS++2PDLDTQZ+8k3Jfzhi1uHiSRC/b+KnbCF7iB+e/8=;
        b=7/9sf+SWFLH9f1K/XdiygGpXgZa8zUUDJlgZCIaKmYCuqvS20oCpZHFS9Imkpd9QKU
         vn/hq+Fn0bqMf9rCPrqIlh8Mg+7voGUNswYV4fsA6IX4O4D1zeqbNS61dScGMAMaRGNw
         MVpuZMKIBlu9oPB2kU5COlUBk/3t9NXFTEc+rmjgbkhyP3G/26eqeiBZqeEvWFdwM7nx
         nwHaFvCy1/eCLqpSE5af/qfPW+wik/PrTNyugipujuqIyRZ/VFTjDfkY/LjT56Gc/uQL
         q5Pi1MstLn+vyA+TPTWtsfTRPi/PUutWklGdJw6QG7aDYRQhpkv8o99Z0ZIMm2oMyl8l
         J5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fS++2PDLDTQZ+8k3Jfzhi1uHiSRC/b+KnbCF7iB+e/8=;
        b=hKuPv9pDOtQzIY7yJDu0XSJCh9/B1kTS1HtY/SOfXLY+InaFFdEdDskz+1c+SUxx/o
         1pLLd5h9H/2LUMbkUYbpFlfor374C1qF4ONKC1klUAPViNY+k6wcrwVR3zvaxtUM6RwL
         5Fl+csrQjrH1S4xz6retPyJyO5uYxG8Qn5Ia47ztHSgQuNMGgg+uKCMImR3y5ffGMdwC
         pOTDuvt41c2E+Q/P9cEFWfjLAyj3p6TA6F/koTwCJi9AbKzMD2vhDjvtSWRBqshp7fgu
         Nn6lI3YhNql77XE2RZz68PDNBSou3EcvVS1uw6s0DDqk7PjHhRA7gsZmsY4nMPP+dmpz
         7yvw==
X-Gm-Message-State: AOAM531zc8NMML2hAc6Xx7dQyh9fj6OjcNUx/KynVTMcjMEw6BshdAB3
	zMnBpN/3GQ6TGcTIVSZHMNq1WYYBP7im7raV
X-Google-Smtp-Source: 
 ABdhPJyA26YBQ6utyXBQ+WjpFJZ2hEnelp3AP5WQ3JUJnK7LVrE687LdlQPH1D3Cws0zjoi6VA/v1Q==
X-Received: by 2002:a17:902:8644:b0:15a:3b4a:538a with SMTP id
 y4-20020a170902864400b0015a3b4a538amr21017029plt.146.1652193600129;
        Tue, 10 May 2022 07:40:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/40] rootfs-postcommands: fix symlinks where
 link and output path are equal
Date: Tue, 10 May 2022 04:37:12 -1000
Message-Id: 
 <e69a1533dfb8ceb5b91610f2ab8b3da575fcc36e.1652192957.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165450

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
index 7b92df69c5..63e716c955 100644
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


