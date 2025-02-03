Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68434C0219B
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.92312.1738600927150050250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e+xwyJ3+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso31912995e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600925; x=1739205725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA9tKkExcbcQ3dJ5gNgc6fi0T7AS1YomTcV3EN6DIs0=;
        b=e+xwyJ3+rzSUFTwY3SwqlpdixRNsKgb9w1fkAenZ708MhXPF/wEhUHlnMBn30xRgCw
         K76piLUa91fVkeFs1ZmpDvE4MHTtqi+CBHuXstYp1Bdi/HMQaUeIeEr684WyTtgMlBts
         2JaxeilgOuGr84D01yXrPRcEvneO7IZpSNyrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600925; x=1739205725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mA9tKkExcbcQ3dJ5gNgc6fi0T7AS1YomTcV3EN6DIs0=;
        b=dT7OGEHNJ5rSjrOYZ2W78oXo17bsT5pG8lxhmatFSbn/8OWhYTNZNQ+5qJ85QRvIxt
         f/1YWz5DytiCaGxMVDnRX7jsS/kVGP4Bcgqr60sUecBUJAAXWwWrPmGYDCuaPZPb27jS
         cPsd3+swVXyaSEihnQR3ukNcbRJM+FoD42BgAmreeRitABbqseJG1ANMxJHUgIbmeIUv
         8XloU0ae2eZFcqKf0w++VhRzHQAkQi9kpKTJFycX0NKiFVh+JfVapYEp1EKrOlC03E9T
         KVnOaAmm4E27kBfftk3+1Hz0FY8stZLD3ezOwkui5b5FJBZUyP6u5pjkZUHSc02MjbBI
         v2iQ==
X-Gm-Message-State: AOJu0Yzw2J7ECiF0iqidSVA4a+pJDTFrni4gdVfCvLbyi/wGEcJKNUZ+
	PEsS82YExmuGHGHupfnD34nzkBaarEQHeiB41PfgpMR5Igy7QU3OEhEm8pCiw7Me1K4e1TqN36e
	2
X-Gm-Gg: ASbGncu5qrC08OfUZ4OJVJzzUYyGT5KPCbFnoHl31aDMKW/crJ/dxTHF6+woDvCXk8o
	whMBiIVMtZ9Fp7o6iskmauSdCMDudUO3RdcuRM7mJTxBQFvCK83sQ0tLvpSUQvNv37SXoXftYmo
	X9qic//yD+kJJwENYDvOcPWS6g8ntG1LYGfa3Clx5SCl3GLEOxVxIGQn9q4H2BLSFyawKXqo6Z7
	Qw1uAlb/ntRsx92YmACDyW3x2wJv8O//zSI0UFoyujqEtoxN+aSbxa+wXy9RAnpp7lDXNnsCrPX
	5aGBuER52NnshmS3fiIhKNyYsMZED/4cebFs2Cg2KksW
X-Google-Smtp-Source: AGHT+IFpqEfG3qNnRK6zEa3mLpyuyqiOYRJnOl0L5hUCo1lU+vJU8+fMPip+53r5lx6ylnoBYQ2hBQ==
X-Received: by 2002:a05:600c:35c5:b0:437:c3a1:5fe7 with SMTP id 5b1f17b1804b1-438dc410b2emr179240265e9.20.1738600925044;
        Mon, 03 Feb 2025 08:42:05 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/46] python3-pip: upgrade 24.3.1 -> 25.0
Date: Mon,  3 Feb 2025 16:41:16 +0000
Message-ID: <20250203164130.3403325-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210705

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_24.3.1.bb => python3-pip_25.0.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_24.3.1.bb => python3-pip_25.0.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index f95071bfb2c..71836dca078 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 5d0b54ea2aae600a2c3a2b6ec71acf99290640e7 Mon Sep 17 00:00:00 2001
+From a715a622989ac182d18f6f2ada8201122282d889 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_24.3.1.bb b/meta/recipes-devtools/python/python3-pip_25.0.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_24.3.1.bb
rename to meta/recipes-devtools/python/python3-pip_25.0.bb
index 1fa246e4f1b..8908fc9115e 100644
--- a/meta/recipes-devtools/python/python3-pip_24.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.0.bb
@@ -27,7 +27,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99"
+SRC_URI[sha256sum] = "8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b"
 
 RDEPENDS:${PN} = "\
   python3-compile \

