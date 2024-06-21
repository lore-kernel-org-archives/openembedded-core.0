Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A31DC2BBCA
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.70018.1718966584918131162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPWSPqmL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso188156666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966583; x=1719571383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BLd9bwV8MAfvrp49cOJEPb+y1l1/GQd56NI1Ej9Py4=;
        b=FPWSPqmLu+MabSyg7W7GNtG8rLGY92Q7F+LpVXEfjb1BXvFUbXVxdX02F1D1plHetr
         4zOVydI1yLfG3GURZN3A2ca3hz6otiyCy/opre2tZnYiHO0+mFctxL1ngktFLBSNhB4O
         c6W3acRZCw/f18MXiSRQ9kXkI7dtOEnAoAE/u5Gt2+vvttDIn+ZJH9V67wt3nWLA2irc
         FnKgbzcVU2EbFjQCZV5WIYCjTIwBPt2QRorvSGCIZrn4aGCC7kIWCiv6jBBL6pBg1QmV
         baKTkrc7BfExC+btFoe1K/t937/HYYz6G0VID0dh0jOE6+6VkP9ckEC9QVLuxmBnoUYT
         vjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966583; x=1719571383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BLd9bwV8MAfvrp49cOJEPb+y1l1/GQd56NI1Ej9Py4=;
        b=fC9DKW1lM/eytndwULTM2r3D2PSDR4yiS+Arpv9tqAo601gjvoeEGeTHg/G+6G3fpR
         oSLcZP73HdRy0vUebMNMnIR+pkPxQDGB3N8m5CZXqxToQoZrDOChn++Xe/0rg5X+Whg/
         C+h6MPXRsxSmHtn2ui4d4L3Gj3QIMi9yBoHjZ3PyctJJEpF/GlqYQtQZj9klOttglYOP
         o/5WLcgFsSwAgz4m+4TnGZnA7NdKKcI5El1rNtA2e3h7SQ1nELg7aMFfCy5TAaAtF3UX
         g7451S32iCYj483Rdy+g3kRiXsLzevSF/BP6h0jIBzvjM4fM4viG4T5Nb8fwiORgwb2B
         MJXw==
X-Gm-Message-State: AOJu0Yzrr+gRjoA4MJP9jvgAzZ1WHHircIVWgoATXpujuMx6PdHw7nDt
	zzOmswbVd4bgnIGBzFKB4fwGPZIqcEcFesv5MhQerBhh503e/dvoOZRr4g==
X-Google-Smtp-Source: AGHT+IEQG678l8GermtChqSriWUUMyK/iyO+USwfbq+vaFeaVU9fW2bpnSBghhJ9abbhABHRmzmbTA==
X-Received: by 2002:a17:907:9d13:b0:a6f:badc:8d2 with SMTP id a640c23a62f3a-a6fbadc0a04mr334169166b.70.1718966583206;
        Fri, 21 Jun 2024 03:43:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/11] rt-tests: rename hwlatdetect on recipe version upgrades
Date: Fri, 21 Jun 2024 12:34:14 +0200
Message-Id: <20240621103414.2842509-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201016

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 2 ++
 meta/recipes-rt/rt-tests/rt-tests_git.bb    | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a3..0238b7e9794 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -24,3 +24,5 @@ do_install() {
 FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
 RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
+
+RECIPE_NO_UPDATE_REASON = "Upgrades are handled in rt-tests recipe"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index 1f48e143d47..266a6a6da9a 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -34,3 +34,6 @@ RDEPENDS:${PN}-ptest += " stress-ng python3 python3-multiprocessing python3-date
 
 FILES:${PN} += "${prefix}/src/backfire"
 RDEPENDS:${PN} += "bash"
+
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "hwlatdetect_{pv}.bb"
-- 
2.39.2


