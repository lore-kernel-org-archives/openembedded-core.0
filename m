Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BEBC7EE23
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:14 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.39169.1683653044213192748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ekcq8Dpc;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-965f7bdab6bso918241166b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653042; x=1686245042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StO4sFvLdxQJtKlhqXDkSyusX4W2r2KN8pgyEqkSwBM=;
        b=ekcq8DpcrVIumVsfs36TXAu2x5tcHuglfh3y5WK/7A5MFXMHa2oB7xOk3+5e4T/zlN
         GzTYrFT6xgKNcoqaXv/jSOAdw+iB6YEpLZXiJOb1apJPBZ71PlxV0IDAXfiA+OeAnHFB
         bKSDcjQdpvrU3nLwWloTdzO3Z3Oz7JTx8DrEFnqznTbwJqtxOF6bZIF/GJotUbhmsGsf
         a6ryPaYnjv+jcAKE8z16/UhrpHZEmIto4Ew+l0gH9VEkEARrLKh+aT/13m+RctiYJRk/
         DhsL/NOsBpXtTXQTkAzoilBM63d1B8YYCk2ujwZOpkestrYnyQ5rb8pzRsG+1jnfcngp
         ijmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653042; x=1686245042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StO4sFvLdxQJtKlhqXDkSyusX4W2r2KN8pgyEqkSwBM=;
        b=WqdPEQsj5F+7xxJT4Tis2+OsxxWtdq5p2+P8iLiYmogySTVLUEcjIavePtNBTFzkFI
         9EfAdoGrP/cq7ZRFtaqEHqgTu2nFtyrOJ68/1Z7M6GDjl44/yik4nAKnGtfFKDzmAiSu
         cJzCglQpc3OySxhM6xbLwjBqFkHjQu6IQvbbJAYUSPYNx8bDGSGizP/37rWv5+NrYdjJ
         BZh5i3Ybe7DFNMTXZ+4iWsVHRR+HTbnvwHPx2lMZ+NdjTxGx+NrFttOz081VyTHqWmUh
         paDRjJoBhpSZTwUOzmTa1yBKqZjMMTMdzolvqC2OzMsZ1LeHCWKrvLEniwj3gBanQXfY
         1nFA==
X-Gm-Message-State: AC+VfDyPjWnhQDjED2iwc4dH53EQJTkZXZYq5kwnJ5f9zy2aDcbMWFWk
	mpsfxvbSpuvjbrLXG237NjkUPauem3E=
X-Google-Smtp-Source: ACHHUZ70VvaOLn8O1Qz7fvxiVpamsO02REKmga3b0Wqvtw4tVVzN91aoIRehjglZ9aoN6htyxSnh+w==
X-Received: by 2002:a17:906:db08:b0:94f:1c90:cb70 with SMTP id xj8-20020a170906db0800b0094f1c90cb70mr13491682ejb.66.1683653042742;
        Tue, 09 May 2023 10:24:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/27] libatomic-ops: update 7.6.14 -> 7.8.0
Date: Tue,  9 May 2023 19:23:38 +0200
Message-Id: <20230509172344.1516743-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181076

License-update: file relocated, formatting.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libatomic-ops_7.6.14.bb => libatomic-ops_7.8.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.14.bb => libatomic-ops_7.8.0.bb} (80%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
similarity index 80%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
index fbfbdacbdd6..d4b77f62447 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
@@ -5,13 +5,13 @@ SECTION = "optional"
 PROVIDES += "libatomics-ops"
 LICENSE = "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
+                    file://LICENSE;md5=5700d28353dfa2f191ca9b1bd707865e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
+SRC_URI[sha256sum] = "15676e7674e11bda5a7e50a73f4d9e7d60452271b8acf6fd39a71fefdf89fa31"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.30.2


