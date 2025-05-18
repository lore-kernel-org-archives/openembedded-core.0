Return-Path: <alon.barlev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EEBC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 09:36:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.27545.1747561008416808370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 02:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GkR+hF7X;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alon.barlev@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso31551815e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747561006; x=1748165806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vOFuUgIW9D6ezAPCDHokmjubrfCRTov6N1Pja0hqfA=;
        b=GkR+hF7Xo41EnO62pymdb19o/vTJ8l+P+1OUVQRSm+dX1aS03Dza4cNFmDMlDJm4IN
         Ez2VNKVZz+yahTEF2gZOBJAyRkkg95LEZM5vaM235q0vZ20O2axQ8CBEOXfdB8P5Wxqu
         SZBuCN2V98Dxue/+6bn7iUBdG9AAO8C+BYeWCS/16Aam5A45lwuY5j9EOwjuGdS1YtS5
         7IrrRrIBgqlovqAekYi3B3h7xujnrM4bVGM1T3PKGDKnICQaAhXm8LaQcqdlFP8uvc0h
         itYr6mX/0q9I4keCMCAgrSZJs32B9CjZVmUQNOuocHKfabwdxKnLexv+gouPBfEvd9xL
         sxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561006; x=1748165806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vOFuUgIW9D6ezAPCDHokmjubrfCRTov6N1Pja0hqfA=;
        b=mBryC9Q1qhUmxbgWKJboNVx9UBfL2A//PDZmCCWYvrZ+JHDumV17hB+JPHBiOC4Haf
         z3k+vkN3/SUBIMRK7xgnr42MgKh2+53SGm5nfcMwBH3WYECdrBLivMVKhwMiL85Jg2mW
         adNfRGUNabJOGx+HjlNmvgO8Hsj6NXKqZ+Du4KbsP1JL9zjC/7BG/Zp6aEme6268mTEr
         LU3Qk7n8/BivEN6XAOJroX7EMTmDnGYUC/wK/zQSPUREWOAUlVQhyCIOF7AM5Zbwht/U
         KSIvJcgcdv+uWczG3+qaNiEP3FJsEcS/P+NXg/amp6Nr/mH2huGRcACZa19d3Xn/Uu/t
         DZjA==
X-Gm-Message-State: AOJu0YxvVS1uiP4QrhPYYlWJ+LRliaj22cr+Liufgg6IXEcBSkKRcVL0
	ZE5no6Y99TuCgi9WdULlotFPHCMgMw1sLLx4NFfxFkNupkgGx03klPXrxRWol21cM2pDhg==
X-Gm-Gg: ASbGncseqbfa4XYpIJIRPIuTlYXNAGbqWi76d7YZh6iQop8d5Yc1QhJo6lhqMtH0gUl
	KmMsxEsLpHdeZd4UgjLAKryuVUx2ur+fogCzzM2FbQpolv3iIr/IcvS6AGPxvvZi8TKxxnfI+UO
	rJwbjy9nZp/U36Jo/QPPms2nmmhwjrDV8ixnEmrExT9zwsenpxrE+6dnK2y8/HMngau25CxR9I1
	e5CsHmtdM7WyUmXeS7zFBFFAhhhH85GafCvezwZ9VbgB7QjugSAP/vIIIzLj13xk1CI50fb8NjM
	E01wF5Mz+/K2dHs+/bP2gneP4pCTcKXSbh8yPzccG8qwk/bMM6NAkODSWBzBISbW3luB6C6dtnh
	0CBdmJ3KbEfxDRoXxU/bDFwNHsh9U
X-Google-Smtp-Source: AGHT+IGx3CuD6T1rgIhTWVe7zmF1/xlpejktctd1/YH2GJUxeDXoFS+pe2G5UXui0Wa8aaijqAF9RA==
X-Received: by 2002:a05:600c:3e10:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-442fefd780fmr72132445e9.6.1747561006246;
        Sun, 18 May 2025 02:36:46 -0700 (PDT)
Received: from localhost.localdomain (89-138-139-212.bb.netvision.net.il. [89.138.139.212])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef832sm170584295e9.40.2025.05.18.02.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:36:45 -0700 (PDT)
From: Alon Bar-Lev <alon.barlev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Alon Bar-Lev <alon.barlev@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
Date: Sun, 18 May 2025 12:36:07 +0300
Message-ID: <20250518093607.580549-1-alon.barlev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
References: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 09:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216773

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


