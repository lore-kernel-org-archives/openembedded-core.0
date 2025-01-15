Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843BFC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:55:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.16810.1736931339991176902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 00:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bh+iwWhO;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: simon.eu@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862d161947so3210512f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736931338; x=1737536138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTVaR6UPVi/VJpO2IE4YP5yg/aV2hwfDxaHhA148zFc=;
        b=Bh+iwWhOXeoSvY81gv2fpUKGurc3X+LDkOzVRoUhgwUHB4Gq5yvonK471aoPxcQxss
         aZGED7NVB5A2RDIwikzQ4IE+TeLFSxyobRVtrk85Hf8NwCUuBVpMY8D4DOMQHbcfojT9
         ynxentqZFNk/kFDjlhKGZhnM7W3yfQfN1Tv4TglhkyNGRBCoZvLUH/N25pn/wDloqqEc
         4FReU/esnYUtLY3JhuXbA+tgfUTZunD1SnZdSz93uuZFUY7zGaI5I+EwiXq5aTtnYKJT
         21VhQyzxFvWVI+3REyk5IsMEBjdAkZtGHXhDVlqhBlCk0iFLHKlvqP2CmM5hCefV2SHY
         wcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931338; x=1737536138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTVaR6UPVi/VJpO2IE4YP5yg/aV2hwfDxaHhA148zFc=;
        b=XMVXMKY0xFqPv8lWLZTPvwXVIPe6wNOPF3zmQT2mh9o32MzpPDmTfaJLHe/Y9maacx
         8wjf+93Wlhc0JYFoRTfAW31kwgq7NjrIi6Zl0/vdGEsaDJ0Z0VQjdO34Z3ER6PpdYtKa
         B06OmQb1av3jpifSJoN9cd7ax5GAI7LC8TXaTbkLPHeJXugylAQxI/1bj/LxpR6vee0I
         /wicXJYgfjXspkh9WdItuTe75GNg/PKdALnvIeLnXX6FZNuLweFIZGb+HIDUnf6VsAC8
         mXOZmlALhmfDH2EFG9SrGb8MkPfCXr5yjfNYv3bjSdC4bSjcGdjkc4FA1k/AC7JpqaNv
         7nDg==
X-Gm-Message-State: AOJu0YysB4xOzUoTtD36vc7RNg/QpbFFseTTqDz5DtHTDDFEALQNVV+S
	kebUbY4+gKNSglPHX8Aa7IYwIYQrZ94ePykF2aRuFU/aZLb5mnHaQ7GBLA==
X-Gm-Gg: ASbGnctWaZAor01H3OSmHRJ+JtitYSKZSeOllJI1yocOEqGsJle6mTyfQno9TQfZUPx
	SMBIOANDbI0OjtRtQBtq0U59XaF+lf283H8yzDzYfZppRrPxFrjofJ0AJQzg4Vsc+3M004rBKTr
	h7M8JvbAayEU0WadHCutr/vHoztBTJYt2kfq6c58lwizOZHwI2x+DU/Bs+N7wUqHHVmgy1kUTBQ
	XWDzhzI/27BPDQDtt1O2j1lMuFLqnKRF6uGDtB0KoM63RbwV7Qw/1HgznzH
X-Google-Smtp-Source: AGHT+IHAzlC7I/Aa95ioyDN259l7uQaFA8As8soaf6k/s09suYZ09/OytYwlfuu9GMcs9QDtv4OiLA==
X-Received: by 2002:a5d:64a8:0:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38a8730a6bdmr27804912f8f.23.1736931337838;
        Wed, 15 Jan 2025 00:55:37 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e4c3428sm16647264f8f.87.2025.01.15.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:55:37 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH] grub-efi-cfg: Add GRUB_TITLE for custom GRUB titles
Date: Wed, 15 Jan 2025 09:55:21 +0100
Message-ID: <20250115085521.32982-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115081303.27992-1-simon.eu@gmail.com>
References: <20250115081303.27992-1-simon.eu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209822

Until now, the default title of a boot entry is its label. The label is
a variable which determines the script to run during an early boot stage
and is not necessarily human readable.

This patch allows to provide a human-readable title for each boot entry.

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 meta/classes-recipe/grub-efi-cfg.bbclass    | 8 +++++++-
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/grub-efi-cfg.bbclass b/meta/classes-recipe/grub-efi-cfg.bbclass
index 52e85a3bb0..9a5cb99c52 100644
--- a/meta/classes-recipe/grub-efi-cfg.bbclass
+++ b/meta/classes-recipe/grub-efi-cfg.bbclass
@@ -23,6 +23,7 @@ GRUB_TIMEOUT ?= "10"
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 GRUB_ROOT ?= "${ROOT}"
+GRUB_TITLE ?= ""
 APPEND ?= ""
 
 # Uses MACHINE specific KERNEL_IMAGETYPE
@@ -91,10 +92,15 @@ python build_efi_cfg() {
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
+        localdata.need_overrides()
         localdata.setVar('OVERRIDES', 'grub_' + label + ':' + overrides)
 
         for btype in btypes:
-            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
+            title = localdata.getVar('GRUB_TITLE')
+            if not title or len(title) == 0:
+                title = label
+
+            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (title, btype[0]))
             lb = label
             if label == "install":
                 lb = "install-efi"
diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 783e30bf38..7ed0877726 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -22,7 +22,7 @@ python do_configure() {
     bb.build.exec_func('build_efi_cfg', d)
 }
 
-do_configure[vardeps] += "APPEND ROOT"
+do_configure[vardeps] += "APPEND ROOT GRUB_TITLE"
 
 do_install() {
 	install -d ${D}${EFI_FILES_PATH}
-- 
2.43.0


