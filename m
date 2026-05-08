Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF06CD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 13:30:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13674.1778247047726278108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 06:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TlUUqv1N;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so1102684f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778247046; x=1778851846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZng3KXAWzZe/gL+rPxLYA9vHbbpECMj3m8NGtDwB+c=;
        b=TlUUqv1Ni7/35XTmKVSbYk6ClNsn9/XBSzOoIhmHxx1AEtXAj1JmawcEyUA2PESNjS
         UE8Lh/yR36pMKpj/JUDfnnAwMqKPn3XnRy124zQ4ovHbQHYepqLFsAV7kRSQIQRHQp9Y
         /H8/pgLq/uXz/GrmuFhRd1dvvBt32Ku/B6NDUSAZDZr313aRlc1+UTYYnbzUfxqb1CXu
         c5JqIVmQxkuS9rljNbrlA2rUv6SqeBZM8p/JqPyi7+dvD10D88jKKCAcNOz8TuBsl7sz
         NwthbeRFeFQbxLIWt/yySzI0UX6CQ/8wZ3HZKPdimoC659BhwcSLGyQygAWLWEzdJuai
         5Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247046; x=1778851846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZng3KXAWzZe/gL+rPxLYA9vHbbpECMj3m8NGtDwB+c=;
        b=ji8SMp351dIHtJxkjFHBb3XwnBXZoK6dNXiI11LoTtQhxcx2+JubH03Gxil/Bj28yK
         E2lrHHZk6zDBNHI9z+XiPvBOnXOP+X9Nga5DIYY2bcQaGofzS1xKZf8HLhU7vgSKHB+l
         TaZZ8p5ZERLDXC80buu7JzPlpLJb63ddhSrDZqmqNRmqGIYzh0vRuA0TkI7XpnASVIXl
         GybFVwdQkSgsQFm2gYlvxg1/z6Qej6qHTofoStUC68OzgW91ih1/9YNEduXe2BTgd7w6
         7PenZ2ecOyUY1mVrsKJQoo0BbXHp291Ua7po06xJuq0sC/qCOEWQGii33KfvS5b0kOJ7
         RUyQ==
X-Gm-Message-State: AOJu0YxpbU7Z2O82q9+NscMnNJwn0PHbDIENCZ5mmACZt0rrhkGqPSXk
	kjJDxDbWedknGq6RQUfEUpKAzyAgv0J3gGo4tn/rwhCO7kWxyJdryeP55wmp7w==
X-Gm-Gg: Acq92OE0wPUVWC8J4jtW/SefVbha5cmP+5uRfa2F5GTMvey3cLVNeFqjFHTDKtkCM7P
	uqVi0mTb7TfS+V0DTYtBQ28GcHVU40JdcnE7wr2rDFpJdwoQegjMfGhpmwi3T7FlvQvlqkXkGvB
	x+39zRtHq3EZkCNRfo1i+l7HUdfw7ojdthHtGKPpYayYWeZ4sL6JMZ/N9BvuG2D+8FHBkyqCY1i
	pro27oMd+bBYcsCNBjkMdbakBxSQwtxbJA0dUAI8Q1OiBrhF08YO8I7HV7g3A/iXrNrfcSTDQZT
	mD61zl7LSfn94WsCz6Hjhd/PA60m2YcsSvFoY3KSwir8W9ZEA+1MinJh5o8fLIJkNqJKHu81yp6
	lUHG6SA3EYwBp0q5I7IIBPuirVrt5yShD8FJUAL0xe7hcsfAaXR7r0v/nnK/TZ8dET1Dso8zkub
	V/HJNWNaCPTUnBAS2GWTUvC9CkOIwWL/Hx6KCiueGWMf83DPzP6KoP+sFED1s=
X-Received: by 2002:a05:6000:24c9:b0:43d:6a02:b7ad with SMTP id ffacd0b85a97d-4515b05735dmr19948911f8f.4.1778247045817;
        Fri, 08 May 2026 06:30:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm4701161f8f.30.2026.05.08.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:30:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] sbom-cve-check: set PV from upstream tags and ensure version checks are correct
Date: Fri,  8 May 2026 15:30:42 +0200
Message-ID: <20260508133042.1046523-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236714

From: Alexander Kanavin <alex@linutronix.de>

These recipes didn't set PV, which by default is 1.0. This isn't correct:
upstream does provide date-based tags that can be used to perform version upgrades.

Correct SRCREV in one of the recipes to point to the next tagged commit,
as existing SRCREV was pointing to a non-tagged commit between 03.19 and 03.20 tags.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...b => sbom-cve-check-update-cvelist-native_2026-03-19.bb} | 4 ++--
 ...> sbom-cve-check-update-nvd-native_2026.03.20-010002.bb} | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native.bb => sbom-cve-check-update-cvelist-native_2026-03-19.bb} (79%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native.bb => sbom-cve-check-update-nvd-native_2026.03.20-010002.bb} (70%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-03-19.bb
similarity index 79%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-03-19.bb
index 3387122165..850537e777 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-03-19.bb
@@ -3,10 +3,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
-SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
+SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;tag=${PV}_baseline;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# 2026-03-19_baseline
 SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.03.20-010002.bb
similarity index 70%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.03.20-010002.bb
index c868ba09c1..d1290ba8e3 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.03.20-010002.bb
@@ -3,10 +3,10 @@ LICENSE = "cve-tou"
 LIC_FILES_CHKSUM = "file://LICENSES/cve-tou.md;md5=bc5bbf146f01e20ece63d83c8916d8fb"
 
 HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
-SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
+SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;tag=v${PV};destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.03.19-010002
-SRCREV = "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+SRCREV = "71a7984884a918f7f1464a0efe25ba4a24c569ca"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.47.3


