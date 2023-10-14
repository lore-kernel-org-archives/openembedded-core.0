Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F49CDB474
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:31 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.75723.1697319931046798715
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TTjg5JKK;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3574297c79eso13278085ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319930; x=1697924730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtWA4+Syq1jE5Y9/AF6Z37F6KqpOgIBCYPAD1rGAaFA=;
        b=TTjg5JKK/hU3ThhFH7PtvAcnd0Vstupkqq5cjygnh0OHNY+7oRvIHeZyCovDIrtEg5
         unbKkHnkDUhPWUsNOLczJsermLs3cpzuxNg9Ij5N2ay79WJIjAXY016qSNh3+76QQLf5
         SKXLJPbdVhzBQ+x3Rvgp1CI6NIG8K8hq6n5BS905YTrY3hQ73Sa12dYWlVcSb5+qkjAI
         aErpu1uJBQZGip3rGc8Y4PHPEw4HVV0jAbEyMuzSCPtCqsVbm18j7/iB+GHP3V3kr7z0
         UfGfGGsI+OJ4Iw5revDr+LaMjvmGeTlG91GcbzqIQzbWMw4sAwR6S506W9VnrH5UmGxM
         cZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319930; x=1697924730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtWA4+Syq1jE5Y9/AF6Z37F6KqpOgIBCYPAD1rGAaFA=;
        b=TgXBc/005XtDroQXZ27gjE4NOt5Ccj35sD9CS8T9T7dIpy3n2zFcUgeoz+7s0JKZd6
         46bvg7S/ZUA6iMYj9yCf1y6pGtifi5ZD5We07UVZrWm4Cjw+fEwKBWbnCeeuussO13Ht
         +/z5LCJpSwzo9FeA0lfzVNUlLqmw7WcC1Sxk7tw5gqfS1QcJ8ZnQr9P5uJq9Y39i31jz
         8FoNDncPuQFCY/YIZPvtH4jmX2f3uoTh7Z8PQAaStE4yaNkOHUv9dSSkHhoS8LXvXxM/
         0ZL2SKNGzJOSIWvU7HZ33aCJGGi9NrKjYrd58SQ5UWZE+4ZK+X5wnlq872QmweqIcpWK
         lYoQ==
X-Gm-Message-State: AOJu0YwQIBQ94jyhB7sVPCQtZWx/Pe+FPqkewEHJDmUZrT2i9JZNSgTl
	PWmCWyCX6oJxvidTyKptOkUBijyPQblwZEgfWuw=
X-Google-Smtp-Source: AGHT+IFpzlXMfH57n+PgmK85IiPYDIjdYMdjTjVNunguS44QFuEeLm57WpiYjMjKIhmwR3/od00LpQ==
X-Received: by 2002:a05:6e02:963:b0:34c:e84b:4c5c with SMTP id q3-20020a056e02096300b0034ce84b4c5cmr26374024ilt.27.1697319930036;
        Sat, 14 Oct 2023 14:45:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] python3-urllib3: upgrade 1.26.11 -> 1.26.12
Date: Sat, 14 Oct 2023 11:44:53 -1000
Message-Id: <69a610b440b5e9e92931e43bd1c75230bb99f03e.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189132

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cb05578af3ace6e3983f93e16d9ad1ac2a65fbe2)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.11.bb => python3-urllib3_1.26.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.11.bb => python3-urllib3_1.26.12.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
index a8d47de0f4..1cd69bcb10 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a"
+SRC_URI[sha256sum] = "3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


