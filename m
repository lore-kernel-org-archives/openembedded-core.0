Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9736E7E63C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:12:33 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.20203.1695737547580837136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HHnlrzhE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c4e38483d2so2644037a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695737546; x=1696342346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNmnH7BhZS52F/qI9JS36pM+KiXaDvZDoei9sKJAND0=;
        b=HHnlrzhEQZqM9GKYUD4IzbEUInR2Nh1goA6S0Ez5JE6sJmx0aFxRMo4M+dxZ4R7TmW
         RnIxOU6C7ta4iBcoGWlG8v1lI+ptCwymAvSUxRF2odA6AWF2aHlglAXdHnl7yjwtrHz8
         vA7fIfaQfvCgi6p2gdbGspVfTcbpaboV0J8WneSVObhEE2MUbRblVDJLiUqsFuA2X5m1
         c/1YgQ+W1M10j9Ioe57uD2ltajE9fyBOzJvDq98svbBSL84or7p58YOdJJOL96KNj2cx
         jqwtw6QqQh9EXekzdjtdUmArhrDiHeuYVP3RuLk8htjhMTNIpj3CTH+IwjjpkM1CDFPK
         Tirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737546; x=1696342346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNmnH7BhZS52F/qI9JS36pM+KiXaDvZDoei9sKJAND0=;
        b=xJlbTeusGxRms2cH+FjbhSg6cwpVA6D3UgqfVeEgTVwOqsglLAfSkyvzJIzIv7Hu2k
         YdaJVikoN2C2FeQ+MW0rwwy8TDVPzEFaO9H7/PGHrO//ojkAUezgP091KcYWWNQDtc2D
         JapVRmArgTyqDVfP94xiFMR8b2+gPpXezPHUbrSGSk//7tV/QsUP/rew0vQM4CXHn4be
         5iRxithp+mtKWrFnzhrUVwaVadUr4wi5kB1AbIetSLmID71ygspUQ1F+PxwiF+TqaSQR
         VgMGnQ8lXniCQtnHnJhw0UsdjuZnT9tJjOwU3n/JOrINzN/XBG5vrnMBHrQN+3ECykza
         y/Eg==
X-Gm-Message-State: AOJu0Yzm/Q9qEtDikKlDr1gXTp7f9XjtF57jCSGh3VKKec0UNSGtFRdx
	aIoCNKCNRURB6n8LqwDa9gSNCcpeN9D6So1Cn+A=
X-Google-Smtp-Source: AGHT+IH5Dfn1Kibw/YHpyxrX0VpRNBz2T4u0rE96UU5w87hMW+oA1UCspeGOSk4696Z1Fl7xbVWXCw==
X-Received: by 2002:a05:6358:52cb:b0:143:8084:e625 with SMTP id z11-20020a05635852cb00b001438084e625mr11434468rwz.11.1695737545808;
        Tue, 26 Sep 2023 07:12:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm1348861pgc.80.2023.09.26.07.12.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:12:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] vim: upgrade 9.0.1592 -> 9.0.1664
Date: Tue, 26 Sep 2023 04:12:07 -1000
Message-Id: <e9591ead43b70da5665f53f8a54f6e0c8f4d0dda.1695737244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695737244.git.steve@sakoman.com>
References: <cover.1695737244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188252

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-3896
8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling with 'smoothscroll' set

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a1ab744142c9229f03a359b45e5e89a1fbae0d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index bbafa170f4..dc22a023c3 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1592"
-SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
+PV .= ".1664"
+SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


