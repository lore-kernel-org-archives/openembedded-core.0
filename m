Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C503DCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 13:20:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.58035.1755454642840308703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 11:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/6tDu0E;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: mroj4n@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b690517so5011128a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755454641; x=1756059441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HadvtnxowLUPxUG9Up7yqvIv62yvotgw0+6EG5iP6RI=;
        b=j/6tDu0E4GB12XqNczdIRhxjCLwJuNGgYHngIurNdTowZ17yr7na6+OoUT8WEZ5dA2
         A46kH+LrA9I8tbnbsLdZp5ul2XG+XMdihtG7UVDy/o+PPefUVL/btXlbW3ZoSfsHDfLr
         yj7d3/ZzhvNL1obeEW5YXZLQQUiK0/FH0k4OBUqjqIajozuU8m3evC+XN9Hjx85+RLug
         +FAVoWSV0Onuu7FviPIyH/YIo+Bk7+xd/h50XRT9OfqnxBgEZ8TMFOFjw2rVFEGo6UpQ
         qNvTqIaE6FHwY6tDwEWJoXZjGnimhHbQhLxEToUYc2U2Y4Dt035X5EcnykHxrlRLE1fj
         jKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755454641; x=1756059441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HadvtnxowLUPxUG9Up7yqvIv62yvotgw0+6EG5iP6RI=;
        b=Bx+kzdeaQZP0wYhJ1++Pq6LMjKOBDx/arvtJxkOEwLJpUi4LQGah51Z6aXP23x0bl9
         j+oetGmsNKnlGLrXPEgSHCKt3MJUK3qWuBGkbsP80mpKcN4kXHUag1g7j5QIdf2lUw99
         7eM5KYob1Bf0fPFnXmPGrQ4puQgc96HM+YI7Jq+KPhPdtotV9s6QQE8FUn8zkOaXDRCX
         BnmMZhPhsPIw4gaXrA6pxcI3pGSsLkirvbm16qAE/EtuTaRFvbCGS8Ra3YCsUQrt9gmv
         ETXGvpSU06n7xbDetvMZN34doOETHcvMOt0IwgoKyQXDLa2eIaI39Vn3WGsKZi3NImQq
         /l+g==
X-Gm-Message-State: AOJu0Yxt1xDxD19fSVI2BAUL0vKFn4XwIwTOM0Rp9ws2PChLkibQccex
	SN1srwaBAVAq3dizWkKqRB/ye9MkwJWOGrQKeFPYvMhupoSHszrHikIR40HLGTQc
X-Gm-Gg: ASbGncvXEV5lFJHsr9+u1rt5YzxaQSH67vycxuh5A87xG55eIbILLgKqLXOQ5cCCXPl
	3K/KYWx4CCouDymcGGhdqZSbP7Ne/RzWOMdOwA+rJbySiT2Y1Q6OOzTjpA/8MnNC/hMjv8IPR6W
	6pavhgFstBm7CW9GqJDma58VcsQsQvnAmge+p2iB00csMbGqvN2peSDtHy/qUvhewrZ2Krrx8O/
	g3+3EsrwUH0xzAFuCxtbeRAN4LMY5kwqrqFWFpFv8bbaIstW2ZvsVkMkAJGw5wqCaxwgkcdyzsX
	lPAJFVP6Y9HjYUBvhufKFRKoCOayWIjdamiwdP8kPRmusrAGxsmLgtZ6n2fi+Pl3FjGjXxsuzwc
	VpgK2OM0DU9KtHKHctYtKH3gY29zVrY4M/YkCtV3KJ3By30r8OgOImg==
X-Google-Smtp-Source: AGHT+IHpfVDbRc/Vn9ZkLFnmpQnPOHo535osZ8E5FYOkawX3zFXpRYbqrMDG0SkGHVKOZvcO+Rp2sA==
X-Received: by 2002:a05:6402:1e8a:b0:618:7585:be40 with SMTP id 4fb4d7f45d1cf-618b054b91fmr7526537a12.17.1755454640805;
        Sun, 17 Aug 2025 11:17:20 -0700 (PDT)
Received: from MROJ4N.localdomain (89-64-15-146.dynamic.play.pl. [89.64.15.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618b01b5fa1sm5397800a12.46.2025.08.17.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 11:17:19 -0700 (PDT)
From: Mohammed <mroj4n@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mohammed <mroj4n@gmail.com>
Subject: [PATCH] wic: add attribute parameter to parted
Date: Sun, 17 Aug 2025 20:16:30 +0200
Message-ID: <20250817181630.3234-1-mroj4n@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222110

Add argument parameter which will use sgdisk to set argument
Certain bootloaders use attribute to recognize correct boot partitions
and having the option via wic tool would remove the need to do via external scripts

Signed-off-by: Mohammed <mroj4n@gmail.com>
---
 scripts/lib/wic/help.py                  | 3 +++
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 1 +
 scripts/lib/wic/plugins/imager/direct.py | 5 +++++
 4 files changed, 10 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 2e3061f343..fef856dbbb 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1070,6 +1070,9 @@ DESCRIPTION
                 an MBR header. Partitions with this flag will be included in
                 this MBR header.
 
+        --attribute: This option is specific to wic. This option is used to set
+                      the partition attribute.
+
     * bootloader
 
       This command allows the user to specify various bootloader
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..af4fb91d58 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -189,6 +189,7 @@ class KickStart():
         part.add_argument('--fsuuid')
         part.add_argument('--no-fstab-update', action='store_true')
         part.add_argument('--mbr', action='store_true')
+        part.add_argument('--attribute')
 
         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b34691d313..cf5c51f105 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -61,6 +61,7 @@ class Partition():
         self.update_fstab_in_rootfs = False
         self.hidden = args.hidden
         self.mbr = args.mbr
+        self.attribute = args.attribute
 
         self.lineno = lineno
         self.source_file = ""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 6e1f1c8cba..877a5d2a97 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -664,6 +664,11 @@ class PartitionedImage():
                 exec_native_cmd("sfdisk --sector-size %s --part-attrs %s %s RequiredPartition" % \
                                 (self.sector_size, self.path, part.num),
                                 self.native_sysroot)
+            
+            if part.attribute:
+                logger.debug("Set attribute:'%s' for partition '%s' on disk '%s'", part.attribute ,part.num, self.path)
+                exec_native_cmd("sgdisk -A %s:=:%s %s" % (part.num, part.attribute, self.path), \
+                self.native_sysroot)
 
         if self.ptable_format == "gpt-hybrid":
             # Write a protective GPT partition

