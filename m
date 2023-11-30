Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D74DC46CA7
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8241.1701381738833526135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Mec6ER9P;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b4746ae3bso11022045e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381737; x=1701986537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFVKm4pIe7h7Dz9AfxUKNMWAtw4drpneJh8hJVEETnQ=;
        b=Mec6ER9P4Gk6ok1XQHZbaeyRqSC7QQ9UCuYjopVTsAUt+9/BqqtlXXOfydUTg+KGhB
         2H/iknSGmKChzsK/PQygZ6REpjvimfG02sgxYYBvqWYYFOGwoHzKWv1g5ijumttoYQYw
         WEh0ys+o6nAYSEDkAg/YA9lnAPzsbhDfBHBXnrij6DNXVxhWSctW6b89K2KOz+fRQg5x
         XjXGsvQ8QNHkfShWgPe0LW4LEVuaXzEN//yWnsxereqnNZaf2z7XmyTjAZKk990niYyz
         CjsveEKBIgEDi2zk39tt+FlsMUwKtVnvTNV2YMmauCkqPCZ5UWYp92s6dG8rbAgD2O8v
         zEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381737; x=1701986537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVKm4pIe7h7Dz9AfxUKNMWAtw4drpneJh8hJVEETnQ=;
        b=kFbieQWow3LOYUhTLEfDuGnsiSfOEPWXK5xCmJeceHi2S6ibwv04PEVI/e1vCdNrEN
         PqQbyrCIeK4iH8IGnEh8WJIKtRh2ZlAryayip4LzKOGBR/9JKN6wspJupknu4p5eGpcO
         7ISmqIKUBacLkYM09MBFeTHprw/c+s18M6On9QKk44ICy93EoSVnjqfLco7R8z7uGqRm
         8YLYL4BF9GHwa4Jv8TfYSCZZggZ9e0BKrxCwihtgLnLcM+qwc4J2x8wYtLczCaWcgZwK
         MM/oP2GKjjiWsyAAVW9HX6JdHDEns4cplp2fLmdUEbS8x724/3J5yHEHTRDd5MmLMDZU
         Nu/w==
X-Gm-Message-State: AOJu0YwwWzhxyaeXAYBZoMzRUcwpaDeX7PpCD8gTxRDvhgQDAsKx1hkw
	nh4R3L4IDIqjyByJC3a9ILMcTTa6Vd05WseRtFULAA==
X-Google-Smtp-Source: AGHT+IGkwN1X0DKDcMOlyXLKg30hfuomn0IVlupkeW4WW20XxepnqtggSaQ4k9n3znHPjCzBIo45rw==
X-Received: by 2002:a7b:c41a:0:b0:40b:5e21:cc44 with SMTP id k26-20020a7bc41a000000b0040b5e21cc44mr67787wmi.111.1701381736739;
        Thu, 30 Nov 2023 14:02:16 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:16 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/8] recipeutils: bbappend_recipe: fix undefined variable
Date: Thu, 30 Nov 2023 23:01:50 +0100
Message-ID: <20231130220156.726263-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191546

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


