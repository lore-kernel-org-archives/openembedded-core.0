Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57838C531DD
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 18:04:38 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.29116.1723399470014761644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 11:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U03pvdQM;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b79c969329so20465446d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 11:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723399469; x=1724004269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxRnCdp/BgJC2G71mG61zkbmwgkSxBplsmVvkAxZkik=;
        b=U03pvdQMMPFS3i6Pb2bd60TZdxd4VRtNLRbUQPqgRS9p3TxGUsGsLXM+z+e/LqxM6y
         kVOx2LhM/3+oeWunjn5FGAaXOkQn1Fodrz8sIMaxjDI2QHIVRwlV7QQDShBCu+trEabI
         hErQH19/dVdACNjq/Ua6gA4Szkpo7UFOLKeTcPTVdOKNMGdCEmERIJ1WeqyRr50VZw/V
         n1ORi8qumbbdphI/OTNOiYTyAyB67Ak5HJaBVsaqruOpbCnQhO8mvLO/DWXBbbPb9+MM
         smsWP3ZwU90XTWyhr7ppr+YPaNm2RURPDWCppMdWiZN8N/7/LICA1MI5kDYNA4X+eouV
         oOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723399469; x=1724004269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxRnCdp/BgJC2G71mG61zkbmwgkSxBplsmVvkAxZkik=;
        b=bo+4klBRcTtum/Fs6D2d+TdnYt74giw/s7O6Yd58g/SxkOKVx8ybzCrgjFpUpActD1
         04JX2Eetp9zbFTqz/ZvhQ12XxG6xWblLHXLd/LQkFUZBURLYvVGw1JrqAzpF1QNa4GAJ
         19f3TeZWU6A0j8UuvzBJ0vxGGSBu+B2aqsbI0bUWUAPGMMLEuXNHxAtS9Fo0qTbzRS2I
         CJnBtU0Q52NLZGB0rWYRx9U8RoBYw+OdgkeLZLRRalEg71AojUZfALJuf8/dupK9WPNt
         E8isapijGB3Aq9gskavkeRXp35Egc/T266cScJhoM/6tr1aq314EE+6jpdDEbMMcUNFS
         HKYA==
X-Gm-Message-State: AOJu0YyvOFL3VDlJ8q1OTq2/CHxtrN+ry59Vdcdcmj73XWuJNQvxvOZz
	Rk0aRpwgYN8MPGJle8eERQtszV+Xj+RSorUIi3uda2B0PLzkwLIOjRR+30JT
X-Google-Smtp-Source: AGHT+IH86op7xAlI4mnSK8TPRyAJTANwJv4jx9/4WFrN6IXmxqGlAcsYOTnu4TqTKVI4Bu9IVRd/bQ==
X-Received: by 2002:a05:6214:43c1:b0:6b2:c034:6aa3 with SMTP id 6a1803df08f44-6bd78e4fd59mr95640296d6.35.1723399468897;
        Sun, 11 Aug 2024 11:04:28 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf42f4276esm1383996d6.66.2024.08.11.11.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:04:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/6.10: cfg: disable nfsd legacy client tracking
Date: Sun, 11 Aug 2024 14:04:21 -0400
Message-Id: <d63d5cfee36b7a1904ed21dd51012f7668a9e7b2.1723399246.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723399246.git.bruce.ashfield@gmail.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 18:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203189

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: nfsd: disable legacy client tracking
    Date: Thu, 8 Aug 2024 23:18:19 -0400

    On v6.10.3+ this option can cause kernel traps. It is for
    functionality that we don't need, so disabling it is the
    best solution.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index cd862b8fdf..0c0620469e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c0094e55e84db839eb3624a2f99d826dd3cbb3e3"
-SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
+SRCREV_meta ?= "5161bedbdc3ff6f22a75fb5afb96a4077f4b4ab0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 2416382020..deb19c3dc8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
+SRCREV_meta ?= "5161bedbdc3ff6f22a75fb5afb96a4077f4b4ab0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 876f504e14..c0b1b0b6cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
 SRCREV_machine:qemux86-64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
 SRCREV_machine:qemumips64 ?= "c1f8e21e4999d233df12ee60c7a47cad144e7344"
 SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
+SRCREV_meta ?= "5161bedbdc3ff6f22a75fb5afb96a4077f4b4ab0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


