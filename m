Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A256C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.26057.1668880108766705885
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ggDpTzA6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id w23so7168434ply.12
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3PklPrJ3KOg4FL23rZztsylQVvrGlXvnYmCLDQHrmc=;
        b=ggDpTzA6emTiUOD2XNduFX+A+8ZXDwI0GJM8p3JVG3yWmUSZ2clxjNKMthEHqltCnW
         xEkdEz5AUSc2Yhtx09OCf7PrRRJFdqV1atr+h+vqt7pjXx/8RgG7Hd/0w1d9A62UB3kL
         HoMyePoPJmXCt+0bv4nYG2Yn0i30CHVxxILFPW6TnsUjPnbEGr+zhQWA7hdR3WqWuWQt
         W3x67BOMFkQF3Z23hmipNzP+kLEaohj4zjqk+23958+UWvv9v9ggRgnCGd1y14OCXv/M
         Vx7uEqt/zUTX9QQSoM/QpXtFI7TjDE6Bma6GOgG/XHPGKdvtRMAC5cJLMvexTrh95/iV
         6b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3PklPrJ3KOg4FL23rZztsylQVvrGlXvnYmCLDQHrmc=;
        b=qFMFFJC0k7/QonJ8Ikd0BtWJ8U7Cqz3pgPRD/3heyBbakWa3KcPgUNjuG6ZL/3GIkd
         59tdAyrpX0V93hRrqtutTzftoQrfmWEqmhU4rxcSrUAWbogIt67ZRsOUolK/fxWu0W21
         DmKMlyYXid6ad1q3H8fd1eKckOCmgCBmWCpDl6j+aW/uN9t2+6bqlBNUBCnsIL2fzuK9
         YBpBf9u9dBeSYstsP/pOA80uw7CL4UCA4K7gFSSZAZALWPspIa/vXfIiW70ajeMtnzNx
         44CF1M1i0FAqTVmEjsFVWFd+6aG36bDZ2aGy5SN7LZv3BCCWswdFGf1oj428hz34LOOa
         MsWg==
X-Gm-Message-State: ANoB5pnr5G2mdA4CyMd5FfGmc2rzhdTxuxDTUa7CyvojVcjxJTen1CXQ
	ULicAk9NPVK16FFLuIp1m7JpRVp4+Yf0i1k5/4M=
X-Google-Smtp-Source: AA0mqf67WbSBMCvRoY5MjpOQTVCNeKG7VE4/BF/QVkepQe4H/k3uXQfXCs5g500DOpTDV6MCc31BcQ==
X-Received: by 2002:a17:902:6b89:b0:179:eaa8:9113 with SMTP id p9-20020a1709026b8900b00179eaa89113mr4763645plk.55.1668880107872;
        Sat, 19 Nov 2022 09:48:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/21] golang: ignore CVE-2022-30630
Date: Sat, 19 Nov 2022 07:47:45 -1000
Message-Id: <283de0feeea4c0780e90e56edb3b15134f71638b.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173535

From: Ralph Siemsen <ralph.siemsen@linaro.org>

The CVE is in the io/fs package, which first appeared in go1.16.
Since dunfell is using go1.14, this issue does not apply.

CVE was fixed in fa2d41d0ca736f3ad6b200b2a4e134364e9acc59
Original code in b64202bc29b9c1cf0118878d1c0acc9cdb2308f6

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index a0eaa80ed4..cec37c1b09 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -73,3 +73,6 @@ CVE_CHECK_WHITELIST += "CVE-2021-33194"
 
 # Issue introduced in go1.16, does not exist in 1.14
 CVE_CHECK_WHITELIST += "CVE-2021-41772"
+
+# Fixes code that was added in go1.16, does not exist in 1.14
+CVE_CHECK_WHITELIST += "CVE-2022-30630"
-- 
2.25.1


