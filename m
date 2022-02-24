Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B351DC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:43:21 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.8373.1645695800270748399
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PDaBPJ0D;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id j7so2828156lfu.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yyiwdfUBOnpk5/2zHIxwIOBp1+AEKnBUauDfqaikR4g=;
        b=PDaBPJ0DHxJrCLuS8fl+EU4hsZwZl+cmE18aqfhiNHlDppTJycVSXwCeE3bERpNTZX
         /1cqEA707th7NGzsL519wz/IFtJKwS88XfRczU02+k5yk9wcoLdcOMgY/IMgbNLR2qly
         ECOEIudywwGsFquI2SDmCKmLeltmINtAMGNX1bms8j6UmqnK0bgudgRIxRNwNw34oyKS
         QMhrH9OW0dLGnoeQt6huBEBgnddlNPiG8Qr0ectgSVwvYjgHy0WpMs8rvPBseLSDWM3y
         aTdAw8l6wFpu7ZpGnLO2PhcONhddEFcqyI2FwcSk0YWLAibNPDLPyxFrZkltSYRVapS5
         4I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yyiwdfUBOnpk5/2zHIxwIOBp1+AEKnBUauDfqaikR4g=;
        b=T4qtlIodMd6oADWXxoi+tpo/7CMds6LuhJd9m9woxUFs/s8AxBKDD2zcTTbfRRYx6D
         NXgBg1gw5F6NxJxqrdzkjbxhPhmergo34PYG5HLj6+CU4//K4U+5lmaTkNKf251eXkGE
         50BmzQV67bNWbW7yvxvcNe6gaHOdVdjKvaDRJJ4PTVWqLAwZ7qcwc5tdCbqCL7ofHbot
         YPHEB1xLWKp6PHBaCC2xycTp7I0oO6sCrApH2PjqtoSHuz0nfDtcHH/TqNDPjcDKAnZl
         scuXSVDNUwo1E4XNBB/FB50EPg/kUFSBvUtYOvG61WAG224xo1Er5SX2jiIO8L78R5Gf
         2Elg==
X-Gm-Message-State: AOAM533ux+owZLHC+cP976LUHgfXfdkNAC7b9un3tUpTVYpoT20hS6vt
	D/658+/6ytx2mVLJh+jLTZljiUGpnH78NA==
X-Google-Smtp-Source: 
 ABdhPJynUFyvIwydN/KOOhZmq+eZphjyV3Wqj5H3LDzrWwiM4PHIKMKKccAEOLgJBi7CECtpF2VLEg==
X-Received: by 2002:ac2:442b:0:b0:443:5ff9:e5ac with SMTP id
 w11-20020ac2442b000000b004435ff9e5acmr1274770lfl.43.1645695797945;
        Thu, 24 Feb 2022 01:43:17 -0800 (PST)
Received: from peterliu-Precision-7530.lan
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 z5sm163892lfd.244.2022.02.24.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:43:17 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 1/1] depmodwrapper-cross: add config directory
 option
Date: Thu, 24 Feb 2022 10:43:08 +0100
Message-Id: <20220224094308.58744-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224094308.58744-1-liu.ming50@gmail.com>
References: <20220224094308.58744-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 09:43:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162307

From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Native depmod by default try to find config files from the following
directories:
```
${STAGING_ETCDIR_NATIVE}/depmod.d
/run/depmod.d
/usr/local/lib/depmod.d
/lib/depmod.d
```

but none of them is correct, change to load config files from
${sysconfdir}/depmod.d of basedir.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 9a172675af..04fc14a6d2 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -32,9 +32,9 @@ fi
 
 if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
     echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
-    exec env depmod "\$1" "\$2" "\$3" "\$4"
+    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.25.1


