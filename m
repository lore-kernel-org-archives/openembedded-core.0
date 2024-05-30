Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F103BC41513
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 21:44:43 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.3741.1717105477218082359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 14:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2+QgFzu;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-794ab01e747so97607185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 14:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717105476; x=1717710276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LpIo0Uv5pf3x9FpXdf9qd7isxw2UFQkQXyBo51AUIk=;
        b=D2+QgFzuNp425EiRshzBw8uLakRXzS1JNMe3ISCsZIuIwcXq04sICI7/SzgY94GHkW
         whuqGL79XgKCoE9kuIWpGRKKNwDZNwmTFaGKYvX8y42Rb4klNnVK1OCfhVhXDj6jazYj
         FMboH0I0wMTw5112/Y3XD82U4qGvWzCF3C4ToksE1S6IOItN0eztwwJK2pMZ4duplVAe
         pd/dZISFkEggVCLcrcaKAyjwPxH96ibskSC0+KwkHDgEunUzdO+a8R6XFYqTV8J0tDcg
         Y4pxVfSckTJxPKDQ2xuRE6G80tmYvu6hgd6v/Gv+gon3S2/Mvhz2RGasx/Pvrt3x2RYq
         QoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717105476; x=1717710276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LpIo0Uv5pf3x9FpXdf9qd7isxw2UFQkQXyBo51AUIk=;
        b=k5ahM1AvKpvS8bPKNNGN4NPZFVlelBU2hoFB57wpUZHYbv05VavU5REHx0P52iRleW
         v7QQbBxMtUGT0o8RM8jon+qqgk2IynPd6rSm4jYozvgNc1k+wRa2JcrHJqNRkvggxorC
         12/Pq1JeE+DkXwJK3XwZ2xJquvfqr57QvP9ou1/pELtPv59JNRCn1YKVxG9fxtY4eP7E
         TtKaI00FEsXE+Z0liOfhJLByrA88dxDQmU1SQ08J8fQviFAMRFwvlnP2p9qr3gW4aJ2z
         /TnNtxVzgWmmBjlYw9zntgBH5+FclukMDUQ03lHeFGSjYxSXEWhZ3c6+vpCD2gQwzfCn
         WDHg==
X-Gm-Message-State: AOJu0Yw+2g0OT2blUtc9+1TcYBflhoi91gNiSojITeBBA7IvTRvp06Ma
	Oi6vJADi1fAol0ACe+ocItZHfRgSinlaHqSKmWyuAWDnlKC7eDFAAHVlNOT/
X-Google-Smtp-Source: AGHT+IGvMRvxJeauoyvk3WsC1DIum8eUGP9iKbBeBR5i1bS+8RsocGvMa1XZXMGZZ6TIEmEKUaym1w==
X-Received: by 2002:a05:620a:20d8:b0:793:19d6:7b57 with SMTP id af79cd13be357-794e9e49d54mr318254785a.65.1717105475973;
        Thu, 30 May 2024 14:44:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2f120f5sm14642185a.36.2024.05.30.14.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 14:44:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/6.6: intel configuration changes
Date: Thu, 30 May 2024 17:44:29 -0400
Message-Id: <b7a7f5cf4d303fb4bd27101f519b7937673f8461.1717105222.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717105222.git.bruce.ashfield@gmail.com>
References: <cover.1717105222.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 21:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200048

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: features/intel-pinctrl: add pinctrl driver for Intel Meteor Lake
    Date: Thu, 9 May 2024 13:01:25 +0800

    Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: bsp/intel-corei7-64: enable Intel IOMMU support
    Date: Thu, 9 May 2024 13:01:38 +0800

    Enable Intel IOMMU driver for intel-corei7-64 machine.

    Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a17e189e8e..7169e94e79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d6479bad645622afeeefff281c6be5339662c701"
-SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
+SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 392cbbe9aa..ee21291ac2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
+SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0e708d09ea..0a87851016 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
 SRCREV_machine:qemux86-64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
 SRCREV_machine:qemumips64 ?= "40b35be7a83982472153cbf0a80fd8ed3f21b053"
 SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
-SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
+SRCREV_meta ?= "49698cadd79745fa26aa7ef507c16902250c1750"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


