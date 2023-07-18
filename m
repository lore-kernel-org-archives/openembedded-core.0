Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6998FC0015E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.11615.1689696101257105234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pCfASCsd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3932823b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696100; x=1692288100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LQzCaIQynDv84hXY+joQxSu2Ho4iGVNtQitnefFS6M=;
        b=pCfASCsdp3mCyxkDnGNE3334k2/NYuyKCMIsRUC7LKpp2cc/tU/0ldrcnKCAB0PH33
         LMiNXfECprN2h+6Za//bWt0MJQjuEVp1/YdY47HqEmdaYalVfL47hRiJzHgIpmjP/DIj
         oyIrMOAxtJUcS7EiG450oAbAZHdkOrCiIGPuTCZ3LRJU/wtagdcGnr8VCXgnXrrKbjTX
         INrx86c4pkn5UMJA0NPwJvEmMV72J9Z+h4c/3QTp+GF19IvG7d02/+A/qlNdDrXwj9Wt
         WPsnO4yH5BuUWF3VeUxpQIJSIqoUe0UnLepkjRxJYhgLWcPA7W7U7oRg+NsS7LtokMj6
         /MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696100; x=1692288100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LQzCaIQynDv84hXY+joQxSu2Ho4iGVNtQitnefFS6M=;
        b=b/3rQ910W/EEp+THHVZ0OVfwViZmPGVBig2yVWcwPmHDqNydiMb5FtXQrNA2ZcxDMA
         s622z2rQW10XSsBZ2uMtdfJhxMeoRL8DycvOiNydGAGJTtTtwUeXbAF8YIrBLguCQmmj
         MhxMGRPbLJhKvoXAYmqjIpHyXF1AFvKYY16sPY0RrU2L6Bb/g6eXe7p0cH+++sErFC1R
         7J25vf3OMCKLdjAKjaJgOi8h7k50KKKmHIPlwoNOXD+eCGCNdEcNAigZbcdFlOJOYrsZ
         vPvfw/7SNREeZRHUNaV2FOFM2zHKGbLPrqBe5GEU+iBOQ5ClUYfirzecstihhjsgZ8T+
         63tQ==
X-Gm-Message-State: ABy/qLZMmMf8SeQPWuF0N8n+pC+NfeCEnd1/Lj1K1kJNZN+UFnscecYa
	sB48z4t3/ya89t3U3Y83Dx1sHWMjwWq2zbMSF6E=
X-Google-Smtp-Source: APBJJlFBfRQ5jVtwn5tN8k6pZTghN1ssAwdyfRO0zHdIXbvPf318gc2ahwsJpRsN21PHsZK/IhdVeg==
X-Received: by 2002:a05:6a21:32a7:b0:135:110c:c6e1 with SMTP id yt39-20020a056a2132a700b00135110cc6e1mr4498380pzb.7.1689696099825;
        Tue, 18 Jul 2023 09:01:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/13] vim: upgrade 9.0.1527 -> 9.0.1592
Date: Tue, 18 Jul 2023 06:01:01 -1000
Message-Id: <8a481b1dfeeee8d8d3430f527da1f3f5b7d96999.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184547

From: Trevor Gamblin <tgamblin@baylibre.com>

Fixes:

https://nvd.nist.gov/vuln/detail/CVE-2023-2609
d1ae836 patch 9.0.1531: crash when register contents ends up being invalid
https://nvd.nist.gov/vuln/detail/CVE-2023-2610
ab9a2d8 patch 9.0.1532: crash when expanding "~" in substitute causes very long text

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e4b4dfb4145bc00eb6937b5f54a41170e9a5b4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 800ee40f92..bbafa170f4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1527"
-SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
+PV .= ".1592"
+SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


