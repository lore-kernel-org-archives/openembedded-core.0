Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C1DC3ABA5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 17:44:31 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.54569.1745862262460066959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 10:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rm1y2jKz;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-477282401b3so65652051cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745862261; x=1746467061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+wW5szG/T0EceYWx5dW3MJBBLvz9o+v8MHros+ASL8=;
        b=rm1y2jKzNIIJHo6TR1tIKB9/kuHlVkbTMuCye8Ml6FhFH2m8H+eA2+PVWuGo0PaOdZ
         Lzuk69dpw3MZQBrU1pJMvxZTCSNOS5eZbmZF4Oan1f8jLR37kM3nu3seunA1OvQPRRN1
         g1fBmyx4q468JI3oBfxQpvo0iDTOal6wENmmFpRkEh/ldeuzbGV9gLGNIcJr+MfwihQc
         GQRloKTj1eXeX22bStY1HLekgFweTiO++69KOWHt7nh4yozeiWHo//KC0JNm4avngzKC
         F5lsI6G6PlhE2zvJyCvyvlcmtbdbAJ4UZQ5+e+Ja0QHyJSB3ytOVzq5B0lwLpyJt9jCh
         fHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862261; x=1746467061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+wW5szG/T0EceYWx5dW3MJBBLvz9o+v8MHros+ASL8=;
        b=OGr7O/hcfO5ZEMJ4tjNF/Xh8IyDWZHcn3M6mlV+cZcUWhLVVdfL+zUYDIviO8NZ01y
         ysynsMcWQfI5m1Tf/1XiGJV4Lr+DGwDzLPj1ORioIDkEyuVYAv5kxDctS/2mLtmTBoQV
         kIaleBCwGd5IQrdRWAyKVsmcHlfLJU3jq2r0dkNd4nKo1UXieQRIAFvDD/hML/mHu7Cq
         9PzdnmalCJMhxUep/m2GMLPsMUceuwUmXK910bek4uLC7uH15yzon508TG+R0bpoTLK4
         I3QgB/prOxGzDvQe+ZD2+UqNt5pm5VJkVzk+ZSEKMstFDgoIQ+Z/YY6rzIINy4NwLSr4
         tYqg==
X-Gm-Message-State: AOJu0Yzz03rPqqIv193VMiJOX+hoXvK5fbd/5nJnZaiLNRveibaoluZ4
	9tvmzVGEiwq78mYbe2DZNPIr88nEJE9EKJXblVn7znhhnM5h7qNbC+EMEobGu8OCDDVKvbdxo2Y
	vC4I=
X-Gm-Gg: ASbGncttzYugqZcK7QH8n+t9MKotI4zfXXjkWfPBL2rQzgzrAPC4B5UYFyGjJHeImZB
	be5w2brg1AC+Cm4uQQIbU6gPbdgELjT1nF3JTnKFRP7erDHJInNI0yEJaKGOWoAXjs6xXyAkg8c
	SjiRZNtEX4RdMMYAk4qbeLVffoZXXWmRdCkwwSZzWa3jz4a94KZDH5sS6V+Y2MKyRlywC3xOnTH
	NlLb8q6PxlHW/SIKtGSII1bQnaK4TVUje3/qUaGaJzpDVIixEpr0VEtnoqP/e7gAxRbTAYDg+cA
	8FbxNS4lE943CgH9xl3+Y0e44ugn1YfT+NH67USsYPaIXYaDlBi3O4S5LaBFcp5PqUNxoirDk6F
	0
X-Google-Smtp-Source: AGHT+IH9KQfRCrGunRibvC2mKYR2xH0wnXT095eVmazFrMSmo3QZy/uhlqrGJ/5zyWZNomBBkN+JoA==
X-Received: by 2002:a05:622a:181c:b0:477:6c0e:d5b4 with SMTP id d75a77b69052e-4801c2c3a5emr231877751cf.2.1745862260579;
        Mon, 28 Apr 2025 10:44:20 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9efd9301sm70858861cf.17.2025.04.28.10.44.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:44:19 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2 v4] python3-numpy: upgrade 2.2.4 -> 2.2.5
Date: Mon, 28 Apr 2025 13:44:15 -0400
Message-Id: <20250428174416.379821-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428174416.379821-1-tgamblin@baylibre.com>
References: <20250428174416.379821-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215625

Changelog: https://github.com/numpy/numpy/blob/main/doc/changelog/2.2.5-changelog.rst

Reproducibility looks OK:

|2025-04-24 10:27:00,978 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1203.06s)
|2025-04-24 10:27:00,985 - oe-selftest - INFO - SUMMARY:
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1233.056s
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
No change since v1 (just included along with the ptest patch).

 .../python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index a2ee2b48d46..c6a37c0a85f 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
+SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


