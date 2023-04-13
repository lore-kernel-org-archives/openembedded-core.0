Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0009BC77B77
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 09:16:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.8223.1681377373848198564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 02:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Xp3nO4ms;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id j11so17152061wrd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681377372; x=1683969372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv4jMx5HYbZJ3JV/pRpC6ui8Z+mNc+LyW1/O/76aS6Q=;
        b=Xp3nO4ms0SDoaXzyKT1IpZn0dRuTcRbozZfnBJglAKG3VAM09PwOisEuTGUlpb/Xy8
         bVCCeV4RKfpGolXoFEHNqd6bzpvccGurKomeDvLc53KY2qw6ReftFhym4h37pCyHzHmY
         ni08gOOzT+IyqGKDonViN98BaxHPahj8eAC0NBXYAzbTMM14u9uGCsvSRDC5n+RJ8lFM
         tsjDo6KxwySwTCrlslq2VUnYeQf2G33AjqgxmEaI5308VXIEMcVTKZD0d6c8IepWvckU
         ub6rWEEkFzmE27ULCIYJSVkrbDd/X+CE8rkuq7+gECT6dexMKNj7+0j+VyeoRyfjbDxz
         HrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377372; x=1683969372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv4jMx5HYbZJ3JV/pRpC6ui8Z+mNc+LyW1/O/76aS6Q=;
        b=bIs8E3gmZ/NXDB3DJE1RfPlCcFkg1v/bcbOurc/2M3ZYMAw56QeGduK9XW+8LI8UHz
         3NVMwDDZXvxo8pO7yhrh8U5S1Wlr4IBOnX+NaiF2S8ghVKhv18g4OCDqZTRjv4oYt7ex
         5aqncF7JHyIor3Bvfz7YhcN08huNJoAr8ddK3/dT3ozUm++0+K2P0fYWH7nEYN539QIz
         MUAlBuQw1UV7YkMfDlzH1nmgqR4ixeimHE8FE4L+fJ3oEQL7g9zsNucNDyOaNh55cZov
         1ifZ/dI5cAb/sTpoo+yZXgoWRetKIN5Yr/DBGkqaFtNtl07O61ch3EHpq0qeRUaqWL34
         foCQ==
X-Gm-Message-State: AAQBX9dqUL5prjQml+LopatPvBx43+KK/Mi5X4oBuGBNOjN0amNWiCRw
	tDYTj0LjJkWA7zbQZvec+hS6Jw==
X-Google-Smtp-Source: AKy350a7Psg7C1RwtD/hNa/0jPxMk7H/0OM0IV6huGE5J/ePUDsSj10x6SFuNdTP2g6o219DWaeWjQ==
X-Received: by 2002:adf:eacf:0:b0:2db:bdc2:f8da with SMTP id o15-20020adfeacf000000b002dbbdc2f8damr673665wrn.71.1681377372306;
        Thu, 13 Apr 2023 02:16:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm851479wru.20.2023.04.13.02.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:16:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 3/5] python3-manifest: add tomllib
Date: Thu, 13 Apr 2023 11:15:55 +0200
Message-Id: <20230413091557.10659-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413091557.10659-1-brgl@bgdev.pl>
References: <20230413091557.10659-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179964

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the TOML parsing module from the standard library to the manifest.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3/python3-manifest.json        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 498402af42..9e91270a50 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -829,6 +829,7 @@
             "stringold",
             "syslog",
             "terminal",
+            "tomllib",
             "threading",
             "tkinter",
             "unittest",
@@ -1179,6 +1180,22 @@
         ],
         "cached": []
     },
+    "tomllib": {
+        "summary": "Provides an interface for parsing TOML",
+        "rdepends": [
+            "core",
+            "datetime",
+            "stringold"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/tomllib/"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/tomllib/_re.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/tomllib/_types.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/tomllib/_parser.*.pyc"
+        ]
+    },
     "unittest": {
         "summary": "Python unit testing framework",
         "rdepends": [
-- 
2.37.2


