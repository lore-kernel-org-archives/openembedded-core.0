Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3E4E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 17:50:02 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.25800.1734025793623304950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 09:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+7SRi0R;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6e8814842so80789085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734025793; x=1734630593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px9ZZHu1gcl4pEIAnzHpW2SEauo71Rp4nourHt+X5eo=;
        b=R+7SRi0R41AjbGeZ0ZqpxEK+N2qEdP84JdpTd3/sroZXhyn5soFYqPZ/XMSqtMlCN2
         BKvDxQFl56LUVZjZSq/rIqFLw3075PIIkwKfqQk4a1aeV+zfAJjgSMAAbv2g6eLQdaBH
         Nrvx2fcT17yhBs1NIRi6fOOLjy4HVQaPc79tT3i5twgJ4B/MXGLLtOO9GmIFwmYy86jh
         JmMRn2PgUqVQkdZ5nkoN9U1RcwBquXRvW5ylAfqVmx+oNziAQ7sg5/IqbiVxBabCQXSv
         cTMCC7Gq010JpAon9vd0th7bsL9omUuDAi4N/AM4HcJhvyCVg5PwzuN5hCc2RVvdbOQN
         FDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025793; x=1734630593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px9ZZHu1gcl4pEIAnzHpW2SEauo71Rp4nourHt+X5eo=;
        b=SBK1yth8y+lvZnAX6WbznAkN0uEYtsRQH+R0R6zZfKMsGsXnvQjWgy6eynTr1vPVcn
         qdf9LZaPG7dWPazxcx2YIWL3FXgAAcGDve6U4AEx+5bQmT1VeOu1lULuhVsNwjNCzR7w
         xPNvy6qYheEDluOCtPsJmw9uDox7lVWcU5OB31+YLQM0HBHbFujYp9SBbNtd4trdPl1o
         CmDAsU/GtQ8FJ1cwK5GT0FzAvU632z4JboQpJI0JitbCK8QP+rYnRtU2zVXfojlgmwtj
         zxskn/Q1ZWvx+ujYQjbrNPCDf3nN8igf/OREE0YBvEpw/xrsvkT+YW0xtDfovu27Ay8J
         YRpg==
X-Gm-Message-State: AOJu0YwDHUkI6bOnMsLvQsvzdDxlTG9U1fUPDU7riYYAc6fbi4dl2tU9
	BtG9VRUd0yBc/7MJp2fO8L05sOVPMIhqeZWvL0MuV9It3//QNWQo1aszb9x+
X-Gm-Gg: ASbGncs4FPD3KTcfvNHIpVM63ra+AgtZxKzvd6L0t/9r2+OsCxhElADymZ2CAop6s9I
	k9k2A1oYqc2rGkPKync0EVW0mUIBWt0WkqwhuN/kZul4RPMMH4XV6tmcQvaYgTtczVyTiiUoLT9
	YSLbpna/wKW/XHUqNnXoTzoX4undton7Ep/DKaPfNciHvda7ThTtQS5DuZeu3NQLGVD1oyGbSfu
	8fdxcQd4TDEqu9gSr75ZOEspREBfV9txAPajEsEdGNVol8R8XLWl6ZTNBQw1EFUZ6tM/upcH9aL
	Bj8OOQQVpd3N8GteFDeCFzSUg8mlElwQEfnO5Im3iIajSLuaVou0l3PNgQ==
X-Google-Smtp-Source: AGHT+IHROU0SEYz+n9QJQ/vDcWV2OfnmMvwYqjafkILCMKmGU9yKlmcb0RI2/2yjG91je2tihjvC7w==
X-Received: by 2002:a05:6214:2a4c:b0:6d8:7ed4:335c with SMTP id 6a1803df08f44-6db0f82f0d7mr18468266d6.45.1734025791186;
        Thu, 12 Dec 2024 09:49:51 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8e70a9f02sm74780466d6.107.2024.12.12.09.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:49:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] linux-yoto/6.12: bsp/genericarm64: fix configuration warning
Date: Thu, 12 Dec 2024 12:49:48 -0500
Message-Id: <20241212174948.2791766-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241212174948.2791766-1-bruce.ashfield@gmail.com>
References: <20241212174948.2791766-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 17:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208664

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    Date: Thu, 12 Dec 2024 16:44:00 +0000

    This option was removed from the Kconfig in in "clk: qcom: fold
    dispcc-sm8650 info dispcc-sm8550"[1] but it was not removed from the
    defconfig.

    [1] 802b83205519e4253b873bef5c095b147cd69dad
    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: fixed the shortlog to 6.12

Bruce

 .../linux/linux-yocto-rt_6.12.bb              |  2 +-
 .../linux/linux-yocto-tiny_6.12.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index ff1962590a..f4fe3bf156 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b01e5cf7ee075ac6fae18ee9eb0ecfaaf024f394"
+SRCREV_machine ?= "29974e6f86d7ddc55a72fc44d209b84256c69e21"
 SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 84c4353008..0ed00fbb64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
 SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 728d7e188c..76f38d8884 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c2bc3bf6168351b86c1940020a05bc3907bd97af"
-SRCREV_machine:qemuarm64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemuloongarch64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemumips ?= "9537ff669bd3fded04ef795aad118851a2bd210c"
-SRCREV_machine:qemuppc ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemuriscv64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemuriscv32 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemux86 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemux86-64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemumips64 ?= "c804d6e613ac8dce9cfde9a245ad3496ad835e0c"
-SRCREV_machine ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemuarm ?= "0c33fda4cb5c0a3dfbdbb2040a8b4affbb34e00a"
+SRCREV_machine:qemuarm64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemuloongarch64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemumips ?= "cb10a94d7ca5ce5c00608ffcea74a79df6b15329"
+SRCREV_machine:qemuppc ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemuriscv64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemuriscv32 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemux86 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemux86-64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemumips64 ?= "861600ef3aecc4bb78dd57f92e4814c9647f1cd9"
+SRCREV_machine ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
 SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


