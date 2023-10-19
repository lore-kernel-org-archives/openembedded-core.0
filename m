Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDB5CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 15:09:01 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.30582.1697728134169769006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 08:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vq+czj1A;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-777754138bdso194439485a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697728133; x=1698332933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zV6RHRxxW3YNIxHcS/RiuhyCZkbzUhClHhCmldwcWaQ=;
        b=Vq+czj1A3ZOK4gy0JJO78CWw54wcE90mk63iOspu75aKCUfAN5DwRltsleZ2bLEuc2
         6O0SzLvvxRhLMp84TktCYsxEJGRpev0ayKn0B7z1mVNj01ue5ZEUFk2n0FlzAwfx8Jh5
         dTDGFCfxqEbDpbYfND2Z7Yln+6owBoWjJk03a5oOXHXOF5cAKs/57bnrIxB7A2JpqRQc
         w6JeNFr1XDC0dvNCXZPEjW3jnEzL8+FHDbpyiHgP+Gq9QenWbKilFisaT548pDIiUVLs
         Xe3iur2VrnMZ38oWu6OQgoD3PgFZXQt6sw4ktBBf4qXMBg92GtGzdu+HQ5D1naLae3vo
         UbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697728133; x=1698332933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV6RHRxxW3YNIxHcS/RiuhyCZkbzUhClHhCmldwcWaQ=;
        b=nNGppk63lpQ3Q1j5asIs7hQl1DsNwvhgrERd7pSNoaMcpXKyU/Nj5JcR6kd0weZ/9l
         GyKxXzbG1ul7OnkArhSmZKFtKxwCx3YA5rzRyLJEtxlnKvz+S9CMX5/wmdUlXofBOn27
         UL4+9DpLAz3vUP8h+dMZUDunYUDgzb7aA5kGl/b+PC4XxrvAkmBbKdAF7lGisn5GQc1C
         w/O8JPUHp9J6fzoSWB6XNZbBDMulVcYzW/XNoOq4iNvyjU4JhwCEQjvuefB0pWl0NspM
         Xe1bf+JHyYXGeAWPT2IsswiagVN6u9fzzt2kQF61OCbtS6biPqQrmv6mxGD+kIxirsQl
         mweg==
X-Gm-Message-State: AOJu0YzZEahCqPRZEG60YiGw8L7C/esyXSygbSXXmOemFUWLtNJ6lEXY
	Ehg3FiijN8bWMv/q6w5UwiU=
X-Google-Smtp-Source: AGHT+IEcw9Jazhkx4ROa7ZaYBNvRBWflCwbBL+yiuIQXInocvbf75SN28gMM7eHBrxxMDG6+CsXp3A==
X-Received: by 2002:a05:620a:27c9:b0:770:72c3:dbbc with SMTP id i9-20020a05620a27c900b0077072c3dbbcmr2393175qkp.18.1697728132997;
        Thu, 19 Oct 2023 08:08:52 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id qp13-20020a05620a388d00b007770d47c621sm805886qkn.66.2023.10.19.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:08:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.5: serial: core: integrate upstream fixes
Date: Thu, 19 Oct 2023 11:08:49 -0400
Message-Id: <20231019150849.2323667-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 15:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189468

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.5:

    14f83e409308 serial: core: test for -EINPROGRESS during tx power management validation
    1b5b735f311f serial: core: Fix checks for tx runtime PM state
    dee98a75d75c Revert "serial-core: disable power managment for serial tx"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.5.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 985490e5e5..598280c5b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "541ff832e9f2a168145f96ff41857a6cf1c74289"
+SRCREV_machine ?= "2aa14dbb8520e59358778a80b32d7ccf6dd6c2ac"
 SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index e2214851ab..b047ab340b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8ad515e79001700d5e3d36e6ffe37ebdae2b5cd4"
+SRCREV_machine ?= "dfe7f47645429e162819c3d5690d8f5052f5b5a3"
 SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index bd99b54bce..516605c587 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e3bd53c181eb362535991bb0e0c15bf7b8b8e86f"
-SRCREV_machine:qemuarm64 ?= "cd01efb6992e0af5dfef251420291d5984898a9c"
-SRCREV_machine:qemuloongarch64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
-SRCREV_machine:qemumips ?= "76f1c7370493dd6068f6733eb7d6ff9da6e7fae8"
-SRCREV_machine:qemuppc ?= "a3ac3f52f2352476f0fb1b0b4fe7b1c2339f9b18"
-SRCREV_machine:qemuriscv64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
-SRCREV_machine:qemuriscv32 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
-SRCREV_machine:qemux86 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
-SRCREV_machine:qemux86-64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
-SRCREV_machine:qemumips64 ?= "59ac3aaf836bd355d0f9f734e7bcca3dde44573a"
-SRCREV_machine ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_machine:qemuarm ?= "04942abac8568705f1fae34066db171b6e2669bd"
+SRCREV_machine:qemuarm64 ?= "ea4b620f18f882b3d882a53ffa33d8125ab27c83"
+SRCREV_machine:qemuloongarch64 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
+SRCREV_machine:qemumips ?= "3348b580e3c47da56ce97a8297a574c2e37bc410"
+SRCREV_machine:qemuppc ?= "2fd47e07960edcd21455548ac6a25b19babe5c10"
+SRCREV_machine:qemuriscv64 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
+SRCREV_machine:qemuriscv32 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
+SRCREV_machine:qemux86 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
+SRCREV_machine:qemux86-64 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
+SRCREV_machine:qemumips64 ?= "6706327d870a0f246df8ed20c6a7f51ef46db1d6"
+SRCREV_machine ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
 SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


