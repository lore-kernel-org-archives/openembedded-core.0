Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAEFCE7AF1
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:28 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.6183.1695869361732009204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1kGfvTdm;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.176, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77386822cfbso818625785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869360; x=1696474160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apPAeWgHHDHvqHjMqaCtIpJtQaUHm8pSGpoR4Y7ur4E=;
        b=1kGfvTdmkWZmxrQky8tOHIQi2q9ApnqQJ4rcedodyr7kH4gZ7nSULZDbGBdWdZ1iM4
         X0HD4MnP4F9GV9XtceZW7ERrJK00vhokhBorqVPNkoQoLiPmilCedpCxd7chQj01/m4o
         k5mJnwykUnUx/2c5fHvm/3SXctl+Rx5uWrSZRyb/JKb5Y0suixDPTUMPc2ClGHeAfnVP
         YEXWPoJcHtSB/GUjm9r0cePHDzqLX4DFU3J4lKZUygQkZ9Ac+Ql8+jTRpCzgWsADj/QU
         fRKYY7bXs1Y/y4H/cRt81o6jV1KV0hq031GQKH58s8Q/fIqr/ooyEL8ra8mUqB3qFLdg
         2YRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869360; x=1696474160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apPAeWgHHDHvqHjMqaCtIpJtQaUHm8pSGpoR4Y7ur4E=;
        b=n7W/YCbnbKPPmfRyZLGGD/qsTF2Ns85c0hBypwP4C8vBc5o0IXUbDJrXCbQMBwqKO1
         5G+mOOWzFBM5H8aRirB3R8SuECGhZWpWegsHYbasG32uH99cJli8ZOTvuU4PRwBK/6S9
         YWrgIIZ0jB4AKlkWXl1JP2bfaqhPxnIfU7wAWDEgh7uSRX+VzX1UEi9R6AWezT9L6gAS
         LqjeFU1ZHg1eNadJdAiAcEC1q21PWVNPRj2WK1ErZ0hY+us+Ls1iBLIlK+BOTi7qrnRg
         lVj4auF8j9CrxuUw1hZ1Nfo1pzoVUHk6eUixjy6YcSwgFmmoM8NC0AJPlIorkOkhBNzB
         xMDg==
X-Gm-Message-State: AOJu0YxuJf2zc3uLPH0R+V2G1u61gmHpSKh2DYGeR/URymHsmuwSQTXF
	40DHsvnfMqgNFxUcQ45wuMO0PDAJ7XPb1KHhm6E=
X-Google-Smtp-Source: AGHT+IEwoSbHyJ6gUEOnPeFG8CNGp79bocFT9oYViEH7vMm510oz4B/zk9k64gCyEm7Z7msxJT9UHw==
X-Received: by 2002:a05:620a:7f3:b0:76f:10ab:7c65 with SMTP id k19-20020a05620a07f300b0076f10ab7c65mr3326914qkk.43.1695869360464;
        Wed, 27 Sep 2023 19:49:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/17] kernel.bbclass: Add force flag to rm calls
Date: Wed, 27 Sep 2023 16:48:46 -1000
Message-Id: <7e177848f97eb9958619c28b5e5dadee12f67507.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188367

From: Ryan Eatmon <reatmon@ti.com>

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

(From OE-Core rev: 2e669bf797b15d803e7d6a700e449bdc467a4bcc)

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f7d199e917..5951347361 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -442,8 +442,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
 		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
-- 
2.34.1


