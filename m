Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2C9C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:51:59 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.23256.1747918316788643697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MHT7AfTF;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8cf00d96fso51225476d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747918315; x=1748523115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gqMuqxbd1B0dRR2UUs9tHCmD+ifnmExV1cGOqPMs1E=;
        b=MHT7AfTFWySeG6yylje8W0xlw0Jw9PeUz3zr18OzNF+bbl779Two+OoUZb5ZfyT1Gk
         jyuMHCKx00nRx4hhZTifqij+KcWj/0aKG3WjGhuJGUTFk7ywoG82vbfLTJT8FEIPrxk6
         lSAlB8svMAgqYu/wghsadKI3tcnrdYgCw61PUF2bagMs8e66aS8iR883qmO/p2tnZdLq
         wgRltWfd6x/3Vrhwmf4fZq6youyhnkjljguxj9Zze21cB9ExJNYSyY25rRZBBb3S63Ns
         Cs2f6w1cjT5XxA1KaQG7HS8deLjavadrWFaELNJyK8waWkhG0i1Y1fDADh61CZaipV/K
         yCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918315; x=1748523115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gqMuqxbd1B0dRR2UUs9tHCmD+ifnmExV1cGOqPMs1E=;
        b=mPKpCfsuQkRNwZqiRpt7S2uoV6jon4aLl+4FYMx5BBeB8zK5hllU4fCbrU28QoStjG
         r4hVwA9jDOYaz6T4jOWfg4xEgpQw999zC+bK2QexTx7XAuy9fcVUZ3XaXj5guYJhdbwh
         WhvYxP9L5aA3hXqx7koNxBtHJMtKMrciMBLk0RuI3uiloAQZDl4vCN+8zdkwtKC72ywt
         EkGhsVtQe0PX1mLF44p1jB7z2D7KpHahj0UPl4hTGTajipJBNi9BTtNhAm1moH9WEDh8
         SW02F15oPjeTII+NCudWfA1cli3vR0rnHxo4g2vRrLVWBm6aXVnofVEwp8csQzWMRm8M
         Jogg==
X-Gm-Message-State: AOJu0YxN+NkM9dmxBvLij7VDtEbn9v+t6rObWZbffIC7KAJOIuOt06VL
	qPxMyBeVh8EFd2mEZVba8uVIard21kYK700b2jFHTnm8Gt3GaxOlZ22ygt0s6vb3ktRM90Pzec6
	tH6EyDec=
X-Gm-Gg: ASbGncs8ocbHi9o0IpKN6WDFzmyzQg9RUNpi24lLwdnT08mXJTziGEkT9YL5Duz77vJ
	8NtM5NTA4nCVzPANPxPl6OIbYjo0xlf5jyc+qTBS3m9sQOmLj/+XXqAJ84A9a5Twg6BtnblOD/A
	UCrrB1HVEWbwz+E92O7H02klvPFjkRI1CAn0d0Hzh4iTGSjn7DXCYyKbzPndRq2+qolrz7/DFLj
	LrwmSlZ/OPTQ7ILUEbmxfSJq7oz9j4K81v/uho/1AKXrVn2u2vNHZ0a2kTybJn1LPGX9O45VAjZ
	MCNtNKYqsa6s85rBDMpof9F+5QOY7e8ZTJXGAxCRoKIxxQlsSMkI0R+lUk4qvs36a/5JM1PShgz
	Y1mpfWsjZJuc=
X-Google-Smtp-Source: AGHT+IExCIQ0ga05MuAlcobQzgr0Ymk8oLW1nmSbeCCm29JLuymxxqiOui17sAjAdT4ndiBFJHBtdg==
X-Received: by 2002:a05:6214:302:b0:6f8:c621:5a0c with SMTP id 6a1803df08f44-6f8c6215cfemr272177036d6.31.1747918315197;
        Thu, 22 May 2025 05:51:55 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b098750csm98501226d6.119.2025.05.22.05.51.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:51:54 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] setuptools3: remove NO_FETCH_BUILD
Date: Thu, 22 May 2025 08:51:51 -0400
Message-Id: <20250522125151.754566-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522125151.754566-1-tgamblin@baylibre.com>
References: <20250522125151.754566-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217103

We aren't checking for this variable anymore, so remove it from the
setuptools3 and setuptools3_legacy classes.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/setuptools3.bbclass        | 1 -
 meta/classes-recipe/setuptools3_legacy.bbclass | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index f19899d42e5..0adce5e2ece 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -32,7 +32,6 @@ setuptools3_do_configure() {
 
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}
-        NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classes-recipe/setuptools3_legacy.bbclass
index 030c3d9e0eb..166808a695d 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -35,7 +35,6 @@ setuptools3_legacy_do_configure() {
 
 setuptools3_legacy_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}
-        NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
-- 
2.39.5


