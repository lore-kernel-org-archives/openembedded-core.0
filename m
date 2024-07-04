Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341F5C3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:46 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.8895.1720096060666813852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PMRLqFh5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-70b2421471aso327767a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096060; x=1720700860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xYr2xiZZxaUpNeaueC74sGuv0gpy70m8rgNI/U56AI=;
        b=PMRLqFh5DBeHvteyXKlakrpG84nwB1wEa7psfaLdnhgbYI0DT0cwvtFGQgRXX7R9Qa
         Rz9oKXVIV7EHDWiOExzM7SC3f2bsKfjhK45FaCOrFFZfStjzpQlDtIin97cLmqG2316a
         sKdTt4oxqzLJ4PzACNHh+AD8RTQdd25Wb8ufmJEnOndT+S625lpYehXaMij+gVbmWVgn
         nSgH6jhIJjHEhFg2qqDozyhN9Lcop/mK54L9AnyiXNsQ/K/5nYlMAU2mEdXvSqP+7Saq
         rvWAGOPq3QfIp3/WwgOvQJCr7chz09peLcKR6PFYyvSuZUxT9R2Lh7gRxR9RxDWw8CNS
         aAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096060; x=1720700860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xYr2xiZZxaUpNeaueC74sGuv0gpy70m8rgNI/U56AI=;
        b=cEvJ5rW+deZsvi2l5NM+330fYEv/yQcwM0Ac2kTO8JYhTXHxd2Ebdu35u0Tqz1Mu95
         +Shcze776dO3hKh/NGjduHZN0O5GhUQAOEW6E8gcg0YshMCncyggksn/wFPVbw09/V0+
         S+EMGMHYCTr3HlBp/gLkXquQx8duq30yIcSILTQtQYh+IJpJO2JueqGzmWzkd5bf+tog
         nE0DGCFxe5b9QYmjWs+gBx8SKoFW9g8SdT2YFwnV193pWKttaglqrTXtng/Mi8tAeEcM
         BjV4h2tQOUTYsgPa9TJESflDNRHzscCVOCmKW6uqv6qbxe9/sN7zYKUMYt3sD0AGmomi
         xBjg==
X-Gm-Message-State: AOJu0Yweu9lYiqxkl1TO77pOHhZBcVqcZNBu1Y/fM9vd2iE2CUhN5fh3
	WXpXRGFFsVhhbGfZz1tiWiabG0gMh9bDRsXAulYeEbWlNPzVId36qs6jLisf1XK7ERK8DYxHTpD
	U
X-Google-Smtp-Source: AGHT+IGl5cM5xq3jAR+5JvmfH8nCYIwpgf4eEjaOZ42oZ7O7Gprefr8NDujvWAGugEoRf7H0GPzSlg==
X-Received: by 2002:a05:6a20:1594:b0:1bf:5ca2:a9b6 with SMTP id adf61e73a8af0-1c0cc8d4f84mr1328117637.50.1720096059815;
        Thu, 04 Jul 2024 05:27:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/21] linux-yocto/6.6: fix AMD boot trace
Date: Thu,  4 Jul 2024 05:27:02 -0700
Message-Id: <1608b8a0303ed24fb5da7c168bb1bc2c81760697.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201552

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: cpu/amd: inhibit SMP check for qemux86
    Date: Fri, 28 Jun 2024 12:55:18 -0400

    When booting with kvm enabled on a AMD host, the following
    trace is thrown:

      [    0.084519] ------------[ cut here ]------------
      [    0.084519] WARNING: This combination of AMD processors is not suitable for SMP.
      [    0.084519] WARNING: CPU: 1 PID: 0 at /arch/x86/kernel/cpu/amd.c:341 init_amd+0xaee/0xbcc
      [    0.084519] Modules linked in:
      [    0.084519] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.32-yocto-standard #1
      [    0.084519] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014

    This warning is not valid in our configuration and is unnecesarily
    causing issue with debug.

    This has been know for some time (10+ years), but no acceptable
    solutioon has been found upstream:

       https://lists.gnu.org/archive/html/qemu-devel/2010-03/msg01428.html
       https://lkml.org/lkml/2010/3/30/397

    We have a configuration CONFIG_QEMUX86 that has been added for
    situations like this. When that value is defined, we inhibit the
    warning, but leave it as-is for other BSPs.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f0c03000abb7665352cf107a600da15a112af5fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3900690c74..dc1413ca94 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d96726faac7f57c1bb3466edc283d929fc183b6"
-SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
+SRCREV_machine ?= "4209a548f26ad97f610f6c7acfee7fabe009dd3d"
+SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0a9b96753c..f02a9c186a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
+SRCREV_machine ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 808561f45a..ca7c4e978a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7e5d1df22352c96c1d63d81d59457ff30e82e2d9"
-SRCREV_machine:qemuarm64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemuloongarch64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemumips ?= "f26493dbcd22b4d89beed4eabdc52d124d59658a"
-SRCREV_machine:qemuppc ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemuriscv64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemuriscv32 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemux86 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemux86-64 ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_machine:qemumips64 ?= "1ef0c6554b95984a5fc9e7cd3bb27ab617204149"
-SRCREV_machine ?= "4c1fbbd1c2b7c31e1755cfa83199cdfcb9707832"
-SRCREV_meta ?= "fe550a76832d3c144e7af34ab78d5da0dcf092ce"
+SRCREV_machine:qemuarm ?= "7558103b801174f277373aa9d7d7eedf3a30d5f8"
+SRCREV_machine:qemuarm64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemuloongarch64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemumips ?= "cd21dc96adcb1d60ad6cc57446464abf4dd338fc"
+SRCREV_machine:qemuppc ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemuriscv64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemuriscv32 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemux86 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemux86-64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_machine:qemumips64 ?= "6700dad2e55f71fea268db201a394b371ffdd78c"
+SRCREV_machine ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
+SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


