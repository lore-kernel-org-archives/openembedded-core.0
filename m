Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DB3C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:57 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.802.1637704676655796866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYfaiASH;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id o17so732912qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tfgslNhFAFObuFTQBVzUvWWWSLroURSP+sdRNuEqUY=;
        b=VYfaiASHXcd0JY1cIPlbyeTdH32FwSf2cIiab7bnZMx/CVacaZ2JRXW7CQmbSRRR3w
         gPG5xTtU+XuRJbpj76qBj0lOJZ7OFgqc30CYUO9LqEpv8hZQzE53m+qsjsVg7T5iR/Gn
         ShCDwWSFRRYlUSYmHhEk9SWnxd/ZkyJncTeh2d5WG0c0Z5T4fe+gdkmRQvT15ypwCHAn
         fI5/j5mEvKiseL+R8XfsFzGbkm4B0ZtwUBfrd47vHiuQUedTX8MtqeHhLOzFP6W+T4JZ
         fMoTJ9la/n09C7hry7F/M9YFlZwUi4WNXL4c62jJbb7z8/qqbuQqdaBcfo0E9Rk6bugr
         /EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tfgslNhFAFObuFTQBVzUvWWWSLroURSP+sdRNuEqUY=;
        b=BhmKlkUiciwoBKf01C0+32XelXkrtAvoQyd5YaiTv1UZOIE/J0kAJQo93RTfoF5uyn
         rdnmcnrysvr2KBIV62FFc0+ZQC84xJWwyUYRSlYDhbsLO0N/VANy9EaHllyPmrxZ5M5V
         eDCxI9o65tNJBa0DE9KbUiXsO2Qkzlnrsyk/M+yIMS/V1OWs8HjFz6ruePB+ATl204ZK
         i51SgPJoA5f46arQ/oa4T/uGf8NkDZ8TssRd+bV8SZBSbQlpSznMGd53ZlXcgc9iHNYG
         Ls8FxB9m0PgarjhlhrYSh6bUPVmkEH8jYJYhChGBDfAcs4nhbIu/fIeIkOEAbPrYXhmo
         Phkw==
X-Gm-Message-State: AOAM530dd8RRm3Y/oDrPuNpaJorHTKAQdP7kvRDzCTyAaMXTT/Un3G3I
	B1ujoU4L3pSFXTnMGmmSIoHwcie1WYF0Rg==
X-Google-Smtp-Source: 
 ABdhPJwzo7aI+ixOsx34dzGNSPiXrNwxeNll7En5Oz3rbuXJzAdLbXFc48gLlpuWvjsse+2YaWO++w==
X-Received: by 2002:ac8:7f43:: with SMTP id g3mr857675qtk.127.1637704675784;
        Tue, 23 Nov 2021 13:57:55 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 06/20] kernel: export native PKGCONFIG variables
Date: Tue, 23 Nov 2021 16:57:33 -0500
Message-Id: 
 <a3b22eea04c306fc100277213b7b340fa437ebb2.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158627

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In a similar manner to cml1.bbclass, we export the pkg-config
variables to allow a direct call to pkg-config access to the
native sysroot versus the target sysroot.

The kernel doesn't use pkg-config for target configuration,
and has many explicit calls to pkg-config, without the
possibility of easy override to pkg-config-native.

The calls to pkg-config could be made cross friendly via
replacement with make variables, but until that effort is
undertaken upstream, we need a bridge approach.

In particular, this is required for dtschema validation,
which is a requirement in kernel 5.16+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e0b752de19..2d219cb5e5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -326,6 +326,13 @@ KERNEL_DEBUG_TIMESTAMPS ??= "0"
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+
+	# setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
+	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
+	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
+	export PKG_CONFIG_SYSROOT_DIR=""
+
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
-- 
2.19.1


