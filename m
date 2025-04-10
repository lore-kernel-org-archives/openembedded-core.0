Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51077C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:55:45 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.6338.1744311343264193865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBIuR6sj;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c53b9d66fdso157283585a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744311342; x=1744916142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g+hyzSuevx0z/vAuRsKRNXILlkRcZFDzZpX2cK9LdY=;
        b=YBIuR6sjZRTl6bBFLBppE4Y1MCoRK/FUwwe6JFzQgNDYcOMruL/htD+JUVUoMcrV7S
         t9Y9oD1PvLXlj6dL1Ud+XQE8QAysNzmsxXw/59pdk80w28++4aiNcaPrElPRiuMeFYr+
         DAoGuI8vcVAZWSG2e45VTlub9XQ3akuq9Cj2rJHYE/INVGHXTtQ7eU9C6mpWSDGJP0hR
         bYutB2k7rKFP+MTxIKooCuZJFT+ZsdVWi0AzVdyQ7TVLb4DVge0m63XVAtMo9GNN2mH6
         njX/fbYprYX7XpYoBlC689QyUExUqDjCoXnxsCp3nMGBnR476FGvulXPNTtEv/CHv3wX
         jpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311342; x=1744916142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4g+hyzSuevx0z/vAuRsKRNXILlkRcZFDzZpX2cK9LdY=;
        b=XBotDsAbZFr3KmUXW8kdlMjxlGiVTaTzJ0fONedepzBlPGbNHcbE5gSkzsBYhkZULH
         /z+sCTJJqWrhq1dqGIR3wBZXaCIuQ8Bi5m685iXcEKU4a5xvw3DNMbgtkvWbnLZPJ5fY
         uSiclwT5C3sEn4yD1hM+LgwJb5ZNM1Biosp6a7CXfVjNLXDZDyOOOu3dIvf9uPdiRRz4
         Y3EgJ0CHn3driSqUE6wgPk8M5F8QReFtccePhgJvMLUje0rddaCc6ksmwNuB4cK6kjmh
         9xcsSw1gy7WeAjEr6W5Xv4uyoeNEdXWPnxcOiW83vNwFi344mYjqOTIpH8r5LJ+rLDAI
         yRwQ==
X-Gm-Message-State: AOJu0YzTFJ3OuiBTLV6dN+ZVRyP1RzXt26lEn28lATnRi6tEN3VtqAii
	SXVSMt/5IhWna4dbr8fnLGraT3KxCgzX8ckRpppLwklv74WwmPXJTMdPh5V3uiM=
X-Gm-Gg: ASbGnctjaT3knBpYFrPwBIKoPROM2QCw5AmW/KtbmvTYsV28UlKmRSYgSLfNVpXLZ3c
	2OR8lT9YDdu2gwPQyssaZRgdlPJ/9pMEGXLN5Kc7jCv4Ozy9KOnfjJ0F/85Xczr77xj33vSITeB
	m9C0UC2Yf3tbgutAdIcMy3xprHU27vgp6Qj7uhlDB8sEXg9YiRagOtFKxffXvIzKEx6KEq/9gLY
	fYqRbM6W4aJKGux+dyhfhQUk+4ePmhyL/VYnK5N5vi2wfUk5AGScNal2SX8bfG/CxHGUa9QTBZa
	Ksv4YW/e+dld9EkZx5uWJFq0HlrijWjqaj01cAZB/MrcgoLlPSYwVPn5r2pefQIjQuWhdBHeT3A
	tdXNW4EFrac/5rZQybqD4hx5HqAohAhG3GDM/6HS7gA==
X-Google-Smtp-Source: AGHT+IHoQz8Q62/S330D5gzKzTxPiKr38ZPFK1yw+TRdegMtu+Jjij0CcOvOStyIi04WIKv/ftxONw==
X-Received: by 2002:a05:620a:318c:b0:7c5:cdb4:6230 with SMTP id af79cd13be357-7c7af1164bamr9680285a.17.1744311342234;
        Thu, 10 Apr 2025 11:55:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8942eadsm134956585a.5.2025.04.10.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:55:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] mips: Add '-std=gnu11' to vdso CFLAGS
Date: Thu, 10 Apr 2025 14:55:36 -0400
Message-Id: <e794172c936a8beccac6655e43d1eb89b0453a94.1744311165.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1744311165.git.bruce.ashfield@gmail.com>
References: <cover.1744311165.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214694

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: mips: Add '-std=gnu11' to vdso CFLAGS
    Date: Wed, 26 Mar 2025 20:24:36 -0700

    GCC 15 changed the default C standard dialect from gnu17 to gnu23,
    which should not have impacted the kernel because it explicitly requests
    the gnu11 standard in the main Makefile. However, mips/vdso code uses
    its own CFLAGS without a '-std=' value, which break with this dialect
    change because of the kernel's own definitions of bool, false, and true
    conflicting with the C23 reserved keywords.

      include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
         11 |         false   = 0,
            |         ^~~~~
      include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
      include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
         35 | typedef _Bool                   bool;
            |                                 ^~~~
      include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards

    Add '-std=gnu11' to the decompressor and purgatory CFLAGS to eliminate
    these errors and make the C standard version of these areas match the
    rest of the kernel.

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  2 +-
 .../linux/linux-yocto-tiny_6.12.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e0bf187823..a04bd3a95d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9f69ed0ac5f665d431fe52bacdda72534172712b"
+SRCREV_machine ?= "15dd975f84e62ba7b866a96108aff27b97cdbf80"
 SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index c96874480b..5b3661a80e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
 SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 2a8cb964d0..10350edd5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f7235e5c375b9ba3d49902dd36d4b66eefc19979"
-SRCREV_machine:qemuarm64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemuloongarch64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemumips ?= "c102fc13802679cf23f6a41f9ea54294294f7a93"
-SRCREV_machine:qemuppc ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemuriscv64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemuriscv32 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemux86 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemux86-64 ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
-SRCREV_machine:qemumips64 ?= "ee2d5ef2e92ca23c5b345ac50bab130c6a9ad0fc"
-SRCREV_machine ?= "b2c792d89ac51b1147810021dddab1e9f38ade9c"
+SRCREV_machine:qemuarm ?= "3a973aae1addba0ecd7485694d4fcfc624085f24"
+SRCREV_machine:qemuarm64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemuloongarch64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemumips ?= "fc7877fe6aa5f2a445e17941a5858c7e19a1746d"
+SRCREV_machine:qemuppc ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemuriscv64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemuriscv32 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemux86 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemux86-64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
+SRCREV_machine:qemumips64 ?= "9e2bc57fafb525cb3fbbfab7c7f92bca7e9a43f4"
+SRCREV_machine ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
 SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


