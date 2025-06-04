Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75800C5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 17:18:04 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.22473.1749057481506516564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 10:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QgS1Vz/Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad883afdf0cso17882766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057480; x=1749662280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSck1/7Sry6y+EBt53N/83/AInKrfXpaCNRFq44Xm6g=;
        b=QgS1Vz/Q/rlHqZYFJXyMdxMN6FSqTyKetsLIVM1RR0S3Giq2wI3jVJSDnbKZPWUEiP
         EMi+jeQqX15kT0550XJWZHev6RlxTAL8w923CARNGPDaUw9X2ZNAPO63yEfLgfyQ3ftz
         RycXQJj6mYgtetq+aBoyMUMtDpgOurjnGKHp6VYQubeK5QdCIbClBppyO5lPVqkfQMfO
         AaQJfugc0na/F45ByOYGNnLVUCqRmcM4TZ0qyfL9SrAEDuHG1ZOTFRbzLk81ZeOnW1BS
         js8XX5hYrPaXBf12Z1qaKmtkwYJzZ3PCPQiHAd17NcbhnxdIVhvJZClns+7bh/zF1/1G
         7ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057480; x=1749662280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSck1/7Sry6y+EBt53N/83/AInKrfXpaCNRFq44Xm6g=;
        b=TLJS/58fPeJJ4H69uqDq1r/6hqB6jI+aHmncC/0sTi1mQaaweEmBaeYl1KR1NaicYs
         4hwokz8XOGeMq3/IVpHUMHSpnUaTb2dSnhqCwTo7QlNZAQmMUhLRB5WUBVimgQTRwWNW
         +LMR4lnWFhKVRvMVkKpRq0fBgZv9egsNaUIwJcPJf2gSXBuxaKCwyvrOJ1alCYjm+Cf1
         DDwDmwjEoSMS5jn2zTyozjl2fRaEvbODLEYDn3q+VHGQezZIZuUoG000kUAykhkrh3cp
         u2ZF4ogTD1iUAQlo3ZS+RYB4Fmn+MUW7zzBFDiMnELgWkyXVSQoa0jgVEHhOAMVe5kpD
         qLnw==
X-Gm-Message-State: AOJu0YzdiwL3sEZkGDEATn8Giw0fD/TDqN9uc92oXFNa0Qawa7N6xP2w
	w6VYkhTQJb9xsRhe+u4XhIBqMbB3V0ebDIPb6pq/i7rf4sBBvWw20CHz2tzGLvtn
X-Gm-Gg: ASbGncsguqtTzhKHJDj4xuvps8cms2TWaNdA7wuLe43/gRHfpzlZcaTJhwaos7JSeBT
	LvxhrDA9XexvUlbVUcCS9L0CS4ljTP6JPBKEMDO9uW4V09P66RHe6fWHEtItBBewuzfRf1xw7ot
	N8LDwT7ln/ToakMNUFHHTqXMZlXFVDPs2C5ftHlb/tnedVM5JYUPU+4NMj5e4kwSMTGEBnk+x9h
	LT1x/Yyhnm0xCwWKYiScrd2q00/C9tz8qSt8pFBgUeJxEqF8/edwRdBdqW+TlWzdv1hh+1I0dAG
	1ZTS04kNcaK68DGmb8XDFOZ9cUczt011eO185LdWTA64s1kzNQM+11RxlyvqGJapkgE=
X-Google-Smtp-Source: AGHT+IFNWwCvbYP2lF4jKS7sCAfENa7aQA9eT0Hknr+WqK0TVaRRKr68MqeoSOzQibT4sbVD/hqVzg==
X-Received: by 2002:a17:907:d16:b0:ad5:4a43:5ae8 with SMTP id a640c23a62f3a-addf8cca3f9mr345253966b.12.1749057479618;
        Wed, 04 Jun 2025 10:17:59 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed53sm1122441566b.27.2025.06.04.10.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-trove-classifiers: upgrade 2025.3.19.19 -> 2025.5.9.12
Date: Wed,  4 Jun 2025 19:17:57 +0200
Message-ID: <20250604171757.689102-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171757.689102-1-skandigraun@gmail.com>
References: <20250604171757.689102-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 17:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217960

Changelog:
2025.04.11.15:
  - Add classifier for Wagtail 7 (#210)

2025.04.28.22:
  - Add entry point to enable installing with pipx or uvx
  - Tests added for running the module and calling the entry point.
  - Add return type annotation
  - reformat
  - Try adding BINDIR to python and entry point
  - Add missing BINDIR paths
  - Add docstring to test.

2025.5.1.12:
  - Don't assume basename of sys.executable is "python" (#212)
    On Debian, it's "python3" instead.

2025.5.7.19:
  - Add Trove classifier for Python 3.15 (#213)

2025.5.8.13:
  - Add several missing languages
  - Update src/trove_classifiers/__init__.py

2025.5.8.15:
  - feat: add free-threading classifiers (#195)
  - feat: add free-threading classifiers
  - refactor: add numbers to force correct sort
  - Update __init__.py

2025.5.9.12:
  - Add trove classifier for GraalPython (#188)
    GraalPython is an up-an-coming JIT-based implementation atop
    the Graal VM.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...2025.3.19.19.bb => python3-trove-classifiers_2025.5.9.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.19.19.bb => python3-trove-classifiers_2025.5.9.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
index 39fb997e88..68b09537bc 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
+SRC_URI[sha256sum] = "7ca7c8a7a76e2cd314468c677c69d12cc2357711fcab4a60f87994c1589e5cb5"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

