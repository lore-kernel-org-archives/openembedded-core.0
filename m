Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EABD58072
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17088.1732536102174775994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLtFLiBC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a099ba95so5295015e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536100; x=1733140900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odt9cJpnaOWgmyp+SITDl9gyuVaqAB0JOj67JRdKBiw=;
        b=YLtFLiBCPp6dN2QJ/dPW1B2kU+waIbNBkwQ55r28ySkniETlRSt49f0OFXJMhup9QP
         52NEO3S11OWAo6Ja+wg8zAohqb3cODhDb/tctwXg8Iion3GO4R6l1Gp+doPVmYuE4TGz
         TRKT2h/byy1TEWBG/4WdVED7baqe4Amjwto51UkouDiz1V5hWcOLXjF4pc/8D5YMk8DT
         m01O8Fm3M5i809tpi+G7Lwm454W9E0iEGJ0sr6lm1XutGyMOsQosFrn6sIjNVpBgSZ+H
         Rm++HM2v7Pk59WJ694mIivSaWM6H9j57AoUlInhTBKnq5doWUKF0YauRWpLi2FhVn5ru
         yDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536100; x=1733140900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odt9cJpnaOWgmyp+SITDl9gyuVaqAB0JOj67JRdKBiw=;
        b=Szp4Z9Gj7qHYL1EsPqDsM/ZEsEcxBMAu/XCwBF1tcZDt49U2AOjn9m0glceKt4iHx2
         5JsUrxaids1VCb8V2OJNtmY/o4El1d9J6Te6yVV+PmYvQUzNbmD8G6107EiOM1pGbqS/
         pvWQ0WvF+KatRocrF2Y9zXw64ib8cG9Ggrin85j4Z8P9gKNn6YcK/NbbfTes34rgNNAO
         oFkB8z6bWhO1bdIKmEyO2gYZpYRWl53oiRCLBe9uT1okjcSUHR0O5VZlBC2c/OksMk/3
         PCremKJRVH5CvkPGUH/A5T9jGM/k/RNZ3anxAAclJDp8Bnpunzdmtj0WdfE7P8ZNUR0F
         XQyQ==
X-Gm-Message-State: AOJu0Yx7m/HcQATuEfCn6/YmaiKsepOrL6tWBXSTEOXZlb2nEaSguQrJ
	BIs08nQEWwCE+wlqsWS9ZkImCB5y7hsW7j+MoTrs/Z9umdplEUPXq1f5bA==
X-Gm-Gg: ASbGncuC++5+U4nN1gMHAXJpm60x1i4vQYcOdtalCCkvs5AvUq2jMJXulC0CZ5QTU4N
	CRBaBGxNBVxHKrt2dQpsiQCfKOsoM6yNywaabM81xsCT2+WzS6fnPN7x5fnI4f/hGgYiBZkU8HT
	PwL//p8uIWuX2+hPz1+luZyO1too1skU2pMX4vmbLkzyzbwKl/741cajZqHgS2jSr5lo6TBH1xw
	42xKwE/UDtV6GGImi1nBGG7T53nBedxpi/Y1uK8KQDp8ISUQhI32dKLTq4XlB1OiBUpWqgVsDRW
	kksNHOPMrbo=
X-Google-Smtp-Source: AGHT+IEWkIWjcTG53LtXl6LIQK487Pk0DY/tmxSVommf8mr8N4Z4/9nMSabY2JowNwaS0aypAWs/XA==
X-Received: by 2002:a05:600c:310b:b0:42e:93af:61c5 with SMTP id 5b1f17b1804b1-433ce41e542mr111787355e9.14.1732536098898;
        Mon, 25 Nov 2024 04:01:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/35] libtry-tiny-perl: upgrade 0.31 -> 0.32
Date: Mon, 25 Nov 2024 13:01:05 +0100
Message-Id: <20241125120127.2205232-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207761

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../perl/{libtry-tiny-perl_0.31.bb => libtry-tiny-perl_0.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtry-tiny-perl_0.31.bb => libtry-tiny-perl_0.32.bb} (91%)

diff --git a/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb b/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
similarity index 91%
rename from meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
rename to meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
index a3728d84356..d0714695b8a 100644
--- a/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
+++ b/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=5dc332c2d4aade55f5db244681000091"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Try-Tiny-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "3300d31d8a4075b26d8f46ce864a1d913e0e8467ceeba6655d5d2b2e206c11be"
+SRC_URI[sha256sum] = "ef2d6cab0bad18e3ab1c4e6125cc5f695c7e459899f512451c8fa3ef83fa7fc0"
 
 S = "${WORKDIR}/Try-Tiny-${PV}"
 
-- 
2.39.5


