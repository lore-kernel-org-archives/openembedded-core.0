Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47659C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:32:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.812.1700004744190840838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e20M8cyD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4083f613275so51084305e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 15:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700004742; x=1700609542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcgWjniHchDbDdSHEHU6ZHMubNf3xGCASwi9IC01qO4=;
        b=e20M8cyD6Hb2JgFI6Iwk4oxJ4/7VcHYa/ateLqjn3/xZ+pzxVQ/PXJ2+L0Mxdv1tch
         HQqLuEaYq4MlJr/Kn18lpsRAQHdqH0AloWIBH73lKnliMzyL/cZ7JecuZlByC5ud2UaI
         LnFkAj9CY5Bkdn9zKPf3RGdSAczfSV5yOhR8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700004742; x=1700609542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcgWjniHchDbDdSHEHU6ZHMubNf3xGCASwi9IC01qO4=;
        b=Y0C/pZ49EarkfDuhnVsJyijAqrP/wW7y/Ah+/p3T5h8H4S9hb14Lppxhaj/l49cIPP
         tdFnivmSbzQa6bkImMVkTr3hUtcs5D+O70+rqNddyqWwomB5ZTLqiv5rFgsAd25n3Jwi
         FZV1qkWxvxaa6XV+68QkamUiFeCrNcV55LfLPfQ4008qLUStEYQjf8lyGmqQ9Wft3foH
         3Gn9AeAOOdwtP6NhimBlVDFQENO5ZMPTa6g3zJTbeDyf75GT8ddchC3tplBOuwXAtal3
         fGwsi5NyjmidNa2+WnZdcgQNbR5VIcJERUd9hHmos+We78uH28Xk1tMHOGeYUGyMAucQ
         YN6g==
X-Gm-Message-State: AOJu0Yy8erF+PQVesNM19flESl/gz6ozepOQBGfyXA2vcfzsJAPnaEcW
	a7bZXb8VlDg0bZV4epopy83VQSWeRRPOfp/2w+g=
X-Google-Smtp-Source: AGHT+IF1aOqtp9rWnQjnHovjTIGWsUrhZHn7mtuWSIyJnJU4AgXo8Fpb+EoL408vEh+zBfNWuD/Spg==
X-Received: by 2002:a05:6000:178d:b0:32d:a466:48d8 with SMTP id e13-20020a056000178d00b0032da46648d8mr10704916wrg.69.1700004742541;
        Tue, 14 Nov 2023 15:32:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm8836638wrq.14.2023.11.14.15.32.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:32:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] vim: Improve locale handling
Date: Tue, 14 Nov 2023 23:32:20 +0000
Message-Id: <20231114233220.2567795-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
References: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 23:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190524

When making checkouts from git, the timestamps can vary and occasionally two files
can end up with the same stamp. This triggers make to regenerate ru.cp1251.po from
ru.po for example. If it isn't regenerated, the output isn't quite the same leading
to reproducibility issues (CP1251 vs cp1251).

Since we added all locales to buildtools tarball now, we can drop the locale
restrictions too. We need to generate a native binary for the sjis conversion
tool so also tweak that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 58025828f2b..38212a1fa60 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,22 +40,16 @@ do_configure () {
     cd src
     rm -f auto/*
     touch auto/config.mk
+    # git timestamps aren't reliable and we want to consistently regenerate these generated files
+    rm -f po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po
     aclocal
     autoconf
     cd ..
     oe_runconf
     touch src/auto/configure
     touch src/auto/config.mk src/auto/config.h
-}
-
-do_compile() {
-    # We do not support fully / correctly the following locales.  Attempting
-    # to use these with msgfmt in order to update the ".desktop" files exposes
-    # this problem and leads to the compile failing.
-    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
-        echo -n > src/po/${LOCALE}.po
-    done
-    autotools_do_compile
+    # need a native tool, not a target one
+    ${BUILD_CC} src/po/sjiscorr.c -o src/po/sjiscorr
 }
 
 PACKAGECONFIG ??= "\
-- 
2.39.2


