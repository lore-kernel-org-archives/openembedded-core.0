Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web09.3805.1620124679104884906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 03:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S+Urk6YG;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id v5so1718588ljg.12
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bP6zHDLhN8phSqG8qphlj2pEOscFNLjTf9QMK8BnKww=;
        b=S+Urk6YG7wN0ZFHQ4ldSMNcWuh3JK+SjdfGokSb3M9W6GmIK33Ybz4JLXW6GSaUVmG
         8tt1MqZ26UYWGCvMHSv4NDaOYW8eLPMJUC9wK+6pT96KCuJsud5Jb6oFa6hMbNTl7L8U
         NXv217SDfHiXRRAG9R0i7F8se/fFwwVlQ32GbuEhuANJzslGPMUWqPyYtDN3KVxMKMFw
         gmMZJnTbMks6HIcCXRwsupwlabkYPtPb2+BYW0V5LtI3k0tZdzwXjEfhFEZzcpJb5lhM
         QzoLPQDA2DYfjp5Wco/i3x8gd9l8cXRYKSpzo7dmz9OQlYZ9O9CxUiV/HTd4JeJnHc86
         7SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bP6zHDLhN8phSqG8qphlj2pEOscFNLjTf9QMK8BnKww=;
        b=CIvicbhnnhY+KL2gn+JwVFIBpiQ3tyi1QuOZScxdo0/tw0f6vTAigeQMC8zpXd+qMJ
         TcfS2901puFYzOJEAcYu9vusKMeoAlnZ891YQdpFHv5/+AyETRbvhnaQ281Q06+yfyRm
         m2I/NLIqMgO2dKtHv4e8Bc6bzMF6kxix1WvPhqRE0Dv+fLzUW/5DljNo7RPK9m3QRsLQ
         0a/hpqE8vcPPJ4XtrFltLwSZj0k/hPucHB9PtLh3QnjU8reElY/aHKdR1sIov9iYpT+g
         BvTWDKj8ajrFiAsNdt68vJcCEuWy45WkDSaAdChmJy3xdhroxOlc5NO6FRhDQFOvYUjv
         7X4Q==
X-Gm-Message-State: AOAM530TwZHA+4AM6EgdAJT13cuwvHuE7zAZWoCHLhW4taiQWgbbGeL0
	jaFLRVI1FZTU4mivcKw0uxdHdH6nxYA=
X-Google-Smtp-Source: ABdhPJwNFFXNRy8lj4n9CLsAeXxbCm4owqwdmzZUbC2TDNIhMS983Ow1rjGdVfbsump4JgCk8R1FyA==
X-Received: by 2002:a05:651c:1031:: with SMTP id w17mr8424265ljm.195.1620124677084;
        Tue, 04 May 2021 03:37:57 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-39-71.cust.tele2.se. [83.185.39.71])
        by smtp.gmail.com with ESMTPSA id m17sm230639lfh.146.2021.05.04.03.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 03:37:56 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] kernel-fitimage.bbclass: fix a wrong conditional check
Date: Tue,  4 May 2021 12:37:51 +0200
Message-Id: <20210504103751.340800-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
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

