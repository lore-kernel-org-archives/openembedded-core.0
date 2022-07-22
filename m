Return-Path: <lenriquez389@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A99C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 09:50:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.6009.1658483428779918089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lEd5lEgu;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: lenriquez389@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 h206-20020a1c21d7000000b003a2fa488efdso2259124wmh.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=07yxZPFPaNFIThuw95nrJVzyxsEEa2i8t8fRxp0ggHw=;
        b=lEd5lEguRZTa6lekXzBfT+ewWyetEWN+O+sxXhSCSgNzjAeFLM4yQlhCg95pipHk6C
         WdayMeWwGndISCr6aO0m1sEHULbkTujEBf6eBTIRGbo3nXT3fQE6o/pWgykDYsW3gTNX
         wwVggGAViZus+Vp9AKABULzdcfVw2wfNpy9heJ9Z07JmcD2rg3CKuT5IFuoStDOyz0lS
         H/zHmm94PMS2TVKj+dbaqDGW0/E1M27pi/cH2wWvmOCloncumZMj3rrlpLuE4NXlHsbO
         ZojgGeXyWM2/d5TqAoU4DPO2JwGe2ZDcuVi0JURIULIpGwa0r6PFdcPC5XCeV60EKXx6
         jo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=07yxZPFPaNFIThuw95nrJVzyxsEEa2i8t8fRxp0ggHw=;
        b=TVYqydogLebtNXnP/Srdx1ysHfWWJfqUjIlVCEMOZbrAEB5jDjgZmlzz3JUGm2Ca08
         Z+EU+OM4L5Vk+T6hQugfD48rFJwA8HGQc3XkMlWujmxKlKuqQWQJpSL/61xli2Mjirm0
         /P5lIKJxTAx6rEUTNYuAU+Sb8hcY7Tmd/U+2zn0F1tpIN4mnCTqiahak3tGd+SaXMr36
         5aogZUIf2Ny8GQvHg7F6AmHSDZ+CQvOuDBoyHXvFLkpwFA/owyXw5V2epw7cd37dh3Oy
         2vckCS+IybC95CIMVCjIy2avC4UUO0DoZUpnZavhUq2Cr1OsgiS26X6Xpv/PdQuaTa00
         Yg2g==
X-Gm-Message-State: AJIora9Eb0KQZNSaN0lBLT6EfFQWwjQ4YkqaGuR+Dmbs8ax1aM9FAC7g
	0URtFA4DJ9hn3J7MpdZNbtmxQTiJYEs=
X-Google-Smtp-Source: 
 AGRyM1sw9QWU41tn1+ReQcgILa6hKBkghOkRKXbyadOByNc/2MVfhxY+EMYLT5E7cocgfYp9SCG+FQ==
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr12113171wmc.56.1658483426483;
        Fri, 22 Jul 2022 02:50:26 -0700 (PDT)
Received: from gmail.com (86.174.185.81.rev.sfr.net. [81.185.174.86])
        by smtp.gmail.com with ESMTPSA id
 t17-20020a5d4611000000b0021e68b706basm308111wrq.74.2022.07.22.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 02:50:26 -0700 (PDT)
From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
X-Google-Original-From: LUIS ENRIQUEZ <luis.enriquez@se.com>
To: openembedded-core@lists.openembedded.org
Cc: LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: [dunfell][PATCH] kernel-fitimage.bbclass: add padding algorithm
 property in config nodes
Date: Fri, 22 Jul 2022 11:50:17 +0200
Message-Id: <20220722095016.1573787-1-luis.enriquez@se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 09:50:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168399

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
From: LUIS ENRIQUEZ <luis.enriquez@se.com>
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


