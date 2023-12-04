Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5457BC10F13
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.71451.1701703575154967904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2sf83vpf;
 spf=pass (domain: baylibre.com, ip: 209.85.221.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so3960873f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703573; x=1702308373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFVKm4pIe7h7Dz9AfxUKNMWAtw4drpneJh8hJVEETnQ=;
        b=2sf83vpfeP4ybjJJEykS0pMsrN5U+Fu/VpeMZghsDKEVckrheWEHOVQtuzC5l+EAqQ
         w0gYDetxpyU7dRsedeh5QeFHykGcBUgOr2O84o+i+ax7BUfJxkHadQdh44BuGnxNRO1A
         4AwDwZcaY8rZJvT/Sm4LQqtBfVTBCT+h/hBrnJsf07MVunxtn1V8ZIPfKKRzeGeLBC96
         dCpXLeQvAAIaYfVnHrCAFchg93rgJgwy5e0uxh2TWhmwo9p3lX3YxejZYyl5JQceTaBl
         F0DWRZzAo4rLPoEN3fBroogJos9e4Rh4YSIFe1W2ROEK+A2bW2jbCAzIw5R+zB1s1jDe
         oXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703573; x=1702308373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVKm4pIe7h7Dz9AfxUKNMWAtw4drpneJh8hJVEETnQ=;
        b=RfJdfoKz3O3AjQ/QmC68qaTfyoz9gFOI/NSuMhfsxxr/MGyjYXXP/r/yDDI9LYHQgc
         wTeUmniVlIX3Gfp1+UWmYkZwZjrmWl3yptFBS+rLELjI45g4M0g/BcOPDnf6++WI9+Vn
         wvRb1d9PBPMAL/Mr2lgYYd7r0DxySDquu1NzZkzKwmZQDGvYhNO18DlUcsWtMjbnQwKv
         TPHhwIo+AcPWJUqJ8KF7hAVbKh+R8fzHvAFI+QDMUgM7JBnkQ8zAd/vkZ1vxXdsV5MWW
         0aZU5ZdfeGnVuq/umjqAaIUuEsmNRDvsNbxZPDztWkoXYKd6nskqzPWEf1zPwKboDIcA
         lXXA==
X-Gm-Message-State: AOJu0YyREIPmBeoQYSlirD7OHC/VWOQOzzOiStGeCvkS0EizzVKRCPlw
	eLtD+P0JoexYMkKHKwd9Zr7e8UKUEdEiLGUztPDD4g==
X-Google-Smtp-Source: AGHT+IGRsj4co8S+x89xKHlw0+nrEeTq65rMQxpw6UYJhUV28Y4H2RwdeUfQsDDYPHDDkBOvd8zByQ==
X-Received: by 2002:a5d:5051:0:b0:333:2fd2:3c1e with SMTP id h17-20020a5d5051000000b003332fd23c1emr2178867wrt.215.1701703572504;
        Mon, 04 Dec 2023 07:26:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 2/9] recipeutils: bbappend_recipe: fix undefined variable
Date: Mon,  4 Dec 2023 16:25:56 +0100
Message-ID: <20231204152603.831495-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191746

In the case get_bbappend_path returns None (could not find the layer
containing the recipe) the error message tries to print the recipefile,
but it is not defined. Fix it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 3336db8ab06..7465a2d0ab4 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -702,6 +702,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     if not removevalues:
         removevalues = {}
 
+    recipefile = rd.getVar('FILE')
     # Determine how the bbappend should be named
     appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
     if not appendpath:
-- 
2.42.0


