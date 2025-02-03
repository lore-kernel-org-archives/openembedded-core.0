Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC35DC02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.92649.1738600905692892765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S2k5LBJT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a88ba968aso4222398f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600904; x=1739205704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHWgBGTenYwAi5+a4bRXHkLSgGL6W01nGXeVmjbbWwc=;
        b=S2k5LBJTd6ojfBrqLN6fEy/APya7MagtnprJOjCcNzJM5YUnJo2msPx3yiUalZ7fYy
         viYKQe4NwfFeHBKX7haBWIBjQADGf1/8T9wOwvJkF07BWPXR8ORGjCJ+99GmPFZE6Hyu
         +Fl+K3KS05rCONiTeRElTCp97rvHFS1tWg4Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600904; x=1739205704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHWgBGTenYwAi5+a4bRXHkLSgGL6W01nGXeVmjbbWwc=;
        b=GRA2GO6i4e3LhjNJdm6YjAeyRN/9ryvlS1ayriV2yqW2FIeXrfeSxqqoJpwn6I4jZe
         JrUpBTrbtn/mTR9Q0fYW/9YyuISCSeC+c/6XC2BIH/I261CQRcPCk6R0TYAEEZFrM6AH
         r4foiNQU7RcTpMt3KMMQKXtjqQom62Pe+T4qo2hqiaZaMtTmuBPn2clDtefAHkoPfuGP
         8LTXgiByv30bHKbMaaEdaSk4zMKnZI41a3V6Xq12jJwLxTBzr0F3fKcVEKALwJQ/A6Iz
         SNtxW97ZN/eqT1iEIp0NtJ9y+8obMQ9TlaHN6V+YenEzr4vevgdnYTxV4qlw7X/sfovA
         YHfg==
X-Gm-Message-State: AOJu0Yzowzz2AxeuotiJ5WCRhkAnRhwLp+wgWrRAZ2Akmz1CcY7SNpbb
	jkwwt3cJknIWuaE+eYVjSJS2WZqxrSuHMndOAqfI/T14ueMuNouFZ4rdEAf1FgyVcefT8pZnblZ
	c
X-Gm-Gg: ASbGncveXW4pmEl53l70Ycqoop7Yz6s2RMlxN66qhRAajhsnqnYi7IjgNBHEh/rR+bn
	wvk/2pePlGSWpi1rqGkgHGJVbGoM/tmCNGlcIGGUhqcazKtpIuejuesEjxwbhRGRIXk7qzOZ1l7
	Zdfh1u9XWOo0DUIUybJ6yXRoNZtoSNNafttP5ZJweXrDs1qE08NdOGrKraXQ5dcwBQqaDtQZNGf
	ccCRyz1Lm5atF1fxSFS2bzEoCoeYwj/NQdNLbxwqXAnZtoskIY4ND5eCqkwVAAgIEIVtueMZ48n
	KhssrRMJ6GziXkZmI7YvPFLo2Re9Eo3h5ueUIUaHuXKv
X-Google-Smtp-Source: AGHT+IHHRpHZpmMx/prRPj6xBij2OD2ahxNo2PemEiVee4eEZJQPjLiw3CE+XAvlXRncgYR9aR80lQ==
X-Received: by 2002:a5d:6c65:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38c5cd0efe3mr15750266f8f.11.1738600903812;
        Mon, 03 Feb 2025 08:41:43 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/46] harfbuzz: upgrade 10.1.0 -> 10.2.0
Date: Mon,  3 Feb 2025 16:40:57 +0000
Message-ID: <20250203164130.3403325-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210686

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_10.1.0.bb => harfbuzz_10.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_10.1.0.bb => harfbuzz_10.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
index 4425dd3e1e9..879cad36dcf 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6ce3520f2d089a33cef0fc48321334b8e0b72141f6a763719aaaecd2779ecb82"
+SRC_URI[sha256sum] = "620e3468faec2ea8685d32c46a58469b850ef63040b3565cde05959825b48227"
 
 DEPENDS += "glib-2.0-native"
 

