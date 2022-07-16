Return-Path: <lenriquez389@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEE0C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 15:53:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.6749.1657986789410693452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jul 2022 08:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8TU+c3q;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: lenriquez389@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d16so10635462wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jul 2022 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nkbojUeZ6fVNtYUi2ANdG1YK1Dr80yIVh+93KNrj5Q=;
        b=V8TU+c3qHaqJI179TDFvDrN0o/Ytq2GRqM3ksNh7HDZ3LUzBiXANv5QA3iBlpECGsH
         ANF309QXgLmLHkpP3g46PPmE1SYitMMoBTpdKA+TS6gr8rM598a+WqMXO+i2oHGLP+Hc
         qaHJPUU+zyg8uCkt3gEtTqufYg0antulH+WRw8TFuAlIkFDkZYZY3Osz3mEhLXy+V0l0
         lH1tvq5ZENuTBQ64iz57SgZggHU1ZW+e8SvJxMKSARNRX/5LWSaa2uymzFJ8HmDYr9Xl
         oyGQu+F9sx5xA51VSWaW/ccWufImiuvwLeuAghDRxZHFSOSrbUcRtwuN7kSatq25WOKg
         4ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nkbojUeZ6fVNtYUi2ANdG1YK1Dr80yIVh+93KNrj5Q=;
        b=487DZnXVNw9m9A712Bj4iOTfzD9ROEWkZBK6x2A+BPNxL/06bwim+4OgsnY1M+qUfY
         UmB8Bgop1Zi6XMAEv6zieYDiR08Yb7gA54C00OFv8kxurfmI2CvrLJ1joBIXpmdlKNOl
         5F7r2+32CuZ7MqHPncaT6MElK6s01BDNFBHhwOWYj7p1gdqs8r0lnbwHJR4gmsAONZsn
         C/6VQsBtXoGPkajCFUXLDQC8e4pcHh1HUz3izUTCGVewpDgkoDS/Obx5QY8HCjOnkSgz
         LE+utPb7poV/Xe65zf2PWYTY2SaAjNZb8L4FxL0etTLy7k+Ti8i86vfrITU0VtcXr1JC
         yGQQ==
X-Gm-Message-State: AJIora9Fkm5385rfXD+cwyK97LIYXiSMg/c7EhY+n/L5S5jvwx0n73SF
	mRn4SnTwF9Ic2GTnC26otOmBWUDuAPc=
X-Google-Smtp-Source: 
 AGRyM1vR4uuBCENPbGv1cayl6fR5fra9WN5nwJ3Iuf2nEhM7RG7jNzdVaEmS/1uLVpwatOUpWt4bLw==
X-Received: by 2002:adf:eace:0:b0:21d:6e90:2bf8 with SMTP id
 o14-20020adfeace000000b0021d6e902bf8mr15936320wrn.349.1657986787545;
        Sat, 16 Jul 2022 08:53:07 -0700 (PDT)
Received: from Asus.numericable.fr (174.18.86.79.rev.sfr.net. [79.86.18.174])
        by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b0039c4ba160absm20866335wms.2.2022.07.16.08.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:53:07 -0700 (PDT)
From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
X-Google-Original-From: LUIS ENRIQUEZ <luis.enriquez@se.com>
To: openembedded-core@lists.openembedded.org
Cc: LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: [PATCH] kernel-fitimage.bbclass: add padding algorithm property in
 config nodes
Date: Sat, 16 Jul 2022 17:52:22 +0200
Message-Id: <20220716155221.15968-1-luis.enriquez@se.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Jul 2022 15:53:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168143

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
From: LUIS ENRIQUEZ <luis.enriquez@se.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 meta/classes/uboot-sign.bbclass      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2112ae4cfa..753164551c 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -346,6 +346,7 @@ fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
 	conf_sign_algo="${FIT_SIGN_ALG}"
+	conf_padding_algo="${FIT_PAD_ALG}"
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -465,6 +466,7 @@ EOF
                         signature-1 {
                                 algo = "$conf_csum,$conf_sign_algo";
                                 key-name-hint = "$conf_sign_keyname";
+                                padding = "$conf_padding_algo";
                                 $sign_line
                         };
 EOF
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 31ffe1f472..eecdec9160 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -73,6 +73,9 @@ UBOOT_FIT_HASH_ALG ?= "sha256"
 FIT_SIGN_ALG ?= "rsa2048"
 UBOOT_FIT_SIGN_ALG ?= "rsa2048"
 
+# Kernel / U-Boot fitImage Padding Algo
+FIT_PAD_ALG ?= "pkcs-1.5"
+
 # Generate keys for signing Kernel / U-Boot fitImage
 FIT_GENERATE_KEYS ?= "0"
 UBOOT_FIT_GENERATE_KEYS ?= "0"
-- 
2.34.1


