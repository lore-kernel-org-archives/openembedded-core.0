Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BF3EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.9110.1689690401517630767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=K/6VPwQY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3837673b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690400; x=1692282400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpW6zLGyGx0pBVvYz248dp9zo25tRFBwEDw286/kies=;
        b=K/6VPwQYjH8txDCxm7S9akW7Z3LD6B4rq1R67hermCYTCJo3OzoR4sI2ZeIJy0/PtP
         l+fgZfa0TPqDec6DDDcPTfnkfzw24vdFF8D2ulwur5oHQ4X7l6+JCmcqhpAl59Ym19m9
         VS1q70ZVU2F6B2H5aT2bEErUmaxnwXLV4n4rOjTFZefAIXzgxBNrSzK9OkscXOtvcnpM
         GL6oVTxhW7o5YJkHfeNJA5GtPU46z4mkSP30b+K4bw8M31pmHvxZ4cNKaZU2XP+IIUcu
         49nv30feSDAvT/5eknHuGGT0SqWs0eQ2ZxcO31utXl+boMuqpe0XVK46toPEJnchzWGc
         eBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690400; x=1692282400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpW6zLGyGx0pBVvYz248dp9zo25tRFBwEDw286/kies=;
        b=l5k4H5dwydISC+msL/2ej2hgG4ZRYjD1hNC6MXs0ZaNUGCyZ3k4M17ehdDERYqmrmC
         caNv2+3Ui2NKrcdL0NE7bg2k1r7VnI4bkHnib/EKIPU3LsLnuQNvuTiywmZ5/jblSABI
         CsRQam6iY9Yne0Gg6ue/Uw/5/HKwCBd4PVyv+oypPFFS2bPG5nua5jWrNjyQQTnCzSEW
         N50qYUNmNopYDfrhtVhiu1SWMLOhWfcGWKjGfBHsqY3w8LxaVcyTUtYgVPzl6WezUoJN
         RcOCtH/R9UMH19HDX6x+hFtpqeLB0qh7PRtC8LZIPkiideuJoFf5BccBYVCPjjYSDiof
         ouiw==
X-Gm-Message-State: ABy/qLY/7MzvqhjFDWMhUNzHN4PNS+NZORJjeFcpDA0/5+4Q7F57YO7l
	rZchNwDtVhiS2cI+QbYUc77m/3vCUg7jjudbICw=
X-Google-Smtp-Source: APBJJlHugmUM8HHHYpLvn7QIlPAOX2YLMCZkYjXcujAoGmLvtGB1L8H9zhicOnSyYNO0T97yrcNHXA==
X-Received: by 2002:a05:6a00:a1b:b0:682:9162:7218 with SMTP id p27-20020a056a000a1b00b0068291627218mr19373178pfh.15.1689690400544;
        Tue, 18 Jul 2023 07:26:40 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/27] vim: upgrade 9.0.1527 -> 9.0.1592
Date: Tue, 18 Jul 2023 04:25:46 -1000
Message-Id: <a71153cb0a509456dd36466ac15a603f953eb6b8.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184516

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
index e1d2563316..33ae0d8079 100644
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


