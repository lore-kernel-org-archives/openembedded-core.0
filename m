Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBD7C4708E
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.125288.1672005580638220504
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fqb3A8Xb;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id gh17so23132434ejb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydjd8apOladjbMCkBG6Vh0G00Xo1OoUMx8ZzeWdbVWI=;
        b=fqb3A8XbMfZKJ0oLE6tmbvK80JyUEVTwW4TZNKHdIqBHzr5vu/BAs+BHxK4VQE7kLJ
         3X0TbXz17g+Yp81X540hO5k3bX8thELBeznAwCe6emUnyTzTTzuMkgdSlHFljuCUa/1Z
         yMWDBG136pBROyL4FmuY/QRr7T5rsvCJV9mU+N+hqBTmF4DY8n3NaIbIqH7jVdE7I9YJ
         RCufKskVXLhj6nQu6PGPfFbl/8BNwdeWwpqPl5i2lXODRLchWZhNwByruugPkrEtjivu
         f9Z7UdDLEoSFVgQprGbzHYqAFKD/QcMUqoJqfKGkZrOfT8l/3UClRtd+ldAaIe0IMKmn
         3xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydjd8apOladjbMCkBG6Vh0G00Xo1OoUMx8ZzeWdbVWI=;
        b=3grhgWI21j6V52QQqKNvs/OzYP4PobomOtUoFTk4XUi41kwuUNVfjKqxxAW9XTfLuI
         8DMOcyfclAeQQmdKfX2wVGjQGCzh3c6J6094NImF57OsbXaoFu00ktyETLKM/AlT55F0
         ZEWKUywf7k79WsADWNJFyYXM/8SAdTW3igsN8Hr64WaDqZtcNgyoJPSOtbbR0cp6J4XW
         hybfyWPRRrbAdfbVI5yUZeUnXToiqivchenmfoN7RKCPfmShz94eVRsgbABzC+VC7SgX
         t53Y5e7saRkKuzT3nQ7SE54IMbgwriGM3eBK+YMVD9PR1PWsqngUXU8SXj+upLHxG5/r
         SwoQ==
X-Gm-Message-State: AFqh2kooUTcI+dxnFZtdtveIeJB+nYZD2iHvGrHcHVbKGIgCp6gJn5lK
	fHvFUCYsUqPLfGC+27lihmL1QE1+DxY=
X-Google-Smtp-Source: AMrXdXvbj94T8AS9pAZGwD9kkC2AX99Up3Z7q77rc0hTzF8miCQD2clwCNN0riYTFR5wlivyc8X2BQ==
X-Received: by 2002:a17:907:a782:b0:7c1:6430:e5d0 with SMTP id vx2-20020a170907a78200b007c16430e5d0mr14233042ejc.4.1672005578993;
        Sun, 25 Dec 2022 13:59:38 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 09/11] cargo: Override crossbeam-utils with 0.8.14
Date: Sun, 25 Dec 2022 21:59:19 +0000
Message-Id: <20221225215921.12868-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175004

Use cargo patching to replace crossbeam-utils with the semver compatible
0.8.14 rather than trying to patch our local changes. This corrects the
ppc/mips builds.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v4:
- Add crossbeam atomics fixes for ppc/mips

 meta/recipes-devtools/cargo/cargo_1.66.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
index fe8049b68c9b..909651b9efdd 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
@@ -14,6 +14,13 @@ LIC_FILES_CHKSUM = " \
 require recipes-devtools/rust/rust-source.inc
 require recipes-devtools/rust/rust-snapshot.inc
 
+# Reuse the path override capability we have to patch in a later version
+# of crossbeam-utils which has the vendor misdetection fixes
+# (https://github.com/crossbeam-rs/crossbeam/pull/922). This should be
+# removed once the upstream source merges the change to include it.
+SRC_URI:append:class-target = " crate://crates.io/crossbeam-utils/0.8.14"
+EXTRA_OECARGO_PATHS:class-target = "${CARGO_HOME}/bitbake/crossbeam-utils-0.8.14"
+
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 EXCLUDE_FROM_WORLD = "1"
-- 
2.39.0


