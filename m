Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63801C02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.92673.1738600925760802012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=anck+wgS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso32215985e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600923; x=1739205723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSp/T9dbhGbBa5/6ZVP0h8Z1EJfh503fGVLnCKJwkEQ=;
        b=anck+wgSjF3EDHZqGGrtxaG9sHleFE6aU5asBOtw9gu2KHNdvQxI09/SNq2M6Vfr+T
         9srhJz84uzCJOxyBHCFg4LZ63jruzJ8DE4w+zHqgSN/cQoJ4AmK7NR4JOdbNW/JPOf6m
         CngAUXuOJYqnJOY14SJz9bSxUOB8VThkWVi9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600923; x=1739205723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSp/T9dbhGbBa5/6ZVP0h8Z1EJfh503fGVLnCKJwkEQ=;
        b=dnORKSwpeTuQZK4K/UlGZUUkZIlHIorS/jZmEINnJDjxd+QbsHPrfatVgsuF6Ozske
         luYwpa56HdcKGfdX1I3qB4goT+kSXWNRpSW7nGH/LcbASyMqbK/nRAzh9f5kF8JOOQXl
         DznrthQ7JFizEobUoi+qUeWq5gP3jklOiJsk6BQ22AFi4Ok7o1a2TbhLtIdsgQ0U9aPs
         JK4mpsi01TnNtTPbUQdXlhdwBaV+hCVAUTDYmfVTdZB4YS3yvicV0hUDs2IwJifNK1Mb
         ijI7d2NL7nxHWhQtw6YVK2l1JjplYh62Sxqhqixt3eqhL9gp09AqJadmXhvCLNjwgSAr
         QPlQ==
X-Gm-Message-State: AOJu0YxhMyF7Aqf10BhASy2lGMgzd0L+GM7YasLRAaVH+hPBph1eeMjd
	BSt/kdB/ckrQZVHVZHE99so1tIliL6Qf9BXTsWLSq6bsPazgT6IuVyZdJ9dz6labfJBul5KxnYX
	G
X-Gm-Gg: ASbGncvfSWCR4gCqgB+MJjsDl12RgNOZOKNq/tfFz9AyfK9qHnQqWiqgESUPRRdlvex
	xaB+4aWoUwyPa1LrY7swwoxHdAeBXAFvkb58uR+6HubHQa+vL9uce6VrBa/veAyuuqDCj/BrNDF
	Q/bCJ6TQCZ3E0RZ6t7RzB/qETFCni6mBgUL3DLxTW7hv6iTEFNea6mMlaGEhQvH6hd9vdrAV3kV
	Bq2na4mUhUYgeqqaYKm8E0nMYLZywGmkfeC2XtDEF0oK9ee6J6gM/oDbPoLhZ2L2+JUZYALtM4l
	2lnIw3dIsL3u7rCpy7hVL3ZzZY6GwXQP2apzZk56u5bq
X-Google-Smtp-Source: AGHT+IGO4pFCPS1jLz6GE1e2WjT/jos1Muu/iE+ZerrFJf/uatfWgxGvkIh2XBYjBvpw9U8ICEJ4vw==
X-Received: by 2002:a05:600c:3d05:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-438dc3ab389mr182269935e9.4.1738600923626;
        Mon, 03 Feb 2025 08:42:03 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/46] python3-more-itertools: upgrade 10.5.0 -> 10.6.0
Date: Mon,  3 Feb 2025 16:41:15 +0000
Message-ID: <20250203164130.3403325-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210704

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ore-itertools_10.5.0.bb => python3-more-itertools_10.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.5.0.bb => python3-more-itertools_10.6.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
index eda9bf1004e..5447a7af8e4 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6"
+SRC_URI[sha256sum] = "2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b"
 
 inherit pypi python_flit_core ptest-python-pytest
 

