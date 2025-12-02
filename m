Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626ABCFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:29:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4220.1764667776500332159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=S1pVqguc;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2ce8681eso1991541f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764667775; x=1765272575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC8i75qQj+Tufo9rVRpL2hfdsju+sfyfMuCMJ5azxjY=;
        b=S1pVqguc/ve4DH/XY31QqaaejTMwQhA1HE6twoj0aQxMCCjTTfpcPQuJdCm/KBmXEe
         rhrOAnodso59Myzp82bSINlcjOgu5tNgEnsM6UrjLHvpXnN8/EzTkwTXr6z+3T2cyKE0
         BQO7PAKf324k4CoRy9EZUqaPBIvXiPVVWmM8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667775; x=1765272575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mC8i75qQj+Tufo9rVRpL2hfdsju+sfyfMuCMJ5azxjY=;
        b=Tx9ejpzKqiSHe7PuxFnUbIlncpOgn4KHn6l8IcUNIRX0KAiex8qg3aUn6O0Gwf9xTQ
         N1/E8tTOTeeNNwEmeL38glPxrzO+nNeVtyCnQhcDYXZf1vTBLNcvjahNDFnc3Gw1B39V
         EmXK3Tz55g7ieKqULJnbi+5QVrGYw2jHLp9gfiz+L7/FBUOtzMGZoEoPo7OJEZoVnBP6
         UYr5B25C5fd7nlrnZK83/3YH8YHR6zbHe/wg9jXz8s++FIVoZEflAGWTvmuOmSV2O6wK
         Vj4n4W10DMeKxQnU4tCo/Qa+5/TEfB/hIT0+SKxFb3wA1QTbFfnz0MDP6ScDZqHQ2tTT
         yglQ==
X-Gm-Message-State: AOJu0YzB7o3/JFu1B3Pnhf7GtKqR8rbhtpdsc9oFXLcL0Qi2IrQym6k+
	ZeqofxH1f4R6H+c4Iq2bqy440Rr9VjhK5A7esmwyaXw3DN9/TThb2/VWpQnTx379qQ1UEOtxeWi
	o10Zo
X-Gm-Gg: ASbGnctppVI50AV3TzbHurwA1CzJKcbsQnuBfPJuHHy9zLd/fq3x9r+NqjlC2uEQ9GJ
	R77E+bq2vbREmdM2HVgLYzAuhJ87Tc3GYlqmq9Nhu4cW2ps0wHhnmlEaR494tphVeFiC6cXv4bR
	n62ROQqkivazTIU1aHbcav+dwyeZAIGUrYKzPIn50Y/cZLHCuG+Q3hHyoRrdqAixjxfo6ACOk9m
	TF5CWDdkV3LS2SsuZeQxAXIcSN5d3Ep1T25nbaXFIy/iuZiBlxb33D6f/Vu5NwIWOj40r5MpmEM
	knLR6QsnESC8wpkNwPg50tnZawdxEwT/syw8Km6WqWvqSnGdsD4LUH1AMmnWR6tU0FxwCvLN+LE
	X7Ey3KoX6wMgYb4khp0bj/oFO/YNTF7qoa88VwVT9xWxmtIkIAyZryN+wzdvZfRRyYf0X6qKlYV
	DIiSIY3yc3PYojDv0wsF5pKd8Z
X-Google-Smtp-Source: AGHT+IGymMMVwPri929HcwHh5RTxeMOR47hSZ8wiin2iy06qigsjdIY0M0NniXC4w35Gt8FJlUEoVQ==
X-Received: by 2002:a05:6000:1448:b0:42b:3090:2683 with SMTP id ffacd0b85a97d-42cc1d23070mr42771595f8f.53.1764667774649;
        Tue, 02 Dec 2025 01:29:34 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm32148400f8f.15.2025.12.02.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 01:29:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 3/3] python3-docutils: Upgrade 0.22 -> 0.22.3
Date: Tue,  2 Dec 2025 11:29:26 +0200
Message-ID: <20251202092926.1370646-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251202092926.1370646-1-leon.anavi@konsulko.com>
References: <20251202092926.1370646-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 09:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227154

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
 
-- 
2.47.3


