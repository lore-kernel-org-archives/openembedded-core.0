Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB15C4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6549.1635842593774514682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8D2DjNt;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1481086wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=49y2KZUa4LmKLbGYQS21n9NvlsFtQ2NnYeOVeCQFys8=;
        b=c8D2DjNt+V27AO25n32drROkrQ51Twn/sDO+6SfHNN74oOjVlgUPy/QaL0cjHLEP4X
         zy7R4uaf1Zg0FJQiHuWIUqrHhW5QMk2+eYpvTzJaNguzDbWGY75GqY60Djq9/vJYyS0N
         LrLjKEfYloZ6d9fCWT1S8U4E+yK846GleumPRUnt4EeOmcNkGEp1UTW7dfgCOBL8hK1s
         X2mApZlc/dqwd2whr/j92Z6CvSZ0ztwlr1mOsAF5rh/chnKZQVFRFP3rpjZU9YZtZrhc
         zSoxE0SyIAKlWNVzoCdFVJbKoInwQR9unW/g6HACiJa7EzR3D6JSxi6rxBgV3jfrEKL6
         OmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=49y2KZUa4LmKLbGYQS21n9NvlsFtQ2NnYeOVeCQFys8=;
        b=VRfOrO1F4LOB8WEn7N+s0NA4qbDZauXyDgzXmGE3AlfGvGxXKw48yGGLp+Wi8un8/B
         XspmPvSk7YgCoANEU2znRD228sNeZCxisMz73J4LEdZ65sWbFKneNoiRnATP6YineJmD
         c3A0Zza0ApSW3BibLnrq1USBbbO6g2dRadRPKkWUxqEVUaPGG7TLLFO7ATW4j0e5r58k
         Rq8b8P2et+eyVVhi6uNZGncBsqQStRGtfIvdRmi11ExLUC1LZa6sfNNMnsPwUeUdspPO
         se/xqod2Uq9yPgUZPokwEfX+QJRIUC2i09FqIfaZlkx8z16fSItUcqRx9F0U4JiV9ZdN
         TiAA==
X-Gm-Message-State: AOAM531k31TVlwC3yiALAue1qWGJmby/3+RrguqNyTOtPvDHAFqePxFL
	bTsVizTZyJVtanWCwYN6zdViUuRr7nU=
X-Google-Smtp-Source: 
 ABdhPJyBg3POSdVS0pREhEhfGC4URx67K2wt99JOEccs8ONpzF43EzE9Twz9mQ/mcGmc8mOpBGkzTg==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr5210779wmo.136.1635842592398;
        Tue, 02 Nov 2021 01:43:12 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/33] lighttpd: upgrade 1.4.60 -> 1.4.61
Date: Tue,  2 Nov 2021 09:42:42 +0100
Message-Id: <20211102084303.2974802-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157750

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-__BEGIN_DECLS-__END_DECLS-if-needed.patch | 38 -------------------
 ...{lighttpd_1.4.60.bb => lighttpd_1.4.61.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.60.bb => lighttpd_1.4.61.bb} (95%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch b/meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
deleted file mode 100644
index 2a9bb352b5..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c1466f3620f608e4def4b8853c4e2bc6d9a19646 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Mon, 4 Oct 2021 09:51:22 -0400
-Subject: [PATCH] define __BEGIN_DECLS, __END_DECLS if needed
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/first.h | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/src/first.h b/src/first.h
-index df747ba..9d0428a 100644
---- a/src/first.h
-+++ b/src/first.h
-@@ -39,6 +39,22 @@
- #include <sys/types.h>
- #include <stddef.h>
- 
-+#ifndef __BEGIN_DECLS
-+#ifdef __cplusplus
-+#define __BEGIN_DECLS extern "C" {
-+#else
-+#define __BEGIN_DECLS
-+#endif
-+#endif
-+
-+#ifndef __END_DECLS
-+#ifdef __cplusplus
-+#define __END_DECLS }
-+#else
-+#define __END_DECLS
-+#endif
-+#endif
-+
- #if defined HAVE_STDINT_H
- # include <stdint.h>
- #elif defined HAVE_INTTYPES_H
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.60.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
similarity index 95%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.60.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
index dca8934ad2..32b0ae4ace 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.60.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
@@ -18,10 +18,9 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd.conf \
            file://lighttpd \
            file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
-           file://0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch \
            "
 
-SRC_URI[sha256sum] = "4bb1dd859e541a3131e5be101557d2e1195b4129d3a849a3a6fbd21fe1c946f0"
+SRC_URI[sha256sum] = "43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.20.1


