Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30832C6FA8D
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.5359.1663078707858202802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=exKuuPc7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id y127so11908836pfy.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=G1J61YBQ/0d+wUxUrsu+nNt6tOD2S9swLe7hxv0jGLk=;
        b=exKuuPc7GEHQyPpBV0VTxJgR93R7L3Y4tkzMJniqS3DGo78RnsFwDVUOurcRo3xqea
         6tLo+U4t1C52NRGfnSTblSlplfI4fpQdlTHYZ5PH+USi/5Jfr2NwTH+JbggRaXmVihiI
         vWtiAV4dN2GLFlY+E8iqDCsRCSOxlqRFGd8SncrmRsxGgYZrw0NwPKjzgaV8SUef8WaF
         BskI5v90weQIgl4SVPJyX1fG5jwfOdCap3d7ILSKddJ43OoU0wYnIhUPBc+UdU4cw+jb
         UjU3c0EnFxMMpGeXhSXjW+BX4T6tM/MOEnj8BvXPSZcCTsJEU+QSSoTuO1YUrBVJtBbP
         4lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G1J61YBQ/0d+wUxUrsu+nNt6tOD2S9swLe7hxv0jGLk=;
        b=7l48fg8lUyQDdFE07nzGsrb1TDa+t1skVn6w9YIIo2MsnB00epFXz2ewap5qTw6t/U
         qm7NgP1biHXODGm8MUs7isyL5oCZHXRJFE0gBjANwXKoqqGO4XU5X16rxF9FOUoC3eTq
         mhcSKDC6QD4+0wN480GU3AkI8d/5bzV3yw4+NGVWSV9o44EB7zBahkjIhhCfulcvBsS/
         jHOK63oGr94XdgUA7H6nv8UkyCwv6aBCLUJQdjOL9d6Wjk/wz/R1ErAlhfaEa8m9woLt
         a33LScUzcYbGW42wnfxa5zrg6saInKrbxu9Q/t2gQ3AddTMI+XRm3i70F34+snGymcUL
         cz1Q==
X-Gm-Message-State: ACgBeo0AiTUNu1Bbxc8XIOgP27Rhdsr6TdHCLk22qVIaNtph2HqlQ249
	vwpzfMx7+EjYQ8P8Y5rnFrtzfBlYdFIkvufa
X-Google-Smtp-Source: 
 AA6agR5YGAXNZqPlNjgSgzphwAfA0+NjKUn4kzVngvKWt/kfGOIqV7UbItCvm+qCDd1In1sdRnXz2w==
X-Received: by 2002:a62:6347:0:b0:531:c5a7:b209 with SMTP id
 x68-20020a626347000000b00531c5a7b209mr33009029pfb.60.1663078706892;
        Tue, 13 Sep 2022 07:18:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] kernel: Use consistent make flags for
 menuconfig
Date: Tue, 13 Sep 2022 04:17:47 -1000
Message-Id: 
 <e36f3c3c7de052945edbb62bb2d6de7639360c47.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170585

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're currently only passing in a subset of the kernel make flags to
menuconfig. Fix this to be consistent with all the other kernel
operations since these are becomming increasingly reliant on host
compilers and flags and target toolchains as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c616bc090d1834a21073a33209323220c05d2e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index aca03fc071..8dff68612d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -637,7 +637,8 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND:append = " PAHOLE=false LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+# Need LD, HOSTLDFLAGS and more for config operations
+KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
 
 EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
-- 
2.25.1


