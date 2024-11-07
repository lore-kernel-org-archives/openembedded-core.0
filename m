Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9A8D5AE4D
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:41 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.63356.1730946576278521341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKP+bxPv;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cbf0769512so2941586d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946575; x=1731551375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Frv5wV4FtUz+J4Oq474WY21/TLl+6/haJ1y5AHrI9So=;
        b=eKP+bxPvbmeIteax5KAxhDxm45fAlF2moqlz0MI5ILlj/RcY/BiIJ9JOwGeNmj+Pdg
         Z6Qj97XEU4AwrF/QlNwGXF3lWluExEA5SsRM41vWU1zcKEClvRFkQTxZaXMpa7oFDLvf
         2mRhv5rlPhd8dXUxGVmbcK0RJ7X+XrhRAED+wYWFCF3Xhnfe5Kt1TxT8vkY1rw4Od7hE
         iUbLZqMFcnTz+TPpPlhlq76xb/16WTjtm2iJaohMb2S1e1UajpkLivyPzmWrJ1EleoQj
         7zvvCMInOGyt666xNYpnacHys/y3HCFU9/FNa8IQVVw/MumC7OcLPqifDnXC/SJTJO1y
         Orug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946575; x=1731551375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Frv5wV4FtUz+J4Oq474WY21/TLl+6/haJ1y5AHrI9So=;
        b=MOAm2Rt0+ZRBXhZ72pMkzAZzakDgkIiCq7QDoXhmo0m6WkWy/WwNGazos+DsRk4xMk
         7sRwTFhs8tr4bSXNZ8w54a4tlIH8Q2/JZpaAPq9C1bKrYDSXckCpjdcLk5scbtNZgDyb
         9ACdxQ0C65SabBIV2RP6pHale51SChcVFN42zy9PwKLI+fOSrYIboI1OpxK3se9ewoE8
         5tg2MuCnXvZ+16R5iPX58adegwnTGyGIJHOiKzve2hyUzg5hxxrdghIYG1xHFJrQ4/Ip
         61JPoPRgqZjuf1bf0salhUuJhF9oY1BAuHwxjoKlNX3mHYKxzxFNuZDWw2ZxpyUfiKTk
         02Fg==
X-Gm-Message-State: AOJu0YwmdA4f18PiIW0P6aPkOaKhjm2CpzEnqhzsRG8Qj9sccQivGQ5l
	UDeqyvJN9+qnXBICxUE8OOs6GUAjbHFmP1cTdP7c2nFUnFVKDwtwxqNb9Rzd
X-Google-Smtp-Source: AGHT+IFsG1w5FLefXHT5FMp0ylsFkcn+L0eV5Bna0iEQ3/HYE6MdVynObjA2IxDEdvEJ1HHH/8X3WQ==
X-Received: by 2002:a05:6214:5681:b0:6ce:23fb:ee5b with SMTP id 6a1803df08f44-6d396c91fd4mr7377826d6.30.1730946575235;
        Wed, 06 Nov 2024 18:29:35 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:34 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] linux-yocto/6.10: genericarm64.cfg: enable CONFIG_DMA_CMA
Date: Wed,  6 Nov 2024 21:29:15 -0500
Message-Id: <753546899b29083591647063ccdfa0031a0065a2.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206814

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable CONFIG_DMA_CMA
    Date: Thu, 24 Oct 2024 08:49:29 +0300

    It's needed for graphics on AMD KV260.

    Cc: Bill Mills <bill.mills@linaro.org>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index a1096f6a04..8f87a096ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
+SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 50a461149d..abfee6953d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
+SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 81898a4328..9b2334afd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
+SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


