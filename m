Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B9EC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:57:46 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.537.1706900260814956124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUfzlOX5;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55cca88b6a5so3098558a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 10:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706900259; x=1707505059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WoYbKamqxm9W97Ru1VaK0KnhKVlI/UKaY6BuKHkJ9Hk=;
        b=KUfzlOX5DlywihkSCQv00aXxOy5MEN5YDMETn5iEEiFegAqL8kxOwC9xJQ0yJ6sooc
         sRztVlU1i1rmTPCr1fBql03T5TGmU0NoYI0ed5WuVI74VkAqEfM3loBQWxmxPDza5U27
         h1OM0tiIJWgacslSwElvZMA4K/ef8C6DTVoUThV5leCtRY5iO/HimibbWGFHCInUkEKV
         V0YOCRQiH+1zinWvCDil9sAkFjWBzNDlKEbYEoDypRx33ehwQ4sswFN2v9ktIXwUYgTx
         bjPe9259+b456+6DsSWW0zofVvaZmAJsPZn8NDquq9N/t6L0XoBdCihD3NPmRTH/v6Bs
         vVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706900259; x=1707505059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoYbKamqxm9W97Ru1VaK0KnhKVlI/UKaY6BuKHkJ9Hk=;
        b=WVnhb7vE0BR5AfuZ2BRBqpUQvfgcmkjl6OFWwp3Dg0HNniJrromREmrVNHKm9AzgDs
         HBJY0Oq3fkDc1vQ5K86skLkIyeD+PxIxMV2e8hZF3r7ahVYYacRAhVUMmxMZbIp/uRub
         09QTZ1vQv+p4oIZ48Ig6U9OxAabkxQWUC7yr3ZyLTP3e92Mi6gBoIj3+teqDelIUWtU1
         hGAIlp/ZL/WyE6h4ifMU1CkceGZ0XPlMfRVMyzgMJDqRxc7P+JpJWJvx2b3dIqSMi2HY
         jzSLEs3xtU5kmWUOdN8JW5XmFrz4taN2XHZa9gPW56251Hq53YWlrfftAGBizU952WzG
         TX7Q==
X-Gm-Message-State: AOJu0YwmYkIP+7WWr94DOUw4nxLWWjZwdmuT0WVvCTi/E+GA47bDLrJE
	qlresHOfC3Z8dvgAd8U6QQIBLndXsDzASxzDqyub5liBDuVH/pKCKKD8nZ7k
X-Google-Smtp-Source: AGHT+IG+1MRBDa4yHyUhfn8qm6xV9psOdlSyJcPH6HKaybaH7Yuu5+nx962mZSzSyqQsiG3xehRrww==
X-Received: by 2002:a17:906:32cf:b0:a36:fad2:6093 with SMTP id k15-20020a17090632cf00b00a36fad26093mr1787121ejk.0.1706900258809;
        Fri, 02 Feb 2024 10:57:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a317f2388cfsm1150432ejc.195.2024.02.02.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:57:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 1/2] package_manager: ipk: add OPKG_MAKE_INDEX_EXTRA_PARAMS variable
Date: Fri,  2 Feb 2024 19:57:33 +0100
Message-ID: <20240202185734.3209021-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 18:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194813

* can be used to pass e.g. -f param to preserve user-defined fields
  in the index as added in:
  https://git.yoctoproject.org/opkg-utils/commit/opkg-make-index?id=13f6281d24e17199e0fef6c2984419372ea0f86f

* otherwise it will show a lot of messages like:
  "Lost field Author <value>"
  for every package in the feed

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: fix build when OPKG_MAKE_INDEX_EXTRA_PARAMS isn't set

 meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 8fcbad56aa..8cc9953a02 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -16,6 +16,7 @@ class OpkgIndexer(Indexer):
                      ]
 
         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+        opkg_index_cmd_extra_params = self.d.getVar('OPKG_MAKE_INDEX_EXTRA_PARAMS') or ""
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
@@ -41,8 +42,8 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
 
                 index_sign_files.add(pkgs_file)
 
-- 
2.43.0


