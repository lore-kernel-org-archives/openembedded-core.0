Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5586DC47079
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:48 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.151016.1703864744311759978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=po+xJm7J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9c2db82b0so1297419b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864743; x=1704469543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBJ6JXYoCtPrHO4pbc8Darct6nB9tN+hwo5p7sAn68c=;
        b=po+xJm7JnsbiEtqlgdir+LF4jM+UPUwgVCZfXjm7Xbk4vQelJlKyZizoa5UUyPaU9h
         JNtwjkKW4jVYnutlnA06bQEGqP/8+L8v7IMk1LLARVolD3NgzsPhwDaJnrmgKRNiG23/
         vy1UpOVb7ebSrTW2P5quZXPwM74wr2QjHCFmL0giSDkUxBZdp4Q2LUQ1pbNMnMVaE4OC
         zi/7yelyHKPGFoSbJi4FJc9wU5nxI2K4Rnu0faBUQeqbEtMe+TQBD44f6UcvTmu4wEjq
         5ZBjkRQSKMqOyq+ru7nvIShyfN4eFZu010arJDQbtJBs1iECdjjQ/TEhTsOwzjptvjLm
         AaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864743; x=1704469543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBJ6JXYoCtPrHO4pbc8Darct6nB9tN+hwo5p7sAn68c=;
        b=AbOg616JDZzAXVUOzWXf+iCFJ5wHkPjOTXZGw39pxgcW6g+SA85/Nf5LLxC5OX7EYW
         tl5yvGThPFU07FR6EIf1aqi7xOGIUHANHgSmRxj3vySyWSa0UbT2Pxis7duNpPYerug1
         QuNtt1SBsQb7LCujv5hTcJzEBNEuBH5nk9Zr8xzPpUvR2uZGrXI1AqnZTYu2SSy54m6A
         rEg4I5q7oKkhmmRRojm8I3gdWZI7tnZRcSSoi+x4zqDpRewxnRTesOALltgYYYZYXeI+
         fiBzTRZDtLAEKH+IWzy52ocz3yhdERBPn++5iXHKORh7cuxWC60Z8i+u0dswgHsPRjlt
         BURg==
X-Gm-Message-State: AOJu0YyUlJUMv6Eus0BHjaCG6/i7W/bdAmsWC1WydzEsd80WwPv4W6Pv
	8jpCaedfLhsurbzllfIDBvAWPxZU9xi+mg9+xJY9G4OVhRd+qg==
X-Google-Smtp-Source: AGHT+IHv8IfDI03FKvjnrupX2bv8BN6kQxCvgtfjgT6mc33K2+Abt7M40epQRyO0URn/t0JlGvFHQA==
X-Received: by 2002:a05:6a20:54a4:b0:196:5628:f17 with SMTP id i36-20020a056a2054a400b0019656280f17mr1458770pzk.37.1703864743049;
        Fri, 29 Dec 2023 07:45:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 21/41] log4cplus: upgrade 2.1.0 -> 2.1.1
Date: Fri, 29 Dec 2023 05:44:35 -1000
Message-Id: <067023cd723a9056c5c15a37d20e3b12d4b2cf02.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193038

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add missing source files to MSVC project files.
-Resolve environment variables in include directive in configuration file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 33d49b14609d9b92a7c23d79f1bdfca79a5d8197)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../log4cplus/{log4cplus_2.1.0.bb => log4cplus_2.1.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.1.0.bb => log4cplus_2.1.1.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
index e0c16d2e73..be3c787ab2 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "2a8eb99d71b0680c0520c7c16248cdb4195da82f396b79fea30b0d9e289c8c72"
+SRC_URI[sha256sum] = "42dc435928917fd2f847046c4a0c6086b2af23664d198c7fc1b982c0bfe600c1"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.34.1


