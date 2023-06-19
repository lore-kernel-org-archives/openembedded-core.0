Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74186EB64DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:20 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.36.1687143372001790932
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SxT4pC3v;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.178, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3fde82c8ca7so19802041cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143371; x=1689735371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YoKdD0c9LbVykTLio/PbA1fiNuSLQod6hSHDxdmsPs=;
        b=SxT4pC3v6j7dqT/X5FGd1HYzZg/NCqMQ7hSWf0g97GmsDgnsW6jvNagNxldfcnO9f5
         Q/bH54fTsXeRoRwXld6Yatfcj9riYAYsitXBM47TrS6TCJ04k6DrsnZuq/SAO4RPxLNU
         5dpDqlFbxAJjjkXOkrUQ1Dv9R5KOlnTLRTGOnOBaqFFWRQECsh5kXgY4YSh0QsMfT6bk
         vdz5DFUmsJekOU3lnYpeXinlTBwtEAgUSScfsOvSXxg9HN5Xk+64fBKL2AzSXo6hRxrl
         idL9NR1CrJ5eAHS0HbURQC26+NqcHC29SVL0WE1kadfR7kyfay2CEWCaiuQMv7e1+zjQ
         +oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143371; x=1689735371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YoKdD0c9LbVykTLio/PbA1fiNuSLQod6hSHDxdmsPs=;
        b=Ba12Kx/kE7wXY4KbNDW7p7PRr65wniU3GS5hNpeY/69RRWhE8G7/8Lq2GdMZ7OfaSQ
         ESUzbzKVrBaEFQL6azYqg1VkSX40hJASGuMywwYlYmEXfpPOAaOwDJVM5o8KFVM1vZec
         3PfG+zTsmN6AqySmjMmwH6CHcAPTYld/oSPs+V5oDJs5myH5Pkvw7hQxHqTwu4J+oign
         6Jv3jIYgPVEcej1w5XpPOwBnU9BI0ErsaSkH4LhQF2oaRsZ3eUD1xyCnLh9HKAR0IDu1
         EWpWek1MOMPZY4w6xFgJR+DDiCE7SbWnxds9WnmR/ZWxqqYNQpu1NL4F4BjtPAFkxgBL
         Lf8g==
X-Gm-Message-State: AC+VfDzjxaPO+AkaKBcKGZTHNIYFnWqguaUWE1/ZqbuMjKUasjcUcIYQ
	XJ9XFzCTcEvuvgL6pEV0wXb57xHE9P+zeG3DUVM=
X-Google-Smtp-Source: ACHHUZ6KGPccwwE40/5J3RsSob1pHtkbCf3PSnySJv+GgwcH8cpb1ceLLbvGcZZGsqLHF5xdSVgAeA==
X-Received: by 2002:a05:622a:11d3:b0:3ff:24a8:4f26 with SMTP id n19-20020a05622a11d300b003ff24a84f26mr339954qtk.16.1687143370811;
        Sun, 18 Jun 2023 19:56:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.56.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:56:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/18] vim: upgrade 9.0.1429 -> 9.0.1527
Date: Sun, 18 Jun 2023 16:55:35 -1000
Message-Id: <035b5d918eea3f3bb238fecd795f09505801971b.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183082

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-2426
caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matching

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4f9a8df5aca99d0a5c2d2346b27ce7be08e7896c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1e27415288..e1d2563316 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1429"
-SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
+PV .= ".1527"
+SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


