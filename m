Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F51C3DA40
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.9067.1690468596002730589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oJ6MgNzb;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso15593521fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468594; x=1691073394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYi9dj87oiWaOJBvb0z8m3MxuMOCxLg3YWEONBMin5Y=;
        b=oJ6MgNzbCvHfo3YsGPxYQgLRZZEO7C/TOeKiRwtJz+Ezrp7z9lvxMbKGqReFw8rSKA
         aiuAbNuw2rsLwGrQJWjfLNE0D7J+3dLmkqWKqpAA3oOAOGEH9oTLhPIcN4BLtlkvkXpf
         Z/fKaht0Ixgss1hwwXGnqeIKFYa7UJWjBNKUw7gZfjaqiYn0kFluYSC9UYI/g0MwagNO
         mxFvy1tpRzeXNnt0ca1btl5DDWMLnzPK5zS/K4RmH6dbUFAkLuHrDI50CUxkuc6B0Ran
         IHj6jQrmzpDBp6EVQxsUlopMoWjKhY1u3u8oISlQpV12BLnBe6srMY2gLmKrnQ2dp36I
         bNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468594; x=1691073394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYi9dj87oiWaOJBvb0z8m3MxuMOCxLg3YWEONBMin5Y=;
        b=kgKBPVZfo8bKv5IexSrVIaLbJd7uA+nqPMpOY3VtC0PCvCGktuCXp4YRLAz2ysg7Wp
         GyMQxjXb4JM+2SyaRUOi46j84e5ButfIkMHgGwxaZh+zFipSvu3YWlo19PAZQIPjg8Ml
         1KNCaOhtVLYfqy36bnGD1WW+QoGf7gkWBLJlCnJh97xRHjMgCcRY80RTESjxSxbIC7mF
         KqV7whv/J8xP3yXlFYdZlTQimxNxOVqOb3eY112BHJcfxyPMITLwFf7Ty6M2dkxcfHAh
         x6Y1IGSSJdz0C2HmvHgtd3rbPeJhD5FyQMxV7til2bgRKpGdn9hRLVX7Gg/VtoODotUO
         ir2w==
X-Gm-Message-State: ABy/qLbitvH+MZS9M5rzu9aGf3Rs3HGUJRo0+42wjB465fgmFcjZU+Vf
	8XtrmEpM9P6ly9RKIb2Vl119oWvo0H0=
X-Google-Smtp-Source: APBJJlHCq//UucaVPLPPkx4slVi6++R3oDpYwSFYWMly0hUjE/WNG6C61w6++lCUrrN86qJuyHokYA==
X-Received: by 2002:a2e:8704:0:b0:2b9:3883:a765 with SMTP id m4-20020a2e8704000000b002b93883a765mr2045529lji.31.1690468594101;
        Thu, 27 Jul 2023 07:36:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
Date: Thu, 27 Jul 2023 16:36:14 +0200
Message-Id: <20230727143627.3718496-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184948

Unset LDFLAGS as the standard ones do not work when linking EFI binaries
(the new version of gnu-efi adds various apps).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gnu-efi/{gnu-efi_3.0.15.bb => gnu-efi_3.0.17.bb}      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.15.bb => gnu-efi_3.0.17.bb} (93%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
similarity index 93%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
index 5ae6f391ae9..547c469d19f 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
@@ -17,7 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[sha256sum] = "931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea"
+SRC_URI[sha256sum] = "7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
@@ -34,6 +34,10 @@ def gnu_efi_arch(d):
         return "ia32"
     return tarch
 
+do_compile:prepend() {
+    unset LDFLAGS
+}
+
 EXTRA_OEMAKE = "'ARCH=${@gnu_efi_arch(d)}' 'CC=${CC}' 'AS=${AS}' 'LD=${LD}' 'AR=${AR}' \
                 'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}' 'LIBDIR=${libdir}' \
                 "
@@ -46,7 +50,7 @@ do_install() {
         oe_runmake install INSTALLROOT="${D}"
 }
 
-FILES:${PN} += "${libdir}/*.lds"
+FILES:${PN} += "${libdir}/*.lds ${libdir}/gnuefi/apps"
 
 # 64-bit binaries are expected for EFI when targeting X32
 INSANE_SKIP:${PN}-dev:append:linux-gnux32 = " arch"
-- 
2.30.2


