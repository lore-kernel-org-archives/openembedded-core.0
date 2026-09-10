Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D3CC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 10:34:50 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10809.1789036489728270294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 03:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BxU5h7vQ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso8854015e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789036488; x=1789641288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ypkteJOHPA6fd5/DkV59Ae2242ZMaSOsapFWOgjWnNE=;
        b=BxU5h7vQLX7QBtrOIOGY44RITKN6cn7VPqrt1hk326Lx2SOuMP5ZOtx/jWlGvNwjc8
         MMqFoQoJGVBl4eJjn7Afo8+tlY+PnqAIrOgXe0PUs7a/p2I0R36xUQUaVgWfQA/VSgN3
         V2WST4+smQQbmplhg0+2wX8+QxBaNAp8otA/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036488; x=1789641288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ypkteJOHPA6fd5/DkV59Ae2242ZMaSOsapFWOgjWnNE=;
        b=Tg0qj71xKW5R8lVaHTEbTwnQZyLKoBllSu/mIOzsC5/aPugy7DlK/AccZuvcE9u5DN
         aB3DQZDodlmbAqQF9JeaJI5+jhYhbAUayvjrytICI8oRKJ4Bf4Cubj7wzkqq07Cqav4m
         URfzeJ5BvSb4E2RL5mEiYkivnQTt17563UGuXwR9Js7N+GlgaUJ81nbiSNaBqXVGHTs3
         zihAn1FkBDKexNH2UlD75ly9d2Nw0U1nukL+8zylrBrB5w3/zzW5/BQqjJQXhsVNJGhz
         X3vDkd1Icv0T4ZpHiCkRY45T9/WMyZCoy0Qpvdp0tsbmDeq09qaCvuYIgD7QHxbcc8fL
         0JwQ==
X-Gm-Message-State: AFuF++muVxlRlRlv0VCLVJhlDDNQBriwI0LzQ6LLu/COX9Myr6WU8UlX
	2ia+KpY2HoYWGjBzyoiqiUHXt0zNTNT2YgUub/8lHVHWWdT1B9dxtuZsnG3D2oLiXeeJTgwZeLM
	59Oqme40=
X-Gm-Gg: AYBFou3jNyXNrCot34FvnYP8YDr8fHi2or7GWn5DCgxid00gv16ZZYRmTxdsbXgADe2
	wekKKYsnj+k7iM1szGybjUUzNl69R89MGgwNcwUIWGlmCAFdkkdQ10UvNffirxQVQ2EmcU8QQv3
	TtwZBunYWu/RpxGVVk63kPsfztynZlL1DZ6wxY/rC4r1bkImux2xTcmtsPDWtoGvzKF2RUpynKE
	JXENiXGDB2xjJLiAgrhaR+UN/mu/ZmkjUAHv27+3w+HnIeX0J2HxLfxlyqEFp5sUaGLt2woVvYk
	ag4qk9TqC/QOvIRtOGNWGf+ZsT/QzBKcgiRIPNQM6zQzzKGuUxZhWXO6wnkwxtvYsKef5v/E/RF
	AgfIRQTwmMZqqnAJs9vxi68W4gLk6boZHmxuFfw57y9G5I7iGJL/jA+Hcf+g/tCP9lDJ/Dn0Wev
	ZjE4iPoYfjNx0WzUd/1yGUHQvePURlyx3TMfjXtLwJGTTDQoNcrOaBs/2H6c2HQSxVyqfy6413R
	km8SK49Tv+Jsjelgdff/idci9wZ
X-Received: by 2002:a05:600c:45d5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49d258f1d5cmr120956635e9.7.1789036487875;
        Thu, 10 Sep 2026 03:34:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm57395075e9.9.2026.09.10.03.34.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:34:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] librepo: upgrade 1.21.0 -> 1.21.1
Date: Thu, 10 Sep 2026 11:34:41 +0100
Message-ID: <20260910103444.1413539-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
References: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245545

86ed082 Release 1.21.1
bfa2bdf Fix file corruption when re-downloading a completed file with resume
04a1478 Configure packit to propose downstream releases
c45e00d dnf5 tests were moved to dnf5 repository

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.21.0.bb => librepo_1.21.1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.0.bb => librepo_1.21.1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 6cfe970c2f0..30802fd4f28 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From ba81dfc3aaeadad0e22272136740864bc95d4f6b Mon Sep 17 00:00:00 2001
+From e15c8ab0aab4eda7754e186c63b5ee0feb13f886 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.0.bb b/meta/recipes-devtools/librepo/librepo_1.21.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.21.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.1.bb
index 72ee9a627c1..9cefbfd48e2 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "5e5bddacad52121f970c499e13a98d936dcdc7b6"
+SRCREV = "86ed082e25bbd1901d21d75924297c7697b33307"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 

