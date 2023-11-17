Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB00EC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:12:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9415.1700219563959808441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=vf+7wHJj;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso1323506f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700219562; x=1700824362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALFBlN3RXfM8G++9dipMmPS4BJazwTbEs56PXQLqvUY=;
        b=vf+7wHJjB8w7tN7sRt6Zp1Qy5lGNXBwR4Ob099WL/lbdjaZfcrH0rI42KSvtF3trUy
         FUl7jXHruKzUos1kAcJ2YZhKBfdj4MztIbW84uj0Merp0BqceYueiWzql37bvTjChZW2
         /GM6Vcwt9eYPtbaJJJvYgI6bUy1NkqwrYimFhj+s+bbpB0bOYOJbQUQtMY0XnL9ifdRt
         QiY2NhsQJI1qQCrGEBIstu5dFywbUqnm/RSXymcV/L/EizPtWpspwidCiHbtoNk6n6DX
         VEbarQjPrZOJr4rrsxF7J/wRRjIbYibA+/oCuoWDE8/CphJ9rVZuVHLt8rt+pOqr9onI
         o8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219562; x=1700824362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALFBlN3RXfM8G++9dipMmPS4BJazwTbEs56PXQLqvUY=;
        b=IsWkDHMlRBvqRRlZUw5pfz1463dgqO2r+N7Wf2SpTzefbwra77YIDROlPoyjiMCGKU
         kJPekTAy8iFIH6TD9PO1qG6vqh02FGjOdk9tQLZUPhfEl0nL1GQDham9K0yfvWgUEXz8
         5c8quXUsKIr3NG64hyJsgEvT8sW1zKIojeUJcA82j0dkMAw9sxRdLmeMKpAOGzDfhInp
         KEmrub4icxJ1tzDUNDFxYd28xEQIvu4uQqhKoQivvo2YaiQDF+nHl2pWzWGotFEcveAn
         5QBHKpcXf1ohsuZYvYdsAYObN6YpC80NhhRIvEBA6GiIIq4Ziicbo3CCkQn4o/ru1I5z
         ZGfQ==
X-Gm-Message-State: AOJu0YwzE/LgQasgKamdNrL21tRwYPKjC45h8ovlUKgy8UwHfhFRX6dm
	jZ96qQdu23sd5gCjthI+gkAYj0iZGV7/R8ovHqBDCw==
X-Google-Smtp-Source: AGHT+IEpG79JYfs8FZpy7VFy+eHos6ksLfVEgn7tJxjwZAtIzInIX5F6h7sExWW8TtICEQLjsxmldQ==
X-Received: by 2002:a5d:47ca:0:b0:32d:82d8:3442 with SMTP id o10-20020a5d47ca000000b0032d82d83442mr19285529wrc.53.1700219562306;
        Fri, 17 Nov 2023 03:12:42 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm1982440wrp.28.2023.11.17.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:12:41 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 6/7] oeqa/selftest/recipetool: remove spaces on empty lines
Date: Fri, 17 Nov 2023 12:12:17 +0100
Message-ID: <20231117111218.3344066-7-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117111218.3344066-1-jstephan@baylibre.com>
References: <20231117111218.3344066-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190842

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 55cbba9ca74..4bc28a4f2ee 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -853,7 +853,7 @@ class RecipetoolTests(RecipetoolBase):
         self._test_recipe_contents(deps_require_file, checkvars, [])
 
 
-        
+
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir = basedstdir
         self.assertTrue(os.path.exists(dstdir))
-- 
2.42.0


