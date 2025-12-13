Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB5ED5AE7D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2918.1765620128225403263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AF7+MvUY;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29d7b8bd6b0so12861455ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620127; x=1766224927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIzGANj1dOKVoVxkqgX9riQr/O/HZKMXQz/JbeJ4neU=;
        b=AF7+MvUYt/kH3s7f51nJq3RTh3NaIn2xFI8SZyW32GuOjJLvQvve6AxsmYoTLawi7L
         R/x6Xi38uiaZA05pHTBPp3WkA0m3liBzQGhK5MK2AOyRUkzbtu3jtQtWGoPtgAQq3vQA
         TWXNjWzdNdGPYGO0zaytSXbmdyzFLHyBbB7OmLp13GXBcCZVFuWTBcR7h+DL5HfSFUUB
         HmZx2eLJOiunp1eoor08YSYjztomKuRh7B6r5InXhwdJ7jjsZXj8PPEj+mvglAuZnlt1
         QtvTIhx67wiATBUGx7AM5MjOptIxXDYX1qWQ0Svrehmm96rSpHdlnEYObwdIGUi6FPPm
         i55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620127; x=1766224927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIzGANj1dOKVoVxkqgX9riQr/O/HZKMXQz/JbeJ4neU=;
        b=HL2A3CKu3RvgA2O59jQQAcxhc6XjrXTIq1NO0t9eGFFC8ZdQOL/LDBgFD/Y1JvEBtO
         6pGBIK6AfNPxVNiUSE6DLZEajahPc1T1c3Laut6Lelu8zuLWEONQZkDdNfE7aEeabih+
         rebsTnwdKqHe3IbCZmDyXANEX3+pqFJaiLq5mJglmBPUgX4vP4ajB3HyR5ytaiy0TXcm
         SVAEzFMlMm32v7ULviF5mU4deiJbw0HZO5wnfbD9Lv+kLsjaMk5/e2JT6i/TmSOCAUB/
         OVZ62+dsJGHJ1Ur41WaxC/MP0dtvLw8kKMvmDXMBhTDwEB8tFYmiZNT1ndGcFR9p309T
         /NxQ==
X-Gm-Message-State: AOJu0YwHpoemWkPW2Hhirv47G/z6sYaH7WhGahms8bjcunoZMOq6f0tS
	xeKwJD2ujOpW9bVV8sYIf44AspIBETYDpl8xPBKxkwSanVFPeK8ALNqKZ1Zbp3Bd
X-Gm-Gg: AY/fxX6iHkUCmkqSIC9DfEDexo9xoZoaFUZ8kLSrPjmzj4M2PJXAlRre18QbscHZzFZ
	+xmKuhsqC0M0gQYMNQs7iChtC8akH0uk5VPb2pP1KGiRomk40M5HZv2dbFwlvvEYu3PlCHzwQy0
	OId0mF8+WthYnPrcwkGyVGyx2bUKwcAebVkw/2Psi/oduMoxJ7dw4EhfcMsxOdif/ff7K8e0N+L
	hc2S+ueMXTD5gZUXZVizoZb3D6jM/RM4coIxIpPIaJuwewpKuDsj1c8/InfOurxu+ejfL5FH5dz
	VaHDIt9J18EUCv7A8a5aHGQJJPh5wZudIvZNhikiX8wf5X3TCBbvydt9GjRJdTSx15eEveZbBSk
	O4OST5AV5jDdx0IIng81sA+SF8K29eo6/HoU4LsnXHIqoygajLeY0exv7kCXwbH6yjbEFPe6mN0
	oSeWFtv/gM0FKa5SU/BKerFkK3nqhMiZbiVoY=
X-Google-Smtp-Source: AGHT+IG1lefI+cTu8IvnWuqr6RVdskEGUw64s20rjWuM9tRtWhBYEk7ZBxOKui+fJ2EWK1SIavEzDQ==
X-Received: by 2002:a17:902:c946:b0:2a0:9a86:4d62 with SMTP id d9443c01a7336-2a09a864f29mr9794065ad.12.1765620127420;
        Sat, 13 Dec 2025 02:02:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 53/67] python3-docutils: Upgrade 0.22 -> 0.22.3
Date: Sat, 13 Dec 2025 15:29:17 +0530
Message-ID: <20251213095931.2571498-53-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227671

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.22.3:

- Do not flag uncategorized, auxiliary elements like
  sphinx.addnodes.only when testing for invalid parents of topics
  or sidebars
- More informative error messages when a substitution definition
  contains problematic or not supported content
- Ignore combining characters when extracting a grid table block
- Ignore combining characters when parsing the grid table structure
- Fix handling of combining characters when extracting 2d-block

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3caa8fdf0d7306844021574d22ed1fad9d1294a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-docutils_0.22.bb => python3-docutils_0.22.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.bb => python3-docutils_0.22.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.bb b/meta/recipes-devtools/python/python3-docutils_0.22.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.bb
rename to meta/recipes-devtools/python/python3-docutils_0.22.3.bb
index 2dafa034fb..a89e9941ca 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "ba9d57750e92331ebe7c08a1bbf7a7f8143b86c476acd51528b042216a6aad0f"
+SRC_URI[sha256sum] = "21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd"
 
 inherit pypi python_flit_core
 

