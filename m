Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C357C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.19492.1676150656465304453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rNFJvLaI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id b1so5707682pft.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pyy9cucqW8r5ghweobZyXwDdNrTlFBxEWTUZqUiqmmg=;
        b=rNFJvLaIfXM7F8msQxtOWjaL/G+AZTXIQKzXMqDm5KkseobY1mgA/gs/cNzJKsOTmY
         uXiHByrndKbHGl54dHFa/1jTTnD598R3hBS2nVVqvzTchkX6G3bBs+SqFsF3zJVGzSag
         0RElyUpS7G5azciQWiDLn9YFuaZHUJgjmgFJ7lkv3tgdjb/cyD6v0ucQyo432RsOZ0t/
         vSuN+q+UWZPhcx88gvRc+TmpdSlO0/zxd66yQ6gcYWJrJrvtWyg2ISKqH7OHC3mC54Ik
         U2NzmE5KhIYY/VSFIwPKv0CXwAtVYy5m0RVrCqNJD+QiYLGDWEMerLG0p/DpsXaw/S65
         kddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pyy9cucqW8r5ghweobZyXwDdNrTlFBxEWTUZqUiqmmg=;
        b=L3LBukPeYcAT4LI5XyJw+Pid3V05Q1pyGG/8uYRl7uN+ZWX5WJhTCs6RJm6GuO784b
         ZuKkjwvHBUzQizRyQrtPea74ukRt/ONr2yFQS/Zn5DuXSQ7ClKfkncqmZlUIbeBRnkFd
         XGnkC0rx6IHFAhtavuz0Qf42NnkSEzoNspz5f0H0tb3P7h1GTZoZ1YeIyqo0boKWs80V
         PP7O3/E595k4AhFj6pu3hk/QNQTxvPRLI/4vKLqs47S98i4mFN+qmpOVXsOnkQWdgTvP
         V/9kGyQtgKz0lZgU/Eml3BMhhtMk9jPdQnI1fvMFRGD1Nf7JxmOElY2wUvTLPJsweV98
         i9AA==
X-Gm-Message-State: AO0yUKU/AFCMs5iELl+wzpTwgaI4iLwgJIv22FoEzlBCYm953KR9QZt3
	ScfRp6LpFZRCqD9jle544mLlBJ6MPR2v5vooB4c=
X-Google-Smtp-Source: AK7set98eLzHujInfurvhQ7avqpIlgPscvlWoPr9L+AeQoFsCXeDoK9VYKAKEfOmY/hurasF9CB6aQ==
X-Received: by 2002:aa7:9833:0:b0:5a8:4dea:7020 with SMTP id q19-20020aa79833000000b005a84dea7020mr9777238pfl.27.1676150656986;
        Sat, 11 Feb 2023 13:24:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/28] make-mod-scripts: Ensure kernel build output is deterministic
Date: Sat, 11 Feb 2023 11:23:34 -1000
Message-Id: <8153db20ebf3e3d03b754868caec4eb6968b4420.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177021

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The definitions in linux-kernel-base are needed to ensure the generated headers
are consistent. This was a small step that was missing from the previous
changes to linux-kernel-base as both kernel-devsrc and make-mod-scripts
need this information defined consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d79d4883f924cef0d0ba361506ad75d441b9721)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 9afd6714f0..38282e58f1 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit kernel-arch
+inherit kernel-arch linux-kernel-base
 inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1


