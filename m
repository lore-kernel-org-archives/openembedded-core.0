Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48767C4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:48 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.151015.1703864742236103797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1ogBepF/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cdbc7bebecso2219278a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864741; x=1704469541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JW1ZhI1h7JGDyXSMw9ElEojYSjP37bCPqqyeya6mg/M=;
        b=1ogBepF/edKCsbd4Bv79nuo6UnUFqWy8+PLaWR4orMj5+LdvzHjtmTvrdf7tLklq8p
         hTE7Fc2Jf8Xz1gzSqZn9ooJwAbRcndqv7drZGycST7p6l/N1vcuN5KCejth0iNyxoqL8
         EA8fuhWMniKgVxylWKROiCKkEjZWb6nVQCHHl7XZY+dRO5cZa/5+UnPUxfAtGp/P7Yud
         d00DBcJ87P5XUdUZuPxsN+1mIfvTn01teQvVARQAuCw/6suynar4vZlbt9hLlcwiuD7Q
         e0/vLUl8QP85ExVZvSNckc3nrQ8l198b3lDu7qAbZ/ea/oO6wS23qw/pV5pW/Wcl3qKF
         EVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864741; x=1704469541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW1ZhI1h7JGDyXSMw9ElEojYSjP37bCPqqyeya6mg/M=;
        b=RBVfGLiDFEiFZd5Isvc764hEUVc8WNuGEm1LLXqoku+ERSEf3tlBC7iJRkd7eagV9R
         j0TnxW6RvV6XPVNgzWrVBmrELQFlgsEC0avPW3e1X6kWJHkcfysmZorLFtLzsBaqix6O
         KoyXllBGLXxQn9cprrvtDnQMI8BjeaIDZk8f9+50F6fY2pwKYexxF2MJaqGW76MsCqc2
         xgzeU2koDxiPTotK6LSftZcp6Rag1aoKgPSBJVbDU4Z7WJbw+ZlE7FdbNDLd/2o3cHIy
         Jh5kd4SkPovpYHNQZT4lO95hWaqZPfzSI8NNZb05tFz5zEtCT0ERIbWXcirkqgK+LVb1
         31Jw==
X-Gm-Message-State: AOJu0YzSrfLZvU2I6H6ILS+LJ2yNHJ82p7MprBNPK5zL7SjJmYZMjvAk
	wtQLthi0O3x9LDRTDJDekhlwdS41iV/fRKAGL7vC2v6nocNMxQ==
X-Google-Smtp-Source: AGHT+IHLvo4n3jRrOJJlvhjrVYQ/g6Fn81N0XUQ2xaqz/hWpWdlmv3x0k3v4kD7ui2p37Wlr5pfboA==
X-Received: by 2002:a17:903:1248:b0:1d4:9ac9:eac2 with SMTP id u8-20020a170903124800b001d49ac9eac2mr891077plh.28.1703864741383;
        Fri, 29 Dec 2023 07:45:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 20/41] libxslt: upgrade 1.1.38 -> 1.1.39
Date: Fri, 29 Dec 2023 05:44:34 -1000
Message-Id: <7828e780813857a6667cb07472a0371823781e9b.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193037

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- extensions: Don't search imports for extension prefixes
- transform: Check maximum depth when processing default templates
- build: Add more missing includes
- python: Don't set deprecated global
- build: Add missing includes
- imports: Limit nesting depth
- extensions: Report top-level elements in xsltDebugDumpExtensions
- Add extern "C" { } block to xsltlocale.h
- python: Make it compatible with python3.12
- date: Fix check for localtime_s
- date: Fix check for gmtime_s
- pkg-config files include cflags for static builds
- Handle NOCONFIG case when setting locations from CMake target properties
- autotools: Make xslt-config executable
- tests: Structured error handler now passes a const xmlError
- python: Fix tests on MinGW
- fuzz: Fix xmlFuzzEntityLoader after recent libxml2 changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 48b353f3fb8e5ab1853cba7faa3065d2fe6f36b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/{libxslt_1.1.38.bb => libxslt_1.1.39.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.38.bb => libxslt_1.1.39.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.38.bb b/meta/recipes-support/libxslt/libxslt_1.1.39.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.38.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.39.bb
index ed5b15badd..2cc0c84bec 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.38.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.39.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1"
+SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


