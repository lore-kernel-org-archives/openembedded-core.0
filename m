Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065C0C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:26:34 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.6466.1646731592351182158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=C7Uho0IW;
 spf=pass (domain: linaro.org, ip: 209.85.208.171,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id v28so24146592ljv.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zJXgyrV9mei1Z7uscwiFJ8jX/hLJ4QyEaHspdb38wPY=;
        b=C7Uho0IWwC6VGQ4tWm9DCegpU+KayKbRUu38Sv6hLhoaA5+3C8nivDfW7C/XPoFEid
         dPqOwVz/HVZgTJ/Z6hRphBG0dhRPknpz2iSFaMGJ8S35tY5SCg4+65HWwwZXy0Y66Pou
         H3LxpncTrmQnMAKJZQmuWgS3PHHkybmfM2dyMx/Ehd6ALR5m1KqJ1YbEuOS/RMllBj4H
         l3bcKvgyfcG5jglEQ/1iBTd4yj+h3dxHl9TIoTbg/9XhM9Ryz4Z2ah3V3tNMJ3ixymXY
         sYr3/zHmexYQeiKD5uLGuh/GppZmPBKAB/6BC1QiWDu7d7U+9qMkeQAOZ1/5Gh1d5oVk
         ARVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zJXgyrV9mei1Z7uscwiFJ8jX/hLJ4QyEaHspdb38wPY=;
        b=I6KxpsayAoP2KLM7I4ZCuTUiMQEs5Bih2xeT+f1ePCOI/7KyQG/g7lcwzpM6BZMc+o
         y9YZLBnOBXzAmkYaBwVxPXXtuvrHU7fZWCqUE2PgmR+r4a7v8hbIjR7dzNTUpXyCyPYu
         wgDHjD5bNJx/+SIRRdsSsYkeceJyogG3j3v/155Hpo6O0332DuwEMXbDgyolV4z3ttGb
         YBZoYDNbul+NaTSVsjf7xYXyk8bjs3SpC32BRkjdX3Ypv6awTUqJjJ0aZv98TkkOKv07
         BVX4535w9qqpWUrd3lIm+RVgIOlq664iTt4BUwcNw1tPUW5/w/F+4uabl7KrsOvNa/rx
         +Z9Q==
X-Gm-Message-State: AOAM531vxu+43GbZGY4flHwPvQbQ3pJlXs+Q+meBrcUyjb6JTPkOc1/X
	2GxIOfWhwmCWCXBgSrNFQuSql/CrM98e1oux3I/OHS8TTvnlPw==
X-Google-Smtp-Source: 
 ABdhPJw5AQqbxh6dnsVwVpw7JMEB/YjCZEzfbwyhgZUOEWEzMqK3NGFcdmZNlsbOYv1hFPqXHjTGUGYwqgkjXlHyLu4=
X-Received: by 2002:a2e:bc0e:0:b0:247:f348:d6dd with SMTP id
 b14-20020a2ebc0e000000b00247f348d6ddmr1101625ljf.323.1646731589966; Tue, 08
 Mar 2022 01:26:29 -0800 (PST)
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 8 Mar 2022 14:56:18 +0530
Message-ID: 
 <CAFA6WYPbMYuHXHaHDe3qkDFoPE8senbZWhJjuUXmuZ6d9-2=2w@mail.gmail.com>
Subject: Linux kernel GCC plugins build failure with SDK toolchain
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: raj.khem@gmail.co, Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162877

Hi,

We have recently observed Linux kernel build failures while using SDK
toolchain (built using gcc-cross-canadian_<version>.bb) especially
after upstream changed the way to detect presence of GCC plugins here
[1]. Logs below:

  HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  SYSNR   arch/arm/include/generated/asm/unistd-nr.h
  GEN     arch/arm/include/generated/asm/mach-types.h
  SYSTBL  arch/arm/include/generated/calls-oabi.S
  SYSTBL  arch/arm/include/generated/calls-eabi.S
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/empty.o
cc1: error: cannot load plugin ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so
   ./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
_ZN8opt_pass14set_pass_paramEjb
make[1]: *** [scripts/Makefile.build:280: scripts/mod/empty.o] Error 1
make: *** [Makefile:1214: prepare0] Error 2

This is reproducible with current OE core dunfell (gcc9.3) and
honister (gcc 11). But strangely this issue is not seen while building
kernel as part of OE build using normal cross toolchain (built using
gcc-cross_<version>.bb).

I have tried to compare the two recipes: gcc-cross_<version>.bb and
gcc-cross-canadian_<version>.bb but can't find anything explicit which
can cause this behaviour. Also, following hack does disable GCC
plugins detection during kernel build leading to a successful build:

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 553ef7fe62..5529932472 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -73,8 +73,6 @@ FILES_${PN} = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.* \
     ${includedir}/c++/${BINV} \
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \

Thoughts?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e860048c53ee77ee9870dcce94847a28544b753

Regards,
Sumit

