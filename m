Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF5AC369D1
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 19:54:53 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.4273.1745006092279846897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 12:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TdqtlHZx;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47664364628so22234111cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745006091; x=1745610891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQZPl4wj8E+c2Cbdw0fZEQWntv/v6ArtB2NDJISdopQ=;
        b=TdqtlHZx2wwUasP4eAH0ZSdALwaP4rlRCQsb8UVAZviDZw8zDrWF3RWaIwxBor5yR0
         0xcPKN1YaMNypC3nsMR/CTYRcUuBTUPCSVdpEk1MES+37eh/RMLq7M0QIZz5xysgH1ZJ
         /LkGnUHQv67hpM8URQ/vQHv37llkumX9CqJFKAjCaMcF8hc3tURJlzFqDRn/igIf6W/h
         KorKnTuHUiEYFieCTo6tGlhz1SKDetqsgeSucTPXvd/VG/oVyQy68ytiRnRVacM/gPLX
         JXxN+BHV81fxPkZpGIwo3zxW94RuagMbym4fK3H3VwAUYexwk+LgM/d+ghCXeO9LlKrI
         c7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006091; x=1745610891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQZPl4wj8E+c2Cbdw0fZEQWntv/v6ArtB2NDJISdopQ=;
        b=MdCFpps3+IyE19pBWxJq90HJ4+YzyQrYi8iJ9cE5QTDfYyZA1D5IALhtoUTohBbgAX
         zwjpINlSIktVgRPYzi1H1vu0K9Mf5jbwqAvENi6izliZPvWaIfskRx8bo9AntSFL+uWx
         vC6KILS4c9Da/1IGefyKN3bm3iowu4ow3+rcBvdZYbIDWFzKA1E+yl7y3uahS6xEWlMG
         g6++aL5WfCyhC26JMSe1hQ9qAPzHgk/i4hBLVS3+n40KVBfdd46GUEscjuTUFPHg6QKj
         zjo7GqsBnYjjCZCBtHb7taSMekWkaIXMt72UGRHbHR7nniEiK29nEOWZMhWQsGkoyvwJ
         saSQ==
X-Gm-Message-State: AOJu0YwUilvsFhQqk2hrakDrYAY9OwazRcBYiN3V9YtggdymhjHGjBKc
	YskrQLQ/YLjWVke6v64AY7nGXKB1g86DkyhP4jnEYpXp2nllfUWxjnNpziAX
X-Gm-Gg: ASbGncuhuN8rAlhxjko//pm5eymse9sL4eB1fJLY7J7x6SP5KZFoSNnMHhq5yjch6Ly
	/FOg9glNeL4SMSwhAXQ3waZZE3J1An12NGzZ+kM+gWNhiQU/ES6bs4PGctp/AKIO4y0Cd7TPmm3
	pnNA6u0kEB0v3r3olmWiJQpnz1uRUmeWpUEglE/4KYj9pwpSdkt5jbDVbfTsKkEsS6MKK/IAAvY
	o4RkP9BdkBVkkdkAhmwZcoBGMWY6Pc3HxOk649h5hT/o7sLJYHxJim9Y37blSMLlFX9skCfvwqo
	c9RjOAXz67IfhDUWUuS7BJgxjiwNKgyVVOf2z9dzlv0DAYysMbWNQ7BcDMiYvIzSF9WUrg+JZeq
	xevzk6Wrj15I7zQeIDeFJx6Rt8LSQHkTHxxKvDnLEnQ==
X-Google-Smtp-Source: AGHT+IGDbReY8Z4zG8vNzv8NC3Bbc3rL8iCT7H7C//DFE9IYtztbYgqtkyaFlwZzwFLfx7xGtS77Tg==
X-Received: by 2002:ac8:6f0e:0:b0:476:8edf:8122 with SMTP id d75a77b69052e-47ae96a6495mr84571111cf.15.1745006091246;
        Fri, 18 Apr 2025 12:54:51 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9ce085asm13774061cf.51.2025.04.18.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:54:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] 2/2] linux-yocto/6.12: cfg: Include iommu.scc for Arrowlake boot support
Date: Fri, 18 Apr 2025 15:54:46 -0400
Message-Id: <20250418195446.1914594-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
References: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 19:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215143

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: cfg/intel.scc: Include iommu.scc for Arrowlake boot support
    Date: Mon, 14 Apr 2025 11:55:45 +0530

    Move features/iommu/iommu.scc from bsp/intel-common/intel-corei7-64.scc and
    bsp/intel-x86/intel-x86.scc to cfg/intel.scc to eliminate redundancy and ensure
    IOMMU support (CONFIG_INTEL_IOMMU=y, etc.) is enabled for genericx86-64
    on Intel Arrowlake, resolving boot issues.

    This changes is needed in 6.12 as well as master branch.

    https://bugzilla.yoctoproject.org/show_bug.cgi?id=15802

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 22d7758f8a..774e828fec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "8569a61bf30561b620c3171431906cd8ddb7d095"
-SRCREV_meta ?= "cc3691c02d54e5a5d91ef5dfe670ee80ab323ef3"
+SRCREV_meta ?= "6d55bad30f3e379bf2ad98d971d1ada4f48e2eff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index c7a058599b..50b1787db2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_meta ?= "cc3691c02d54e5a5d91ef5dfe670ee80ab323ef3"
+SRCREV_meta ?= "6d55bad30f3e379bf2ad98d971d1ada4f48e2eff"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 4df34f3b0b..5472a8d79f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
 SRCREV_machine:qemux86-64 ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
 SRCREV_machine:qemumips64 ?= "8a34918e22d2fc3b37282d1929e760747762b74e"
 SRCREV_machine ?= "c2c450e032c7bf2653e50fc0a87329ce5660b6be"
-SRCREV_meta ?= "cc3691c02d54e5a5d91ef5dfe670ee80ab323ef3"
+SRCREV_meta ?= "6d55bad30f3e379bf2ad98d971d1ada4f48e2eff"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


