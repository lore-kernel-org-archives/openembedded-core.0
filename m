Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5CDC0219D
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.92308.1738600923530386992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VFkDxtqh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3863703258fso3477900f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600921; x=1739205721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1bM/9se1qyNaFiYdpFhZd/cA++duEWN9u+MrTtvYpw=;
        b=VFkDxtqhChOFK84G4pYO0H6e0YVrmvhsTpiYZnwqheMYTqV66/BYBEp9u4lBpvLbLP
         JIQvm5tVp3wDfvP6qO/cE7IK34trgz0A3TS/ohavHXWgASIsDA00V8nRMFgFpHNU4pK8
         kGQu8z/cY4BqghY4GoFvgEr9BGZpVj7fhS45U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600921; x=1739205721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1bM/9se1qyNaFiYdpFhZd/cA++duEWN9u+MrTtvYpw=;
        b=HpACKlZMLJpAKMUkCX8PzpI2hzcXqnCeec/cfOYWxNkHVS5J8VnPkbdpb5YyjaICV1
         m0XfTbpPFQONqDuWHGEXlvO3zClGaNLJiFk+3mzNroMon1zBoF1CxxgT8iTK8YwUAWmM
         7HM9umnifjoc3u1pVVVtW5iLl11VoNvpYHtYvlpzRTSHaGlZcjpxVrqcXlVfauoPAAsn
         u5npwmhpTbng2WjlxMwZo9F0/YAeMNiZwLLeATZjYtc9R1lJjhSbZSwB0RWNqVIOV8SU
         fKE2FOQGiC375S3TpjsPioNav95X+UoOUKshsHPIUba0zTD+blZdHP/7cZr0C+mWowdY
         WvtA==
X-Gm-Message-State: AOJu0YzGUNHSsbWG+bT8e4M0pzXpGW2F34yRi3EurW0Ang6RCccjBOI4
	8mk4FrOS4k/zIMmEmPI4ipD5N0w6DQJh2jPIxhLq1lbjxlGgBOmMfywxxjc4PvdKmJ3LUGi3acn
	8
X-Gm-Gg: ASbGncv5cGjUm9XAXlWH/ejuwcYH30pfu1VwTpgQb4JPMO9sHQtnVOYCBjOgpGDRUSq
	/dhJFP8vCDupssK9rG4S8o/XGWswrWvq6gDBxQHcfe1L4XhVf6+mDb9i+MeaFhYIP17WeIPxdt5
	NBjAIlt05QQttpyzGf2+HTdttlOYMsWTPDNc/xv8jt77pqkOjl57Lul+uEHtoRpcU7QZICBugCS
	qwd9U0sg1CWmZmKtHnWB2AHc56tHPLAes/K2Vp5Iaje1EJxbnlshu5FK6digD0c9DgCFsHdf7MN
	G2C2eRdWdnfKK7Z3MSldDcYNhxYp/QH8k9FiDco6kEHd
X-Google-Smtp-Source: AGHT+IFGV+E4w1T9KeH4LuHyq1X0dGgGYrvhjb/iSVgzA/koNWPWzFMD4evd9Ey6wfmL+Pupt35Ntw==
X-Received: by 2002:a05:6000:1a8f:b0:386:3afc:14a7 with SMTP id ffacd0b85a97d-38c60f1654emr10575239f8f.7.1738600921543;
        Mon, 03 Feb 2025 08:42:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/46] python3-hypothesis: upgrade 6.123.2 -> 6.124.7
Date: Mon,  3 Feb 2025 16:41:13 +0000
Message-ID: <20250203164130.3403325-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210702

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-hypothesis_6.123.2.bb => python3-hypothesis_6.124.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.123.2.bb => python3-hypothesis_6.124.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.124.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.124.7.bb
index 5f13a6ca8b8..6b294ff68ca 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.124.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "02c25552783764146b191c69eef69d8375827b58a75074055705ab8fdbc95fc5"
+SRC_URI[sha256sum] = "8ed6c6ae47e7d26d869c1dc3dee04e8fc50c95240715bb9915ded88d6d920f0e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

