Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2220CCA480
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:37 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.22261.1655667333268457854
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XbHWjsh/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id t21so2207183pfq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rxK3BF3I7eSqbDArfJs2RlG+zGct4LxIlVF+87wBu0c=;
        b=XbHWjsh/krQXqXQI2wblC3smjwve5rT2yrVjHOOaPlwv+4pD/wJ1I0LXu0apYIYi4B
         9JqMx+Wdx09Rhsyz8K8Mfi7bmpwcP/dQYU+nVZksB0p/nM0JDIbvmjJIfgApUM8LPMTw
         aldC199QHEPZztA0D0B8zJ8QpiAMFdgN5dHyWKjwXyUSls+oMd4e/H9tIUHZ1kIoVXNZ
         fqU3ptDUthyVOYAx7D2Taw+QfFiiyQ9og3ll9XLeA/lXBqkYYNSCKkBipF9pDcOu9qWt
         +kyulKCcleIfrSYq6NITW1Rk67yRK1Lt2gjX/zKjZgsyr/zVe7vhDICt9ktx2cZfOcBL
         KvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxK3BF3I7eSqbDArfJs2RlG+zGct4LxIlVF+87wBu0c=;
        b=jzhn18pXP4lvROss2pgjVXNXKd58hgd8tn3VfGEKmUcITpUZcCbzvt1gqRhqeEJ0vt
         +xY0MFW5yUM8XyiG5b08v2x8Dhfg41GTxc+kXlViI6A8O7Bf/28SaDCo+FOHn78SHKv9
         p6i62VW//OrKwxhgae4ZyFLHgAA0xtXVBydBRyK+rW6BNkxs16bJKC9/S3uOHqGm3cQp
         6Nnb+mwsPc5QI3iD4i+lXmxxkVF5cWmh3jKMLx0kBqCjNBiHvNAoU3qrs1yPlfG8cDKY
         Mez/c5cdfl55x/7yvKSWmXQwZ4uKvTz9rtJKLkhc6JyFE4ahvxbQv1yxGSJMPJmlkLkF
         VgJA==
X-Gm-Message-State: AJIora9oNwemaPxiR/rvd4Z+q+KwQZF5idnaXq2y7LBKn/KYaNq47hLJ
	WT367puKwiM2BmRRBSb9ZNMqajxfZbhucx1U
X-Google-Smtp-Source: 
 AGRyM1ts7WBU9JScpDaoQbGfBOx3GopKXW3hV8J0hqR7qmAyreFRYVErvq6lLJ4fE+8CKXrdd5OOfQ==
X-Received: by 2002:a63:6e44:0:b0:40c:73a7:b6c9 with SMTP id
 j65-20020a636e44000000b0040c73a7b6c9mr8475003pgc.285.1655667332295;
        Sun, 19 Jun 2022 12:35:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] rootfs.py: close kernel_abi_ver_file
Date: Sun, 19 Jun 2022 09:35:01 -1000
Message-Id: 
 <b761150790231792b42a8eb534013f1e17b4efb3.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167069

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  oe-core/meta/lib/oe/rootfs.py:331: ResourceWarning: unclosed file <_io.TextIOWrapper name='pkgdata/mach/kernel-depmod/kernel-abiversion' mode='r' encoding='UTF-8'>
  kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9dd8ee063c1132265248457fcd628e1e93727be)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9e9f7f1f08..5391c25af9 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -321,7 +321,9 @@ class Rootfs(object, metaclass=ABCMeta):
         if not os.path.exists(kernel_abi_ver_file):
             bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
 
-        kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')
+        with open(kernel_abi_ver_file) as f:
+            kernel_ver = f.read().strip(' \n')
+
         versioned_modules_dir = os.path.join(self.image_rootfs, modules_dir, kernel_ver)
 
         bb.utils.mkdirhier(versioned_modules_dir)
-- 
2.25.1


