Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADB1C7115E
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:53:52 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.22823.1750175629076901763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NDIBGvQQ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d09a17d2f7so545904685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750175627; x=1750780427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQHXdgBYC8YRw/+WyLTSZLnhimIc7+xWWtwYHctfpXQ=;
        b=NDIBGvQQwvksegO7506TNlwTde0bVbp6wWNGBuOfTxw9KWlHkB70kVJrpWgma6rGtS
         kn0Ot2ZbeSWoSB6xSFBZIrOiLGJCD6WVgo3XyP0dtdHQj+V1QOwjDLEEtvxeY/k1K3aN
         rP7OxkkU6/LlpinFUdiwY+buj9htr2kjrKq886+8WQQyH6HDPS1DnSpm8UG+hOjue9+B
         P+9vjMZkFEhXOfGHzjY9Viy6QsWgGk7EGKVX2ozO6RfRXiXwKwr6iTJjcJGXAldItKpq
         LZhQoSoMtX7GCchpiAyKcEyh+Cs09xI+Ffvs245wK3Xo4P1Hkw6QomKYQsaPirCUVng2
         WbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175627; x=1750780427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQHXdgBYC8YRw/+WyLTSZLnhimIc7+xWWtwYHctfpXQ=;
        b=lPHfw83u6flgetC9uGMAuSqieAS0xTmDW10lYDYHly7ZO21hvvmLRZ+cLfOIgT8SZE
         K75BgB9nAF+Zh+6Mp82tIcrVcIUh1o0q6UwVuvwl+K5u3+cvF/4hU7XkOD4yJuBdAYcH
         3gOpupqpBHFNA4RlxE4HeJhyH9ootRsIkyd/a9VmZCQkISD0TN5dkr+gLLe492NJyKEy
         UYJspo18W2kria4Ebce5m7unB/4q30elkXXz3qrOgGP6XEsc8W0xKhyL0Bq7uy6fchVX
         AriFnA+irs8Gjq139iWzWmTBuRzPotCoFWC3i0hY0MWkU3mCw/JRxKMjn6Vz5sm/5sGx
         XAVA==
X-Gm-Message-State: AOJu0YwWY42Q2xrQ6ugjKdJuPDWEhiWTTQfasTHKJIv3axTUxQIe+JRx
	lbH5dHCH5PvvmYTqh65D7f7c65L04VJPH7Us9t+mqwKwijGorDjmuN9Fe8/huymBADZ+5j9ujDm
	BnRuaa/k=
X-Gm-Gg: ASbGncue0lfS78haQgrF1P2ONyDgq7VCjnBe3W5qe5aq0tWNOdKd056wK9zDWjkTPQs
	djh/kwO+xc5soV4dVliLN2c7QdU7PiO26C2O4hy2dqv+15oSLBb9lsMjqcM1mfAB/YwTWy2lSg6
	qYO6ljIRoDIZfEROuErRvDCow4zfAOdWXApY9+c6CD1LjgTKT6GLImEF7uL65mrZAWXBIxF0v6U
	cw77+duEW8N19eEzewF+dt70lXspeEGy9MVw09AIgNRfDi3mmdbQKkHrnTOLHvRKH2fnEMcS7xX
	gte/Zqg7EKnQvPN9GP3vof/GFhjo/d5tdewkL6q+ZPPPtDEwhRmi2rUlM99WveTjgEDqt44IShB
	3Q9dGBziUoAMB6V4gEXbkvw==
X-Google-Smtp-Source: AGHT+IGfGtap66LKBX9xM/s23+l0bMxhfAAL3JokdK7O1YHgjCoSyap5fGH+W1ACG6wrJCCNYxVEuQ==
X-Received: by 2002:a05:620a:390a:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d3c6c18fcdmr2419986285a.13.1750175627317;
        Tue, 17 Jun 2025 08:53:47 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ed35b1sm661128085a.88.2025.06.17.08.53.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:53:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/5] python3-pytest: upgrade 8.3.5 -> 8.4.0
Date: Tue, 17 Jun 2025 11:53:38 -0400
Message-ID: <20250617155339.1305652-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155339.1305652-1-tgamblin@baylibre.com>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218886

Changelog: https://docs.pytest.org/en/stable/changelog.html#pytest-8-4-0-2025-06-02

Add colorama (moved to oe-core from meta-python) and pygments to
RDEPENDS.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pytest_8.3.5.bb => python3-pytest_8.4.0.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.5.bb => python3-pytest_8.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.5.bb b/meta/recipes-devtools/python/python3-pytest_8.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytest_8.3.5.bb
rename to meta/recipes-devtools/python/python3-pytest_8.4.0.bb
index 4d4e8b8511..e811855c77 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.4.0.bb
@@ -5,21 +5,23 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "f4efe70cc14e511565ac476b57c279e12a855b11f48f212af1080ef2263d3845"
+SRC_URI[sha256sum] = "14d920b48472ea0dbf68e45b96cd1ffda4705f33307dcc86c676c1b5104838a6"
 
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit update-alternatives pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
-    python3-xml \
+    python3-colorama \
     python3-debugger \
     python3-doctest \
     python3-iniconfig \
     python3-json \
     python3-packaging \
     python3-pluggy \
+    python3-pygments \
     python3-tomllib \
+    python3-xml \
 "
 
 ALTERNATIVE:${PN} += "py.test pytest"
-- 
2.49.0


