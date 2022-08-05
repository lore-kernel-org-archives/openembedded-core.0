Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C565C25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.6584.1659705179496665197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TI52ohua;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j15so3235698wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=03zbOk/SycMP5bSYDUCVgcenomjajyfdszYVXBxpRBg=;
        b=TI52ohuaazAUc2zO+DdbG3JKqmT9Hf4jYNAGUTEaIiNKWSIL3tQjlxdqV5gvCZWkXJ
         SG6izbLHsKVpobBWHJbg1JLUfG6KXMLZ/pcz8lBYz9EMhG8+gTQoDBtMhSsnlmwXXdx0
         2Q/MufIuDOxiyH2DWEKYf9Ll5BGhQ2lYdnkPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=03zbOk/SycMP5bSYDUCVgcenomjajyfdszYVXBxpRBg=;
        b=iSFg5AfUsQSkSc5kynLl4cX/2iVwexiKYDnE8AY46YkfBq13YHz93VxXyPoJXW1QB3
         WiyxBEVXA7X4U89RiDj6goxsQYKGByRo+ecFDtlcvLtQfp8sAes/hesYNaj+TW4NwOQq
         jWDIiuTDjIiocT7lAJ8o0u7jo1aOnTpEhCsf7aUuc1JeGJfYpTxE1li6L8AjagLjuV9y
         9DVULiygwqzkV5f35skQUCJi0UAgEgKvUlpDi6YfHdMouAd9WgH5j2D8/fCpTnLQrpVv
         BLLNkUON2bJMIhAglneD9wkFfjk+9E0p6EkhbBHhlYOvjlQQCuM8gQKZ0FAq7OS8krx8
         Bdvw==
X-Gm-Message-State: ACgBeo2qR3GQRNeM5l5l/199pge8PFLRS6XWGTOudTrPso0KArWWlaZX
	DSddd8kKGQ+HpotVoupgg+z8Fq8PXJAM7w==
X-Google-Smtp-Source: 
 AA6agR6EBR+0+N9eTqH5C8I0PwIPVprk76xzWkQ4VBMtXcf7TRimTQ+BSrGu9I0T8Kq44y13nr5NZg==
X-Received: by 2002:a5d:6746:0:b0:221:76b8:b8d1 with SMTP id
 l6-20020a5d6746000000b0022176b8b8d1mr1406107wrw.710.1659705177822;
        Fri, 05 Aug 2022 06:12:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/29] rust-common: Add CXXFLAGS
Date: Fri,  5 Aug 2022 14:12:29 +0100
Message-Id: <20220805131252.3706794-6-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/168940

Similarly to CC and CCLD, handle CXX flags too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index cb811ac5da7..0c9363b31a1 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -177,7 +177,7 @@ do_rust_create_wrappers () {
 	# Yocto Target / Rust Target C compiler
 	create_wrapper "${RUST_TARGET_CC}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target C++ compiler
-	create_wrapper "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_CXX}"
+	create_wrapper "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
 	# Yocto Target / Rust Target linker
 	create_wrapper "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target archiver
-- 
2.34.1


