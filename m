Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.5704.1591340949604284279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 00:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: miraclelinux.com, ip: 209.85.210.194, mailfrom: daisuke.yamane@miraclelinux.com)
Received: by mail-pf1-f194.google.com with SMTP id b201so4520446pfb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 00:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=D2FaUwJsRxMx9X54mkSyT9ir1OBUQwoWT1Q3GQ3TtCU=;
        b=HVfq6NkhJkDy5P56xJBtX08VSpc7xS0Ih9kFu2r7FU+T0pGcKT3wbY3Scw16HShtqX
         svTy+MZpe8t5bSxecPG7tcWxuclQD3NjHviv1ODOJSzmpxOAZtQwtbPFFeUvUc3OLAvg
         9/kCb5/2md3uMGs8ONu0cFWnGNPAr/PhuViEQMgOnlFDJ+mcsa94iDzEQnxQBQqkzTQA
         IEbCMpd+R1KdtjnJ35bakPcbLPStRiDz0ysj2o5zB8oTHV5HRqZm4AW5bXgndkn6flkA
         GlwhKO66mSbKUjv64dAMF8nBFCNywWSsAhuRpAzaPAX+CY6fT3IZi7uGNK6e3b8/26ij
         CeFQ==
X-Gm-Message-State: AOAM532PI4RKp5tKwc9gyulDDFBpRZJ54qh1rNnJkfpoM4iLYWPlMvNH
	N+U03BdZMGUoGLZIZxM1VCF4xn4kgEo=
X-Google-Smtp-Source: ABdhPJxwzd8Lli3ZHsYoQPv/Jr8kIWmxgkpmXUGD99I9RptHuzTobIqWo8riaZqZ89apg34qbO60CQ==
X-Received: by 2002:a63:b957:: with SMTP id v23mr8483170pgo.262.1591340948642;
        Fri, 05 Jun 2020 00:09:08 -0700 (PDT)
Return-Path: <daisuke.yamane@miraclelinux.com>
Received: from AIBox-1804.lxd (219x123x27x194.ap219.ftth.ucom.ne.jp. [219.123.27.194])
        by smtp.googlemail.com with ESMTPSA id dw3sm4347031pjb.3.2020.06.05.00.09.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 00:09:08 -0700 (PDT)
From: "daisuke.yamane@cybertrust.co.jp" <daisuke.yamane@cybertrust.co.jp>
To: openembedded-core@lists.openembedded.org
Subject: [warrior][PATCH] kernel-fitimage: introduce FIT_HASH_ALG
Date: Fri,  5 Jun 2020 07:08:37 +0000
Message-Id: <20200605070838.6352-1-daisuke.yamane@cybertrust.co.jp>
X-Mailer: git-send-email 2.17.1

From: Ayoub Zaki <ayoub.zaki@embexus.com>

sanitize fitImage hash algorithm selection with FIT_HASH_ALG
switch default hash algorithm from sha1 to sha256

(From OE-Core rev: 8c9d5d59cb1575fac17c461090937df4cbb3d3b5)

Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9e224daf05..b51882dce4 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -50,6 +50,9 @@ python __anonymous () {
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
 
+# fitImage Hash Algo
+FIT_HASH_ALG ?= "sha256"
+
 #
 # Emit the fitImage ITS header
 #
@@ -109,7 +112,7 @@ EOF
 # $4 ... Compression type
 fitimage_emit_section_kernel() {
 
-	kernel_csum="sha1"
+	kernel_csum="${FIT_HASH_ALG}"
 
 	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -142,7 +145,7 @@ EOF
 # $3 ... Path to DTB image
 fitimage_emit_section_dtb() {
 
-	dtb_csum="sha1"
+	dtb_csum="${FIT_HASH_ALG}"
 
 	dtb_loadline=""
 	dtb_ext=${DTB##*.}
@@ -176,7 +179,7 @@ EOF
 # $3 ... Path to setup image
 fitimage_emit_section_setup() {
 
-	setup_csum="sha1"
+	setup_csum="${FIT_HASH_ALG}"
 
 	cat << EOF >> ${1}
                 setup@${2} {
@@ -203,7 +206,7 @@ EOF
 # $3 ... Path to ramdisk image
 fitimage_emit_section_ramdisk() {
 
-	ramdisk_csum="sha1"
+	ramdisk_csum="${FIT_HASH_ALG}"
 	ramdisk_ctype="none"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
@@ -261,7 +264,7 @@ EOF
 # $6 ... default flag
 fitimage_emit_section_config() {
 
-	conf_csum="sha1"
+	conf_csum="${FIT_HASH_ALG}"
 	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
-- 
2.17.1

