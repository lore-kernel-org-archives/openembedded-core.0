Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EE2C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 05:53:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.180589.1698731615966175210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 22:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dtd3ui/b;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc4f777ab9so14086605ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1698731615; x=1699336415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hR2VnmnIIRBN1P8NihV7UOU3ysLxQrzRc09Gu/SbrsU=;
        b=dtd3ui/b52nNbwk7pECqHPsVFnKuH6XV5hcubjEdkLBB7fcDJqsKtl/4aE1sNd2Sy4
         Refz5R7ch5xy15ech1N3gqHRQynNg44+/b9e+MIm8Zj3dWFt+hkumntUsIp37Cvvv2LO
         xEmjYel/aM0etWdx9simcItG8P+iA9BIW4zsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698731615; x=1699336415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hR2VnmnIIRBN1P8NihV7UOU3ysLxQrzRc09Gu/SbrsU=;
        b=vPgb/DHXxyp8QS51ykoglcTDDXnjKTczHJ3Ux1WoGdM85NgW6oRuI+BcqkH+MwndNo
         38T/sWjpRLcw6igRAgE243NbxakjPRNUaWc4uR9TdcKbM8vfn3DrJDf6uq3h1ijljj0u
         xRxqyps6B3tCzpu1oLtde87MsCr/YxKNDrZGDTJQ9YP7NFU9yH9eLrKN5GdeKD/ZS5qQ
         WEtPVqsLkqoEWnE0eiq/7MdjooYDbQPrtd0abyPNOqI46sQZuvopXtelGW13sRYy+zCT
         jp2w2xZ0etcRzTQKRDL/pm2KmFlXk85Pjp+KeCjxz1MHU7BlsR0YMhXZQ18QfiGLucp+
         qPEA==
X-Gm-Message-State: AOJu0Yxjj86G6Sg5iH+Ja+YURzB1WLFauzsRjDY2+so1vkFCCrZ9pKEW
	df+hbEAbA+AsGBpdNtfDNAKLPsNZLwg0O4qM3NQ=
X-Google-Smtp-Source: AGHT+IHfzJ7W0nh1Igj3dNKPJTxnzkCMowoUlFCKT4o+nQVsO//lClpPxtY3giw0P5fNTXzr8OkoWA==
X-Received: by 2002:a17:903:1c1:b0:1cc:6b5a:a2f1 with SMTP id e1-20020a17090301c100b001cc6b5aa2f1mr307298plh.8.1698731614915;
        Mon, 30 Oct 2023 22:53:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:3421:c205:c655:5bd7])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902bd4300b001cc2c7a30f2sm455570plx.155.2023.10.30.22.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:53:34 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] tiff: CVE patch correction for CVE-2023-3576
Date: Tue, 31 Oct 2023 11:23:20 +0530
Message-Id: <20231031055320.482206-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 05:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189829

From: Vijay Anusuri <vanusuri@mvista.com>

- The commit [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
fixes CVE-2023-3576
- Hence, renamed the CVE-2023-3618-1.patch to CVE-2023-3576.patch
- Reference: https://security-tracker.debian.org/tracker/CVE-2023-3576
             https://security-tracker.debian.org/tracker/CVE-2023-3618

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../tiff/{CVE-2023-3618-1.patch => CVE-2023-3576.patch}       | 3 ++-
 .../tiff/{CVE-2023-3618-2.patch => CVE-2023-3618.patch}       | 0
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb                 | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libtiff/tiff/{CVE-2023-3618-1.patch => CVE-2023-3576.patch} (93%)
 rename meta/recipes-multimedia/libtiff/tiff/{CVE-2023-3618-2.patch => CVE-2023-3618.patch} (100%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3576.patch
similarity index 93%
rename from meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
rename to meta/recipes-multimedia/libtiff/tiff/CVE-2023-3576.patch
index 8f55d2b496..b17dd72170 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3576.patch
@@ -4,8 +4,9 @@ Date: Tue, 7 Mar 2023 15:02:08 +0800
 Subject: [PATCH] Fix memory leak in tiffcrop.c
 
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
-CVE: CVE-2023-3618
+CVE: CVE-2023-3576
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  tools/tiffcrop.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618.patch
similarity index 100%
rename from meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch
rename to meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618.patch
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 8dcd73273e..e925b7d652 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -40,8 +40,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-26965.patch \
            file://CVE-2023-2908.patch \
            file://CVE-2023-3316.patch \
-           file://CVE-2023-3618-1.patch \
-           file://CVE-2023-3618-2.patch \
+           file://CVE-2023-3576.patch \
+           file://CVE-2023-3618.patch \
            file://CVE-2023-26966.patch \
            file://CVE-2022-40090.patch \
            file://CVE-2023-1916.patch \
-- 
2.25.1


