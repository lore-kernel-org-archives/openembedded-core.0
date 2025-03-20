Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB087C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:28 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.7690.1742478022053153848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i6vWmLya;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476f4e9cf92so5839021cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478021; x=1743082821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VClT+rnCYAAISxyQXdaF3+QUODuL/sQGzM9sLW5UClc=;
        b=i6vWmLyagOht794Oi+WKT/fmVE3RaSZqAPy6VUvXXjPCWRkuK4iaO5NG/jQjb0zXP7
         boIgL1CIDMWJ8nI6d7hmx+0yKnfdSwUehmycEmW7zNQVTmEvHRVUGNFxi+aBsGC2V46+
         sN08L/ffOW4kmw36WDH5eHDE/eRRLk6Bx5KygGGnxhcQr1P/bUlwWARL2nRcSfrE92bX
         peOhTXZMC4jwcKPZL6LmLU4770/F/JF9ec+Td+Wsy7QJdQG8NLly4ads3P04EEhYiBpv
         eV8a1RJQstbDBONMEvG29ulYhq6j8A0euqEM74mSqBSNe0/Le0fpohXesUwAKkRwJXFa
         YTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478021; x=1743082821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VClT+rnCYAAISxyQXdaF3+QUODuL/sQGzM9sLW5UClc=;
        b=DqdOVMsYX9GzURwSC7OgEXtgEOWIg4E4YrB8Hy7/NLfxkmmCaG5yYjsVvS+z2T3DDz
         278OebNpY2X/nyWN/d93vdxx33QKfoLU6z87QNldqFpX6xAcYtreUYKduf96UlZUgYos
         z94ZmhjgCm8Qxlz8v9E6xbTUPJezyGD8xrnuPMhYwokJx47dOA3JsKRVY1kR3nC6yqzW
         bZmvPFSfdj9N9925iQdk7jbXM4FXfoCBCVYxop+RfrHPIICez2ki7g0REPj7lFy927zd
         LT/bJolVAmxx+K9UPY7Wp8BFBRSUIscwzEWDZPOAZ13tDt7nS/kqJeYFkslY07ITCgOF
         +aKQ==
X-Gm-Message-State: AOJu0YzLu7FYhepttIY/MnOSIAluIGTPXssd/i30u758NbxzKBBK7jXP
	DmoJn4Pj5NE8VPLQW+fDk0db3u7BICAT701XUPBHRGlmFm0cLxu69+LPoCDNlr0=
X-Gm-Gg: ASbGncvkPRBTBbvAajKiVPpKoz25Vm18WaQIvojo7H38rvfLTCyb3zy4mx/s1fzolIo
	66e4VDzPPfxQQ5P7xZNfOujdB8MMRXZkBBtgc5bQmZzjXT1NesWu4eVy9AFd/um2vrjBNWRmqOQ
	hud5iSxy5l9525u36T5cKXeCKiL6bochn/eAT2BTXva1fQ1ZgoQBrra13aHdRTmbFi8BHiqEWna
	QSvUM2L1jrT36jbVDzIJh77wt6fNWgbVJY+15gcWfTraTiTHLuo+7GEbjhoKEhYacg+t767otYv
	qvILikJeU1EfjvjRU4KYOjeSSGSjR8Hs516/ZDCaLuoOyIsigIIaF47K2qqiqkefdKVZ4Zmtj5g
	Y+wqWpKnO90vYX01q3N+LWiRh3OgsEfxCK3tPBufIQnGqSHzIX/m/Ur31
X-Google-Smtp-Source: AGHT+IFCuCqrqmBDiVb46NLP/yNo6QlojdbW24cm8bg0fdb1me2e4qcHO++WtCfp9VvSj5EwmZhWVw==
X-Received: by 2002:ad4:5c45:0:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6eb352c4e43mr53222436d6.21.1742478020856;
        Thu, 20 Mar 2025 06:40:20 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/6.12: yaffs2: fix module build
Date: Thu, 20 Mar 2025 09:40:11 -0400
Message-Id: <b10af3bd033847a825b2dd3a6208477dbed0b4d3.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1742477836.git.bruce.ashfield@gmail.com>
References: <cover.1742477836.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213396

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: yaffs2: switch from readlink_copy() to vfs_readlink()
    Date: Fri, 14 Mar 2025 10:33:42 +0200

    To compile also as module. Fixes:

    ERROR: modpost: "readlink_copy" [fs/yaffs2/yaffs.ko] undefined!

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index dd11a8836d..e0bf187823 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e9449f7fd2025227dbae7f3c254c1c22c086f856"
-SRCREV_meta ?= "44bd5711078ef3bf89012274afa8df13aaaebbfc"
+SRCREV_machine ?= "9f69ed0ac5f665d431fe52bacdda72534172712b"
+SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 314bba5fb3..c96874480b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_meta ?= "44bd5711078ef3bf89012274afa8df13aaaebbfc"
+SRCREV_machine ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index d1a6b84321..2a8cb964d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e8404cbe72cb5bf44d8a89130f388357c71a73ad"
-SRCREV_machine:qemuarm64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemuloongarch64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemumips ?= "2afe846961bd3c8a12b803e9aebfd291d4257dfd"
-SRCREV_machine:qemuppc ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemuriscv64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemuriscv32 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemux86 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemux86-64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_machine:qemumips64 ?= "1d91393bd4ca94c2689da237efc60b15b241be4d"
-SRCREV_machine ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
-SRCREV_meta ?= "44bd5711078ef3bf89012274afa8df13aaaebbfc"
+SRCREV_machine:qemuarm ?= "f7235e5c375b9ba3d49902dd36d4b66eefc19979"
+SRCREV_machine:qemuarm64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemuloongarch64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemumips ?= "c102fc13802679cf23f6a41f9ea54294294f7a93"
+SRCREV_machine:qemuppc ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemuriscv64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemuriscv32 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemux86 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemux86-64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemumips64 ?= "ee2d5ef2e92ca23c5b345ac50bab130c6a9ad0fc"
+SRCREV_machine ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


