Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8CFC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:17 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.10479.1651153690328897548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IV8ac01b;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id kj18so3222596qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Dq7xqnT4todeYMcnikEyApKZOMbUAFfDCzeEPsFYeg=;
        b=IV8ac01bXT/CJ58KYhjz7PO3zbtQAwgGOFV2xdW+Ui0RTBvFGMOCfTfOjpQfmuNtGz
         gtUHU/awbr5lvKclvlL85QbUobjRmsNtQ0+12qcX0yGNS1In0MbIRlJRFRz8j7wLCE9N
         DhV2zIjKkrp2lCJ0w/D3X4CFNjZjqJGLs0iENzq1MlzIDBt5tRZy5uimc8Bo0ZDANjPU
         fjA5DCK5gzil9bHl5ASLnDKZpHYhWqPtTlaMy6ap/QBjBn7BvM6glPDtaWhpw+Hsg7LD
         tLZQhmfKlvI79Jqau1XXCY2gVN0sVEUX21g1NrkGqWn8p3JobX61sCnKyfyn867Yac+r
         22Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Dq7xqnT4todeYMcnikEyApKZOMbUAFfDCzeEPsFYeg=;
        b=kCkOlIA1Vh7z61X+tj0u6HmF2lU58wfbEVWyTqmWsQiJp3VLqhiaOas7Y3iPaoUhlV
         +BnTh3qjw9zkgdAugaaXdfT70vIk2VybsLZ/sViD9SqwYjVel4XN75fZ3NfniW7GL71H
         gSIa8oq9JE//IMIA+tpOK5X9qYYBNMxvPBRHXvtQHf1P4KQIY/TcvFySuwOsm02FXyA7
         cz0e8J2URG9pSpi8RZ3vSFmiglDOoMP6Lk9aojCV8IrzyHjj8oDTruojS0rhwYf+Op/0
         UDyLuQA31Pooqc9AMwUkt1qej1UequzcQowazAex+KyH6c1RC4UoQzmrT+s0Fx8x2TmT
         uxHQ==
X-Gm-Message-State: AOAM53273mh5+Ds7c0GlVhr3xyAICEyM1PKj/gsYnK9Kg+4b6RdNppyd
	X2UauV4Uj07NZIe/19Ke7vT4Ri2xu7v+vQ==
X-Google-Smtp-Source: 
 ABdhPJw73nxMLDPd5FRb7ZcGw7IBiRvtUKS0THMuVkVcNFFONFl08m/COC9aA9O4kmSNayQUMjXo4Q==
X-Received: by 2002:ad4:5c8a:0:b0:456:397f:7904 with SMTP id
 o10-20020ad45c8a000000b00456397f7904mr14255157qvh.87.1651153689386;
        Thu, 28 Apr 2022 06:48:09 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 04/15] linux-yocto/5.10: base: enable kernel crypto userspace
 API
Date: Thu, 28 Apr 2022 09:47:50 -0400
Message-Id: 
 <01ffe3bc1ece6733c52f9c3495bbddcbe3bee4be.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164952

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    bddb0e4921f base.cfg: enable kernel crypto userspace API

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b8a280a615..9731a738b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c11f8738640c3c52f4ffc2adf9aa8f6c097e4a4e"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bafa486d23..f75c0d70d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "3851408a9f5d9d4531f29340056a1089debd5b58"
 SRCREV_machine ?= "0a47fd76cb0f7e22d47afcb88bf884c750ba5d92"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a0b7bbe48a..127763e972 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemux86-64 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemumips64 ?= "36a2d17167ee66a2feda5fb1efee0a2ee2dc4740"
 SRCREV_machine ?= "a275cd6839513c72ceae989a575b6accbb262016"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.19.1


