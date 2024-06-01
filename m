Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39107C25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 20:03:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.45060.1717272228808122208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 13:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UbAwfQsm;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-702447766fdso2114265b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717272228; x=1717877028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSKBHbh9YqeX4HelwHHnQ1vM5qcsI8qte8WPIAttp1Q=;
        b=UbAwfQsmzkfhcxRSlKGGw2utQapCTKm+sbRsTMb3Z4NXcFxqdEPKRs/mhoYyiwQeMC
         xbYYeRbWKIqERDXvIExZxKhUB0KkaDsC2K1ogQSNww+IzuhsqVeLnUqLkHtzNmxopZnx
         bQPpF8J1zXrfKJKnNZ5UZJ0BcbgBCC2xl2ufZuUPIgPuqmayyChGKyLDDDuX3wYIGjXr
         /VR6VCY0Tk1urxS9GgdIgASuEDNqndNJe8gk1u2lXqlRqR/zqqneYqfBPSXpHBc6KWuY
         vfPIf8rHHyGkvex1kZODGXy7UnmDBXiVsNpbXFP89PNiQ2x/D11X/HXb9IrJ9lpznJEs
         GKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717272228; x=1717877028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSKBHbh9YqeX4HelwHHnQ1vM5qcsI8qte8WPIAttp1Q=;
        b=Bvt3S8mh2Qb4CwzzQzTSo/kqbHtRCWIJQztybLqMX5IL6GUmhZ6P2rCd6EKBTyAvLs
         /SOFgqDYa63uMvvw82OG+YRbVrJPEKQYuzuRhZ7i/9cSxkzjHI/Uphlnrft2VhzDQJ3i
         UYPRF+fepudDNv+Bol09HiPnFW+GROp9KXbmWPvfD78iy27YqWvsV2SuYPEMBe8V3I7B
         d7YvPb54jIv892T9Nu20Ud/PmaDYZqvTWpOeWI9N35K5c9IDN6hHH/Xrg3XuEd8eZaI8
         KA5KqJJwab3RJsn4Icv45U3sH1wOnxkC5k43NwNKrvLzZQLtfH+2lhzB7yx0lLPZhmh1
         4vmw==
X-Gm-Message-State: AOJu0Yz0hfyUz231uGgSWRa6qGkYn3Hm+STTmWTcxWHUTXUs/r31wFud
	6f5w+whoPafAJOYWL3TgEJpCB3z8XxciOURhWU+1BkFoPlHSQL24mzB5BJV8ZtE=
X-Google-Smtp-Source: AGHT+IFHiGcVS10rjSDA4XAKGa98x4wMxa6CCwiJXp0k88hlHj2qn44AAmeoOX8uE/ESC9uw983s7A==
X-Received: by 2002:a05:6a20:9187:b0:1b2:2893:4c30 with SMTP id adf61e73a8af0-1b26f2cc0efmr6101331637.43.1717272227643;
        Sat, 01 Jun 2024 13:03:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c354d7fbaasm3105680a12.36.2024.06.01.13.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 13:03:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] grub,grub-efi: Remove -mfpmath=sse on x86
Date: Sat,  1 Jun 2024 13:03:44 -0700
Message-ID: <20240601200344.3004308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 20:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200200

This option fails with clang compiler when testing for soft-float because
OE enforces this option via CCARGS however, gtub's
makefile/configure does disable all sse options when checking for
soft-float support, but it can not disable -mfpmath=sse as its inserted
by OE, therefore remove it in recipe

Fixes build errors seen with clang/musl like on x86
error: the 'sse' unit is not supported with this instruction set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index e2a2a842773..07b4000e042 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -51,6 +51,10 @@ GRUBPLATFORM ??= "pc"
 inherit autotools gettext texinfo pkgconfig
 
 CFLAGS:remove = "-O2"
+# It doesn't support sse, its make.defaults sets:
+# CFLAGS += -mno-mmx -mno-sse
+# So also remove -mfpmath=sse from TUNE_CCARGS
+TUNE_CCARGS:remove = "-mfpmath=sse"
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \

