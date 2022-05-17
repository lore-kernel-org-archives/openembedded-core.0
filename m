Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4DCC4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:37 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.1156.1652811936957854692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hg78Zjw0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 31so17651954pgp.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OIZUrtu4MF3TVW2iF888p5iMKMNuyLXs8r/k+kw6bHg=;
        b=hg78Zjw0cQ084+51150ibhsXzYy8QtA8uLZAwuV7hwxG2xQt1Er2uBLafojfpJtAM5
         nv8LjbNK0OO1kLOL3ydjGGjNwVpLz/driPjW2xKakIpkCPZbHfay9f5e8RZx97yb5WWt
         NNZbFzhNCVNFPFa9kWrnGzCyjiDYbkclqWWDagp7angeDwp9p246S5pb7npSMKO+Ewwp
         viijY9sMMoj4BFTlRYjsYKUSeSy5wytqvPqQ+pjFvY98atprzLHlOCGLiuR4Qi4Iv188
         XKSxmOvp5xU/zlzSc8j8qqeCsMyfVfKVSNi7XFGJ3Z21K9LlYu7QrLYTfM1Tbe+hXTl1
         aOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIZUrtu4MF3TVW2iF888p5iMKMNuyLXs8r/k+kw6bHg=;
        b=JmQYH5bffStH/yEyotutwTwQZlyvF1IwJVmc11fKy5NIUMVxPjoFkpWjnAE6UXBHG/
         DW8QDWGdpxxP3lzJ7g0OLJXa4Slif7s5q8yWMXlP9q1zH2voVmtTpHEp18Ni+wV6CQF1
         3LbTUkktdAu/IdlS0gw78T96QpJ7E2iN04kJkrQZBvLl5AylRnJqe7S0EkFomZhoyAmk
         i6ERTa5VZze3pCjmp6P97mmVLzSTW97iZlCIZCqfyj6iBDgd6q251JqOB+EVcHdxL+XO
         Dhx7QOdvsAfOgwTXdj+LiS/lYVoo18soZXogPVqpYq7hs/m+Rz/VBy7cP2AjPl9UV/xM
         L5xA==
X-Gm-Message-State: AOAM532To/iyCFrVMpQQd2jS7BCtU4jtZ0EC46kkewa7TyXr5Wr6hvKy
	ERG8pWtb68NVAY35XGbz72/4DE2LtO9LuK7P
X-Google-Smtp-Source: 
 ABdhPJy3ASyrXnI7xKy0awzjyOs/d9xhYwdYt8vhdxENx1XILYatNTZmzt1b8Zu20m3RYElWOqz33A==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr19692389pgw.223.1652811935705;
        Tue, 17 May 2022 11:25:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/31] wic/plugins/rootfs: Fix permissions when
 splitting rootfs folders across partitions
Date: Tue, 17 May 2022 08:24:10 -1000
Message-Id: 
 <a5406116ef647ff0cabc6b9466aa0e34e6a20750.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165769

From: Felix Moessbauer <felix.moessbauer@siemens.com>

This patches makes locating the file database containing the file and
folder usernames and permissions more reliable.
In addition to locating it relative to the partition directory, we also
try to locate it relative to the IMAGE_ROOTFS.

Prior to this patch, the database was not found when using
--rootfs-dir=${IMAGE_ROOTFS}/<x> in the WIC script, leading to erronous file
permissions and ownership.

Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09e18ee246da8b56f446c4db548fb9c7e895142b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 2e34e715ca..25bb41dd70 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -50,7 +50,7 @@ class RootfsPlugin(SourcePlugin):
 
     @staticmethod
     def __get_rootfs_dir(rootfs_dir):
-        if os.path.isdir(rootfs_dir):
+        if rootfs_dir and os.path.isdir(rootfs_dir):
             return os.path.realpath(rootfs_dir)
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
@@ -96,6 +96,9 @@ class RootfsPlugin(SourcePlugin):
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
         part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
         pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
+        if not os.path.lexists(pseudo_dir):
+            pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
+
         if not os.path.lexists(pseudo_dir):
             logger.warn("%s folder does not exist. "
                         "Usernames and permissions will be invalid " % pseudo_dir)
-- 
2.25.1


