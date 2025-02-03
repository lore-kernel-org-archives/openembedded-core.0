Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97964C0219A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.92323.1738600935701454218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QoepYst6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361f664af5so54334445e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600934; x=1739205734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnROMy7NsEfcP4WGI8jZtK/9Hw2H1vZnvg2wq+F8F/w=;
        b=QoepYst6ZAh85SzDgAzYJPJ7WlpZN7RfxyvINEdpIyyFbdyevHlo+b/C6ajKo+HyFd
         S7UPr5Sfb2z+NNShxJejyN/EvI8bVTf/3RO28dJ7ZETBcKxC83gDjZi1kjKavEIDEnqv
         ZG0BF5TAC3lJzldUoEmHHnrutAiQ/4/mwNr24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600934; x=1739205734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnROMy7NsEfcP4WGI8jZtK/9Hw2H1vZnvg2wq+F8F/w=;
        b=emUIMjvCuh4C08/+ZXdyeXk/TH1rJYqqh2Xr1aV6/659xLqCo59RJp+dDa+EkcBHBd
         lPj6XvI37HQ67NS6C7xOPOUWm8Yzu4oSVTJ9YJg+F2F7b99kCEdTARTdTdwvydnbAjJl
         JwEwBDUYOyshrOd9Yb3YQ1unA3egb4WNgsXSUZL29vNzAXbW48bXYLnCyAN6OY5y8sSM
         6DBSbv+LFbrYS0JcZu/T6l+UaASQnYsmO9r5p2BflVQsRrJdvQffCkS9TWnDZEnm2Txm
         7bVHOZ2TzpG97No6WNcUkwgI7swwjJZ6l7qupE20rad41AysWujbcbWTkC/yQX9S4yj2
         HREA==
X-Gm-Message-State: AOJu0YxZjSXSCIslaQbG4ZqMoExbP9QaMBDxWO7J1VFwKr6TufQ2ee+Y
	ItSFeIn4q9nEoh+skbFH+YmFdMR+wgCEDS667fG4CyVdRLDCojTwNWICI+pYz7ijJE7V5zcftLE
	X
X-Gm-Gg: ASbGnct4rliU88bzHhN9ubFfuKLW08Kx3oWb/SqkxzKPxaXWmdHMUGZ6NDfbxWHBWW/
	ZQXTrEZC939W6P0yYvjGNn8WhoPJU6KMOXSI4teIlxrWJPhL81pl+n079JvPxwKLqD7SzYbsgwE
	vtG99av5HhF6mU9ggOJHfvJzn6Lx8B1JMyzDfNN/sL7SBNev3toxfzKuPKTTGcWu+B9ao1wfpRS
	Un/tvOjB1ZrwjWeJtnKHM0hhG0eolhYMPIBRn2/dbKPHuHM0EUAoAxdUCnxIY1sVD6edBTE7RUj
	S5X0bQ7rl3hVPx4ZA3n0rIRpTtZOpye1rS/za/nHlpJs
X-Google-Smtp-Source: AGHT+IEJbh+6GJc5fKFRWFrcBTT2FLsEEtOmEQFwyEYW1E/Ft9CSzgh4lDeLoQ9yFMsSzmRp1F4zbg==
X-Received: by 2002:a5d:59ae:0:b0:38c:3eca:b30 with SMTP id ffacd0b85a97d-38c5194a7e3mr18756365f8f.14.1738600933808;
        Mon, 03 Feb 2025 08:42:13 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 40/46] python3-trove-classifiers: upgrade 2024.10.21.16 -> 2025.1.15.22
Date: Mon,  3 Feb 2025 16:41:24 +0000
Message-ID: <20250203164130.3403325-40-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210713

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...24.10.21.16.bb => python3-trove-classifiers_2025.1.15.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.10.21.16.bb => python3-trove-classifiers_2025.1.15.22.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
index b63d39b7843..eb7eb30554c 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3"
+SRC_URI[sha256sum] = "90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

