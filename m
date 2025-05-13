Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D12C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:44 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.84926.1747163320771417074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GgNlKcnj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c336fcdaaso56965695ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163320; x=1747768120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwMioiLYPIozsK+s/9GGu4Dz1cjyatX+xPYO7rBI0Xk=;
        b=GgNlKcnjTzQrpK2ush3GmADGll2IhejuNV8PxztHabtXJnFyKwys4rZrCnaLucO6qU
         fPPIZXA0lYPhucsZLxCqbDMjrmg+PFIeUsoInI717zQHaim1aLSXijyGsTZqLS03ANLY
         +Zi1a5aiElPs+n70J1dyztDhVWOxG26Q0xMnuPpSuWuLvByD0HfvX01vSmyjyc9+O9Nk
         fWuB8wQneBUZvKS0oEiViTn2xEshH86FaaQYHMqNF9RKy3BQksLgnw5I0YGesAT80vp8
         K15qYgLO5zBvOyu+9sMdBNDUfPwgYDP1qLZF0hR2a7ZjzzsxqZQpXQUHfrwEYubmW78q
         tq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163320; x=1747768120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwMioiLYPIozsK+s/9GGu4Dz1cjyatX+xPYO7rBI0Xk=;
        b=MEgoSEeUeM4uKTUPIYHFmdw8ZRnBhdIUWfH3wbWmLSBQhW2SKs8DYCtIaPP4BArWT2
         rLmEt0s0lY3RerXZHzwv991QfRcjH6kElasB/UdzaSBps2qwRyac+w/u6DnBYZJhscN8
         s4g8THnsbmgXYhgPaMe653RmLOnFZ/OYMsOBS7We/eLpKs0wI77IjS0aVEVknnJ0+TbC
         FGErxa5owXDqPzKSh0BDqIn6zR1/ynBPi2JD3u3TSdgZyZlHtkPhnJdmBQQX5+Vao9IR
         3AXfFZ/pBbDYUMern5vs11aM798FVV3vAXdkPYUVcU9WF4IDogRplzl+pgOurpb4k5PJ
         SSMQ==
X-Gm-Message-State: AOJu0YxkGL9pPGulPT3HCioqIGHwV5p6n+SryP+aly4Chor5a/p+ggA7
	/e1XrroQ5xV14t23Hit2qSxsPWBC+kMOgeinyAnGlgcatb8e5EwP/2v2s4qo1I3YJDftWHk9AvU
	h
X-Gm-Gg: ASbGncuCh5/mRbW0Y3wvlGmHsUWkHMoJkr8d3PeDWLJzqKHtMmSiXb681XXODLr5nca
	KG2x9c4ieKwekbHP/jR9TcM11l4tRlpJysOQ5BaFYnCE6/HB8JoIKIgrl/tG1ML9QG4t0Fqf75/
	bpNwIa5Y1TSLhqI7/jGvnkdiROyxSBIYFwS892hY3Huka1GHY5q8+WQ6QeOHTbQeRXI1+q+g5Wm
	4AoCVTflLVTCC9O0TBy+SCbgP/D9j1ITv2Mjlh4YFjz8LXxXCcC8tTbbZz/gQ1MXXjEhlW1uYL0
	lRAu7qyX6GRJhQiXkwgggJA05l4Mnr5hc6hSlZDicBE=
X-Google-Smtp-Source: AGHT+IH6YmYmBC0X5Ra8hchH+rxlESvi8HoW3GJk3ab0PL8zAPdjcaMWCetYidoQToGbgv8czZSboA==
X-Received: by 2002:a17:902:e88a:b0:224:162:a3e0 with SMTP id d9443c01a7336-2319816fab6mr7536065ad.49.1747163319979;
        Tue, 13 May 2025 12:08:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
Date: Tue, 13 May 2025 12:08:11 -0700
Message-ID: <1403ffa42014ad5c88c28da6c360ea5fd1857147.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216447

From: Alon Bar-Lev <alon.barlev@gmail.com>

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

Signed-off-by: Alon Bar-Lev <alon.barlev@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ef80eeda967a9e04ff91c3583aabbc35c9868e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/module.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index a09ec3ed1e..2315f3c834 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -51,6 +51,7 @@ module_do_install() {
 	           INSTALL_FW_PATH="${D}${nonarch_base_libdir}/firmware" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
+		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 	           ${MODULES_INSTALL_TARGET}
 
 	if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" ] ; then
-- 
2.43.0


