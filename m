Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76963C7EE30
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.1199.1684776398730992829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=maa9BBoK;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso11404268a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776397; x=1687368397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ixIkxc9Do+FmH8KnJ3mBqQZEZPCdXb76jEH42PZog=;
        b=maa9BBoKDsibcck0XLeontRoUf6WNXdSLI0i2CrgMQeyw12nu0/p6wJ+N3zTp5U/J8
         MC/8gf+HyyxVfkXLYpDETM26EmjU7uGSamjwU3b6yVgxUI8t2GEQimAv5Fs6RZ/04GcP
         pLeWTBYyjaxgpfp+ld6v/j53JYMWm9+Zldt7ywAd8+UnSmyvCjRT3t84d70S9iiYbie/
         /Laupza86/KY6rgyU6g01/mOy6TOw+PRawXnvm8Tf5cJpSCjWn+eQoVXYOik9l5U7v9I
         GgwS5q1zyLlodVAo+JM281a4ShlVYeW+xEjKTxCReCLcwfZi5lVEU9TveLk41suO0OVt
         FCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776397; x=1687368397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6ixIkxc9Do+FmH8KnJ3mBqQZEZPCdXb76jEH42PZog=;
        b=d30hMwAfb4Icu2+ETx08ElE+FvQa12SVLQU0PKigJI4y9wZtk8vQOooWve6qf9DwL7
         +zlu8BqxqZ8OdrZl+s9ivYyk2hx5LFBVoKX/qMJlH2hgUm8fJkr0xP+iXKInJCLFPo32
         DATfo4xxY93Rg8L2DDVokALhXUvrTZVwTuOhlEE/PajBlO4w5B/ho7gZoUqZ/1oAG8mZ
         EkOu1xEtJFxcMfLigwtiBh0h1iIqLwt2bOofd0HDg15k1w3T06T17g4F4wHrtLCXt8tc
         XRyloye/dbaKmWXjYKHPKi9Svtaa5YMNPl0l0oM0lRnkxmm90McOZ6H4nm/IhOBicUAV
         bPaw==
X-Gm-Message-State: AC+VfDw5PI1H6vCSTBR4+EbsjAq29m0ZFcl6L5ej1V7ZlTuXcE13iHIj
	BezLyB/8qIMysRujeQDJWG3+RasnpF8=
X-Google-Smtp-Source: ACHHUZ7GFj/dGbFZXa2Y2aX7BvFB4xer5Ssa/4aAdYGq+bO2ZEy4U1ssL6PKn7y2DN2emgnKZlmJ+w==
X-Received: by 2002:a50:ee03:0:b0:4fc:709f:7abd with SMTP id g3-20020a50ee03000000b004fc709f7abdmr9800293eds.2.1684776396925;
        Mon, 22 May 2023 10:26:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/8] insane.bbclass: add a RECIPE_MAINTAINER check (oe-core recipes only)
Date: Mon, 22 May 2023 19:24:57 +0200
Message-Id: <20230522172503.1651374-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230522172503.1651374-1-alex@linutronix.de>
References: <20230522172503.1651374-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181602

Absent maintainer entries are as well a frequent source of friction, as they are checked
only in selftest, and so aren't revealed until autobuilder runs.

The selftest is retained as it also checks for obsolete entries in maintainers.inc
(not possible to do in insane class).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 632f738c86d..50f60337cc4 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1492,7 +1492,19 @@ python do_qa_fetch() {
             else:
                 oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
 
+    def test_missing_maintainer(d):
+        fn = d.getVar("FILE")
+        if not '/meta/recipes-' in fn:
+            # We are only interested in OE-Core
+            return
+        pn = d.getVar("PN")
+        if pn.endswith("-native") or pn.startswith("nativesdk-"):
+            return
+        if not d.getVar('RECIPE_MAINTAINER'):
+            oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc.".format(pn, fn), d)
+
     test_missing_metadata(d)
+    test_missing_maintainer(d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


