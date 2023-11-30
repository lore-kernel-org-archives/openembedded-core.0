Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FC5C46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:57:50 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.5134.1701377868481508253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EpAxE0+C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6cddc148285so1402569b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377867; x=1701982667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOCVirXEJrougbL26dLFCdLXOzDK0fFdFy7ZV2MzId0=;
        b=EpAxE0+CfY+prolLCXeFfEvWFwyVr+e/dvLr0nwGs86esLdmKeoD0hB/tJb/bZxhj8
         Iuq9g7h/GKdMoxyRGH+SOgFqR34jViS5GQKxLFu441hBaEzs9NKHwEXP5B9Dvh5b5nR3
         pLbqK6WE77FBS125AEjyqcL5nGjBkoB7kdtbMicrvmc0ua1H+i/LYzBZ+bxnXj/s04zW
         uSYHuxLfPfFL4eLRY4/+WHUSw8732S67uaw/BHrMUU18c6iAOiqiuuwx7gEt4Wv4Pxr5
         fNjXgQmqUk5tji1VFQu95SOix8gGEij+nWnze0jHMSCuFPfaXEUFjWQcayRs9mr8IqdA
         UP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377867; x=1701982667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOCVirXEJrougbL26dLFCdLXOzDK0fFdFy7ZV2MzId0=;
        b=aA26nXtQf6vYym7cJXCZrNv4U2SmnEg9Uk0wCzehLwwA5hB/vRbfwMCcmguwHUVZp6
         mf+gDWkY2TThQJf/60jP3CqYelaSnZ4Q9Qq0UNYnFfhxlbr2iR9xZvEPfe3yfffraTYC
         uhTJ1PtZoGWcmnxPW3R8i/Uitat4HZqGsSr7ZIiEl7JTVyiOMI3Cf41iQ/JXC5uYev+G
         V/StfO+L33HUddpZewCIk729/HPcKPsTUVQWEX6tdwszvSJEb2arkAAkd4yvwP4CpSoq
         UjGyAYOXYQEivUSGxduQfoxXtUW+iKEJIrVE0UcNJBLpg3Un0bomwLgmFDduJGV5zbqd
         nvFg==
X-Gm-Message-State: AOJu0YzCk7pkxuru6HYcsEFdaGiB9hRwENcOaLKFKWiNq9QpBeT6mwhr
	0glAlmNfVTH1ZvN2CU9dlH4Ug4M/AmvqM46jljvrAQ==
X-Google-Smtp-Source: AGHT+IFewzTNdhglqET/CzY+5LcqoQn9acR5aluF+UrGFDB67JtWGFSECOdb4u9O8I98FbXVg302kQ==
X-Received: by 2002:a05:6a00:3907:b0:6c4:d76a:68ff with SMTP id fh7-20020a056a00390700b006c4d76a68ffmr28873455pfb.17.1701377867177;
        Thu, 30 Nov 2023 12:57:47 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/25] harfbuzz: upgrade 8.2.1 -> 8.2.2
Date: Thu, 30 Nov 2023 10:57:12 -1000
Message-Id: <d33248db045b6959c641630dda1aa35aaf702648.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191522

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix regression from 8.1.0 in shaping fonts with duplicate feature tags.
- Fix regression from 8.2.0 in parsing CSS-style feature strings.
- Variable fonts instanciation now handles more tables.
- Various CMake build improvements.
- various fixes to build without errors with gcc 4.9.2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7380afcb41db7b1a93c716af567d4a30a71dddcd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
index df41af29f9..ce1a6bed65 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0fec78f98c9c8faf228957a201c8846f809452c20f8445eb092a1ba6f22dbea5"
+SRC_URI[sha256sum] = "e433ad85fbdf57f680be29479b3f964577379aaf319f557eb76569f0ecbc90f3"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


