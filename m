Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB285C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1982.1667356951013526101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TQ/G/9AK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id v17so12280586plo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PldM+O25GLhwbwunL7t6Hzh5tblSi6nTeCn47LQrhfU=;
        b=TQ/G/9AKbOk27LKIr+2xAcRzMLywh3dnh6T1urFqVM9T6owRC2/uQZ1k6fmo3OO96G
         JzRaY+liR27sw7m7qG4Xb23EAOxWnn0M2929RsuO0DapuyAevnc6EuhTUYY3ow72JvYT
         Hii2obada/mJlHPYBonoGkXHAD9G+x91Xx8pteu7DYH3U9mnmZl+CALWd4zD46P/VLzj
         SQqdzPF27ac6yhd7NYDeW3YUXo8+AEUIaAQe1al95kIRXXOZ37oY3op415+rRxFdRcF3
         Bl5U4KuB1swnCcBbcHGN2l5NDyIiT6sK4MFyP++bdCSp4JVv02vG9jWR1S2UmHGKy3Kl
         QykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PldM+O25GLhwbwunL7t6Hzh5tblSi6nTeCn47LQrhfU=;
        b=EV1vaevNcFlCkjCovz8Bo91ecMJHvitVCZkNKuDhMsnov+GGY9yQLW8CrN1o7jupMJ
         suxqeYpJoQquXnwtbkKqYWmMSxUarcANFDNbVcecoeVgl9KW3gNsLeNtCePwb0anTvti
         p28xig6sRmEpBPrAO8Q7cwvTjnXNVNzkFslJU+Fm6Kds0+x1YElqsqOoc0CEUaCRWC36
         iYM3uNIS10AA215hzKl1cgnM92Po48DoYvv6ixT6zLmwCHPChKyNG+NXedeH9JRn781Y
         mSHJX8NXfyH8zCejI2Yy8I2x3trnbo04TPJaIGyjb8MoOsVFUsmMlQkTTvEkpoZudqJK
         kC9w==
X-Gm-Message-State: ACrzQf06+79vsRaZepS5l71K4iJrT3/fVeg9hW77AM/SU3PN83wOd028
	CZ1iflrQOjyeC+XOSHcbx4dOGrS1ZOtuGLE3
X-Google-Smtp-Source: AMsMyM7LG3q9fNaWGNDrxM9ZWuT31OcKyBBDKGSPA/tzMDQEVsZeUIiQz/6JnI5jyb63W4BKW/Rp8Q==
X-Received: by 2002:a17:903:289:b0:186:a8a8:e99a with SMTP id j9-20020a170903028900b00186a8a8e99amr22151117plr.104.1667356972068;
        Tue, 01 Nov 2022 19:42:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/20] mesa: only apply patch to fix ALWAYS_INLINE for native
Date: Tue,  1 Nov 2022 16:42:04 -1000
Message-Id: <f6fb2da56ef1f35b536ebf62a03e10bba59d8276.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172554

From: Kai Kang <kai.kang@windriver.com>

0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
needed by target mesa any more. But it still fails to compile
mesa-native without this patch when DEBUG_BUILD is enabled on Ubuntu
18.04 with gcc 7.5.0:

| ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function ‘nir_opt_move_block’:
| ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining failed in call to
    always_inline ‘src_is_ssa’: indirect function call with a yet undetermined callee
|  src_is_ssa(nir_src *src, void *state)
|  ^~~~~~~~~~

So only apply it for mesa-native.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c6a6d0c2680799683d58968c2558a224f27caaa2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8a74e0a80a..c94e439363 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,9 +19,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
-           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
 
+# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
+SRC_URI:append:class-native = " file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
+
 SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


