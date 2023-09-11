Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ACCEE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:49:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.302.1694447388671614062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 08:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KmtHsc/I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-402d499580dso49237185e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694447387; x=1695052187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3PaIgHe6Y+9WNuW3TbGXvfHI5rOHuv09+ujnI/OY0I=;
        b=KmtHsc/IoHlpfumW7KpMHoafqPmnyb2U8lf/N0blSowiRGmvQMbehV6LgdYIEmDGRe
         dChn0KVomnIIW1rk4JUeyKmQIGA+CMdQWaS28GQxSMY9sahOxUR/4gKLUCaXzVgXbxXb
         I6CpjxnY5VjAZVXu0aspkcuFFsugG8AgCrQmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447387; x=1695052187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3PaIgHe6Y+9WNuW3TbGXvfHI5rOHuv09+ujnI/OY0I=;
        b=EG60WVH8bYuMG/iyAzfE0TxQ/bhr0A+55jlm7K5wZy4W1lfdZV4/X3BvsRs13TM9tN
         zrxjo6o3Uu9cqQisEcTKM2bmdlJ2FnbbS5SGDRABt+KnF7W/xhOzdYywIyoMCqHUYVYF
         EpUz6L/l4QMF/uaUCgu9Ojoj/ykZhoeOs5tGd2ztoYwJyVyJvHgGwh+1dvfT4gAfIIZW
         qZMwFUfA3TYkzgLSKWtZniYm0PBbTsWEWaPxLn2a/vEmAucs2a7THGYOlFHLQZFKb3Pd
         JhgvlWA2HEIqhdVAHt5Br8moDJ4J382XGRJoIibkwciTzYjIBCyWwoC7/M0XpCETZTPV
         /7jQ==
X-Gm-Message-State: AOJu0Yx/uRiYK+7eviIuwZWZiZKS26dPznnVhyWGpV8Bl+tTJ7kyLFda
	b7tN8dg46+UPegHXDXKnbK1XLIs7gntnXtg6eDs=
X-Google-Smtp-Source: AGHT+IESEJuLy5rE9BD7oPXrngFQYlSXuiCiNlo8jy42e0W7LF4DiFbgnJC+a/E1/SHKstp6on09zQ==
X-Received: by 2002:a1c:6a0c:0:b0:401:d947:c8a4 with SMTP id f12-20020a1c6a0c000000b00401d947c8a4mr8919657wmc.29.1694447386626;
        Mon, 11 Sep 2023 08:49:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f06:d4a0:29ed:7f19])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13625999wmb.42.2023.09.11.08.49.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:49:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Add IMAGE_BASENAME to SDK_NAME
Date: Mon, 11 Sep 2023 16:49:45 +0100
Message-Id: <20230911154945.3812641-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 15:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187495

When SPDX manifests are enabled for OE-Core, it hightlights that the SDK_NAME
default isn't working well. Add IMAGE_BASENAME to it to help avoid conflicts
between outut files.

I suspect the defaults aren't working well and most distros are already
overriding this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 69e854ecedc..8b264618745 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -459,7 +459,7 @@ PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
 ##################################################################
 
 SDK_NAME_PREFIX ?= "oecore"
-SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
+SDK_NAME = "${SDK_NAME_PREFIX}-${IMAGE_BASENAME}-${SDK_ARCH}-${TUNE_PKGARCH}"
 SDKPATH = "/usr/local/oe-sdk-hardcoded-buildpath"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 # The path to default to installing the SDK to
-- 
2.39.2


