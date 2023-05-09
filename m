Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAFDC7EE25
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:03 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.39165.1683653041812457409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DFuhx/DG;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-953343581a4so947659866b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653040; x=1686245040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVDgHGaYbvB1inLats3+8LpJ+e074UtfUU3Lu3Yt5fQ=;
        b=DFuhx/DG5tOaYBQAG9rJYYRENymwxGvOUdVZqCssZUGRPoOlz+vBdty1ShVsKx5Uq2
         zgVIpsnHM1JRddYcV/S2xR3k3xR0cWuP2LpS0WgDzGfnqTWHQc2WHmzPuRYnfMOn0cA8
         JvmAaENivs2fUDlimurnB76fwHHeI9OVrhpBRP2XfbWqq21YxmW2rrcBZVJKnuHPQsFk
         qe4yA/mSEH78SkAdcvLSmSJfluihxPsQAekS6uVI224gI46ZbsU4K/gOqkOMtgQzfXPj
         FLR88zuAJFjNwbCrVYrrFx7ke7M+eL/8XW7OqSYcbmofE7qNAtyKlZgAzkAft1CkmNJD
         igWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653040; x=1686245040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVDgHGaYbvB1inLats3+8LpJ+e074UtfUU3Lu3Yt5fQ=;
        b=lwjwvHcxjZN251IIticE9XMRkOg1U2RjM7EEssXKEnogyAP/VReXbkizsLZifeE1kl
         niFO04AsxqDphhGv5dtcXdfPjAxlaLVYLBmCL6OquUzDkyTj/lexsbcEdE0OaYRocL/f
         orsGLGbTsz2BtX8kPK0PQxyPxpxV5Q152NYynYQPrP4NO1zTeDpw8xYXmlld6BJDQMKs
         TBm2wbX1+5jdQcCLhar2Zc+6MSHIgB3yijY0jafj2VinwF4Gtg1zooabFN5IC6Z2oR+E
         Mxbsh95JSu0uBZuEL2IzXTibCv/lPTVmVELhYisv07d8XdlT8kEB9EjXoA7hWfWZp7+l
         yJyw==
X-Gm-Message-State: AC+VfDxaXo996xIYc+sy3WtngrTKEezYzyfvbd8QFCaijQ864Ajgm7HF
	RorP8LLsoLEunSRlGk4j1i9SG4GN50A=
X-Google-Smtp-Source: ACHHUZ4KfQ72p719K14IrMwg2G6Ch6urnv6ht8BBPG1jGzo+nOpzeA2WylleMb38g6mf2JW/E3ZsHw==
X-Received: by 2002:a17:907:268a:b0:965:d17b:26d with SMTP id bn10-20020a170907268a00b00965d17b026dmr11732124ejc.35.1683653040288;
        Tue, 09 May 2023 10:24:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/27] libva: update 2.16 -> 2.18
Date: Tue,  9 May 2023 19:23:35 +0200
Message-Id: <20230509172344.1516743-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181073

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libva-initial_2.16.0.bb => libva-initial_2.18.0.bb}      | 0
 .../libva/{libva-utils_2.17.1.bb => libva-utils_2.18.2.bb}    | 4 ++--
 meta/recipes-graphics/libva/libva.inc                         | 2 +-
 .../libva/{libva_2.16.0.bb => libva_2.18.0.bb}                | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.16.0.bb => libva-initial_2.18.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.17.1.bb => libva-utils_2.18.2.bb} (90%)
 rename meta/recipes-graphics/libva/{libva_2.16.0.bb => libva_2.18.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.16.0.bb b/meta/recipes-graphics/libva/libva-initial_2.18.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.16.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.18.0.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.17.1.bb b/meta/recipes-graphics/libva/libva-utils_2.18.2.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.17.1.bb
rename to meta/recipes-graphics/libva/libva-utils_2.18.2.bb
index 1e475e804b8..c7bf36023d1 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.17.1.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.18.2.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.17-branch;protocol=https"
-SRCREV = "3a291be22cfe70e41bad8a376fa278efa651fdff"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.18-branch;protocol=https"
+SRCREV = "76993ae8d0fbd17e5bfff80ed495c71e727f0d06"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 0f16dacc98f..7ed0c9ed890 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "115faca0db2c417a37da49830870e260450fa13066f5e24e252a20c36d920a1c"
+SRC_URI[sha256sum] = "a3577eeba0c23924686c7e2f2030073736c8282a80f27b5473e33ea94ccd4982"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.16.0.bb b/meta/recipes-graphics/libva/libva_2.18.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.16.0.bb
rename to meta/recipes-graphics/libva/libva_2.18.0.bb
-- 
2.30.2


