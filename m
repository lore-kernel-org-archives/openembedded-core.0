Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28D2C5DF8D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10408.1787155066628572521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ugp5ptdL;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so11266075e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155065; x=1787759865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jyuors+EzkXc4Ti3jROEpx9MSQS8rLv9s0flzjz7mJk=;
        b=ugp5ptdLbYHuwQKLzCN6dcYS5GDeVZrt9Ns+2WLTiYUGEBY6j5/daunRpuu8hvfOF5
         vyJ9XO9/kOTpjt/bVJoi7sDFc6iGKA4U5/n6VlFDEyz4tFsdHbdogg8IcQ8JVgbmAtvI
         4kMUtCoiaHi45sqhT7w247O6lQcIKAQMF99w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155065; x=1787759865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jyuors+EzkXc4Ti3jROEpx9MSQS8rLv9s0flzjz7mJk=;
        b=Y+1Yq/EroG5ps3LuGgGk1xHMypZJjTYb5tNcuZuJ2WrIOj1xYve2tZrOiPg9Xkt89d
         ecn9kRrjYuipO/kurEm7Fva5JjyB4NHKqlbRz400iPGGPcHeYK2DtzqBP7Su9qAsA6rq
         lqVZ3O+slYBLdEttlpKk39emB5/o0Fb1nF8VGQC9gAlnN/FPWvxo2v46rFnuol9X2ac5
         MIhmr9D96dlNn0jvob1ziT4E2mbWjKuv+mTlm39C7HNSSX8lMdjXarh+YkHzmQcU693c
         CEXrn9xqPxOE53TotymtFJueJktpNM+XIEuWcU9SsCmwr0i+sbU9ehFBt9NlT0AnySc5
         8Dow==
X-Gm-Message-State: AOJu0YxXrT7BnI2NEhdh4BVbJhZH1TrQ6EJwy3cImpRUWULa7RkkhEB6
	8HjKUmMumZkCZR2o4ldmwzKLeapCHDL+2T3kClZvMlsazZfGAkInleD/F2gckqFeDRUOUdJGfj4
	3L14n/3Y=
X-Gm-Gg: AR+sD10g0yJRiyvDj2BpNKLGctRgQdRyW1O+ixmkaGepJ477v72DflUbLmB5zRti+B1
	qFtcLQZzeKiwq9C8ksdirYMfgSWjxqmjXzKtoTnb7C8Qu3S/8s0aklOwTrdR5BIREog8oBLkF+B
	OKnXSxUtlfcwG4C9zHBemXpafhQWsy340BzV72OYCO2vWyhsZJUlRbe73yDLqwReC19KEpYGNdv
	2DWZPfjL7gmmczaXH4i0otbC25RK381MXk37kkH8yebmjPxbHbcdbXOGXXpAeEVdLP+9KdVmC/5
	8YZvrOWUFYwIachvISUxgRyDFJIwNk1sKVABEjSqwWrtExKuQVYR3JrkzqWMRS63buZWdjDa2mq
	fNAYwWVGfhXc7a1eN9uNXk5xuGzvhB9s8Ad7Yg7s0ToxoKsmOrNbHHTOynHb8bYjwjnWnPwjAof
	iOg6e0mhh/7RSNh58QOPKvm3fFCzrifZFESzfjkG/81nlK841GavPcHubNE4YV+tu2QN15v1mt7
	RnSLB42StwG2r4FgH8abVvJonaFHqvZL403IP0B+o2E3/douBe6BxihDX5jWnCDHkQoGP6uvi6p
	kd1TZEUp1tow+AgThZxqhXaZ5Wx2cn7CLcrjZLcN
X-Received: by 2002:a05:600c:5294:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-499aa1f5413mr115937355e9.15.1787155064895;
        Wed, 19 Aug 2026 08:57:44 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:44 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/37] expat: fix CVE-2026-56409
Date: Wed, 19 Aug 2026 17:56:44 +0200
Message-ID: <ad98f0dc5352eb47b0c5a3ce29ef1089a2119cc6.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243749

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56409

(From OE-Core rev: 6e0669fdbf661569083b7fe479bf829e6e476f72)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56409.patch          | 51 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
new file mode 100644
index 00000000000..b0aac260739
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
@@ -0,0 +1,51 @@
+From 174ce18f2a283be634d830a5259bd07142635fe8 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Mon, 1 Jun 2026 11:53:19 +0530
+Subject: [PATCH 10/17] xmlwf: protect output path join from integer overflow
+
+CVE: CVE-2026-56409
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit XML_Char cast used by
+  Scarthgap 2.6.4; overflow checks are unchanged.
+
+(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 7bbdb303..bd5f68a4 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -1240,8 +1240,26 @@ tmain(int argc, XML_Char **argv) {
+         }
+ #endif
+       }
+-      outName = (XML_Char *)malloc((tcslen(outputDir) + tcslen(file) + 2)
+-                                   * sizeof(XML_Char));
++      const size_t outputDirLen = tcslen(outputDir);
++      const size_t fileLen = tcslen(file);
++
++      /* Detect and prevent integer overflow in the addition (without
++         risking underflow) and the multiplication, mirroring the guards
++         in xcsdup() and resolveSystemId() */
++      if (outputDirLen > SIZE_MAX - fileLen
++          || outputDirLen > SIZE_MAX - fileLen - 2) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      const size_t charsRequired = outputDirLen + fileLen + 2;
++
++      if (charsRequired > SIZE_MAX / sizeof(XML_Char)) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      outName = malloc(charsRequired * sizeof(XML_Char));
+       if (! outName) {
+         tperror(T("Could not allocate memory"));
+         exit(XMLWF_EXIT_INTERNAL_ERROR);
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index aa2a4f89669..0f996f882ba 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -70,6 +70,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
+           file://CVE-2026-56409.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

