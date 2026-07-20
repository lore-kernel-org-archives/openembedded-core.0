Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12FBC44534
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2897.1784568217941760168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EIP5lMvI;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so45662295e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568216; x=1785173016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HF+gfoI0duFTXBwdA++ro7fQQ++CNS/hPiM7+1sQ4qA=;
        b=EIP5lMvIiDdGcphI7HvcnsqGaC6HUR/1GUF0gkOQYmAPIaC9dxVdT0su6PglWFB0pB
         bCpgx89TSDB/1MUFztMBZC9YunLN2N+gBCmNDSYuGGrATDQu+YQ9REHrD6BagDGyq7vs
         lBmJm+TRT4zq5em9hkh+ARnIGWi1F19uiBMpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568216; x=1785173016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HF+gfoI0duFTXBwdA++ro7fQQ++CNS/hPiM7+1sQ4qA=;
        b=eS0ScOGqglLSeKlU3h2RXEKxegBYdQsvRD2idY5aTd7CIn7PVwQJjPKSbohS0x0Nhp
         Xq6O2LEatlJFjQkl+iJf8RfVU9yqDpt/JDkrLT3Pptwlpdozn7jM4C55oS1eHJ0kicCN
         dmpaCZx87aSB3H0QbdLIw+Nf4qPaW+FwhTncrkRJ8PzDPTbQbo/3BQT83nN4EkgszqUn
         b6qzHe8uNFpBC6INc0DsrdFzk+J90uFr2uS/kAZdb/bf2SgXaMofjnipSQjfwrV+m+if
         Z8c7SKQPlzwAGY/Dqyg1wDQkpBsI8dRd0YNbI7c5b0QWkVlMaEan5AeVMdN7FPK/e+q6
         KB0A==
X-Gm-Message-State: AOJu0Yznn7Ht+DaTZQo5q7PNDJNKfwxu1koou0Z6qitQLkRTuOxnRGbZ
	sEtSFxb0wYgmWaIFQqjvsvjdmRxmg7ceRytmxwPQxMYUh3gQM9nhpxSi3p8Kx0F3+42DLzodR6+
	6KM/pcP4=
X-Gm-Gg: AfdE7cki4Ku0N6SvKnMnnytufBnk2QThAXP7P2ptNsREpwd/odB/pA8jLuhmqZQ+rVM
	vmbgIpIC2SibR4dBSZfuyVpE2S41+X990lP1PCXERYqDpV700qWWEZQQKDOsZD/aq8FrvRRS8ll
	KHocH+JYIQQ4BZNnVzchP3eVjrxuA5IoekzXWffFE/40pc7LXgnzgvVhTXbGXEXmhsbfD2oo3+0
	zVqEdO+SmEnk36rGQdRkaAweXUrT+ufbiEjHFx4VvXC7oXpZIFuULkUl1Tkh9sf+Jl1zb4LE0hW
	QeD+O6P0lMU/5D9M1ITn5s2I0c+BX6bO1VJDc+IFESfy2thAMrCzPO+QNwimhHY6HdnI16wKi7k
	YFBWCirGxZtX5kqqIlUgglyly+Z/aB+SLaRYR831EPLKNvhQlxYM1XW2yY+Hub4WGYCFE3QDt/z
	XLS7skJTuON7Xgbh4OM+nR23vTrTwuHjExKsB99DTDyS2H05ieTVTwsY19csMK/ae2tDlm7hiMd
	8VOd0wJ
X-Received: by 2002:a05:600c:45d5:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4954a40843dmr164165015e9.25.1784568216122;
        Mon, 20 Jul 2026 10:23:36 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/33] dropbear: Disable DSS correctly
Date: Mon, 20 Jul 2026 19:22:46 +0200
Message-ID: <56f5e0e276a5f39e5ae7fb9e61a4ef64aa51bd7e.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241447

From: Mike Crowe <mac@mcrowe.com>

Take upstream patch that stops sysoptions.h unconditionally turning
DROPBEAR_DSS back on even when it has been disabled (which is the
default).

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 30 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
new file mode 100644
index 00000000000..250cbb7a6f0
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
@@ -0,0 +1,30 @@
+From c7dfaebd5f6a4cde4198f4d2a7baabaa1f632274 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 6 Dec 2022 22:34:11 +0800
+Subject: [PATCH] Fix so DROPBEAR_DSS is only forced for fuzzing
+
+Regression from 787391ea3b5af2acf5e3c83372510f0c79477ad7,
+was missing fuzzing conditional
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/c043efb47c3173072fa636ca0da0d19875d4511f]
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ sysoptions.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sysoptions.h b/sysoptions.h
+index fb6adc7..12db59c 100644
+--- a/sysoptions.h
++++ b/sysoptions.h
+@@ -383,9 +383,11 @@
+ #endif
+ 
+ /* Fuzzing expects all key types to be enabled */
++#if DROPBEAR_FUZZ
+ #if defined(DROPBEAR_DSS)
+ #undef DROPBEAR_DSS
+ #endif
+ #define DROPBEAR_DSS 1
++#endif
+ 
+ /* no include guard for this file */
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 93563aa3b47..d203fee34b3 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch \
            file://0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch \
            file://0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch \
+           file://0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch \
            file://CVE-2025-47203.patch \
            file://CVE-2019-6111.patch \
            "

