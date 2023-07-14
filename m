Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30FCC0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.801.1689374007158926882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YlJ56e/5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso15148435ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374006; x=1691966006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWskmQEzmyL1EnFWZtAfMxu3JVssCnAY3xpWfbOmTi0=;
        b=YlJ56e/5/BlP9+mfngykpVlGRyRf5nX2zXYDTWLLYMS3D7Xs7egudEFJjPeZh62dwv
         Hb9/ZAuqYDnqKVAee/x00PV1YePELPmC8Kg33Qp8cjH4Io3LsIqCUj8TDlsT98pams+V
         JBEjwzS2jATg9dkX/rKKlg0n1aMra+ima/gaNNPo2qrTEzUkznQ0B768IFAJj9Lwn86T
         8bb0gk4ve9qM+Lu+21pYhUV/HC1hAHlUdnUJqfBxcnmLN5FuUqr6Q9UuUBmfmbmeZX+J
         mxqcaJVuYMFFMyOtSDdgNF5HtrplubiIZMKRdfqTK4XgFuFQMU3OfjFZbvOlUm81i+8K
         y71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374006; x=1691966006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWskmQEzmyL1EnFWZtAfMxu3JVssCnAY3xpWfbOmTi0=;
        b=X7fsEEe++brz01G1DbC/rg4zYD2kepH8V0t+eNcBVS8notFPpZqfV4JEOk0iwPvY4w
         +gsGMIhJfQYAUBBRtv26T/Hv4xn2sKwWf/ESXBLlMGVUte7cGGHljLy28Hh/EcCDH/C1
         SADCtw1U6TPk7To48ByO1hUtzNgaNs8IQtxelgq5/N309ifzMARZxZEpaaCyz3o/IzGV
         eT9GodqDmcVXOCL9iHxp1PnNQpKEM5GzMSf95+5fnCX2bVbcjJgaii3OJy3gekBJL4fZ
         7EPss0oAYowa8QpkkLZSvQEsSx2pOsWjdOkGtWUu0JG4s/pxg8z7ixNGWps+rVLODhCw
         CHxA==
X-Gm-Message-State: ABy/qLZQ2e/dpIUMqPHbfhplhPHndm5bgjNoMhzofLUWluPyksGb2aKh
	3cCbTc8NZGKiPXOOG6y345y6eXLOTpEDFd8I0BY=
X-Google-Smtp-Source: APBJJlGnJgCBoEvdLmnho1lSFPKOG7SGVsRVCvzKjao/8hvEFLr2EQO0LfUKUMfYvBwbtYn+3fd7/g==
X-Received: by 2002:a17:902:b487:b0:1b0:307c:e6fe with SMTP id y7-20020a170902b48700b001b0307ce6femr4419218plr.10.1689374006048;
        Fri, 14 Jul 2023 15:33:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/26] libassuan: upgrade 2.5.5 -> 2.5.6
Date: Fri, 14 Jul 2023 12:32:42 -1000
Message-Id: <569df0fb19ee9199fa9c3d86bb5bb75252b3c663.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184290

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix logging of confidential data.  [rA0fc31770fa]
 * Fix memory wiping.  [T5977]
 * Fix macOS build problem.  [T5440,T5610]
 * Upgrade autoconf stuff.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90126be6dc32170c08eb90223b6a6cc06c2133ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.5.bb b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.5.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.6.bb
index 2bab3ac955..7e899e7399 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.5.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4"
+SRC_URI[sha256sum] = "e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.34.1


