Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EEAC00142
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:18 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.140928.1698632478553246685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WkAhWrWr;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7eef0b931so34634927b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632477; x=1699237277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6u/zHt05jDeWbzYFJCd5z6Z/7a0cjGeG44NaWAJLso=;
        b=WkAhWrWrGHTL8Z29DYnAiRbrv00bJslTnbKru0wZxm5th7RzRVh/fPi48HZutI97L4
         yjGACfDRb9fg6PkdbJMFA9Q5We2W8FE1zwUORCpjcwbmsr8fbV3Ooq2Bifny0Rg8+dq+
         eZK0nGhhcm+BRcHvRkfoSfuZHCA/VTz1R4cbB3IB5vRJmv8rQbObYKUQ5ZtWdcr60cFr
         rb7pfjqwwWf/hMbkBsObK1+pTAO6JyjZfYCcWe6OTxj3HNhCuYrtOzQRmX/ydZJGOrdG
         nyShjSpt+/i/1pcV3FQrXHM6BNl7H9cX77fPhCx2px41YxwJcKW8UIH6PDvZ0V8BFq+q
         68Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632477; x=1699237277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6u/zHt05jDeWbzYFJCd5z6Z/7a0cjGeG44NaWAJLso=;
        b=G0woiCyg9yGwqcgsS5vQ1IWo0PIO4t6Xktm8H+gVG1jXtqsiUqrzOpmeSBGBommFxw
         hnCQxcq91QbPOBH0MTAugnNxtv5Qfsh5tAPsx+9+cWP4Zl0Vn/7EFfOJyKOYlu0kVghT
         PMQUFIGv1KJshC+NJzvFWxcgxj6+OaWRo+H8A9ZvzevaUhDw1h56yIL1//KVAVbkNmk/
         hmFRCD/pp6ENHAXaX2A0LU+vM9Wj7yMNmveBEU7Q+yRwIX7y58yO5mTEF2BO6wDKRw9X
         ZZrv9bznMJsR1xMHUFV+Pshfec8yHvVL80Q/0tcibvj1cgX62Csa90iG92DeVH8FqAOB
         Q4FA==
X-Gm-Message-State: AOJu0YxjCmaz4rNifFOkEKWk0Sbz8QtymzCvUJu5WtZafGZkXWHI0aYL
	EmY0h1p+Be/qJoToqqs/tzH74ksjACGfsXfSPKEkuA==
X-Google-Smtp-Source: AGHT+IF7MvIOEwXqIGOGofZKEHocKfQt43OCIZGDKbtyvbMO3Wk20QaPqlxsYov3lArSP2m/Y5mgLA==
X-Received: by 2002:a25:d342:0:b0:d9a:c28f:274 with SMTP id e63-20020a25d342000000b00d9ac28f0274mr7647210ybf.31.1698632477353;
        Sun, 29 Oct 2023 19:21:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] openssl: Upgrade 3.0.11 -> 3.0.12
Date: Sun, 29 Oct 2023 16:20:55 -1000
Message-Id: <5cf9f9426de71a35b06c7b4b9b092f22243676fb.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698632320.git.steve@sakoman.com>
References: <cover.1698632320.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189784

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3011-and-openssl-3012-24-oct-2023

Major changes between OpenSSL 3.0.11 and OpenSSL 3.0.12 [24 Oct 2023]
* Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.11.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.11.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.12.bb
index 22eaa3af33..d8c9b073a2 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55"
+SRC_URI[sha256sum] = "f93c9e8edde5e9166119de31755fc87b4aa34863662f67ddfcba14d0b6b69b61"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


