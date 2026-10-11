Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ECCCA9ECF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23451.1791708089591590942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qEpIU3T0;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02718da81so7072815e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708088; x=1792312888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nh7UOtNWe5PyzALQ/UflpgcpJ7Ps7/WRN8jlHbzohwI=;
        b=qEpIU3T0vnIqsJ0iDT5cOuiD1gEMWzLMske0TAwQRk9Pk5ZEGT2mgwBq6M89g9qWGm
         NvNny/LxE2EUwm1hu3oeo5WVVQmmSJuF6OYU+V0kvLc3iGHEEy2qYepjKPllZ2n030/6
         ghvYJCiWaNpIAZWSlaUurRgmm5+lmc99h1vvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708088; x=1792312888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nh7UOtNWe5PyzALQ/UflpgcpJ7Ps7/WRN8jlHbzohwI=;
        b=A6cyuaAPYij1PNIUDSULm2G2kf6ngr0Rc34viBJ41GV75/XhfS4WzF76Be3YE6xcU0
         j/PB/09pg2gys+Ebo09BrqddUUeaCBQNhNRa1RG9dNsT5QBfoJgmhFktEuEcjWVqqnRF
         3MOv6CTtNZmWKyXq0qFnUPlDBrs2YC+8H2OJAP1M/cT1W423xMSGrUaxa6q3IG1a9PGH
         7MWEM9k09/d8lCNxVvurCySMkuyLlL7Z4wmkxQv6lsV8Y43fg6WDNCMjNgRY+caGXnkJ
         XIUu5W6o9VLnVTCLIH9E9L22q052YJT3sjDBvZmQDJdMW9+RwF4iLQM+RQEWMykXFwQt
         5Slg==
X-Gm-Message-State: AFq9FYIDiiBDEPk51T1N0a7pxwfkzxSbajyn2B5nlyNRtwdFXuUURD9J
	H33nwLCkf7CNL/wWyVmFi92J94fYZjlDUW7YnbQXqvMSUvMdpX6IXzNatmhQ2PNG4yD/+f9iOHn
	62kmgphI=
X-Gm-Gg: AYBFou3jrMVwvqVDidJ9Gjbu+1DrRAz6Y9D3XHAwmth2Kzd/Ao3jwoVcaWqwQ5z+fj+
	fZuQIhn+4hxoIwyfXERjQ/q6CnhiilSVfw8Q2mjTRqmWFxIYI9RERErAlGzcM/ilROvClrt3OAS
	KXTf32w7rCV3iSOQK7IqH1Lwv/8hFPjenYwPgbDvOSWVmYC4/dzryuZ++50tId1vB1MSKAQM5xl
	hG+tJMLqQVqqZtmU0vrSrVwQ6g2+KVSyYx2FD3YASpj9TWARvQT1+VMxls1GnoJuYkHFtFmZCTV
	Lw4qG9pIlOs2KEMeLlIDbqITw75G/NSJVDS33qI075BUWPl7flAABkqQFivp7pq/yDQ1A1p6hQu
	+CgQr5xshIqREQEHaf+7h/CekOjNaNtHqRBT6GtmNhHwnQwpBbGhuKmFghW8xkYiVxdm9NGKTCT
	RAm8zcuomVNxZBPL7VKY+KB4Vahbtj/Nv/jRYem+hg8C7+jXtPZVR6mkas0Dqk4CqYHl90H/UTI
	8AWXT7WqDZhbn7YL4mBDNbrvOWixf7+cq8eQQ1tpbv+Bn4IVm997HOwnHBXZ1VW3VpW24tmJw==
X-Received: by 2002:a05:600c:3554:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-4a18e4a01a1mr121078365e9.6.1791708087725;
        Sun, 11 Oct 2026 01:41:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 41/60] expat: patch CVE-2026-76956
Date: Sun, 11 Oct 2026 10:40:14 +0200
Message-ID: <ec92b188fb73305aba92ed0c018d1b31c276563c.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247550

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-76956

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-76956.patch          | 26 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76956.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-76956.patch b/meta/recipes-core/expat/expat/CVE-2026-76956.patch
new file mode 100644
index 00000000000..96d9b68ee7c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-76956.patch
@@ -0,0 +1,26 @@
+From 40daa9996d616e66a75dea41ed2b18f2c3901b9f Mon Sep 17 00:00:00 2001
+From: Sorrachat <32319737+Sorrashut-K@users.noreply.github.com>
+Date: Fri, 14 Aug 2026 17:29:50 -0400
+Subject: [PATCH] lib: Fix inverted getentropy() return in
+ writeRandomBytes_getentropy
+
+CVE: CVE-2026-76956
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/40daa9996d616e66a75dea41ed2b18f2c3901b9f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/random_getentropy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/random_getentropy.c b/expat/lib/random_getentropy.c
+index d258df6a..ad8b1984 100644
+--- a/lib/random_getentropy.c
++++ b/lib/random_getentropy.c
+@@ -54,7 +54,7 @@
+ bool
+ writeRandomBytes_getentropy(void *target, size_t count) {
+   errno = 0;
+-  const bool success = getentropy(target, count);
++  const bool success = (getentropy(target, count) == 0);
+   // MSan does not understand `getentropy`, so explain its effects
+   if (success)
+     MSAN_UNPOISON(target, count);
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 5d30a844fa0..c3c9f738453 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-66046-01.patch \
            file://CVE-2026-66046-02.patch \
            file://CVE-2026-76641.patch \
+           file://CVE-2026-76956.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

