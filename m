Return-Path: <lenriquez389@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2060FC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:59:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.6516.1657612756329950239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kio+UjY2;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: lenriquez389@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id v14so10003061wra.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OxcMe8MjpIepobLTWTYidCkuQ/QnA7rlPUIPPEZtHzU=;
        b=kio+UjY2piimrSvD008KL1Umrz7XTrOHk5TZYKD0lIdC7l+f3jqI++xCoMQpgWi7e6
         BfhEJhmi3vO5D6O6kW6M6YmwSJlAYU3KpMCc4uyOZpdBfQ+RAG/VP4lLtqzL78c9xYVg
         CUiC0kfoj41qukuTBtqpGIVE0wdMw3kze/V1m4zNI9PuDSQvZxHOvOdNt6n8ub9efdGD
         Y9G3oN8GR7f6khPfUws1F+DvtT7c7KH8wX2o7SInkobrYUiA7sfMnzjFJ/aUVU7SR2oL
         2W058SX5deyqFL52xCRpbJdL91tDvhdZmu3ZNQ0wkve3pC/0uxcvHAhQ9rOzey+V2gLf
         e38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OxcMe8MjpIepobLTWTYidCkuQ/QnA7rlPUIPPEZtHzU=;
        b=LZwVsvML8n4QwiTIm02eaLzxeQqVG7adOd19/GfLBiY7wRWRjA1x3RItbDBsJdqouf
         2dqeqKVcVe+kW/O8bIS1yQifEk8M3VDo15rXGiGgAPebXrZNWhFBp982eU1Tj8na9GgR
         /LozAUm5Hc/H1/oP3r9aCBuvXo2xe0sSvr7G7elNltSux0zFVrNA4G519J07VbDS2g+Z
         3W46+XmrZAzZCNTR4JQVYwNQ3thO3s3sLrX94Et4s4ia0Let2qJYJHwHUQzJI1Rp7tTR
         qlUhcRzg3rwWbVMwOVETGPcqgQkrcX9shC45xiLVvOxDZ04xhTejVnXxL7SHnYlUUbtD
         1RCw==
X-Gm-Message-State: AJIora+aDAI3+mpx0qYlxmJ4QlBKQ3nDSd1DLljACpp3UiYgj6RUiUyu
	VBHPTlrL9WBOmtxbwRGAbP7LUPJeFb0=
X-Google-Smtp-Source: 
 AGRyM1ur3rRNnK9t1hIw1xxpWKpSpMuTBnNyNCOLLFJt6HmMQeLpUAzAE7D1OQVcJe8SUk5AnY6P8Q==
X-Received: by 2002:a5d:5451:0:b0:21d:2295:6a05 with SMTP id
 w17-20020a5d5451000000b0021d22956a05mr20274242wrv.302.1657612754546;
        Tue, 12 Jul 2022 00:59:14 -0700 (PDT)
Received: from gmail.com (38.165.185.81.rev.sfr.net. [81.185.165.38])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c465000b003a2d92ab521sm8573775wmo.26.2022.07.12.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 00:59:14 -0700 (PDT)
From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
X-Google-Original-From: LUIS ENRIQUEZ <luis.enriquez@se.com>
To: openembedded-core@lists.openembedded.org
Cc: LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: [PATCH] kernel-fitimage.bbclass: add padding algorithm property in
 config nodes
Date: Tue, 12 Jul 2022 09:59:08 +0200
Message-Id: <20220712075908.522994-1-luis.enriquez@se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:59:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167909

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
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


