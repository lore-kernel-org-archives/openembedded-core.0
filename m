Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A4FC25B0C
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.6822.1659705177741602045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P3bPv10i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id s13so945783wmj.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=/VNfTvvRP2tVIcduShLynaJvw4nC9PjXv8eT1DXFwe4=;
        b=P3bPv10i0TsBuG9h8rAFZ1Tvz3g0tenb0VOMuqES8yrVn/MpNnWZjaWS5iX672hk7e
         Z6i7/2M0nDH7qLSL92+K4ew9K4TxXqaFoxZpdRzc81ct4PPw6RwBLsFKvvDhvqpZ8UYZ
         HD/9lFXnO7faJ9XP3xKXHeiae9kjUMqpLzhDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=/VNfTvvRP2tVIcduShLynaJvw4nC9PjXv8eT1DXFwe4=;
        b=qm08QrQItN1toKiaUfT4bjcIoS1k1Be1MvMUKN9cmvrV6u4FqL73uvn9RpcrPUMNXr
         RQ9cXXYIRrCwz/PFyBHWEXtsVK5KHgQim8P+uYxdbnKwoeWAtlONIvopmKNoyr4fWwo0
         yrS1rrFuiIZ0+Wi0rnR/cmHra10xoqXN+uLlU0JCSDqL7nK6enc0SFyiJPCGRxHx8gOP
         fORulT0hk4SiIZd8evCePB3H0BgBi5hvuPrQo7kYmyzleeIuybXlRUylHRSCEspSScPC
         L8e+5R28Mngp9Bz2X4Sk8fQVU1TFOg/zwfRWF5Ng96sQz2ORaGwhjiSytxM9EFA1oNSt
         SUgw==
X-Gm-Message-State: ACgBeo378+wt4hSJ6xptJwYM2TLLGy3fQ1iUgRnWEjb24kYGs8ABBQ5j
	S/am6Vu6fiq3Gcd/pgcwU1YUIiFVZla2uA==
X-Google-Smtp-Source: 
 AA6agR5VcpbLQ7Sfe48w1HhNJ1w3l4TlcB933b8n0evA4zG7NWr/SZSTzw3hwQf7WCM5bk7xLVYT8Q==
X-Received: by 2002:a05:600c:154f:b0:3a3:4383:e1eb with SMTP id
 f15-20020a05600c154f00b003a34383e1ebmr4705797wmg.111.1659705175966;
        Fri, 05 Aug 2022 06:12:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/29] conf/distro/no-static-libs: Allow static musl for rust
Date: Fri,  5 Aug 2022 14:12:27 +0100
Message-Id: <20220805131252.3706794-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168938

When building rust for musl targets we need the static library from musl,
so enable it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-static-libs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index ee673834601..75359928a14 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -18,6 +18,8 @@ DISABLE_STATIC:pn-nativesdk-openssl = ""
 DISABLE_STATIC:pn-gcc-runtime = ""
 # libusb1-native is used to build static dfu-util-native
 DISABLE_STATIC:pn-libusb1-native = ""
+# needed by rust
+DISABLE_STATIC:pn-musl = ""
 
 EXTRA_OECONF:append = "${DISABLE_STATIC}"
 
-- 
2.34.1


