Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1202CC8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:13:01 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.15060.1751425975660734193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kRiBMh8X;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4848624b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425975; x=1752030775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyaMVJCtbVTUUadfSSC5KMTnf/pJIrofZuGkYjAGLhg=;
        b=kRiBMh8XjghFqNwOsTQ+gJVmIitwKZHGFKc2Veuhd05/0bDA9pbSg1ox3dsYnrWzD6
         mVg3nN/VhLKUU2OekjX//Erg/jMj0RaLszgDS8cC1AXyn13UK5GWbgLe2uZuwJxGFmg6
         7Wsu2gxs2Az9INvwHl59VrLWQnuergXwjh/f3adcjqAErjLM7VvQDFh5WoYuzTT/wVEF
         k8lN/QJhzZwMJxm0duI3FkMileEwOF8tMtVNjdQN8atnjbZE94DBN+l8vpq4lB0kaxA6
         M/QyQlZN9D2MhrDtV7r7oEVCX4vJr49c3fcZ2Q2wX8NN9jNAOXmoVjJcH6pybfIR5iJS
         9kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425975; x=1752030775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyaMVJCtbVTUUadfSSC5KMTnf/pJIrofZuGkYjAGLhg=;
        b=EjMWSlvwzacYdPjjj/jNVQrjPmMlds0WzwvtLdQZwO8ehxNZWVtEZX0Ct95fG/Vda5
         KujWhbZS3QWZuYeJoM4xtEsuZXg0wPpQs5OMQGuhBXXtRyxRlvDoajJcJVgsHFUNdscx
         U+ZGKx9cfnsXqVLYURPEeY1pz7F5pt9AySM1QD4PEw+d0eymKvGcsVynAyThAcXrD8i+
         mcKccLGAkWUBuX2W7+mJRiw4ZvG9HiiUQgKwH9jwXVPN2Q/btOZZB64FFigZfd+5OVH4
         AAH0xoPQuqzoCIeoYegjvE5u2Ag7G48W9S6DxzFj6TjM3rYJA1x/8wnX7L8OmXCDT/oN
         IxuQ==
X-Gm-Message-State: AOJu0Yx9BmBnV/F1IGSLz3rOpzErGwANUJqQq5y5brj2hrRgH3UJz1d1
	VXtkYxOUflnWioI/fQdVFX+LH5UPj22jnVY4JxmMbw8Da2FZ6Fq79vqGabk1b7+gUGqph5+EZTr
	5XGNE
X-Gm-Gg: ASbGncv2hn2y1JnZiHooIfJQn6fQ0Yej1O7qlLm75iVVHIIF3tzGDVSEg11hnHpVyj3
	4nsi7Y88pb8cOOtbg9CyljtT9tzmSry7T4A5lS+GX54OS34URUo+iBtS18s2MRUJPEgQ4bldRVi
	aIcZcs/JXhdcuW/8NRBkoNt98ZjPUy9asNvaL0ld90QCxchtm67CNp/1FbrYzPPT0j+D7zo9wYU
	YWLfAhhF6zLAYfpb1VnCgFKOyAU5P7tHETGH00qzgr6d4kliyjhgwUULH2n3jbQ9tkFHyJZDgls
	lec69IgP6UTjWbRwDGV8d0tmqSgDueuxmytKZrcXqWPEBQdcA4ziEA==
X-Google-Smtp-Source: AGHT+IEfRFnrXHdbg43Qqd/puZcybM7YpKpYjPerSvSSfgAJciurpQDQgGSTXSAkmvVmgpfmaDPqfQ==
X-Received: by 2002:a05:6a00:2289:b0:746:3200:620 with SMTP id d2e1a72fcca58-74b50f00f95mr1663252b3a.9.1751425974832;
        Tue, 01 Jul 2025 20:12:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 19/19] linux-yocto/6.12: libbpf: silence maybe-uninitialized warning from clang
Date: Tue,  1 Jul 2025 20:12:04 -0700
Message-ID: <0454186eeceafb8e0bd2b29ac2f8b46f9601f65d.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219773

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: libbpf: silence maybe-uninitialized warning from clang
    Date: Wed, 4 Jun 2025 21:22:23 +0100

    perf is build with -Werror, but clang 20.1.6 (incorrectly) finds that
    mod_len may be used uninitialized:

    libbpf.c: In function 'find_kernel_btf_id.constprop':
    libbpf.c:10009:33: error: 'mod_len' may be used uninitialized [-Werror=maybe-uninitialized]
    10009 |                 if (mod_name && strncmp(mod->name, mod_name, mod_len) != 0)
          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    libbpf.c:9979:21: note: 'mod_len' was declared here
     9979 |         int ret, i, mod_len;
          |                     ^~~~~~~

    Inspecting the code it can be seen that mod_len is set if mod_name is
    set, and the strncmp() is only called if mod_name is set, so this is a
    false positive (interestingly, clang doesn't spot the same issue above).

    Silence the false positive by explicitly initializing mod_len to 0.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43f6b7795170f0e571265f22bcef51554684206f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 1f61008bd6..5a7bad9017 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4127c6137af28c2c91ec79acee60fe4d4d70db9b"
-SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
+SRCREV_machine ?= "7cb6d42c40de351ecab0a083aef260f84407de0d"
+SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index d92862a426..0fad73dddd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
+SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 4ecb8276ea..55660830db 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4260a7bd706072e6bec438cdc29f44845d380b21"
-SRCREV_machine:qemuarm64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemuloongarch64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemumips ?= "681fad27d382f2e0eb53d1b46f9d35aa2332248f"
-SRCREV_machine:qemuppc ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemuriscv64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemuriscv32 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemux86 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemux86-64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemumips64 ?= "c32033ad8eac09b074c44a42e7d34d398df9d172"
-SRCREV_machine ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
+SRCREV_machine:qemuarm ?= "37a1fd13ca538e7785daf01434495a614bc55ead"
+SRCREV_machine:qemuarm64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemuloongarch64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemumips ?= "2bcf58ea5aa19d54c436e63c59ab09b307e9ee8e"
+SRCREV_machine:qemuppc ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemuriscv64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemuriscv32 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemux86 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemux86-64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemumips64 ?= "6470f58a8f04951f202cf85afb4421d2e7ec9995"
+SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


