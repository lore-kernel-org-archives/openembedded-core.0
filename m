Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014A1CAC5A8
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:48:20 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.1267.1758300493461456112
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=z3wH+/Zj;
 spf=pass (domain: baylibre.com, ip: 209.85.219.67, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-78f30dac856so27032006d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758300492; x=1758905292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgJgrmF3kPqFdBDErtvYSLGYHw6YppEXHiceGfaA4jg=;
        b=z3wH+/Zj8SOoSgasSRq496mRrH67y7N1RPz+gtWaG8sNKv+jEX/VhVFFW0yLPjQoxg
         9G2wJhw9J4r4SWhNrYmkoEj9WyNtnT/wp/uFKwYWZfvuMBd3I2h5enqPJ7NX1Gm9sjE7
         yFvkJrzY20m+29Euy31/9SaByfxXwO7lQDmzY+WG4KOIqoAi9JaQq97o1rcgbdfcaQZY
         mL43NaZ1oa4MPBAra76FMAJW+CXFe2Lz+3KDRkDyZ5zSB8umcnVpwkKtWS0i4abLcOw7
         iZt3fQO3Y1nn1WgGDd5alM+cr5K1MzF2D+vQeI1DDKl9mv1ADYW6zZO7jodp9wJXXL0n
         p04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300492; x=1758905292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgJgrmF3kPqFdBDErtvYSLGYHw6YppEXHiceGfaA4jg=;
        b=fdBcyMke71loKFwny1Upqwu1XAHxGQhXhE1JxEwPGvF+TZmkLEj/UVI8ftVE2CjNME
         yuBG2xXr6ZM1Kv6DpU/TLynLTc7OhStOZ6WZHp4kusRnA2s9Nanxz5iLyJc9ZJN35lmF
         1rswRlupIfU6nDeYGS3jliS7wpXqpgkSFG50dhhK+RB5X2LbW/50c70fMycN+fC/zQIm
         1AGzBfjJ/lyC+QIbrmyQrGfaBoSLlLkHaET/NlSWBO1zLRDwhMxecykD1Xk4JpdRf6hl
         kLRymGtByugfe61oT/eFEyCL3Nh1Yk8uu7jT3ggCsZh96eT6quaKy0DuBe9xTcsf3p7G
         GCPg==
X-Gm-Message-State: AOJu0YyKgr+25gx0lRlNhvSoGcYUjDk8AtTPQDHurCWlUN0hv1sT0/IQ
	LQ5uRCdVXA49yu78qY3M0dBpJDKQAYDhYnXXhcBhuJULAdENP13cGomPtEbtdRJZ0CyRFODGJ8Y
	Ua3yL82Mldw==
X-Gm-Gg: ASbGncsk2+EIqj1hpjesEPrqYz3vmWk2h6c2X5GdkbSnJ8yd3JQE6Fv/WLl/G8K8eqp
	g67S+O48fjDRoPZHzaiWROEgJlG+h7tVl7X5DQq7bAc40H8AYu9J+Xq2+/NVvE6/lP3nGmZgwAN
	JLbmsUKbeEbFMaDU4ffn9PSuVQgDt9kRjw31NUJfmmZaQt96tt7PxkZNxi6x4CRKRc1Xd7HW8Il
	K2w/D0eRbrPBCnk+WoQCCJKf2R+Vfa5ih2FXByh18mAkHyATskzsLCa6lAdLxASj9WTeJ0/MN34
	D6OOh4VovP01wyOiEGxZkLNDFwuu/9JjVpfXqTSYA8/hxnBas8N/7Jqcy0N0AfORFmdMTs2FHes
	DSXfKU4iml3+qKOb5bmImLqncfmHEht1hN79cR01ou+7zIpEu3VZqy5mRdg==
X-Google-Smtp-Source: AGHT+IHaWhCVe9Hgwrhz2FxhIDPXtxKoSTELWR1WLl8/NnlN/O4xS39iJz3Kn4sIkuvAORC9vU6BUw==
X-Received: by 2002:ad4:5748:0:b0:78e:274b:302f with SMTP id 6a1803df08f44-7991c5f2785mr38849556d6.51.1758300490811;
        Fri, 19 Sep 2025 09:48:10 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79351b9de18sm32321366d6.48.2025.09.19.09.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:48:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6] python3-trove-classifiers: upgrade 2025.9.8.13 -> 2025.9.11.17
Date: Fri, 19 Sep 2025 12:48:00 -0400
Message-ID: <20250919164803.3174518-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919164803.3174518-1-tgamblin@baylibre.com>
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223762

Release notes (https://github.com/pypa/trove-classifiers/releases):

2025.9.11.17:

- Add support for Odoo 19.0 in classifiers (#225)

2025.9.9.12:

- Add classifier: Framework InvenTree (#223)

* Add classifier: Framework InvenTree

* fix style issue

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...2025.9.8.13.bb => python3-trove-classifiers_2025.9.11.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.9.8.13.bb => python3-trove-classifiers_2025.9.11.17.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
index 8586eddc70..4bbdd243ef 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.8.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2de91c8f286b7fea55072061924f69e7f3bdf7a9cb63719c90090e41c6657d3a"
+SRC_URI[sha256sum] = "931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.51.0


