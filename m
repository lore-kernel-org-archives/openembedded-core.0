Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B190C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2950.1683671578909593471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sfOjn8xg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6439df6c268so3876228b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671578; x=1686263578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1ZSGF+TdctZbW4oWez2GpPEb+2prDmloFcE6VHk9gM=;
        b=sfOjn8xgBMYzIEgaCSEtKnCk7P7fEkhB3v13EPPdNhDjydkUsCS5NGj0SA5ukoic/O
         zDz9VbQeVggjaz3vKJCgR9YkgaNbi/irNnLZ5TbRPtTd0eeuIV35dbqDwdj2KIx8uKfx
         q0PNAdOjnJxnVCALnz6Xzt+c/H63OU8jpfBKZ7giaNr2C32XT/KEc+qzyxTrg/QvCOKU
         IVb5gpEeE6gIUZA+WULX6nqnkLEfXuTsB8ZY7h1y8QGPMdj0Vept2b+cVAlB1kxyTmE2
         PLeMBth1EiWcJdFxhh3YtP9Qi6/L8HncgnOaYOvYiR4zPoV1AIi+H+RLUjx/MHwZbkvW
         no2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671578; x=1686263578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1ZSGF+TdctZbW4oWez2GpPEb+2prDmloFcE6VHk9gM=;
        b=BJByCDLOFaTFw/3ySec4T8SroBHM21VSCBtLrTaDbCvQIyiISZ0WMy2pF3kC8qKofm
         uatwyYPSAnaU6l7lLPECgLMb3+ZF89G/vx0JendbvziHlfdSr/d9TBt9FZ56bP2i8rQ+
         cdS/Fwa9MUq1fGHg6jy0NNGzOoMyhJnCfpXRiZjW01FzPq6iv48wOBIH12WhzgvBtdh4
         YgR29n0dbSgv/1jhMnyCQ+vcryU0nWHqotw2uyZUf+1VDL3KBs7fwgnkkgusJywUPxJm
         ytoFCO6DcRtr1EbgXMAuuLLIE2mwU8Gq3q22T6p481hE+AJ+E8fXwKy5hKjZLqQFuAOj
         m8HQ==
X-Gm-Message-State: AC+VfDyoUt6TSRmiD0tZgrhf7N6Xo+L+alf7XyK1W9DL/P6JWdbS4LaS
	FJ6ZSPFyQ44fJMiTfxY6/SE+q9SvyvpGCFQmyDs=
X-Google-Smtp-Source: ACHHUZ44L62XMs59SWViqwaSWQIFyRiZL2Bj401YgPaWxxlT+nyJSQgBewssGfSZFtU4MMlDChAYMw==
X-Received: by 2002:a05:6a00:b8a:b0:646:663a:9d60 with SMTP id g10-20020a056a000b8a00b00646663a9d60mr10016791pfj.10.1683671577976;
        Tue, 09 May 2023 15:32:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] Revert "xserver-xorg: backport fix for CVE-2023-1393"
Date: Tue,  9 May 2023 12:32:32 -1000
Message-Id: <8f20a985ba622e7be16b86516910e9eef5a6ee3e.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181091

This reverts commit dc2c777cab0230fc54e078d20d872aaa9287a8b9.

Fixed in subsequent version bump

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...posite-Fix-use-after-free-of-the-COW.patch | 46 -------------------
 .../xorg-xserver/xserver-xorg_21.1.7.bb       |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
deleted file mode 100644
index fc426daba5..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 26ef545b3502f61ca722a7a3373507e88ef64110 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Mon, 13 Mar 2023 11:08:47 +0100
-Subject: [PATCH] composite: Fix use-after-free of the COW
-
-ZDI-CAN-19866/CVE-2023-1393
-
-If a client explicitly destroys the compositor overlay window (aka COW),
-we would leave a dangling pointer to that window in the CompScreen
-structure, which will trigger a use-after-free later.
-
-Make sure to clear the CompScreen pointer to the COW when the latter gets
-destroyed explicitly by the client.
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-
-CVE: CVE-2023-1393
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- composite/compwindow.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/composite/compwindow.c b/composite/compwindow.c
-index 4e2494b86..b30da589e 100644
---- a/composite/compwindow.c
-+++ b/composite/compwindow.c
-@@ -620,6 +620,11 @@ compDestroyWindow(WindowPtr pWin)
-     ret = (*pScreen->DestroyWindow) (pWin);
-     cs->DestroyWindow = pScreen->DestroyWindow;
-     pScreen->DestroyWindow = compDestroyWindow;
-+
-+    /* Did we just destroy the overlay window? */
-+    if (pWin == cs->pOverlayWin)
-+        cs->pOverlayWin = NULL;
-+
- /*    compCheckTree (pWin->drawable.pScreen); can't check -- tree isn't good*/
-     return ret;
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
index f0771cc86e..212c7d39c2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
@@ -1,8 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-            file://0001-composite-Fix-use-after-free-of-the-COW.patch \
+           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
 SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
 
-- 
2.34.1


