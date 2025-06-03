Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48716C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 02:49:04 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.2463.1748918941336583640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 19:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d19+nTIZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a588338015so35319451cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748918940; x=1749523740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHe8AWmiAC5bcGRLTE3PMYFVGNsK1KAuoPpCzTS1tfk=;
        b=d19+nTIZAfwD0yMqLUmTa2n6Cubhhac3UZ6FcuWD+z1RXqUmHs0m0bwqUXeyA3U1Z/
         8f8bAwKQ2/B6kvVQv5qYYr/W8DN7xEvh7FwCsIZH1fq93Wm5Q7ro7+c4rrRudK+DYKKL
         W/OqYFaGPjP2diKZ4cWM/4PIwCftOOq+PwsFqRXJETv23i8SxJU6Ed/HdCdJrK0hozrz
         NpYDeJDxCnPa1pwOpl+tAQmI0Uw00QO9MQy7OCpfdISs/V52ydxr5/8HlA/PtSRJgWbP
         BH0Uk/LKYGGaB1pQKRHdo1+TBDO+fJ2Pe7zGxD9UqOi4us1KV9BUAqCsq2Wego3VDO2l
         gc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748918940; x=1749523740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHe8AWmiAC5bcGRLTE3PMYFVGNsK1KAuoPpCzTS1tfk=;
        b=jlhcDjOVS5ZJsJ/jHfLY6/MyqCXvO99fbwsCeM21cF5A8RxjkTpVjVbQn/OFWKyTMa
         sSfMtH9Jl8g+5iSlW1lIb4RbA86wN697nxWsj1y5ryBSYRSzBWACJBNi7cIRoOCJ9Q11
         TKvT4OrPB7zwC6tUmShlrhW1Ow6QLWSbwx56WVhlbMi1LaLxslN1GvIYGmCQ+V+fDTe4
         jqKkLZWRxtDuks6IDKjZ/Htaj1/t3rMRy2ABe6PeL3Q2rW5mnMiBb3sa+eo1lhw20Uc1
         GB6eHRsQdlBWtvXXHNG1WqCTZFCGGVArSPBUk6+He3pktEa7MyrQLnZAF608gSmIhRE3
         SIpA==
X-Gm-Message-State: AOJu0Yz8NrnV1bGgV22/3E6fA7A87QoJfP7ba40aQmMfz1+xZkGxTQ6Y
	U3bQELRbXnCAGnrL1RH4JMlW/3N034xj4r4EoHpnvL7X5hyekwOzbbjV
X-Gm-Gg: ASbGncsT/ltiHoVAvm9VLtRKOUcXTSx0z3AsPZPE7gnrywQuJZrcszD4azUZPD7qVgc
	3xuRLLU37b/dWkup9DB65rQKa+RZhrCuV9c/Uf7iLaO/KJ5v7YdCXhMHRoGdhOt/1Gj/vNISx0s
	q2nYQhmCYETi1LK2xqu3kVOzbuCZJCzwS9r4iVHHM/rZXQyD4sMnZkNPSh9XuBZKWJCbQOmswjk
	lrMyeqTlNT7fAEnq2ovhLmTkJL6Wnars+xxYeiBV6UV8ElK8np6iaqFSIHGOmoVwNtPw0UdtGXM
	HqFwU/c8M2b0OOITS1pPit3q+YBAI7mFwjIqTuYwfpNRo8O+Cd6fOwOc9UGhyMpqpVUkrkNyq02
	WRRYwuoMp2MN8rV8nvajYzDC/HdVGNbA4KBAAruqeM5BnyjswqbUFEuCw8wdYL8I=
X-Google-Smtp-Source: AGHT+IFUfCbtoRtKfapEP6My1K1uYrUTERM3y+LZBh4LUWN8tyVEXIzX3/cE7lcvsmk6hZKzNs/F4g==
X-Received: by 2002:a05:622a:558c:b0:476:87f6:3ce4 with SMTP id d75a77b69052e-4a443f23c70mr257219351cf.39.1748918940237;
        Mon, 02 Jun 2025 19:49:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358b4ff4sm67567551cf.26.2025.06.02.19.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 19:48:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.12: revert riscv config sync
Date: Mon,  2 Jun 2025 22:48:57 -0400
Message-Id: <20250603024858.528668-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 02:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217745

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: Revert "bsp/qemuriscv32: Sync config with upstream defconfig 6.12+"
    Date: Thu, 29 May 2025 18:53:48 -0700

    These options are infact required for qemu riscv32 emulation.

    This reverts commit 64e08f7f69c662efe5f3780e7e42fc80635ad16f.

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 24d93645ca..2088717489 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3d3d56a846c993611859096016322dccea1317cd"
-SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
+SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 042adf94d0..90a00f7cd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
+SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index e282a89983..790e1a03c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
 SRCREV_machine:qemux86-64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
 SRCREV_machine:qemumips64 ?= "98a85ed93bd5eaefe30c4aa3f7c15549be2bd032"
 SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
+SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


