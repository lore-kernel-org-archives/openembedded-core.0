Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.8329.1621599143654019723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 05:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e9OIehcg;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id x19so29386439lfa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bP6zHDLhN8phSqG8qphlj2pEOscFNLjTf9QMK8BnKww=;
        b=e9OIehcgnEJugXcidCfz8S1ZhwiUhkqKoaWbnxEbm2vav3iOsvYPmnB4k2vjfha3H1
         107H0Z8DTn8KWRsfXBCpZxamaSs7ohQgk0SeQL70NhhZOl0x5rtME7s3EqIqZqShNyoR
         RNNa7XGmb/QslAg1V/6whNHC66v5IoMoUOWyT2u3gKWONPEO5odOfu36AQyNIRToCAdt
         2tTuNXM7JNLeGcdsk5r82cx2KI1gBHFvLeXjobtx4Up1sU4gE3hoqVAizhuOvlOLjnpp
         SHOBPjV14S6pDwEZ7JYbKSihTrSffxfD4nNh1nT9j2W1uB3SNvtusjSdw7Hjq8Oo6w47
         lsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bP6zHDLhN8phSqG8qphlj2pEOscFNLjTf9QMK8BnKww=;
        b=bYT9WT4IvKgdqd/jSLTKIg1bmi0JF2ynxwtZSwBbSB2UT6DRPevWBrnH0HWPdW5THO
         4TMKB5aFRrmzDYX4OTg8/X5ry6SGxRrp/7nSEw1zrLB9UtU1pZj5tjiwRy410NBCyfUo
         BG+WeaCkrqseim7Uweh5eyDkQ7C980OOMFE/vjAQwYuio3qeUeIb21KgLtDGeRZlG48I
         7RdqoWkt5cidHDTx+PBkoSTI6rUeP/kXTgglMSK58GcV+acZCEscyWM4jJHAPFfWumZ2
         3ZyioPm4DsftA8gyUacP4XJHMUqabmFQhVLHXz4tVFoxDXq9hmcGGeJVXSh8EN4d662T
         mpsQ==
X-Gm-Message-State: AOAM5321zQBYQyZFW+hsfm/LVgwH4t08Rr0cFqhx6Tk39dO7/QxP9elz
	31Nmb/Nm553WrT7lgZndAho6390+doI=
X-Google-Smtp-Source: ABdhPJy1uKNkOzWqFrBo6Rt0DHEYI0quD5oktFKNB4lyZt7MPb57OcZ+38T5HN3A/MiBwNodSTnSjQ==
X-Received: by 2002:a05:6512:3684:: with SMTP id d4mr2014109lfs.90.1621599141762;
        Fri, 21 May 2021 05:12:21 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m90-129-203-26.cust.tele2.se. [90.129.203.26])
        by smtp.gmail.com with ESMTPSA id d16sm605013lfm.202.2021.05.21.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:12:21 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 1/1] kernel-fitimage.bbclass: fix a wrong conditional check
Date: Fri, 21 May 2021 14:12:14 +0200
Message-Id: <20210521121214.195955-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210521121214.195955-1-liu.ming50@gmail.com>
References: <20210521121214.195955-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

It should check if "${UBOOT_SIGN_ENABLE}" equals to "1" instead of
checking if "${UBOOT_SIGN_ENABLE}" is not empty since it could be "0".

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5cfd8af99d..993e159c75 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -331,7 +331,7 @@ fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
 	conf_sign_algo="${FIT_SIGN_ALG}"
-	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
 
-- 
2.29.0

