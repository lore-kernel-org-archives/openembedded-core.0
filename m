Return-Path: <lenriquez389@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639B8C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 08:29:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.19772.1657700976130242480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 01:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FaaWnOSA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: lenriquez389@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d16so14399199wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJ/EQp/qOy40u4VRrj53phe4um4Tjf7k+wP4M3jSh8o=;
        b=FaaWnOSA56/GFmoC2+ztoEirTp28dPJ9tDwfzChkA3yNleet4vBwR2mGPTwOfBd2sG
         kVjMKSWUR7/sdKdyBRJCeGjLqootRS4CXiYZWg5N+4P4xDaja+Gv9pa3baEhJVuNZEVK
         4Mj2lardT3EaK7fAQrj3SBnMtZljIFxdK9SB+ZZe6OlWvtqZJD2ZNBhSuOiw5ozkSFRf
         52rM8qxq28mykr8+ImiluAwY3R8dGx4cY4IYBi6tkbIbngc1ZO2EezezQclSFnUvZs4N
         wl+5vsXHUpPXMGbLzr2kZaL8vN4BsIXjZ+gkE044Wwy77EIEDlSwRnJ9hBfQt97SrmYv
         Ta1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJ/EQp/qOy40u4VRrj53phe4um4Tjf7k+wP4M3jSh8o=;
        b=PClSCIiSOUeTzh9YFpTr3I5mBXPDWGo9nBDMJMcCCsvbu/AGMnjOZmXWRRWZQNnj7e
         9GPOJrYek6FBeGU7D03wIx1DdwJSES1f/pJr1y0eeCA+UtEayYHEk1wW/d3BRmot11x0
         rmhucPFjaG+qLFHLi12LnZeOzdi+lMU6x/qnb0XrW4bFTjS59PwdVRrHDnFj0HsPg12f
         famdc1q8u+KBrvTKgmc6s/touMIF0RBALAG4IkQdScaQxRurFPV7BpbtjkaFHsiE6hSz
         XfH3PQRsdh9sXJaIQTuinuJfP0+Z7gxaWGQseFsFQOnBdsLl7/QhsL3NCQ33X5W5VqG3
         7p9A==
X-Gm-Message-State: AJIora9R7nPVejtXlgwr4AxcygDCluMDGlHSmZ4ZE7CEC88SGhmOZCmH
	LLGjJQaB2bBAkKwxuIWW2YrNawWALCs=
X-Google-Smtp-Source: 
 AGRyM1sTi0rY1QRyMZMZfOGNkJC4PGg0bwndhcpA6lfxAw6xMh38KLTywXJ7dCxwm0F+In+ZVnjg+w==
X-Received: by 2002:a5d:5955:0:b0:21d:854d:3322 with SMTP id
 e21-20020a5d5955000000b0021d854d3322mr1962905wri.503.1657700974255;
        Wed, 13 Jul 2022 01:29:34 -0700 (PDT)
Received: from gmail.com (38.175.185.81.rev.sfr.net. [81.185.175.38])
        by smtp.gmail.com with ESMTPSA id
 p185-20020a1c29c2000000b003a2e2a2e294sm1406713wmp.18.2022.07.13.01.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:29:33 -0700 (PDT)
From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
X-Google-Original-From: LUIS ENRIQUEZ <luis.enriquez@se.com>
To: openembedded-core@lists.openembedded.org
Cc: LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: [PATCH] kernel-fitimage.bbclass: add padding algorithm property in
 config nodes
Date: Wed, 13 Jul 2022 10:28:03 +0200
Message-Id: <20220713082802.581567-1-luis.enriquez@se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 08:29:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167953

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
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


