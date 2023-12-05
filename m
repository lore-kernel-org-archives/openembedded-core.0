Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45633C10F07
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.102643.1701788206946868454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=r2FZe/H9;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33349b3f99aso1833427f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788205; x=1702393005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YW8I10SphgwVLiPfFzoRVuNLZ7M+DbpYVIH2mODBBFo=;
        b=r2FZe/H9F1yrs9VSJftH3mOZqgJFs9RebeRICsLMkdL9oKGykSrIZKsqAAeIvFF2gE
         hE79Ij/9uQo1OWXLqN1UXoWjAizhqRvFScZhaGUm7a+P8joPA236MhT2+2UH33sUaQls
         q0DGDyLZ5DggNmH2zEZH8mBw+cfc7MPZBRkHUOHC32MIg7e0M51xBZYFTxEaugUdiOtD
         y0LXxg7gnwM1f82DcPavDXkHh8ha1pCH7dScG+WPOlbgchys7/5HR+Gl/Fo8qF1v6NDV
         Ha1CeZYR2aOfRj5PIoJLu17QYd5j49S+Y5uyLzFINqsmoalbf4gSVeluXgeUIOsSkmDb
         aV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788205; x=1702393005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YW8I10SphgwVLiPfFzoRVuNLZ7M+DbpYVIH2mODBBFo=;
        b=Op3IT9ktl7RE/VQqtFcRxGCTwCWGVH3vPK7pdOI+gBsK7HFTw7INeZn15tX+8cbzJh
         qUNqVqzDLUnZ5hnO2OW7U0qtD9l5vF1SNnO5w9hrunKrEqxYrx16uE1Qpx5MAQztYbAW
         uiSSK/hzM9dw0KP91hTJ8K//5NHa3YvmXMDSskfbKbNnAsuL4lqX3RlsCXqs++SLswxi
         T5lKflAVzg2Ca63BNJXYJiL/n0HE4VzgbyVRGz8m8ngJpWLfADghN/4cG3cpDGqv/p3b
         8e8V3kajPYo2TKpOwrAsyxfHpqqy2n4HBrSiHcSR8OQaH9M6bZYRS4c3xUQLfSURcYHN
         2Asw==
X-Gm-Message-State: AOJu0YyD6A+7ohK5wLtvUE+jxCiClE6vF3PMFWRDGXGX5S82RYlkcml2
	SAEmo/V09SzdoYQ8kstHkrTy/fZzONYh0/NuHNBEcQ==
X-Google-Smtp-Source: AGHT+IElUyy3IzRlKIhT6fRGVy/Z0TtS1PyrrQkR9iE9rajwNkzD2OMmw6QuDVFFFmDOK429SvST9A==
X-Received: by 2002:a5d:58d9:0:b0:333:2fd2:51ff with SMTP id o25-20020a5d58d9000000b003332fd251ffmr4324470wrf.120.1701788205353;
        Tue, 05 Dec 2023 06:56:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 02/10] recipeutils: bbappend_recipe: fix undefined variable
Date: Tue,  5 Dec 2023 15:56:28 +0100
Message-ID: <20231205145636.960819-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191830

In the case get_bbappend_path returns None (could not find the layer
containing the recipe) the error message tries to print the recipefile,
but it is not defined. Fix it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 25b159bc1bc..0aa6d0593ed 100644
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


