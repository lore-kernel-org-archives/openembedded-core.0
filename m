Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF280C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:24:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.483.1659108279283869644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OVxwL1mY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d3so4905153pls.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Aq0VjJkJ3Lx6+09PL0ANqyk333sWZKnVMlD1X5K/Yo8=;
        b=OVxwL1mYojBosXKEufsqUjIaq9hIkkyg0Ur3D4OHT+j3E5LG6rF5B/LPeF68zM18KU
         IoyKF4szoZ/8n8KEyOOhB5XQpwIl+ZOud5c+duIhnJkAeJRoH2yPT9ubY53awQs73rc+
         dHqCIeUq+PtjLCl+5oBIWQBy5SEXrCeqEHAeku123fh0e4XwRaBlSLhH8J/0mPPRw/Pq
         COM7NGfetB1yEgp4xSLRxp6Si0ClIqDBifitwqFXwbhZHLdHPaJbFeaYhz2uFwdCVF80
         l/Kjw85w1OBsFBH5OPggSje1kLkeaNQuCTU8KWU9e4XG16AOE4h1FIdMpbYp6E+Z9RyD
         0+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aq0VjJkJ3Lx6+09PL0ANqyk333sWZKnVMlD1X5K/Yo8=;
        b=qLXYlSJbWB5ANXtZB0cfXFrq436RBKWYBHtuoE3baSD+0T1PlWi/r9TXBDYBcwIbNk
         vlLD/ZlngmYdVqrxoSclXcd3IHGh62V8Anl1ibb5k2BzqUYIoJ2h+9FjrGzcZWYJfW/3
         8Y0+HHwNNG5IHr5BWvqzw2/nhYN7a6Im+DQtTVI25rIIN1vkRcIKUVNWsawLOBMTGhEQ
         tK+c02uCOH/02481fsoeu64f0jFhCqtKr8tRFjRm1midmv8vRvSnlNuWwIYpIuClSFdW
         zdWBqlexWHI/N80BZHCRN/J5MUInruo5I6U0MJenmaRnAAN5qUd9YTHkbRDOO23/U+C0
         4D/w==
X-Gm-Message-State: ACgBeo3l308IB/sIcJuEFSZD1aNyCV+NVwB3pTUnQzAmmBywZnh5rUHU
	c2PlZrC3UHNmEvl3/YFwdpHkgm95a+AUhFgP
X-Google-Smtp-Source: 
 AA6agR7H+hVc72Xq0gxhb5gj0PEX4BD4jC9xJZmFSPeMPpU5Cry3GDNZ5Fc8GuEggvSGZXSGbv/mJg==
X-Received: by 2002:a17:903:248:b0:168:ce2f:cbd2 with SMTP id
 j8-20020a170903024800b00168ce2fcbd2mr4347703plh.63.1659108278260;
        Fri, 29 Jul 2022 08:24:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm3889808plh.233.2022.07.29.08.24.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:24:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] kernel-fitimage.bbclass: add padding algorithm
 property in config nodes
Date: Fri, 29 Jul 2022 05:24:07 -1000
Message-Id: 
 <152765b74c77b4da102fce9c4c61a667e71f26a1.1659108121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659108121.git.steve@sakoman.com>
References: <cover.1659108121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 15:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168668

From: LUIS ENRIQUEZ <lenriquez389@gmail.com>

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
From: LUIS ENRIQUEZ <luis.enriquez@se.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5f5e9dd444..7c0d93625b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -56,6 +56,9 @@ FIT_HASH_ALG ?= "sha256"
 # fitImage Signature Algo
 FIT_SIGN_ALG ?= "rsa2048"
 
+# fitImage Padding Algo
+FIT_PAD_ALG ?= "pkcs-1.5"
+
 #
 # Emit the fitImage ITS header
 #
@@ -250,6 +253,7 @@ fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
 	conf_sign_algo="${FIT_SIGN_ALG}"
+	conf_padding_algo="${FIT_PAD_ALG}"
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -333,6 +337,7 @@ EOF
                         signature-1 {
                                 algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
+                                padding = "${conf_padding_algo}";
 				${sign_line}
                         };
 EOF
-- 
2.25.1


