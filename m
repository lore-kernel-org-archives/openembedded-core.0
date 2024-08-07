Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1A5C52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:40:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.32309.1723034444138084546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XEvdk1Dq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428e3129851so11960825e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723034442; x=1723639242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEcbiTXZU6aSgXlPDeGT2r804gKUArjOF+xuHQb0ifE=;
        b=XEvdk1Dqup0tYkiiID25PmLRkHEDaM4fztqVZsrXiiGA8hPBm+OlfP47F5V7/fYf/W
         1ZDoTzryTnfSpO1EpJQY18UnBgNI9ggYVLyTKIeFov8kDCfkBwZWihPgVbGLRQodPDGp
         3H2YvUjhvxWGGF6wfdcT8ONvXVUsnNN4lK2bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034442; x=1723639242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEcbiTXZU6aSgXlPDeGT2r804gKUArjOF+xuHQb0ifE=;
        b=d1sK1VI2NfOC4+wdkcQghbHVjsKO0WPyJzaYvZgMpJ+kW104WHPx5RPIJPHkSsSiwC
         T1aco2bRmia4WD2NBAdPUdVyRhls0wNT/YTgnwP3De8/rrKWYzAJN8DS9DBuG0m7ROzT
         zYREPbst2ySgor6d6cevOPXby+NtfuYj3trOWHbeVbAKLkrAULXGwXiLuvVPdgMnFbz4
         capUNZ3me+/EQuc0+eHQ2eKJkLCxF+5NK2QH7CtZMA57BcCMefX/6vt/jTsufw193iqO
         JwIgGhoAmmKCoFXyCK+EZLgrvBU6wxuv/zpqUL3EljGWB+QoKYbG+EgGx1lOVs8oOfbY
         +7rA==
X-Gm-Message-State: AOJu0YxdBW6KwK3oOWZaYg44dh31KWHzjoq2i+gi03g418Qkot0gpYzd
	PxOEkNs6Fn0YeSQCWQlUd7eB8Drs6t9zAj47fBVs4WBvkziiZIFQFO2zpj3hhFXSzG77WTheOvO
	zlMo=
X-Google-Smtp-Source: AGHT+IFMM/n51uCHRg3nsIx5N57rMy/VXrvtopGnN2psl+JT7B+E0nJxUAO5jeZukt7TzNc+Two3vA==
X-Received: by 2002:a05:600c:35d2:b0:427:ff7a:79e with SMTP id 5b1f17b1804b1-428e6b08baemr120319855e9.16.1723034442101;
        Wed, 07 Aug 2024 05:40:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ff8:c4ec:1a07:92b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cf83dsm26061425e9.47.2024.08.07.05.40.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:40:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] glibc-y2038-tests: Fix debug split and drop INSANE_SKIPs
Date: Wed,  7 Aug 2024 13:40:39 +0100
Message-ID: <20240807124040.187526-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 12:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203070

Create the separate dbg package and then drop and the INSANE_SKIP values
as none of them appear to be needed once debug splitting is fixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
index b760230aeca..5a799196346 100644
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
@@ -13,7 +13,7 @@ SUMMARY = "glibc tests using time32/time64 interfaces to be run with ptest for t
 # Erase some variables already set by glibc_${PV}
 python __anonymous() {
        # Remove packages provided by glibc build, we only need a subset of them
-       d.setVar("PACKAGES", "${PN} ${PN}-ptest")
+       d.setVar("PACKAGES", "${PN} ${PN}-dbg ${PN}-ptest")
 
        d.setVar("PROVIDES", "${PN} ${PN}-ptest")
 
@@ -108,12 +108,6 @@ EXCLUDE_FROM_SHLIBS = "1"
 # debugging.
 PACKAGE_DEBUG_SPLIT_STYLE = ".debug"
 
-# glibc test cases violate by default some Yocto/OE checks (staticdev,
-# textrel)
-# 'debug-files' - add everything (including debug) into one package
-#                 (no need to install/build *-src package)
-INSANE_SKIP:${PN} += "staticdev textrel debug-files rpaths"
-
 deltask do_stash_locale
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"

