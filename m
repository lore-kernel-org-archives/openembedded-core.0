Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB46C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 11:23:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.21083.1636975391273915673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 03:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TaphOetz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r8so29866299wra.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 03:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4osiQRU7OGvFmYMfHnSpXlBJoKjW6wqdDDAU6r4x1CY=;
        b=TaphOetzDCrnvIT98v5ZDf2dk3BWvoR6SIPe5WgXUMsA+i6MMYPlSCXOQFSXYMfRkx
         zi+FgaHUwK95tIhc0wP5QVQK3+nvI8dfRt3I6h3pFzjok+aCnElkqNdBpJv5YTOYtC2P
         k5wPvf/1hVg9ca7V8G5O7zINrJ958dscfZ45Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4osiQRU7OGvFmYMfHnSpXlBJoKjW6wqdDDAU6r4x1CY=;
        b=PZaIXUVZ4D4hFLME/pHKAFmfNzkw/H4s4y+rZ5oLcbt/vzNdx+1uoUVuOAa3wSVkAQ
         625B7Mcu+kx0jMsBqgpto10WU6cHhww3+cQbvBjZc8fxMAChUdTajeIiXXKJT6l3okcR
         kpMvku43Ufc7d0wzmWqjIC3r9l6+12h1frfHTEQ5DoNgenz7Gky9sSuWGzq5dqL3ZsYB
         BfCTXHd9IxSkscoF1H+Mi6CaLJ1G+uKQJ4ee9tUPvzEyyO8mdeU4IJlVH7BEJdKLcawj
         KVqFvdbYwmz5elxRIdiQtUvz7bKaNxOm7Q581oLqZ8gTFDScJRRauSBwrhuEZUI0d/Wx
         VzCg==
X-Gm-Message-State: AOAM533WbAuU445lVJGnn+jwKnqo40nq6XllGLKKdUYVXYYS+nXsnyWp
	xDMLWO+df/UlJXkMiqVHrNDAuQ1y1sxooA==
X-Google-Smtp-Source: 
 ABdhPJxvYOtUiTLiEPsbCh4JQOXsfRHnh+3EG6+1hcPv1ISlNvGpmSz8bD9ATHqHoU//cKwo65y71g==
X-Received: by 2002:adf:fed0:: with SMTP id
 q16mr47036431wrs.276.1636975389320;
        Mon, 15 Nov 2021 03:23:09 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c4af:9769:123a:c249])
        by smtp.gmail.com with ESMTPSA id
 t9sm14932025wrx.72.2021.11.15.03.23.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 03:23:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Dropping mips workaround
Date: Mon, 15 Nov 2021 11:23:08 +0000
Message-Id: <20211115112308.3974991-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 11:23:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158279

I've tested without this and the ptest results for mips are the same with
and without it so the issue this was fixing in gcc 9 was likely resolved
by gcc 11.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.37.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.37.bb b/meta/recipes-devtools/binutils/binutils_2.37.bb
index 7430bf13425..12a6fb55776 100644
--- a/meta/recipes-devtools/binutils/binutils_2.37.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.37.bb
@@ -27,10 +27,6 @@ EXTRA_OECONF:class-native = "--enable-targets=all \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
-# gcc9.0 end up mis-compiling libbfd.so with O2 which then crashes on target
-# So remove -O2 and use -Os as workaround
-SELECTED_OPTIMIZATION:remove:mipsarch = "-O2"
-SELECTED_OPTIMIZATION:append:mipsarch = " -Os"
 
 do_install:class-native () {
 	autotools_do_install
-- 
2.32.0


