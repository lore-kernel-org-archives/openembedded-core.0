Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B172C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:49 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.4267.1719778123854445280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xUpMwgCp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-700cd43564eso1212737a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778123; x=1720382923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68iYALERIzOz1LwXjcOa9bbEZOOKZChvhU6B7ZQb/IY=;
        b=xUpMwgCp1VNaR0+K7JST9ZwcSsLVfNEAU/taAaIEBYbWnI6zqwLe8LcwUK9ZMT6wDW
         EKO4xuGENsIlD6ioBBz7XLlXJ/ZODzxItz2ubAbsebrPE56yoMAfIqrR3r9qaw1nWV70
         VOvsOz1xf7ok7EWsfmeEfRwgL1aZDxdr/g6WBMg9kVN5GHkHI+Tr57I2kv/ChyblxFXW
         sXe3n2UQMYJb3EL+z+TELCU5yKqykmpWpr+MM4t3jy7MUJJTCDC2sFXPACZzHo6dwHbw
         D8XngLZ8x9ChYqolFeWUoDJ/REXXKLE9exPDpzYvvpq9OqKCIvoiOoWrz+rDxH+FzoqA
         kuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778123; x=1720382923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68iYALERIzOz1LwXjcOa9bbEZOOKZChvhU6B7ZQb/IY=;
        b=BUAYuLNSoUoWSI8dmwQNeSz7apqy6fKaQQccKqFsz/hG7q9MST61FJXzR8WM8fBakA
         gdWeaV+UOtiPebzZ4Unh3aoMEXulI0yGW9Bwc2XImq0i3Ua2nH66Stkn0VcUgsN6P/+a
         86f76ZeFs4o6P4knT6NCDJIizxVllo+lDD8VIhCTHhj+YBYnQpWr1pqRy3TrmugIa4GU
         Imv50btqdQPfSk31mVt3Yt1ojcBupucxiyHUmfkzhvXa5bYPbdxEUmKJMGM8P53HSU0T
         RamFmcYpnGVTZ5KBEWCMtDv/HpeiCDoapPbKowHfoui+8PE2uXQtK8nisGLKW+E8J0Bf
         D/Gg==
X-Gm-Message-State: AOJu0YzwT+e7RvRBaVHPAyUZq0Ne8zcF9UWyfIMdDf6sHfilGIqsi9Ye
	3+zTs7iYN1EzfjVRIaY46V+0SGO7HJGfyKpf8XTmrnd88IpsSFgyC1adY6EwjizH+waf7z//BJs
	gnZs=
X-Google-Smtp-Source: AGHT+IGh5pboao/hNlC/SAYdclNYBIdHHI6EJKqwUGLFUwqOuJdJ31bJkCo6w6R2bpe6DjFBYnK1gg==
X-Received: by 2002:a9d:6f87:0:b0:700:d638:c28f with SMTP id 46e09a7af769-7020765dcb4mr5061690a34.21.1719778123036;
        Sun, 30 Jun 2024 13:08:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/35] linuxloader: add -armhf on arm only for TARGET_FPU 'hard'
Date: Sun, 30 Jun 2024 13:07:39 -0700
Message-Id: <f8d96f091844bf4cc0fa3bd3104573533841259a.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201264

From: Jonas Gorski <jonas.gorski@bisdn.de>

There are two types of soft FPU options for arm, soft and softfp, and if
using the latter the wrong dynamic loader will be used.

E.g. go will link against ld-linux-armhf.so.3, but libc6 will only ship
a ld-linux.so.3, so go programs will fail to start.

Fix this by instead checking for TARGET_FPU being 'hard' and then
applying the suffix.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07b4c7a2bd23f8645810e13439e814caaaf9cd94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/linuxloader.bbclass b/meta/classes-recipe/linuxloader.bbclass
index 2ea1b62254..a2e8f9837b 100644
--- a/meta/classes-recipe/linuxloader.bbclass
+++ b/meta/classes-recipe/linuxloader.bbclass
@@ -57,7 +57,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader = "${base_libdir}/ld-linux.so.2"
     elif targetarch == "arm":
-        dynamic_loader = "${base_libdir}/ld-linux${@['-armhf', ''][d.getVar('TARGET_FPU') == 'soft']}.so.3"
+        dynamic_loader = "${base_libdir}/ld-linux${@['', '-armhf'][d.getVar('TARGET_FPU') == 'hard']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
-- 
2.34.1


