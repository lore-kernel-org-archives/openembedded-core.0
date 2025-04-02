Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B12EC36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2278.1743577926764644930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dvlWIADV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so21801045e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577925; x=1744182725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sht9dAoMcIDn+9AYl05qVkhnFLJkQ4tRu2DjkwlER8g=;
        b=dvlWIADV0ZqjXwTdbpAn0F8kjKm8EljaoQEdufHeAltCwMdYacruYV83sfltNO7Lbe
         ab52lpfzOSXlags4jZ7qsnb3hrhgResMQxzSntDb7Drjdl3JWDfOyrT4fKSvW5rCHdqv
         H4Kbzl3qLarOB4xHgSD97yt6iUgKJjl2aFHwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577925; x=1744182725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sht9dAoMcIDn+9AYl05qVkhnFLJkQ4tRu2DjkwlER8g=;
        b=JXss8izcdldMxwtWnMaT4dthei7W+RMTi7HbTj75q0qQdIl6VPRyTjNy9Y9ZP0VS10
         L9LSle8hlwWCqGNrIHam2JUU+Y3LmnBGjRbOhplm+lDgrbELtD2Pbe2JLlig3n8b0Tvv
         FVIoxgqVOUV4wTlMKStl5lgh9HHV61s5eIItPtKqNLKZXqjaTL3GKMESpXceUYlBRtnI
         cf8FvSqb9zkjYWatBa60YLhqWUO4MTMjcoVlHs/76e/pr6Mv0gY//X3+OMwRN3w6kU72
         qKe6zLxcNrwh8fOP+KfhvKqWcAVP6BQkJJK0cqfqXLV97Kv8XjEYk5dRMQ2TMe7l0Nwb
         Ktmg==
X-Gm-Message-State: AOJu0YxXpIRF4UPqZC3ZuSD4BbuoYQbyNWoeOE0ohvOHfKfT0xGEImQX
	4KcugkiWhqpz+SYsgkU9g3Tub17IO9d5h0NXcQUAyxWJpl9Cov0UT8RU3O5goEQEYQVa1Sz9jo0
	6
X-Gm-Gg: ASbGnctxatt/RT2vvJnWB2X2e8CGo3bCTF9Fte9MGUkVCmocFzHYK1hhN9eHOEd1vPB
	YYe97w11/9PEj2MPJrsqUngq8t93aHPzCQaxhJ1cXa7BFHKgEmJc9WHemjYxFH42pH2ZeIs9T32
	w4Ahpg4SApiDIPGEE223Si9rUJl8XRXyBy00An9rbTmdQEyVKBVWvMNZPSMQBtBp9ao+hnmoKWo
	/xanhnPdx/fY+StyFDaamqh4OKBbL/7z/ogOnsZwnYjaRhglJMiqASt4zOMQ0Zx4wWWhxf1ZGAd
	J9IgPdpTThRG5g2gA9xyP5l2lsrlEYvZKmCNFPqbd0dHg1bpGTqPBhsNzMK7F4VoyTSLsOcjvw=
	=
X-Google-Smtp-Source: AGHT+IHJgsSRhE2uzeVwDSkqrRS/DetNZgLWB1l2fwgEzqPG9nLkrm+TS271vDdwam4wZ0XFqg3ydg==
X-Received: by 2002:a05:6000:2411:b0:39a:c9fe:9710 with SMTP id ffacd0b85a97d-39c29737f06mr1038482f8f.11.1743577924645;
        Wed, 02 Apr 2025 00:12:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 41/48] python3-typing-extensions: upgrade 4.12.2 -> 4.13.0
Date: Wed,  2 Apr 2025 08:10:10 +0100
Message-ID: <20250402071017.2157620-41-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214214

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...extensions_4.12.2.bb => python3-typing-extensions_4.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.12.2.bb => python3-typing-extensions_4.13.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.13.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.13.0.bb
index 7bd23e34703..ea946849a72 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.13.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
+SRC_URI[sha256sum] = "0a4ac55a5820789d87e297727d229866c9650f6521b64206413c4fbada24d95b"
 
 inherit pypi python_flit_core
 

