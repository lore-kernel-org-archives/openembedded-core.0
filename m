Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521ECC3ABC4
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:33:16 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.80824.1746549188822454135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 09:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ml3a071O;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4774193fdffso6212731cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746549188; x=1747153988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNIAy45EqDpNj5xqqzx9wiqFWEP3O8sZ3JsDY1oTXdY=;
        b=ml3a071OjMyc/sDvy9AJQhwMvZXqHI53tjWRhVn4tTjA5SgRU/kRHkUICiQ9K0BMui
         6GcinnyTrksqVVpyt+GthUfiN8wi3uC1mp46KvKvvYVBLZpHS1yZb6XJ6NKfDeHWG46w
         Hfjy2R5Xf7YGUkKXjWi0kk2Dsv1iNW+m1L6yWWw+mD06O7pGuZonEVQ4JLIh54M+phZB
         4NBMFQGDug3ONO9Kvv3SwlHgUvpzd4H7ght+ogS7vXReylH4TP201KIjrvT1e5kO+uYZ
         pMNIeJKY5wdooUHe+Y6qBaSpbCh/D1wVclDyT3Fx3sEjWO+h0VSXXK9sm2sNtxs6zhQE
         zhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549188; x=1747153988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNIAy45EqDpNj5xqqzx9wiqFWEP3O8sZ3JsDY1oTXdY=;
        b=HoTSlxxKADdb+WZx+WbC8rinhtiWjKAbhdPCD3ZLYQEKJBBC0eYutGas4GAD1koC6Y
         Ao8lTqb837xP065Lk/vpSkVtvp40tXSSjHDcTmsJQkrcPp0WwiIo6xSIPW/IS3vRTPM2
         6ZBhdOHDPTRuwMeybkSRoM7kX8JHnkKYhFrtoNzOu6ofihyaATewfqmFdsluNdfmDhdd
         yiNQkSIQ7VRyX0gbHkcCjWotsW2rLHc50JEFCN9Qpj2vLqnnY6RfBx5MSBjgNfiauL52
         vuwbf71aYWpUSRFyeIdPceGM8nyY0VesXoihxPBXnL67KREDceg2ZOWDvCh4aSvQiFBV
         TmwQ==
X-Gm-Message-State: AOJu0YwmttMzu7nyoJot3swZo2VjHoTqOIGSGpJHTSMt/O12cAbTE8pZ
	sHb645+qBNF4QFzx2w2p+C6XhnCRQK7ubR/VBTJqTkLilAy+nqPPh5IgR/px
X-Gm-Gg: ASbGncvrBWC2WfkYbcGSrgYmILgfc1DfEdrWMxm7U34z4B+/pRqExhVTtweI/Nxj7gU
	48GZlleTh1kpIRmBcD4IUqRkDUXrECrGgONGKUS3QcJED1fExbgZPzPHwyOEjdheb606u+BYQTA
	nEEifOT91IF5nQR2TzFCa7f4d1CfsJaQHgScNMboX8qVBXzvpl+CXylZ3qTs2A4JGr/Jb1jdFC7
	HOtsQ1GZ7ADGBT44uDA3/gKGFXV2Hqo+QtVkl3Jhml9POq8sPVDJcit80iL86ljvNPF2dSgX2MU
	Q0oqqVDC3S0piEY07X11dMIdJZiE6YpehKKKayXSZMdB5pOtDDUwk4xRxX85DRM7IEDgn2TcKPh
	Xei41RMjVeJE9FQJ+DK7liSUjFynkAjdzLLOI1XcHSA==
X-Google-Smtp-Source: AGHT+IGaChZ/ialknW0bg5Z7eNj8y4qUG1Guj5JKnGIe03pyD1mECV5U7WOry5L76b25xvh9xC9RJA==
X-Received: by 2002:a05:6214:1c07:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6f5353e31acmr61978816d6.17.1746549187696;
        Tue, 06 May 2025 09:33:07 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48ffsm735977085a.45.2025.05.06.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:33:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/6.12: bsp/genericarm64: modular configuration updates
Date: Tue,  6 May 2025 12:32:59 -0400
Message-Id: <78b2fdea28be0f38ec52da2aa40b4fb9b9893761.1746548780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1746548780.git.bruce.ashfield@gmail.com>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 16:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216078

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64: build drivers as modules
    Date: Tue, 6 May 2025 09:27:53 -0400

    Load on demand. They should not be needed
    to run the kernel since it has already been
    loaded and firmware has already configured HW
    enough to boot into kernel.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: nft_test.cfg: build CONFIG_LEDS_GPIO as module
    Date: Tue, 22 Apr 2025 17:38:28 +0300

    The driver can be compiled as module.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: nft_test.cfg: build CONFIG_VETH as module
    Date: Tue, 22 Apr 2025 17:38:29 +0300

    The driver can be compiled as module

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 27bd9f66d8..2211f78cea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "a20f2b5c8760fc32bd7137fbd952f7f3f810ae26"
-SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
+SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 50a217958d..bfe1773e48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
+SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 96954f24a3..b7cfbca475 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
 SRCREV_machine:qemux86-64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
 SRCREV_machine:qemumips64 ?= "54af295ab3ca402812576c8425d92dcabe9f0b0d"
 SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
+SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


