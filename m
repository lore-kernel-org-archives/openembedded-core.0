Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1058CC6FA86
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 00:51:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.3745.1663030297363357974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 17:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZIq0ZLA;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id f24so10214951plr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 17:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wlKB4j5RLKSXMLzWmuAsmvZ8fNZX2yxIEzEFMuEjEuU=;
        b=VZIq0ZLAAb4+zd+XymE/cvPc05d+DDGE4lokZddR6UQ1W/WPvZwpbJY22lZMArbhQV
         6AJfuvGrd6ayf02e8OmtNKULQ/M8VerVtf1V0f+qle1DtntxnW1w4gbwpe8HI23mwOYJ
         rUprU3CMT/M5GTvdxXTVnmRUCaUNGM6dOiKXjnNQiTnNGi2NnRS4hbllektHCWsWLj5X
         HKYtWUewXKQohVZriXYOK1BMgFuWzrm4jM6x9/ih2INK2NW/7F1+6J+hVfvkxpEGNE8o
         SSEDA3V1N3Q+Xejm5KU4UkmXcaCQbPC6Hp8g50AW2FZImvI1xLT6tHFJfPeDvkr8GpvG
         dXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wlKB4j5RLKSXMLzWmuAsmvZ8fNZX2yxIEzEFMuEjEuU=;
        b=jy4skCawLnTJ+8xbcrJiLK5jVSd7OxKP2FpdZU82J3fZEZHqVF1+PrSENS+s1DF0Xb
         IROUtmjjtyWxKHYiMCIWtGEZt+G6SvoknAt6xiW2NmXDsPUDKRZ25p+84vkqeiO0adoz
         j1ddlk1G68nwZesJ5CYqvA3SfCyOJrIGoVa6baq7BvL17kVl7SuN9aHPTgrf3ukj9Bwb
         Swyuy+3NGvDHCRh9HQ69PMRfheZnKrF3Bi/uJSuL9PWLCkumfKo1BDDolPPrRQwD/MPY
         ZcK3EqqSYtFG+IJPsrkkcHhOiGo38rvGe+jyJyqR/eEMP8rjuzqF9LnYkKoDgbsXp7mV
         fu9g==
X-Gm-Message-State: ACgBeo0pg/zNpj16WHRPhAct/vYUzqJsDtTIWDW5aDBwupuvY7cxvoUG
	CYm4rq5iaHP0OPHM5GhLioL9xYxnidAf4Q==
X-Google-Smtp-Source: 
 AA6agR6+gO8B4euKIuxHpdB6ZMgRiL3ia0bPCEzsBuJjWwbH6vd+MwZZFn1G82gPScARju/PRuUZzA==
X-Received: by 2002:a17:90b:1c82:b0:1ee:eb41:b141 with SMTP id
 oo2-20020a17090b1c8200b001eeeb41b141mr1164004pjb.143.1663030296285;
        Mon, 12 Sep 2022 17:51:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 g6-20020aa79f06000000b00537eb00850asm6186246pfr.130.2022.09.12.17.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 17:51:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] binutils: Ignore CVE-2022-38126 CVE-2022-38127
Date: Mon, 12 Sep 2022 17:51:32 -0700
Message-Id: <20220913005132.2218132-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913005132.2218132-1-raj.khem@gmail.com>
References: <20220913005132.2218132-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 00:51:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170554

They are already part of backports to 2_36 branch
as noted

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.39.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
index 37627c8f93..e4fdb73243 100644
--- a/meta/recipes-devtools/binutils/binutils-2.39.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
@@ -34,3 +34,7 @@ SRC_URI = "\
      file://0013-CVE-2022-38533.patch \
 "
 S  = "${WORKDIR}/git"
+# Already in 2.39 branch
+# - https://sourceware.org/bugzilla/show_bug.cgi?id=29289
+# - https://sourceware.org/bugzilla/show_bug.cgi?id=29290
+CVE_CHECK_IGNORE += "CVE-2022-38126 CVE-2022-38127"
-- 
2.37.3


