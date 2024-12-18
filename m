Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5A3E7718C
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.116960.1734559365604890643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mu70b1wr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21683192bf9so1641505ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559365; x=1735164165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGNBmnfF2JsyZwuTBO25CRdBtXZKQytGWrGImw1MM2o=;
        b=Mu70b1wry/sBw6M5uERctEygrxgppxuimsytE8v6IalewvtdKpxPjOWqV655bRBVH5
         B8iQjgD+gXHYx++g/lukN5YlLjC+m95E/+Aj/S0a7Da2eO07HeXudyzoasxQbLaQMssB
         Hh3VZV1Fv3CNkil6/HL3+/t0IMD2omGlhfX/MgdH7dh/QeSSkftyoexU83oiYUjeH2uG
         tXCA79Gn+lPvKfMXyf0o7Zw1JmrY4RQ/d1Rl20G9o+gUJPvdvCUP/ZRzL3WSYvSdOSRJ
         I27tRb37QGy0a/C6BTfwXZb7SyjlvmPEjAZprKHO1lPoP68ejPdRpm+GpesUJJuI6+v6
         SCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559365; x=1735164165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGNBmnfF2JsyZwuTBO25CRdBtXZKQytGWrGImw1MM2o=;
        b=leRtrGEjrx01USzcraqqNtXLH6hqHbPd95qv6IJcMcjJsrAdqqNzpaHI4LyZXNqYVY
         zza3ZcP4xKz4Y1Og2eAXReWc6jz5J7zrG9jKyJr//VwtlHUXEwUWM7A1whEL9v0Ju4hf
         1HXYcI73pKHnSiFnik7qw3C6/HGE97CmixunBxM9GP3wvyYLtcND/qlHWovm1aOqLLwk
         TMwVOtTOhbPHVeChjxMOHUB3ZnZhLxvXVBNxHdEHSnqhRVL8P8Rvge+0yU+xJjJI29xE
         2Zz6RgyF2Mt+apZPogjH3TNgZ+XUwN0m6Q85VhFAxqRzPXsk+U1Lqe9bYYGJHOIHWp0v
         jCXA==
X-Gm-Message-State: AOJu0Yz1O0j2dQJkYH6c4VhliPwM7VFMZwM17TuGnxa35aaNvFK8Rell
	SPLquHj3t9KI1rBO75/o33W0aYXtsOZvMzVZ79p6auQngs5yTMyo3JFvNdW80+bK+IErSCwz0hA
	t
X-Gm-Gg: ASbGnctdn/rMIhfQn8MMT9K5n6HbVOnp2j+7WGqh4NNvgOaUlLsDALW7RpDS6SvPV4j
	GBPfRjhAUmWN/9eG3LM0k5l+ZagGflSBMziW63vsadSFYJFfP4GkgA9mhKh6ijTVg/+2Em1v6GQ
	pzE7gLl+gNB+ldaFz5sNieab9Sf3rVe1tiqfu0pvL20Ox3ta9AWJ7lh64YokTN8k/MA8KuUyXWz
	5Jh+P/QvISiOr+xSU09Zmzx3y0oZm5yGqczOZLtUqINSA==
X-Google-Smtp-Source: AGHT+IG3bm0aLgkSaEfTuYKxI+2tjsNcSTOGxsqn+a0WLBXIiSD9ylgnonZsEV2a6Sp57MyrMYlARA==
X-Received: by 2002:a17:902:eccf:b0:216:32c4:f7f5 with SMTP id d9443c01a7336-218d70e524bmr54482015ad.19.1734559364686;
        Wed, 18 Dec 2024 14:02:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] python3: add dependency on -compression to -core
Date: Wed, 18 Dec 2024 14:02:12 -0800
Message-Id: <05166eafb99cf8c7adb6879277069ab384a2f8df.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208888

From: Ross Burton <ross.burton@arm.com>

importlib.metadata is part of -core, but that will import zipfile which
is part of -compression.

Obviously this shows that our packaging of the Python modules is not
optimal.  I plan to follow up with a redesign of the splitting which
focuses on simply pulling out the larger or esoteric modules and
having a more featureful core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 46092d4004..292c5bbc5d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -216,7 +216,7 @@
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": [],
+        "rdepends": ["compression"],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
-- 
2.34.1


