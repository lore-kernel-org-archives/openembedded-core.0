Return-Path: <alon.barlev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40446C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 09:38:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.27563.1747561113084087276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 02:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPH+HNiw;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alon.barlev@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so21792095e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747561111; x=1748165911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vOFuUgIW9D6ezAPCDHokmjubrfCRTov6N1Pja0hqfA=;
        b=XPH+HNiwrk7MqomoqLKIrz6m8l9bVDaYQ/0YvI+VUxqD/0dCkcIZlm/yhjfSGj2d4L
         GybJPl2UWg8WGWQHvbjGvYKogljxK5SeR++Ro9I1CbLjDoD0YpdbSIGFJUIstfEamlGh
         76QnSQaHnTl5qqc8pjqGQwpYThsJvFCErjOThWyDg6e0b8tHuIoyBrk7aoATe+qeiAk/
         SwQ711GhVnl6CZKoVi97Ns+Pmn9/Nex/cwydhAj9+ydBWwXeNGJHn1oyfEsB3RsmKqpe
         ZTVEKEa0UW6mUbyH17AUwGbyYLtEREtcyC9Hwlj8timpmnQowmSqREcdWVltrTHn/vpN
         c8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561111; x=1748165911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vOFuUgIW9D6ezAPCDHokmjubrfCRTov6N1Pja0hqfA=;
        b=azTiZrdTERSrlA/kOc3ORsIbY/14s7g8H/8mffdgZnuAAyLrS5Ahcz77qspuyqEDdl
         jymHnxJpHcjKFdP8d24bQPwDY7+jyY9A4ndBn3NxfHTiUJfCPFQlN2vSyG/xjndzW1FZ
         HdIHosIxyQl46h/FYBQt8gPl/2/JnC4unsP2oBD7PJQBXo9e40KtvKTmuMUBwPkiUf45
         myeRNMEQk75t9EVImoEUNWlB4L2AFpVdpdPphiK7Ok5bW/O6GCasORvn1gKq+1zJ173H
         0t9WR8D+FfhGks/mm4kyB4VpSVZCDE5tTT28FrFRRGH38Be5XXTcASevY+ZonfaZ1bkE
         9hnw==
X-Gm-Message-State: AOJu0YzWxa/Itm0zMOhuhQtNrwcYY/Jxs3+fh6mM0lke7HOIlIsVN2Oa
	/s5GNQrJQ8t5arKvPnaBIqeqkGR7v57rDbOlUydNIsSCXinW1ta3GW3KzoQtTEUSufrpwQ==
X-Gm-Gg: ASbGncvT7jsTAIKIt422/p2S3GTgQ1VAu/ZdZriY+g/JshI0REIkbCC9Oiewhi9BhXL
	TDEZHUl3CEIjzoSKI8fTiYV877CiJ0gOoBSs/m8cV+/a+R3bPwMTrmiOpgoh2ph0IRkhTGsJyDb
	cfitOlPHnQyW8BYaJXWJ9NFtkObxvg3lHOOmVCOWNGA1x1tw+e71JZxy4wl4UDenY+BvBVrpUCQ
	/pZx/tdB5rLfyLM2fDDgjSeS/KZToO76UI5cCnoJy5Ls1tki/qk4ms7gUNV3fLLQAXky9TP4TOx
	6p0HZgMM39wuj2GXk8vg077SP2JzqugxdkA/8T3x36kP9AepF117h/XrV6EXLWUfZN+XFkj2yUG
	/zwnke2Jgcs9iflWbfqBRYPGPajcl
X-Google-Smtp-Source: AGHT+IG1tUi3cnfFdifiQe1X6nlfD0WZ+O9KsTvx/y9rjiVLo0nRB1wAZEFj5NFTlN89JMxfQLlzEQ==
X-Received: by 2002:a05:600c:1da8:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-442fd94e9c5mr88728015e9.8.1747561110973;
        Sun, 18 May 2025 02:38:30 -0700 (PDT)
Received: from localhost.localdomain (89-138-139-212.bb.netvision.net.il. [89.138.139.212])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm8696119f8f.87.2025.05.18.02.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:38:30 -0700 (PDT)
From: Alon Bar-Lev <alon.barlev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Alon Bar-Lev <alon.barlev@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [walnascar][PATCH] module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
Date: Sun, 18 May 2025 12:38:00 +0300
Message-ID: <20250518093800.580628-1-alon.barlev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
References: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 09:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216774

Symbols are used during install as well, adding KBUILD_EXTRA_SYMBOLS enables
successful installation.

    | DEBUG: Executing shell function do_install
    | NOTE: make -j 22 KERNEL_SRC=xxx/kernel-source -C xxx/drivers
    KDIR=xxx/kernel-source DEPMOD=echo
    MODLIB=xxx/image/lib/modules/6.6.75-yocto-standard-00189-g530c419bc9db
    INSTALL_FW_PATH=xxx/image/lib/firmware CC=aarch64-poky-linux-gcc
    -fuse-ld=bfd -fcanon-prefix-map  LD=aarch64-poky-linux-ld.bfd
    OBJCOPY=aarch64-poky-linux-objcopy  STRIP=aarch64-poky-linux-strip
    O=xxx/kernel-build-artifacts modules_install
    | make: Entering directory 'xxx/drivers'
    | make -C xxx/kernel-source M=xxx/drivers modules
    | make[1]: Entering directory 'xxx/kernel-source'
    | make[2]: Entering directory 'xxx/kernel-build-artifacts'
    |   MODPOST xxx/drivers/Module.symvers
    | ERROR: modpost: "xxx" [xxx/xxx.ko] undefined!

(From OE-Core rev: 0ef80eeda967a9e04ff91c3583aabbc35c9868e8)

Signed-off-by: Alon Bar-Lev <alon.barlev@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/module.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index f2f0b25a2d..4948e995c5 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -65,6 +65,7 @@ module_do_install() {
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
 	           STRIP="${KERNEL_STRIP}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
+		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 	           ${MODULES_INSTALL_TARGET}
 
 	if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" ] ; then
-- 
2.43.0


