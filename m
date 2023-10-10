Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC864CD8C82
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.92773.1696947283207056075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=puetVxgJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c8a6aa0cd1so13285255ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947282; x=1697552082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HN9zD2PGOdTdnzgzgKz8vBJd4wD7iS49IYviXI64Yus=;
        b=puetVxgJYOHxWzDY8H3UHAJ4XII/sMXkuUVnbz/N3HbyKPlIqQ9O/cNsb84XK670Ns
         UwUwfpA63GGmTtYJRjDBT8Grgin+D9159CorC8kGrUSkYAbkOxD9QAhn0Rs3+NH/V13B
         rSKTmBqxCmQvXMhaambBeBRlbMqI/JZCQhQjrWWwQWj95m8znTHO6KJ2GtV3TZQg2ayl
         ECo8x7U4nRf3ks7gvm4FjkYM2PihN8WPnsPYkg4cbD70Q1i+0s1oiLLE3LnXwH9GLU8p
         bhvhbKltiECuylCWBVF1MDqE9wMJZBo03b6iTH2KiigcxNtgE7vVvCEroPZuzGqVjZjt
         ISAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947282; x=1697552082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HN9zD2PGOdTdnzgzgKz8vBJd4wD7iS49IYviXI64Yus=;
        b=jFRtvTHTriMDxVuolTxeBJFhaOmpZOuzsd0euqGzTpGBy+www44ZKR7amXVeP49CA8
         r2IycuqQx8wPku7JVr6/abgYggXTOlsmvhhYq5Jhf2Z1VDvTptgXEPIYlFHXeCVxbjgV
         TObh0F+5lywtt+Viefvkq0eoldNjP155OlR6UhAiA+x4W2Q7DsZHiQ++r3/TLKocAZWD
         4T3/X83kOYsu0N6isfG9/+8efHa0rxO5aCk35Djm5RaeyJQsJ3/vvTJIQa5HGGXF2nWg
         HYg5mkdK/ET47jrgm72/X1RRzZfi56VYZ9plmc0phfLfcBSMOHrJdYwY/gdiCnrSHBRk
         xQxg==
X-Gm-Message-State: AOJu0YzojY/iLGKtF1FQVbOVelY6Knes2xxF+N+/do9Dp+62fSPo7Blr
	8flHltArXsCvSDcBazt/7Xu4cflgf/SZC6w4dKA=
X-Google-Smtp-Source: AGHT+IFzQ88khqr9doDEZo16M1m5bBIzyf0rMyI4WCL1lkLhOXEXnpAgRb306kkDM7FI+WaGE8FtNQ==
X-Received: by 2002:a17:903:22c8:b0:1c1:d4f4:cd3c with SMTP id y8-20020a17090322c800b001c1d4f4cd3cmr17562889plg.31.1696947282309;
        Tue, 10 Oct 2023 07:14:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] dbus: Add missing CVE_PRODUCT
Date: Tue, 10 Oct 2023 04:14:22 -1000
Message-Id: <922872c85d417a5a319aa4beef57ffa4d05faf27.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188903

From: Julian Haller <julian.haller@philips.com>

The current dunfell CVE scans report 0 CVEs for our dbus version. This
is not correct, though, as we use the wrong product name to query it.
Fix this to get a proper CVE list.

Signed-off-by: Julian Haller <julian.haller@philips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 948aaf2e24..9b5cc53d92 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -32,3 +32,5 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
 PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
+
+CVE_PRODUCT += "d-bus_project:d-bus freedesktop:dbus freedesktop:libdbus"
-- 
2.34.1


