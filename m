Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D16C44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6514.1783510827626489938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TzSXI0gf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c7902f47so4081585e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510826; x=1784115626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLsxgj7+duCH4NTZAciuXxM9daT6RLbVIaNJHo7lvok=;
        b=TzSXI0gf9rPjCdCYc8fDFfzBvyVrahI1FpBWAwYrx6GmJfEfr14ag9Hr4gtAvoE1zk
         hSCQkGpEAnIir2B/f3WVOv0WvH1fygpzaHKGALpyB11rrxRXVkqAkyRN0AQt2cOInG54
         0fCPXCNTxSlwel/czcaJDWsby5iHL6BtuhdZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510826; x=1784115626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLsxgj7+duCH4NTZAciuXxM9daT6RLbVIaNJHo7lvok=;
        b=E8o2z56k9W56B5PuQm4/JEfL8b8RYLSLrK7Fe/yUfKWKlrVwBV+nPud16ZHw8myNB7
         sQYakskUgLyWujmdZCBat2c0CbJGuFjApKsOjzd31OSDhm9FDLysO96Jf3ak4YewKksR
         gIkpDqFvZeM89RSHVg7b8TbPRoUh2aolq0jBRmu+oWTLhV8soQVsCbfQmN/u+7eKlJPz
         2Q+PfiAZh1gDbI/stoX+baOi8AFGrF68JdZFa72yXpZr3cP4958c8gifOxCxMriym5VF
         sy3Fd7vspsEFM9k7F5VUHvkIK0/T80xJ9sfsl82v3ZZDXaESY/pDh2sRm9qlnXsmAmPb
         +32w==
X-Gm-Message-State: AOJu0YwGPNlJPSuSaA8HtD/zjY81MvlpX/6H08n7vXXTC8UGB2K+iRV7
	qawKroGAzw4MvUkS5oeucowhgqB3Ba1v/XjfOcVuv+taEDaeVJAhqwIZn0LpnD0KTfc9+oDdCPW
	9nbN+kHg=
X-Gm-Gg: AfdE7ck3fpdRAfGMUCBFqA3RhG+f7B0IrK+B0IxKdvhrGh7inZBEaxsQvJMCds2Bb0N
	scz9FBD4n7/R6TLBZxCD7wJktKIips79HEdbVvXuF8ja/p7sUl8KdPN9oxJQhgoxfXmS5ZqALUv
	y8CkEMY4zculDku1DOWti4k0+AzhJTpfFjiVL1mPs5Bv9+bcFYUSmSYPn9Hiaf+m7TU+esImu54
	YHFMpAUAnAkwz+o69brW4lG4izBjPubIT24XzLxBrjGdwlCYqK3WAXuddt/UNrf4K3XblCv6gsw
	vbhykBCXvFQhFGOmqoInnu42Hy+t1vL9gOIkHwjA9/qmyNBFg2LOL52FLra8voBbDxNcUl3RtLn
	kgkvG2uIqkBhzEm6Kk27h3Fb1Dm/ZBbX5SH4p2EaqPrnQXtn/XcMVZUV5VYGGlZbp5BF+qifwXx
	BkrTbPhEsxq7WVjXna4ZijYdCh2ICbIse3BslyYHGk9nLzoeXmseR/
X-Received: by 2002:a05:600c:3b0d:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-493e68678b9mr19623705e9.27.1783510825819;
        Wed, 08 Jul 2026 04:40:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] python3-hatchling: upgrade 1.30.1 -> 1.31.0
Date: Wed,  8 Jul 2026 12:40:13 +0100
Message-ID: <20260708114021.3484868-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240466

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-hatchling_1.30.1.bb => python3-hatchling_1.31.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.30.1.bb => python3-hatchling_1.31.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
index 23067e3e58f..3acaa836382 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "eee4fd45357f72ebb3d7a42e5d72cfb5e29ed426d79e8836288926c4258d5f2e"
+SRC_URI[sha256sum] = "6b48ad4068a482ed7239b3a8215bc55b47aad3345d58dfc94e553c5d2d46211b"
 
 BBCLASSEXTEND = "native nativesdk"

