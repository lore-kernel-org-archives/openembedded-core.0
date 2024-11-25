Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B61DD58084
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17080.1732536095391589459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+6hq9L9;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a1833367so2505375e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536094; x=1733140894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE2s4/g4d44/9ftD3Q/jlOlFLhG9jsaibpPZXbEXGA4=;
        b=c+6hq9L9c+z0idr2FYyL8KcNvNB/EQ9QdPHtB9WBpHxCFs4kYPwXiHO3e6U1b9ck1i
         N3xOYbTymRMcjmFNOi6dVb65DcL4MbT+zWgyfMj6q63EV6MlpbdI5FHOttxYZRIA4dPe
         Y4y5gPfzLHSKKJ3TnZICrhbxnJEbmmPi6yZs5bDNO0Y+xTikNY59asoY6XuHt0kLFUAj
         N6gvfZ88ErSLYqlL3eHT7c7ZCqn6rpCF0de51vt8QobN/jU4V8v4YO/9QyVves7OpkGQ
         sLvXozmWmr6fdqOGvcmaKVAyXWO15sc7f/VRuBUv9cXP+QKcO2NlXBAi4wAtcoNOF+6X
         uUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536094; x=1733140894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE2s4/g4d44/9ftD3Q/jlOlFLhG9jsaibpPZXbEXGA4=;
        b=XdoDgOXfV9jHi78sSzTUzwb6hBOmLfJKEgIUyNg3RXdtc/4VGAgpQwl8ZKn9O2q94a
         AXRM11M93xZhbSV4JOmGunbVQRrKIPMumSMlil0rUY3NnUoFNCnCC2ImV6Vf6sGmAjNV
         Rx+9EdXcadtF9SC7/F5A+AdG3PECcNmj5sLmVdj8ObMOtAUOxxrflqOiV+MMQUCESmkN
         g/YuAmcx7VHTrMdUgBs/WTYOHQCqOTgFx94F1XFF7V+JYr41dThENiAzuoU/l/PF8/g4
         ajSjxa4Ei4zdkmAmgHvuK3C7vXCuWi5jLRPez1b415mLLZdQzjaUr0M6/L1cKg42b7bz
         jgsg==
X-Gm-Message-State: AOJu0Yy92fakW9XcsIAF6EBD3piBk0epKWbxPrQuVOvveEA/k7e5py1v
	/gdIRnBkmKHmXCgtBi8+QVDfhFnOLkSJyHPENynm/WJ+N9XkBdlJPvlayw==
X-Gm-Gg: ASbGncu50PESlWelP/OtWtodZQMrFXN99vE5TYxyUeIGfbGy71DNeMuAzs1gJ0+5T59
	0nbFjdQBvS/s8Kc9u4nqJcEFh98g4Da+ptG/t3v6vzFUhUF8XJyI3EqczTBJO5/20KWRgkYuXcU
	XmrQyaSEl1DtjRLidqf7b5m9DQWs+DyuSltEibRZEAVq1DeG1SdNfO/0bEN3A7cmVbQwvNEVWgO
	gnE5Vu7i+bhyqskY4atxN5Ljs3ZGmanr18JSJlWJ6W7o9oRfN/45FIcY7J+RNzSowyAzMz3NbUG
	qtmV1w3wbSs=
X-Google-Smtp-Source: AGHT+IFCh6YrI8EReFBU1iGMsrSVZwTpU8krLlhflr6BqqxTFulToO3vBT4ejr37crissGTHvIGB3A==
X-Received: by 2002:a05:600c:3846:b0:434:9e73:51a1 with SMTP id 5b1f17b1804b1-4349e735249mr34240635e9.14.1732536093373;
        Mon, 25 Nov 2024 04:01:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/35] diffstat: upgrade 1.66 -> 1.67
Date: Mon, 25 Nov 2024 13:00:58 +0100
Message-Id: <20241125120127.2205232-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207753

From: Alexander Kanavin <alex@linutronix.de>

License-Update: MIT changed to X11 (which is MIT plus advertising clause)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffstat/diffstat/avoid-check-user-break-cc.patch      | 7 +++----
 .../diffstat/{diffstat_1.66.bb => diffstat_1.67.bb}        | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.66.bb => diffstat_1.67.bb} (79%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
index 46f1cfabcf3..fc42c8cba7c 100644
--- a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -1,4 +1,4 @@
-From 708c765ffb41ecc734316f69043583312fe444bd Mon Sep 17 00:00:00 2001
+From 04fd678939ad0c21f57222c48305bfa29c8f6cf3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 15 May 2018 17:17:01 +0800
 Subject: [PATCH] diffstat: fix wrong evaluation of CC
@@ -12,16 +12,15 @@ be included in CC. And then CC will be wrongly filtered.
 So comment out CF_CC_ENV_FLAGS from function CF_PROG_CC.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  aclocal.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index d4bd283..1b653c4 100644
+index 1c653ea..8f0540d 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1522,7 +1522,7 @@ CF_GCC_VERSION
+@@ -1584,7 +1584,7 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.66.bb b/meta/recipes-devtools/diffstat/diffstat_1.67.bb
similarity index 79%
rename from meta/recipes-devtools/diffstat/diffstat_1.66.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.67.bb
index d59379fd2b9..8c84b30975f 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.66.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.67.bb
@@ -4,15 +4,15 @@ the insertions, deletions, and modifications per-file. It is useful for \
 reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5713b4719a66a6527e6301e8f8745877"
+LICENSE = "X11"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6232ea974e4cbc4ee06b49ed53df6ece"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "f54531bbe32e8e0fa461f018b41e3af516b632080172f361f05e50367ecbb69e"
+SRC_URI[sha256sum] = "760ed0c99c6d643238d41b80e60278cf1683ffb94a283954ac7ef168c852766a"
 
 inherit autotools gettext ptest
 
-- 
2.39.5


