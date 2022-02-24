Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E511C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:08:25 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.8169.1645693703937387691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EbX3uFYE;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id u20so2729856lff.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCxUbIhjPE+meoHpjNiT9iPQ3VG0FcgB0gPURkRBpVw=;
        b=EbX3uFYEY8N4yOoLWLHTLdID5xeJJAe66wUXyyBvGbLpEtI3QU99Nvv2P3xXSHK7ej
         UQ9B4VnxkdbpZrad6sxUP1MwjIR41OiCVfYXOEQkwxzwfts0MmfMSQuH2GTuK6jd4vRg
         RXobO2NPdxQ9WBIEGguimItkOTlFNqC10RytxuSQL6f54SJWdHhzGKAvKJpDrTjefNDL
         eIT2SZJlCHtQlI8fAsxpjSHDoWAH9SesUoCd1EcovIP53OTJcG37OAbO+iLG8SnI5jwY
         KiQk2uiGKw6RkCNw+uGSopMvywX4TxUVLqU1P7K4y9SgeN6RNy7F8hpzKGLe/ufIqjkQ
         7B2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCxUbIhjPE+meoHpjNiT9iPQ3VG0FcgB0gPURkRBpVw=;
        b=13TTOjj7c2ejo5KCVmnKucmmixJwcgYtvYTPMPwDlagc/jNBhUPQ6LlwBFhl5zmd6n
         Dj13u+oXgIvLi6QY4H+TfBacMvk59kJscCrbYDVxGo/1/o6OmEt2Ljdhkb0CiT2JeMTr
         iTy7v+RpwKnWDWwMfNabMocjRjo7V2d0ulwQpeK6HwBrCrWpn4B2w5m6dlQ+msKPO/Sq
         QDfDk6wRBOSRycy3KdgD3eFNh4Pd+ZPg3FoVNWPzMNBvUy+LsX3zwlkgmYodnKiusFT8
         0q4wgEnyArbg+nCMvfgc58TaNNow4LIzIK8TBLNt6drARQwixZNle3kGU4skxrGYpttc
         4cwg==
X-Gm-Message-State: AOAM532mOtpmpw08P2h3sR0zkfI8Y3kQtDOUrQXCaJimeMliPqzplPwK
	Qchf6zbsaRSd6dG+2e8mrmCkEys5FDqRug==
X-Google-Smtp-Source: 
 ABdhPJyydtzEpLjIauCfEnZAIIlmVr2tt4LqNpF2M4btPHeYyJc9KlKTQFTKiF1n/cI9gINQS3ODHw==
X-Received: by 2002:a05:6512:128f:b0:43b:fd1a:3db with SMTP id
 u15-20020a056512128f00b0043bfd1a03dbmr1212949lfs.405.1645693701896;
        Thu, 24 Feb 2022 01:08:21 -0800 (PST)
Received: from peterliu-Precision-7530.lan
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 k19sm272486lji.140.2022.02.24.01.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:08:21 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core]] depmodwrapper-cross: add config directory option
Date: Thu, 24 Feb 2022 10:08:17 +0100
Message-Id: <20220224090817.19935-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 09:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162305

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
index 9a172675af..14fb8ff612 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -32,9 +32,9 @@ fi
 
 if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
     echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
-    exec env depmod "\$1" "\$2" "\$3" "\$4"
+    exec env depmod -C "\$3/etc/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\$3/etc/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.25.1


