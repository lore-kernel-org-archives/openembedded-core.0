Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44A3C54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:29:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.23914.1710512970055352179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ogfemc6h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e17342ea7so1161094f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710512968; x=1711117768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkNtIhubYTJbIeT02WA5HxIEZZtXkBl4SwqlFqFTUVU=;
        b=Ogfemc6hjQWD6Zd/+k6wSCGYYv/tB8w575DyRyMTrkY0Hca3N3jrIepyguRSh67s8j
         dWuqSd4U5Ocuz2wBcIBLDH/PY4hramtTKbgE2Vcjw+gFfbDna7W5qYSoYERx5A4lL20f
         6NMeAzJx3+DiCaoCE+HC3130V15d6iwgQUhyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710512968; x=1711117768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkNtIhubYTJbIeT02WA5HxIEZZtXkBl4SwqlFqFTUVU=;
        b=VftySsGmy0KggsgJ4ZycVBIkmJYTo1GyAGFXpbZsy8FF+m8drrTbrEHTdXc4WONWZl
         sK6hiiP+wiIephv/FLsd/bnfvQzQ8nwFKKRNMFNwb7ZCeirBbp6NErqecTKKLGiAbZZY
         SDXWVlQeqRteGwVKWvTogAhgaotqG3ARzl4fVkkybUpxMXgcH2fVWi7xTZNadJb4+yCK
         kqTIUSI3TqmOo/XNVY86iiRreXIzTw2VXq8S0BVnyTxyoTV//eSQ5iJYEK68d2jLocz0
         EVYcq8qba34/c5ZyWCKA12uUt2C4aquHM8xynYtl90dfGvpFeGlpggzBCJqixcvxsem9
         Bn3w==
X-Gm-Message-State: AOJu0Yx6gfBDNzPVo+F4OwD7iEK/af4xk/YqJdYa0CBYFt4f/udCLQTy
	101FlLHdtdOHJ1kx3cHFIb4AavNeZCID6rl5aLfj933qYLSJex/tKUHgyRmOf2y7bhNix3ywDz4
	L
X-Google-Smtp-Source: AGHT+IHfnwmIxOCxejF2g5BK54epDWoQB8msERlmmqwiOaPrQYDwyRcY5Gs1fg2oyhzyPz4DMY/SFA==
X-Received: by 2002:adf:f5d1:0:b0:33e:7650:58b4 with SMTP id k17-20020adff5d1000000b0033e765058b4mr2475828wrp.27.1710512968142;
        Fri, 15 Mar 2024 07:29:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6f03:430d:44b8:f326])
        by smtp.gmail.com with ESMTPSA id dz18-20020a0560000e9200b0033e73c58678sm3315477wrb.15.2024.03.15.07.29.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 07:29:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] expat: Upgrade 2.6.1 -> 2.6.2
Date: Fri, 15 Mar 2024 14:29:25 +0000
Message-Id: <20240315142926.3832940-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197131

Includes a fix for CVE-2024-28757.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.6.1.bb => expat_2.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.1.bb => expat_2.6.2.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.1.bb b/meta/recipes-core/expat/expat_2.6.2.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.1.bb
rename to meta/recipes-core/expat/expat_2.6.2.bb
index 9bdc3b6206a..6c9db91bef5 100644
--- a/meta/recipes-core/expat/expat_2.6.1.bb
+++ b/meta/recipes-core/expat/expat_2.6.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "4677d957c0c6cb2a3321101944574c24113b637c7ab1cf0659a27c5babc201fd"
+SRC_URI[sha256sum] = "9c7c1b5dcbc3c237c500a8fb1493e14d9582146dd9b42aa8d3ffb856a3b927e0"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.40.1


