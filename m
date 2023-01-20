Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EA1C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.82155.1674238285685718262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TDGQ+aCs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id s67so4745448pgs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+OxFmI08dS0RlLT+2RJrGEMcYrzSZcn3NoUADWpICc=;
        b=TDGQ+aCs6MwrdnyGo7mIsbGe5RYre2puWcijZBcPAV7gGVP0EWXWXwVhfCeoI6sS6d
         L13wYKKHup72vLEnXb53nWm0HjgyHsoE5heg97SYCrakpDSB394ZUro1kUmszT025tMC
         ltX6Z7ijjEyQnovVusrSBP1OtU7/g0KEm0hSJDXQBZ7U0dlkCbtT8X4YnLPRKmY70PBr
         SqjQ8t3faPAqSJyROZgOIf7VPTBXsqjgBuWXAUxBWjafgtb3QdokYsIUee5JZAD65hKU
         I1nrLPB5mBvmlZ4WUMXA2+wZLqffxHiJU4lpxhJJGE79EHeVY7X1xeDQJeSYVv5iJBwk
         rnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+OxFmI08dS0RlLT+2RJrGEMcYrzSZcn3NoUADWpICc=;
        b=dnUTypRgH1IBbyh2BM0IRjv7Yc1JAKrtVZ3bLqjRfhFMUOnVsD4n4pvX2mNf+6ARQT
         eWreL5R6QF0qw3w3KMgSiqCjFqffRPA47vfGWFZE+GNEtiow1o/aFtc+OBZ3wAhaBD/p
         mKhB8hx/snylJ2u+YeNOqE7+HlWsHsPfDy8Zj07b3L1FtlfR2i7Ilwh4zeu7zG4SPzQm
         2aduzDhe9BNKxWbapTAU8neOLL6QD2V/M6mOngyhPy5OY1w8Z43Abp2LtyBs7W5SFj7W
         s0aXdzI20fpzxOvPMqhrigJH3uOPz744xXuY2UbVWQLzL1AIdC/44RUTW+8Pf98wuZK1
         8qWQ==
X-Gm-Message-State: AFqh2krvpCXW4rGFBWReLXpaDJ7CEqk+u6GW/eZfmY4mPNVe34bGhZZF
	apVF3blpGJqinObwXdWx57N30Y6wM9Xqp0CsGzY=
X-Google-Smtp-Source: AMrXdXtTX1wmwIYeX4xSolyaLJZMQSiMNb6SHMVQo8w2ghWFnVdzvkM1G7lnflB6uAoTyX5pHzIRcw==
X-Received: by 2002:a05:6a00:26e3:b0:58b:c4b4:86e3 with SMTP id p35-20020a056a0026e300b0058bc4b486e3mr25165099pfw.24.1674238322684;
        Fri, 20 Jan 2023 10:12:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 32/41] librsvg: enable vapi build
Date: Fri, 20 Jan 2023 08:10:49 -1000
Message-Id: <e9d7a381ef47f41d52a2b57de1a5a2920a35f222.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176239

From: Markus Volk <f_l_k@t-online.de>

Otherwise gnome-chess will fail like this:

| error: Package `librsvg-2.0' not found in specified Vala API directories or GObject-Introspection GIR directories
| Compilation failed: 1 error(s), 0 warning(s)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed814eff90677f894d9eb480d8d4389c64a35820)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index fc52ae61c5..b2e93a2684 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -42,6 +42,8 @@ do_configure[postfuncs] += "cargo_common_do_configure"
 
 inherit rust-target-config
 
+EXTRA_OECONF:class-target = "--enable-vala"
+
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
 # the sysroot is. So copy the json to workdir, and patch in the path to wrapper from rust class
-- 
2.25.1


