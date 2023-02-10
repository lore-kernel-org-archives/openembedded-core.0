Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0570EC636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8402.1676011361482388390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+9XYhIA;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m14so4019403wrg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO2rTNt9M5SPTdraxmdJFgA/SLf6Ox8Ag3V+sourfoA=;
        b=Y+9XYhIAhdmh1vqxAJfAtrtNvuJSUdyo4frRdsn/jzHalX063LcedcO0ZFTKfelbOV
         CKEwaKQOGwmDXNQIcOI/+s/G8M72l81j69bSPDjjYkiovTeWQbd6JFtmqfuivn9kTZIc
         qlGJ8eJp2FOL6xpBZkmjWnWAApGyS0HHH0t19oMf3uPwdI3xZhQ/zlXPusLJcyF5Ai1n
         LwurlQkygyKmcxPkvm2jzcxkLovhIPxyirQbUXeBlw/uAjOOuXev0LpfFbtD3xJRdbYn
         5vu1nxUZlFEU0B2Qm8krQyNkSbaRBkeK+Ev1l+uOgdqlwOwFnh/F9zTNAJq88Z00lhOq
         QTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dO2rTNt9M5SPTdraxmdJFgA/SLf6Ox8Ag3V+sourfoA=;
        b=kHdyuCAw3QH8JXOuLlrQOjHg1RGOSiMeMCv9PfUapLsNEKgNimMLrxfthRsJvsQQhx
         W2nRR5OZlcaY5cZ5F5Reow9n5WGf87PRz5sn7AhnMX2FZM7GWh8JFYjKRgptr6eALHrH
         5j6Sc0oBn/MJRxrqSToumACJvNn1Hr4vE6I/aos3pvRsUxM/UTd68iAvqJ7lU8DFrRhQ
         gk9jAv6IoeW0tYrl8Vb6qbOfm3VrCBKPt8DqRJBITbAHg8SjUF+bwuOLQ9SJrpqAQM4p
         17krgbSq0VnGoXg2k5IR8/kcfCgyJliHOGSk/fbfcNtKoeVdeQCCHd8MjbvA6PWQivOZ
         DCNw==
X-Gm-Message-State: AO0yUKWTF5MuFIjSCVZLQwaT7uHY3R9XwxllqVIkVtnCb1hgtLOJBFnT
	TkC8Ph2SE9yedl5IxDAvj8rQEps4ax0=
X-Google-Smtp-Source: AK7set+ngTV+OO8iocxeDdOQpxGB19xxQhq1hArJppGpJ9Ju4KEdbz6HVmHOjEiDLMsEp1W7aCBMaA==
X-Received: by 2002:a5d:4107:0:b0:2c5:4add:9e46 with SMTP id l7-20020a5d4107000000b002c54add9e46mr511948wrp.28.1676011362568;
        Thu, 09 Feb 2023 22:42:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/8] go-cross-canadian: use gcc-crosssdk, not gcc-native
Date: Fri, 10 Feb 2023 07:42:13 +0100
Message-Id: <20230210064216.4123807-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176978

The recipe was building native go against build host headers and libraries,
and then installing it as a nativesdk item, which is entirely incorrect. This has
been working by coincidence (go generally uses C and C libraries lightly)
but with go 1.20 this turned into hard breakage.

Also nativesdk sysroot was being passed in incorrectly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index c1aa987427..5a80ceffa3 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -21,10 +21,10 @@ export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${HOST_GOTUPLE}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
-	export CXX_FOR_${HOST_GOTUPLE}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+	export CC_FOR_${HOST_GOTUPLE}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS}"
+	export CXX_FOR_${HOST_GOTUPLE}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS}"
 	cd src
-	./make.bash --host-only --no-banner
+	./make.bash --target-only --no-banner
 	cd ${B}
 }
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
-- 
2.30.2


