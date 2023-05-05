Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5759C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.30318.1683300024203089058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nAldyEOE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6439d505274so674990b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300023; x=1685892023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTOLEiVx98lBI2qAvvHt7a71KM5kS7kanfOcXMkwcVQ=;
        b=nAldyEOE+WIlylZZyO2/yc9qqG0zaOSgL638ia3X19D9LJ7zB9ojSt3YdCADfy/sST
         p9ifAzDpD4FCWjGVpHtJnqc3xBhcB48uRuu2PRrtN2MxVyDJdaVHS3Pc+EnEX71d+s1A
         L8kQ38EUsZ1QD+Hjns+mdtMogXSYXf5Aj+IPBzgNhtbqOloD4jxc4DPkg8m/i9xjqvQl
         HuKVysibvANX/MpA7ZsYxg6qdiSDoVfeO+I58xxQ/Mz2G2HD2d8txnlZGJgr1cXpctPH
         KX9IX038OwPyhRWOWAt13+59GIpE+wBSuQRoqEzEkinUchoW7BBXFUvV2H8+VyY3PIbK
         /Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300023; x=1685892023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTOLEiVx98lBI2qAvvHt7a71KM5kS7kanfOcXMkwcVQ=;
        b=lJDhneNSn/WZX8XpZdQD1S0A7Ut4XvOab+6hbHdZ9s1bxC7xHTIwcoykOvLiJV3j3d
         HkwsDvQm2ppu6vKJJotGEKXcPVkRNfsx0iG1vPET3VkgBMTtTsDDCiD4+hy/QmWFdIln
         mqzupbBLtbnHEjZekAwtR5OElcxoMqVmPvxV3plWLx+Vsb2360BOYafWELdTsBwS3Oba
         nRPX0pGhire2jIxJN8TckDQNplVYXck88EX0h34SHfQDeJg6XWx/nuH+4vDK7SkmsLH8
         eFBI5Epuop/arZGhBEQtk26FVW5Pb/Xb57GV+oMIfPy/X8xrlai+YIdWAc7zR5iN+VG6
         xFNg==
X-Gm-Message-State: AC+VfDwJdb09KcUxSncca0fYoM54j0JXVyEu4GGc4W4Ycv6QwVrMk0fi
	f6eGKA76stbWcTkyzlqsv+w+Y9nHMLslNTLUQcs=
X-Google-Smtp-Source: ACHHUZ6OonL3f4OQj1RkinPSllEkjpqnyWtVWoaDj6p2BJy9FebECPWaApZpiyWTIZeZaiiU3xlNFw==
X-Received: by 2002:a05:6a00:10d4:b0:63c:1be4:5086 with SMTP id d20-20020a056a0010d400b0063c1be45086mr3171453pfu.6.1683300023185;
        Fri, 05 May 2023 08:20:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/35] mpg123: upgrade 1.31.2 -> 1.31.3
Date: Fri,  5 May 2023 05:19:23 -1000
Message-Id: <653530d19306f26e40586786032f8a2375dc6b48.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- build:
-- Fix --disable-8bit.
-- Fall back to generic decoder if no yasm for MSVC (bug 346).
-- Fix some pedantic compiler warnings, avoid breaking libtool wrappers.
- mpg123:
-- Fix verbose position printout for new resampling outside libmpg123 (where
   output rate differs from decoding rate).
- libsyn123:
-- Fix reconfiguration of resampler to avoid double free when reducing
   decimator stages to zero (bug 350).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01ccf7c55d3d9c32ffd509abebd928ccb402b9f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mpg123/{mpg123_1.31.2.bb => mpg123_1.31.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.2.bb => mpg123_1.31.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
index 0a2d870cfa..90f285872f 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b17f22905e31f43b6b401dfdf6a71ed11bb7d056f68db449d70b9f9ae839c7de"
+SRC_URI[sha256sum] = "1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


