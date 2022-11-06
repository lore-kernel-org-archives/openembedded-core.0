Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB17FC4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.16795.1667744319382329323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5VAzESmD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id g24so8934169plq.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot1GbBDJ+MeiPiwA3AYKeOfKkbySLcpBRr1vvLaQEc8=;
        b=5VAzESmDhTY01k9cocfqdu/aM5JlYRyOMul+gAkzCcZMFD+9qXvGCOF67EK7SN6DZo
         8p/oPhcYr/QJV8U6i4awP28Cyeskg0yzTIq05a+ZTSh/edgbXhUC8qtNvokpLBi54Cc6
         e244IgwZ3zblsg+0MHFC2mDyr0PLOh9tZDnYUFT5t4lZ6+xw5ewECsqLOvzbcFkIqhWh
         4JXI/e6N8Hxh5SOoiz+O46ngl1KHtqSPh2uhI6eZFZTiTqLkaPDx79ag/Q0PYIpAeoJW
         eI/rL7oNfRsgGrcIzaJOAla6JYMiLcLGdftZgab5ZC7T6TwBrFUno2tBdEc/BKoZcmME
         /q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot1GbBDJ+MeiPiwA3AYKeOfKkbySLcpBRr1vvLaQEc8=;
        b=McpBuX4EsGrSKY6JDSqDpsyiaBUM+mcun+I6T6An6b2WULgUwMHH/66U7ZJhL1+NF+
         tNTEHloHMdfEhRo82Vpe3zbesowDIewyN/h6YuPyr4+xZyqHZL2gB9bDVlt8V9+XLeFh
         u8KOTgEFvXi6RHN0fEbzHlh26R2/2ePBU10V5sRV5Ubz18iTCTrdWuTDhHW6kHZ9MZyi
         OBHjHwNQYFbqJxY1WJYsxh2f3INRG2rspeaFklzfLm7nOOPeEbeZOqFBYBK1Ynq1+BAF
         rka7PxGfO403sQ3wKw0YVXyJtcRMx9iUJ6R9BByp2dtgso79w0McOdOfLjRWfmcFyjD/
         gEWw==
X-Gm-Message-State: ACrzQf3oXjpz1mVas2/VxpMsYBU4RdpqxRonpwO509A1vnsnLytP1jSC
	U5rbYptSTMH8trAp0fumA/5RUKSzj1tEyqsn
X-Google-Smtp-Source: AMsMyM5hDEa2p4TftmExrTcdA7StoUji15QPtTXqmW3ZIzqFoL08raC/iOVxHlXh5OMAnBjPHXfcEQ==
X-Received: by 2002:a17:902:d48d:b0:186:cf83:4be3 with SMTP id c13-20020a170902d48d00b00186cf834be3mr45339595plg.22.1667744318481;
        Sun, 06 Nov 2022 06:18:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 34/34] mirrors.bbclass: use shallow tarball for binutils-native
Date: Sun,  6 Nov 2022 04:17:17 -1000
Message-Id: <0eee57ef03908c04e1567889f72d7187b5c1f657.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172802

From: Etienne Cordonnier <ecordonnier@snap.com>

This is useful e.g. when using meta-clang, which introduces a dependency to binutils-native, and then a
full tarball of binutils is fetched additionally to a shallow tarball.

The original BB_GIT_SHALLOW lines were added because of https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg08752.html

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd83b8b502ae935c75b59aaf71bbb531c9771dcc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 9643b31a23..81fef7f660 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -90,6 +90,7 @@ BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
+BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-glibc = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.25.1


