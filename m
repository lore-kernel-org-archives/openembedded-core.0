Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5356EC25B47
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 22:07:43 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.160579.1698185259354334270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 15:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3/6S9iy;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b26a3163acso3981316b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698185258; x=1698790058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+YRC2NaPKNfh/hB0hK3WL9IY3d1iETgFGSeJvhaDBA=;
        b=R3/6S9iyAt52WGdGJeE/exX6G0JFSJCqJcOf/3MjLPDhUZY01wW8+WDA9RDXBUT137
         yg5h6XBd3zGs1ZXkVrBaH4ya8mLA8EcKgcCIBfhrKD87fowBvz9DFZ/GiBIutPmR87N0
         AN65meQuGL5yllrDHXShCvQw4EP/mS8zO8TZZwnL98FDwzbeWvbOnWyoeXKqJezxx4ej
         8leG4T+dcxGXYkuHUvY5cnDoDKgCHLwMWMRnN38wDe8MKg5poI79GF7u6OM+g7fF9Nzm
         oU3tZ9CciGeYnWUXGV50KXuYwVF0N9Nc9M7lNN2ULVPmTM8pQmHRkhWq6o3DKB+BTnJh
         UcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698185258; x=1698790058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+YRC2NaPKNfh/hB0hK3WL9IY3d1iETgFGSeJvhaDBA=;
        b=wNGC2Aeq5YQaHPOYMTnePr3jSk8wBUsZ8KTUCmExvIqzcaYgngY5qx6SbXoZBU4Jzv
         3BV5+CtncWAutxfNMjqxL5d1uXk8bekjl5ypfgOQOeKuKnSQ+BoCx3rZvWC62kBYHQGy
         PgkqCAZp76ItS/OaumqXB+bRCLbzvBtLdKbrImwiEB2R2Y0Xgd+wDzQhDSIflM6eWEFf
         0ByEFgwJXEAnPpn/sGvkDq/2UIJG7bWcc+kjq3Danbjo6u5JHZ/ltLYVRCKFnByOBDD4
         fnGB8JxlN+WfIxJnKgFqWA0CdZt+xQXWcw7C3XPX/iqAvmL6pUHvlr4WPj0rpTgy1PKA
         89NA==
X-Gm-Message-State: AOJu0Yw8YR+3Al1a8ms0yuBZysT+OaDC8OZ2rVVFfYzk9kN+5cdX0V7e
	wAKWrrWe0CvS3f19dYGKXDaE1QVP4/k=
X-Google-Smtp-Source: AGHT+IG8KBQY/btPtPfUMxqfmlQu0/q0lGYQRuK4vjqy9Xi6LF0rvLllwWOZ7imgKmxt3P2laZ0vLA==
X-Received: by 2002:a05:6a00:2d01:b0:6be:731:20d7 with SMTP id fa1-20020a056a002d0100b006be073120d7mr11591359pfb.11.1698185258522;
        Tue, 24 Oct 2023 15:07:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id gx25-20020a056a001e1900b006bc189378a7sm8131004pfb.196.2023.10.24.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 15:07:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel.bbclass: Use strip utility used for kernel build in do_package
Date: Tue, 24 Oct 2023 15:07:35 -0700
Message-ID: <20231024220735.3011192-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 22:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189658

os.environ does not pass this down to runstrip() function and in
strip_execs() its using STRIP bitbake variable to find the strip utility
to use. Since there might be a trailing whitespace in KERNEL_STRIP
remove that otherwise python is not able to launch it.
e.g.

FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-linux-strip '

This is more evident when STRIP and KERNEL_STRIP are different utilities
e.g. when using clang as default toolchain but using gcc+binutils only for
kernel build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2ec9ea2091e..16b85dbca48 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
 do_transform_bundled_initramfs[dirs] = "${B}"
 
 python do_package:prepend () {
-    os.environ['STRIP'] = d.getVar('KERNEL_STRIP')
+    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
 }
 
 python do_devshell:prepend () {
-- 
2.42.0


