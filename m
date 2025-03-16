Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DF6C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.31825.1742141591071064795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WdzX55ME;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso8961395e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141589; x=1742746389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkLm4HJVZeOqyiskQev+4BVvTdpZ7ozW2MMYJw+uTHI=;
        b=WdzX55MEAam1/pX5MccmlzGL2k0ndCtdinlWlGTJeMb0leU+d6hPO0cxaqni4IaZuI
         YM5go9b1KjeFN5/HbXbD0zPLHwXNmuizX5VLWBWZzhGvHXZE/i4D8TGn21My3prZtzf4
         r9xORN5LRdu/IXlxdVM8lCYG7aFKGQ3vUnn04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141589; x=1742746389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkLm4HJVZeOqyiskQev+4BVvTdpZ7ozW2MMYJw+uTHI=;
        b=AevxMA2hNAY4PJMiQemw4GDStXvirxDUSb3/zhkDWmuCuLIl7Po0U8AGiH2A4hRzgF
         DDJzdtnyawSTVVXcl7cq4wDNMBQ4U0LEEUH/ioWBrDFDnCcExSfZqtUNydQ1uOlaftzH
         Q1CZsOTow5nRcY8X8m2ooTXSqWpcCQ2wd4HLQLA0PbUnRc+6HFbysz55xcCvcS/GGZi1
         ACDGvrUDc3emJy6ewKlfIZrK7WXHrLNLDQrPFAfkCKwJn2oL/vgCBiMTgnRQsA9drfvC
         tHmGSmH8YPC7bEduICmtavKMvnd2YPF3bIeyUJVk6NWcyBeYSI+ENqowsZd+TzXhv9eC
         5zzQ==
X-Gm-Message-State: AOJu0YxuA5fFNrwnX+l/vw3Umv/x9bezPEjznxlABYI2y6crAeUCzXQ1
	odOIgnXM/1AJSCyTY0F+wkU4TcyzMN76CcqoapkT6/E0R/03JV79FdZ3q5L3hu18bydTT7gOvd0
	S
X-Gm-Gg: ASbGncu/Rvq9pB5OABaCfCCNYzIMJqcdj5tHMI/Xgn/hVfdsbjdE01NT2mnHloM+ihu
	erHs2D0/K3/PuwwFXhZXj/6+CU4xpCQhl6o+eQQQnlTp/MVuDV3NFnif+kSkRA0MsSjVp90nqQy
	KLYxYBjSggBq6vKA34981FseGsMXMTSV19yOR4MrbSqeGY8g1Cd8GPt6XrGgDyyKCCna5DeALlk
	Jr+O62vfx3AihkKFc+4Pe0ZlvJIkQrFrh9lR5WeZ3OKdaOhMTlpj6M1vSJ4YDGHeeCuw4ITT4vn
	5SEPTUDeCK8+zg6BMFvNb1MENoamIpm6V25A87BxLILOIHPNR8a6e+bOR9jZYC/nsbKrwQtaPEw
	E43ofmGOY
X-Google-Smtp-Source: AGHT+IESlFY+2zm0GWdxJ5MDEeE5dIHZafkeYUYPH+NPPJH6NfReYWoeaYg4QuRR6PW1QeeDsCmccA==
X-Received: by 2002:a05:600c:1913:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-43d1ec79e9emr107326635e9.7.1742141589160;
        Sun, 16 Mar 2025 09:13:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 40/43] xinit: upgrade 1.4.3 -> 1.4.4
Date: Sun, 16 Mar 2025 16:12:06 +0000
Message-ID: <20250316161209.3629986-40-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213043

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xinit/0001-Make-manpage-multilib-identical.patch       | 7 ++-----
 .../xorg-app/{xinit_1.4.3.bb => xinit_1.4.4.bb}            | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.4.3.bb => xinit_1.4.4.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch b/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
index 649905574cc..05cca7804dd 100644
--- a/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
+++ b/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
@@ -1,4 +1,4 @@
-From d642e60d8963f1b90569cd0ab5c29ac2c9bfe939 Mon Sep 17 00:00:00 2001
+From e193ebf82819a24f067a559b42a81bf380d12ab8 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Fri, 6 Mar 2020 22:28:14 +0000
 Subject: [PATCH] Make manpage multilib identical
@@ -11,7 +11,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/man/Makefile.am b/man/Makefile.am
-index 9c6569f..608e933 100644
+index 9c6569f..e88c4ae 100644
 --- a/man/Makefile.am
 +++ b/man/Makefile.am
 @@ -12,7 +12,7 @@ MAN_SUBSTS+=	-e 's|__XSERVERNAME__|$(XSERVERNAME)|g' \
@@ -23,6 +23,3 @@ index 9c6569f..608e933 100644
  		-e 's|__configdir__|$(XINITDIR)|g'
  
  
--- 
-2.23.0
-
diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.3.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.4.bb
index 519a9fc4efe..b646ac667c6 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://0001-Make-manpage-multilib-identical.patch"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "86409f21a6a31148d2c1c17bf5f2d904eb5ef455f9dc67c49fbd0c10ab18fd5a"
+SRC_URI[sha256sum] = "40a47c7a164c7f981ce3787b4b37f7e411fb43231dcde543d70094075dacfef9"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie \
                 --with-xterm=x-terminal-emulator"

