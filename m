Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A466EECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 16:47:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.14180.1661878053790696783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SRCBmgWR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id d5so6077779wms.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2mmAzigZDVSrbKbkALpFE+YkAfR2iVzcTzDBoWzCt44=;
        b=SRCBmgWRpvemcFHf3xArggZT9PWGASNodaolU/fmZkbr84npx/0ttsnvudL0Ur+DX4
         sq6Uz8zWfpLOJVxaPXoEd4dLG2DkyG2Ej4L/053Ad2d8pakL+LlOHy2itZwn6mUGJFhU
         wAjpLpl5JdQHIHtY7MLwqdE9OaoRHbZHLH5nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2mmAzigZDVSrbKbkALpFE+YkAfR2iVzcTzDBoWzCt44=;
        b=a4EsY2+Y8NDVKXXZ03HHWOS2RNfcVrJFbM8h01BKdgdH3Kdt1o4r9fXB0H+N+M4Rft
         LqtqwhhiUNL/xeheRJXH86d3ND0Y54mqZtx6EOlCXClVIOsn/bXqRfYVRIpCTjf9s0Rs
         m7QyO5I+NLOJHv/9sELtcYPoDjeLzkHbDBaSudq9sjzLaXkQInSSrXUR/9ZFC+2knVqn
         pHTOr7JKkfLumxCmSFuxziJyh1jzoqMEsKIC8WfPQUm1b1TTaFJs6QNG/X9qLVvVy7/b
         wX16uzN2x/y2hbGoYyudxmTvmgNG/rtwplSC1jxZUuptImVTvbFmGd16RGWj2Womfoz6
         EOkQ==
X-Gm-Message-State: ACgBeo21RUWqoDuXzXJv5ECNhQDfNrCnIPd8RzcPd6Bc1xyNTP2q9Mi2
	iJgkZwm9y2Zyh94P8NcUPGy4AlzfZZgKQA==
X-Google-Smtp-Source: 
 AA6agR7YixuSSUD8l+U+6dYRLBpDurai8PDiR/Iaz0zdJx9qo2mUruZhmabbRUp7HCAGIdg7UYYX1w==
X-Received: by 2002:a7b:c34b:0:b0:3a6:8516:a729 with SMTP id
 l11-20020a7bc34b000000b003a68516a729mr10444613wmj.83.1661878052005;
        Tue, 30 Aug 2022 09:47:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5ba6:cf0e:f253:2cdf])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4850000000b0022546f469e1sm9848651wrs.28.2022.08.30.09.47.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:47:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] mesa: Rework llvm handling
Date: Tue, 30 Aug 2022 17:47:28 +0100
Message-Id: <20220830164728.124219-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830164728.124219-1-richard.purdie@linuxfoundation.org>
References: <20220830164728.124219-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 16:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170079

meson in mesa no longer uses WANT_LLVM_RELEASE and LLVM_CONFIG so drop
those. Instead, copy the llvm-config binary into the target sysroot which
allows the paths to be relocated to the target in question. This should allow
the llvm patch for YOCTO_ALTERNATE_EXE_PATH to be dropped assuming nothing
else relies upon it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c4efc134387..d850246724b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -55,11 +55,17 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
-export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
-export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-
+# By placing llvm-config in the target sysroot bindir, it will then map values
+# to the target libdir magically. We can safely add to path as there are no other binaries
+# there.
+PATH:prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR}:"
 MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
+do_configure:prepend () {
+	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
+		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
+		cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
+	fi
+}
 
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
-- 
2.34.1


