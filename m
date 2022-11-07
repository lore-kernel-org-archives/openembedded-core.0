Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08112C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.94.1667835464840514614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PTiOjgwv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id io19so11387468plb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+oPxX1kY+ZFp1gGMf95ISwq8ctfZa6pwh9xvl00KdI=;
        b=PTiOjgwvn3AtPSc+aiwULXk9O6EsJfTWbWsNSUZ+h2VERFObicHZHU/9e9j6pnulll
         ghjTQTcylyRkkSy5IlbMB8J1p5dpiFUYhkfm2TS1kwXRBBbIoHRjpu+y24tHyoPK+H81
         bJznjC6AQLcQHNOs1aHfdmQmVxNGYCXMbLlkoUZFHkLSNbfMxaWmZKy8QRGuDaycQ2G5
         +Lp5r1nkSGEZxwRFq95yw+QZMaK0nui+aztjjqDTaT5KU0LMHdwkbiG0dYlArKKN4xbH
         A7qouql9HHaC229LOdZW6uYg5OHE6aaIhCGNXdmSQv1Pw3Urlaq634Ugr+BKCYAqsF2F
         bcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+oPxX1kY+ZFp1gGMf95ISwq8ctfZa6pwh9xvl00KdI=;
        b=wTgzUk0bWTPnNGh4l77lFgtMmKGuQMOGyblSk7zRaAzcfIGL4xJ+uOaNlsudmfxk8b
         AzArPFa3JrKFL36N39CRuxONrpmvZAM0lgpYOx1lMQdBq3cPwJw24pDF6TFQryAC+j2r
         g4hezgzc9XGvIR+T5i06Ef7BSwPdNbKndMBGuI3Wy8Ntlx71NIMFxKb1W9ER2pFukwJ2
         aCc9k328ZD15MfFJPNglF4Z5odQMYpLpHOSXoWTFd2l7g2STerxU6WLILe0JBGQPAkeq
         B21XYLzqQ5NHEzdRk96En2CQ8nj9rNd9ur45nFg3QtgTMFQWuqV2BAC+UlYqC7q5fQIK
         fbBg==
X-Gm-Message-State: ACrzQf07PUlQsIS40HIifPT0gJs6hn6B0kkE2E/KqDQMlQRkHLXVriuN
	o4iZ6ZBgS5v/9DyG9wwEGgTVqOKUmjUBLp6S
X-Google-Smtp-Source: AMsMyM61WiDXcMDCAsrbta0uZN3XI2CGtAKK4bjX6rYKSgNsywjSqRmXZ5ecP5mi5ctJoZqNpAGjfg==
X-Received: by 2002:a17:902:f551:b0:186:be04:6670 with SMTP id h17-20020a170902f55100b00186be046670mr50343676plf.159.1667835463930;
        Mon, 07 Nov 2022 07:37:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/25] uboot-sign: Fix using wrong KEY_REQ_ARGS
Date: Mon,  7 Nov 2022 05:36:43 -1000
Message-Id: <a066246170af979b29945c45b436228f5dbba121.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172923

From: Sean Anderson <sean.anderson@seco.com>

When generating our SPL-verifying certificate, we use FIT_KEY_REQ_ARGS,
which is intended for the U-Boot-verifying certificate. Instead, use
UBOOT_FIT_KEY_REQ_ARGS.

Fixes: 0e6b0fefa0 ("u-boot: Use a different Key for SPL signing")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a2d939ccb182a1ad29280d236b9f9e1d09527af1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index eecdec9160..6bb4ddc600 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -292,7 +292,7 @@ do_uboot_generate_rsa_keys() {
 				"${UBOOT_FIT_SIGN_NUMBITS}"
 
 			echo "Generating certificate for signing U-Boot fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
+			openssl req ${UBOOT_FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
 				-key "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
 				-out "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt
 		fi
-- 
2.25.1


