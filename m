Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD17AE77178
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8185.1733294992811861155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ktjjY1O8;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a95095efso2855275e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294991; x=1733899791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThWlSrzPrGl7r8/xzVx10QYzh2Z0YrBSfXx1dzqM7Z0=;
        b=ktjjY1O8pu/oQawWafEjZ4VcvblHCiS5t+JSKR3S25Pu3w/kKsfLIY+DmTSBWm/GV+
         ZzEZt2i+nfosqLwkY3rFNXKhSy2RPHHYX2oxrLM3UxWGPazNcYcsVR3zkWSk0udYyBFS
         6u1ViSTvqfEZOZoRzoyZ5wloxW2bu5Pw59g+yh6dF8Loe+Se9INUYPNvpAFQ+vkjvDY6
         okpLRSZlMSfmHoHOm04vZICRLExlecNL7NfXKCp9wJEncD5CCb3vs8S90D3+oalxlXzh
         UH/TREc8KlChukxHoTnXfYbqL5xrOFO6Kabfe2l7RCXClIamSA4zIvfpPDpeLbvtlpUK
         6H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294991; x=1733899791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThWlSrzPrGl7r8/xzVx10QYzh2Z0YrBSfXx1dzqM7Z0=;
        b=p6FAdOsc0Bl1s2eUPJep466/4MVuzYFcXyVmivYR9agO5yDp551tBOPACjVSkvm4Wm
         uM7CjwVkPLNqOXV7RmxoGosbebqG0W4Tmd7U0eTkhqu8VBzg0l/FT4ohnsqhKE0WNC4t
         DO2LoULuXkaSkpUZUOg1dfbBsXHyIxyJ1ayAKzc605wZDKJEiUwBbsxgO1BLtRvYtx8q
         pcP/mnYZH/MQ0bK+dG9ZUAzgHtyk2iRLnIaPGb+n6664dB04G0vRjRefzZV6ZT8qYJ9Y
         8SQJmI90LCgnK7XaEGWpWbFMZ/tIOFUNJcgcxPddoiIOwoWZIUcdaCSr5gs+ok3Hrqj8
         oUjA==
X-Gm-Message-State: AOJu0Yxs0rfc83qBAQOxo23sIf75iWNYs2PAz+VnmaGjn/FQLSEwsrQs
	5AE44HZWFDc6X2UIehONhI9uoGp6kWb7vsxhuFP0q7RzfXTNapA5rDJoHg==
X-Gm-Gg: ASbGncvYmSPlI1RwK6QFarnHXskDHWgXH4afAAwezIX2dXCJthncU/qRkMOCcx+wNvh
	nuSa8hckAuMRWLMDJdGT7X4OI19Wj3ETCUwY7G6Xqu2TFHSqGrnJytxmz3HCjH+JlC6mc6B44Ko
	ZNCNAA/qoIMgHkfFp6Xolf0pSpGhOsjvjNViiKtdoCvdbK+Sq1GFt3nFLCfw5qy6cy9o1ZvLeAE
	9lYWqdrxSvTQK6vaATySl3EOcTZJb0OYw2hsWpusXVMDppqEaCGvcj52pWbMJWTQW4b/zqmFRLI
	luu6EbDo+sw=
X-Google-Smtp-Source: AGHT+IEgJIz74fqGqBeG3hTR7HYVfeohb05TksquOeyUSgr7DVINFC88T2VK4qP/r6z7rgeKIfIemw==
X-Received: by 2002:a5d:5e8b:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-385df17230amr17363090f8f.20.1733294991077;
        Tue, 03 Dec 2024 22:49:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/37] python3-markdown: update 3.6 -> 3.7
Date: Wed,  4 Dec 2024 07:49:04 +0100
Message-Id: <20241204064920.817016-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208250

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-markdown_3.6.bb => python3-markdown_3.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.6.bb => python3-markdown_3.7.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.6.bb b/meta/recipes-devtools/python/python3-markdown_3.7.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-markdown_3.6.bb
rename to meta/recipes-devtools/python/python3-markdown_3.7.bb
index 7c648373957..619779d7695 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.6.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.7.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "ed4f41f6daecbeeb96e576ce414c41d2d876daa9a16cb35fa8ed8c2ddfad0224"
+UPSTREAM_CHECK_PYPI_PACKAGE = "Markdown"
+SRC_URI[sha256sum] = "2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


