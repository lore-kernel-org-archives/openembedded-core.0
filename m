Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9207CD42BB6
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3430.1731467808118365231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KRGXRC2/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-72458c0e0d5so224157b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467807; x=1732072607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBdkm++QnTM5pdRJPnlPelnn1hF0RJ54OGWFCRId8aU=;
        b=KRGXRC2/ZM1KLpmn/8zTQl71jf2kz3CzITBhBA/i66WhLv7omlUCJfqUJ3YyFVor5v
         DWlMx8m4G/DSnespYR+4W2myXEZsfBYyBtonZodAesGXFdVp7gGWwm5mcXS9aJX1oDm4
         ReKZwye38ZU31oyenelD1f4smRMv3i9kQDJ92ndttJNuRFXPbL+UR6FauQOOEtolfex4
         gdHhgYxxIiGSilfU6gl7Xg6s40Mmb96m0nGSgMDUBvMDXfHHIwst1+3HZ6t6G+6rAnGi
         hF3hKfHtSjdcqqMwBc0FXWIxHFt/f4Qp8CHwpR5zLSyapxVQSXtcJZ0KYNwHZlYS9m5e
         wVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467807; x=1732072607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBdkm++QnTM5pdRJPnlPelnn1hF0RJ54OGWFCRId8aU=;
        b=pFSIAGde+VU+DECoCqC73RBex8xKniIyVJhUCTDJAjwUSbgRwuigmVvXfDEicR+yPU
         W9q6+n5mQc/lOboh2OQKvWwhD/JdpVL94h8/nuxJK6KQjAdIUn4b4yQ6xWCy+LOWFJRg
         u3xKg6q1Z8QwfHaNC7ulBWmtX12tbIooik/IT06rcVx2IMfWh+2W36ZTuLAHZ06K9keg
         fHZmG2EE7X1JDEnw8Ow5im+hwDe0uxqdjGa2ycAmXh+RgzrI+BgGgOI+zMXeENXGMFY2
         yU8DAUsMUqT2qQPB627iAEiIALkcPwsSkhOA500IYm+V7dUV1UynpqcPxHcany1ZUOcs
         J04g==
X-Gm-Message-State: AOJu0YzF3KVvulQydnXNlefW9oiSKuR7GdrjFrIV0qezkD7XpPREnnzN
	uHsxrfFpK61rL3bQNiPNPxsbyQId17Akk9cPeHZZVJEYFXNjSYPp5PD66SKFazt3ke9xODVgVyI
	n
X-Google-Smtp-Source: AGHT+IF3kKYTxMAhAk6J/GsVIFwwW5/1kyPRdxGTZSXH2KSJmB/yVu9D2XUZkKmPucBxwlR+CIun8g==
X-Received: by 2002:a05:6a20:430a:b0:1db:d6b1:c225 with SMTP id adf61e73a8af0-1dc22ee9bbfmr29583804637.0.1731467807334;
        Tue, 12 Nov 2024 19:16:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] pseudo: Update to include open symlink handling bugfix
Date: Tue, 12 Nov 2024 19:16:11 -0800
Message-Id: <cc87b332c5d09d4d7aaa2569fa046a16012597d2.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207091

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a new revision which includes "Bugfix for Linux open(O_CREAT|O_EXCL)"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 50c3b59975..b390ca7db9 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
+SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


