Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC43C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.110.1667835445473836944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1TuI3CTA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e129so10765197pgc.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up1I0LN0SIQYp3OnVtP5wM2CK3+kYoartXO4aV/eyWI=;
        b=1TuI3CTAIZJUvSo3jAhy78oNFI2Bhdta/1s+vzP3z2gq4gphLwPivdV0M8VjIoGUnw
         wGsKAAlitS4SXbNb/TwAAE+jjC5Wn5vzq5XKuL3OoD8Ko9xfaXSZzBkb6yykx/CurZ7n
         lksIdZbxOoNtIU8OJvdILEmnIMFu3Q3yFJIgFxkJ9EfP7R0YdESJ0McOsDW8ARV/j+E7
         CMuw3mOMHkNMn8TLh8NNV2UJqmHEfwLY6KipwxyRZw2KeNYB9rGDW9PTm7a7eLOs95dS
         Db6dhijtw6GHkZk8EiLEQs5qxwnZzukUgGAfSAJ612YBk5YBvND2TzKIjruWol6SwX3X
         XgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up1I0LN0SIQYp3OnVtP5wM2CK3+kYoartXO4aV/eyWI=;
        b=AjKzaxHOwAj6TFrIEm6emI/91/9r/xy8QrfAhkZP9/++u4BoRc5qjpc5jXqJZUfpuG
         XMkHpZPae+N6wcfl3EKY4N2rF7RAy1h2H1iTQUMJAlXlemtuFeDQ++fOPSuTwQZ/y2Fj
         IDG+b4oJ3FYErQI1Uij26GWlOS9ZXhbjxabHtICVWFCEw3XV0R1XWU4UG13T0if7ayGX
         PCM/GcevwxtZtMVbgMjUklb7DDGuHr0RwFOR8WqFSXQnlcwu5FWFYe6P5KjTJ63F1bly
         GmtqWrMfZE0GdlHAmd2R6HD8sq+QBd5tOM87aB6J6V59G5+rZsv5CHHGkrp11psx71cj
         LeHA==
X-Gm-Message-State: ACrzQf1JQf8luZ2rWNA6sT/Bu6HVGdtSVdZgqYWMcWp4wCwgJLY8aNhE
	QI2U8wttYA6Tfc5HIXY+Vh8vDRYfSnYNxFt4
X-Google-Smtp-Source: AMsMyM6WG2nF8famm9MQ34UhBMydmroH+ws7J3SiNLSDYLpLjPbOcmojNrWd9u5IooSnz5ababc7Nw==
X-Received: by 2002:a05:6a00:1d89:b0:56c:a2b:f1c2 with SMTP id z9-20020a056a001d8900b0056c0a2bf1c2mr51391517pfw.45.1667835444497;
        Mon, 07 Nov 2022 07:37:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/25] kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
Date: Mon,  7 Nov 2022 05:36:34 -1000
Message-Id: <45ed53ec09e24956ce3d7d008e254bc759cf5f85.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172914

From: Sean Anderson <sean.anderson@seco.com>

Replacing sysroot_stage_all by a no-op recipe makes it difficult for
bbappends to stage files intentionally. Instead, just clear
SYSROOT_DIRS, allowing other bbappends to easily add new directories.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 849791e7086463a4c7c53c2c1ed9603a6c3a080d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8dff68612d..d878d4e167 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -588,9 +588,7 @@ do_shared_workdir () {
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-sysroot_stage_all () {
-	:
-}
+SYSROOT_DIRS = ""
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
-- 
2.25.1


