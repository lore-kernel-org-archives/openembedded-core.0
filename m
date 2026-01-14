Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB06DD38FFB
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:16 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15750.1768411456275575334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ujcaa1kj;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2ea2b9631so4393385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411455; x=1769016255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iv6puJbyqcbEdSC3aq7G/SXMvYaUanFlmr+K0DVkXQ=;
        b=Ujcaa1kjerRt52uRPZZswX70C9zO7fgfx7NzZPUr8dHTy10OYJ//hmbxgTOVeL9SzL
         QvHalBvWfjOVH4oHLlCuf/6PnJWpRd1FKgrFlDZLzblXdKTHeltKe7Wb9v5pXEQ4UyFc
         MT6U7XTHj5HSDeamdE0uqbx5A641JHVTR6efHHAbRii6RqN1bDjfifTs0mWIH3dMtsLC
         nFhAZ7mDf3sUmnp3PRjzDmMUgA+GNnGbQxbA1zncNlRA2t6LV2Glih843cADLWQ/0xbU
         TXuzxyBRgMMMUOnOweWen2rMIrPxj+owqxXBvuO1g7miioOiAQqtfyBBQipk8+lL+f1+
         6M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411455; x=1769016255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iv6puJbyqcbEdSC3aq7G/SXMvYaUanFlmr+K0DVkXQ=;
        b=LbqWHygkEFHFV+z6r2m/vq8eNwI/kZb8YjyRMwYNnaDR/YCAgrP73BfbVd13v2Byg1
         GptlGp7ctwpBqBJOyuOl77dFGXj0aQcKv3JhN8oiMob+14+murM6/8eljAGO0OW8zlq6
         Xa259dpzjOQ01fr7R09Ta9vbvyqis8q+br8aimoF9Szx38SZlvyZhLh7CfoMpJBKLONV
         QsXpBg8UrewW/YcCNI0BPhJIQgu0XYvFRU4qmhDjFF+/pzqn5M16M4M+P2BC2Tsp0BVh
         UjLJVgduAeG0KMpNH3xLtraDXsTPKhMapTTXbWQvRN7Rwg+tCetRqAmViNLKhV8c5OSe
         89cA==
X-Gm-Message-State: AOJu0YwtsFzIUpopO9YjcRlVskyix23u6XbKbh44+adsvJ7vx4KuNHCC
	AgRGEILWBroopZfzdlBOuROhqLik2xHGqVyyY9EiYi76l5WXtpDoVgPX
X-Gm-Gg: AY/fxX6kMYJUKyZbQzCjSo+llSr68meiKUzpAUQYm6kSV28WX0z8E82dhpZe2JyexmN
	a+kmsRG5tjN88yJDZ8jHm61TrbIUBJU/lS+TiZjXmyv//iMVT86hjm2l87l0nqgAoZFh/PuZeTE
	lMVo2QbeyEUejZngzxqBAzkA3iHONJ0ZILdPqh09kYdG1c80kwcN42H52UAqdJVlv4X3Bvuh3BQ
	DBmbfzWIsiTaXfJnRCyLQnizlkiLqwhZ3S45ZyCLc/cYlkr2JqG5yv5Ecr+F4eLsMK/B6YAnaLv
	ps9Oqi1scEzCLFGaaIPj5uR714c3ZcsG6GehnLx8v3EZSLgPOPNMYjVmrl0NVs6uIw/ja5MfsXk
	sXkDNe+XztlV8cUVlivtDYp5v+HPBl97PlldAmBX8l6JaBk1KWI4dr5OM3+YEi07H5leguNulKV
	jiUoUyEr+o2RJ7ylNNe40eM/ppu0rl5mgL0Qn9rSOwwC2v3/QyoW6P+UqF49IihgzTvtqNqkedZ
	+f3ONsHlt/jr0I=
X-Received: by 2002:a05:620a:1a1e:b0:8c5:3495:87e2 with SMTP id af79cd13be357-8c534958ba0mr274193885a.39.1768411455052;
        Wed, 14 Jan 2026 09:24:15 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/06] linux-yocto/6.18: drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
Date: Wed, 14 Jan 2026 12:24:03 -0500
Message-ID: <20260114172406.2271015-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
References: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229359

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

    c66fba07b7dd drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.18.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index ea597826de..91b5249ddc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1ea117bba0947d103ac6a28e8188cbead312bda8"
+SRCREV_machine ?= "51e05e8d4f25e9960897b387c5f6d6af2145ff47"
 SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index dd84b78239..447ca1b18f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
 SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index f56006c0f9..4f68e679dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "8758ff0400fd85c08d4cedd687e85bc19398d118"
-SRCREV_machine:qemuarm64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
-SRCREV_machine:qemuloongarch64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemuarm ?= "57815a771f1c597e9cb14d2ef20b07d70008c7ec"
+SRCREV_machine:qemuarm64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemuloongarch64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
-SRCREV_machine:qemuriscv64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
-SRCREV_machine:qemuriscv32 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
-SRCREV_machine:qemux86 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
-SRCREV_machine:qemux86-64 ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine:qemuppc ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemuriscv64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemuriscv32 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemux86 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemux86-64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "dee93e99bec48c08795b62ec224e45c5f9b4d9f4"
+SRCREV_machine ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
 SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.43.0


