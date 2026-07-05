Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8713C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140032.1783291387013904424
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mZ6U6hni;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2016943f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291385; x=1783896185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pG7YfEdR70MUsUKBhO36QwyG9qKpDNxPMz4ArALpXvI=;
        b=mZ6U6hniCQCvpWtUb2GGJbfhW7VQje0RkTzAn9Y8lTDGc6ZiSDJTh5Vvdhd6wuN6Q1
         a5SMPhO5HiTVJvP5IKsO9c+pt60b4Z9/0w6WVGmHOShLzfGx5s+lJt6qaPmIX7OifOe8
         fD3ImeeTt6zlZ/0Vws7wNYBQf1ISrkuXHhHrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291385; x=1783896185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pG7YfEdR70MUsUKBhO36QwyG9qKpDNxPMz4ArALpXvI=;
        b=nhxZolX9r54/s6/e6BPdlZjXrm/PUadB6aYYk5h15Zw1BIom5pQlEqU5IBCk75gbNe
         K7qf/0rlB96s3BQzfBlox9mpC2CwMJiD9t6y9IDtNeC3siKPBOMpUNiMpBWnW+klgLLs
         o8Fysy1OHav1mhA06QDfxyDLPSWLF9C8+42YaTZvS3Ko/zDXjiHsSKeTuXb6Ifj0poke
         xDXaqv65HeR/1DM/gIletddJ1IKKpSFDQooIXtO9h5BoL0sevVxTBB+HF7kFmUBBpbBL
         OfloM6olEPyVf0eiQwHvlKMQwNNR4r+EMbXEKtSnqRB+QIAGNl/o8DEwEUVH31g2Y+KM
         QZzQ==
X-Gm-Message-State: AOJu0YxXuiWyo0q+wgTfStAvSJoqSlFU8v3H2gSWL2sfS38syVvPvcmc
	lWKIEstaMnuMElZWDrdmmrqpGEKT2AVSSt/kWWk29BBmI4WeBDYyuC7Je2sNxU2JZnpTLb0vYMP
	24zchaaY=
X-Gm-Gg: AfdE7ckXH2jaslGQnjE3bn02U0aM/CbaWJ5jfR6y7cIFQZJOvgC8aBJ6Ib1phDyqTlV
	jYxaZ0M7dfReY1b3eArwgxwvwdCFoF8YNulN+qdNaHv5FK5bH6WnFO9LpaSDJr6ZeC1OZv0PhMu
	S7WvAJiPfbjy2TwY4XGxreK9mjf6//oEbUAQFjX6FbePT1ZxnqKP62sU2n/g2toIIg+C5/PkAri
	yzoswQNcOhEfDMZvcJjcM91an0XTL4+ALpw3NLi5laGB51zqUaQOxoWOVH+WFeYLpBnV6CyW0NG
	PqkyvsyTeEA+QFsLpM0Er4WEq2lPzoBY5Xt1UC2XOttzcQiXM+wwmUijkLpvkm0ELpD5CIDn89m
	qZIrE+0E/P3wp8YxNjmpZJLUJegASEFt+DIq2wt3JRgyyZLmIXrAEINLtACfSL6zCvoyHsyuI0/
	q6KnNHrGCDsc0pwcy2EXxJH86H6Q==
X-Received: by 2002:a05:6000:27db:10b0:477:6874:5413 with SMTP id ffacd0b85a97d-47aae5a81d9mr6074317f8f.58.1783291385306;
        Sun, 05 Jul 2026 15:43:05 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 37/55] python3: skiptest tracemalloc_track_race
Date: Mon,  6 Jul 2026 00:41:27 +0200
Message-ID: <df2d27df60a68824bdfc503f33d60b585078eaa7.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240191

From: Kris Gavvala <kris.gavvala@windriver.com>

In python3 ptests, tracemalloc_track_race fails with a segfault.
To avoid ptest failures for now, skip the test.

Fixes [YOCTO #16182]
Upstream Issue: https://github.com/python/cpython/issues/143143

(cherry picked from commit 7504490ba5e6ce0317dd12bdb961542062f05830)

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index ed413dc1fe9..fd407c96035 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -253,6 +253,13 @@ do_install:append:class-nativesdk () {
 }
 
 SKIPPED_TESTS = "--ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"
+
+# Fails with segfault
+# Bugzilla YP 16182 (test_tracemalloc_track_race)
+SKIPPED_TESTS += " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
+
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \

