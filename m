Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A33EC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:33 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.23203.1693924645974952774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J+K8g2pq;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76f0807acb6so155557385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924645; x=1694529445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VazCIuU4EgxHj8yWn1+fddylUoSmaDJO+XsNcvKzRXw=;
        b=J+K8g2pqu+uFxBbNNVEfgiNDRDM0UuNvuBxDEy4FZ2SytTkJFYQ9zTx2/JJvblHnO2
         u4c1+fLI/rZFdl3LDHj4Np5aIr7fMOaYl6fjHfIiAlBq8ZF3zFFDyfSN/z5gJbJmWb9c
         aq5KpA+4PLku7zUkIwT1eJ7TORKevOeobw25qWOPXZ2/holsB6rXrOA3Qh+3vJz0qICf
         Y5ouXXKPHtOMmgC7oyGthMeBAd1D+t60Dt1GexArjFlUa0hNEXyDR4UbjG52mbgjNqpO
         EHRznKkPiDDBgCCJc4gfKod1mP8dG+zFWBbHNFm9evTgmSS4YSQR+5ORHOAT3ey+KJxH
         58UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924645; x=1694529445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VazCIuU4EgxHj8yWn1+fddylUoSmaDJO+XsNcvKzRXw=;
        b=C4lNijI0bWPMdlzTQle8Mnf96GP7sGKV8qS38RO/FpVdRHoONB1gcIv76QPpOHP5+l
         lxGenViWnb0zCM7ZwI64dg8tddPseb27EBEy0KNck5ddqoh1pXJcZW0jNNf7SdQYF/cD
         24FVPuHdJN34KeYVnPAI38sHxc+axtkuo83iD1Tp4EwvFG135JMCV6+fELFUo6aNN8Lp
         VqNIieQKfaldl4ynsOt0Wjvq+6cn18BT1F3BMZk0X1nnZlX5hVcQhFJ/SK/7mUAyx2+8
         jT092ZuLv0NQWtK3cARoIBE8cseYCrDpHJFvpuCyhjwEToQLX5CRlh8UJ1/3DglN6poS
         09Uw==
X-Gm-Message-State: AOJu0YziziSMnCDx2NIAvqiP9IorZWbFVOfmJ3MdnwnEsA64oLVMg8w+
	vtnDgZIuNv8AHWWaOM3a3Iy2xjAj6Xpf1g==
X-Google-Smtp-Source: AGHT+IFgDdeJapxGJaCHtm+KGYAqJn7q+T/8Upj7TyLYOvJ0f3xF7Bxn43KuY+3vHXOXHcECq6sHMQ==
X-Received: by 2002:a05:620a:bca:b0:76c:b293:84f with SMTP id s10-20020a05620a0bca00b0076cb293084fmr14554263qki.21.1693924644982;
        Tue, 05 Sep 2023 07:37:24 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto: add gzip-native to DEPENDS
Date: Tue,  5 Sep 2023 10:37:14 -0400
Message-Id: <f3349fa06ed7e549e1ae15ac3e18ef779d34f8b8.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187224

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building a compressed kernel image on a host with an older
gzip, the following error can occur:

  ERROR: linux-yocto-6.4.11+git-r0 do_compile: oe_runmake failed
  ERROR: linux-yocto-6.4.11+git-r0 do_compile: ExecutionError('tmp/work/qemux86_64-poky-linux/linux-yocto/6.4.11+git/temp/run.do_compile.1715845', 1, None, None)
  ERROR: Logfile of failure stored in: tmp/work/qemux86_64-poky-linux/linux-yocto/6.4.11+git/temp/log.do_compile.1715845
  Log data follows:
  | DEBUG: Executing shell function do_compile
  | NOTE: KBUILD_BUILD_TIMESTAMP: Mon Aug 21 15:35:20 UTC 2023
  | NOTE: make -j 24 CC=x86_64-poky-linux-gcc  -fuse-ld=bfd -fcanon-prefix-map -fmacro-prefix-map=tmp/work-shared/qemux86-64/kernel-source=/usr/src/debug/linux-yocto/6.4.11+git-r0 -fdebug-prefix-map=tmp/work-shared/qemux86e
  |   GEN     Makefile
  |   DESCEND objtool
  |   CALL tmp/work-shared/qemux86-64/kernel-source/scripts/checksyscalls.sh
  | make[3]: 'install_headers' is up to date.
  |   GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  | gzip: abort: zlib version less than 1.2.3

We can't juse depend on zlib-native, as gzip isn't built by the
kernel as a tool, so we add gzip-native to our DEPENDS and the
issue is resolved.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0cc303c009..945e7bb9d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -18,7 +18,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN")))
 }
 
-DEPENDS += "xz-native bc-native"
+DEPENDS += "xz-native bc-native gzip-native"
 DEPENDS:append:aarch64 = " libgcc"
 KERNEL_CC:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
-- 
2.34.1


