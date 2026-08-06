Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B11C55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:14:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12813.1785993286663223904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X1/oIAcn;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954afac04bso18713305e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 22:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993285; x=1786598085; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UamD8LC9Ob41ervZlIjlJNXWuPpzE3H3vVphI7AEY7c=;
        b=X1/oIAcnwLNdY0ND8s52q3oFPIL4/shZCXtfdrAUVOPCvdgOtsPzU5T8U0+mq51F/7
         NNi1b3TkDedwXkxwhr3q5CwZweAn9d7P76Dv2F6GtHZLUrSOhMPDddFeu/47ZfePmN0P
         nEVntWBUvtlmcW02o6BdaInbbckTYWK1CzinAqXXCML75W+06LQFSi7JHWLkr4eUYk3F
         xGByk+qKC02PkmIzljz1xNCK8aU4+p2S1EF+2HLierWJWgoWC6XDumCRkWCb4zhd7hJ1
         UnV/r2r28AX9r5GqlXrr7oTxteIXY94pa+c/o7Ldx6ulPF/MRaDqxLlqw08Sj2/KjQxy
         aHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993285; x=1786598085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UamD8LC9Ob41ervZlIjlJNXWuPpzE3H3vVphI7AEY7c=;
        b=aoFxXMxIl6k0ttMpH07QlBLvyUw7PDqaVEcAR6DArxY6Ogne7mev2ni7Gs6k13k+O1
         E37Dr3jGGdRwAS+aQqipxRtna311r8J0HQCtRguKIUVhtgKWzqXSi+9Se64GPxbOO2Ue
         AOOIVGy16MqyACQyUXQoM+pt3ll45IVfdPw7K6F3IEGy6tO1GNP0rDLoqy99F2+lqV1u
         66fGAFFkBdMAYNsv0pKISgaRLQipcXWG/hxoceUFfPJJwAFuQ8eschKMrg3N61QG5GKY
         RUigxdtUiOtg1j2N7u5A34ILdxtp9jC20jJfLZPoLK2uKBxo0uWsDnspzEfuZ+OEOWgX
         jP+Q==
X-Gm-Message-State: AOJu0Yy2oxNOX4nUcN2HUT6fWEOjqboQuMY8S8Jrw57UGadoO2NMKvMD
	PuiKTrIw3sF0nMWStgPLA8GfGVf7xdr7cxL3OM/GKq2zrkzLqENs7PolD14rgw==
X-Gm-Gg: AR+sD13c/8n42hBYrHF/Ik72o2csTOiort6Us9xtGNyZVim4pRA9V1+BGuEi973kydW
	q9QlBmwzega4d7ZgF5VrWSs3ZtSGUj6vUqqKOwBOzR25khCMasy/iWIkmrtQk4k8s7rmGu4Zg+h
	ucR9Oi/u3wWo1bx42kbL46awVBX3E2N6glQjxwJLSjJJK59+mzLPZQCCYav6pEG962RrU3VIiZW
	dPLOri/dNFibSXnCivLe25QmT4Yzfsas+EbEGA7Dqij6hIR3mZEwiPIQHDrcfjjNZuGKY+cRdVi
	RAOBV+Nm+nqEZebb8ZHw+1hkVKwupoxrlMWdF79UcbdFHqctomzIO9OVIB8a3XKJR2EDfUdrEbZ
	DeCOUWULguErjFmEN8uXmDlX7Vdb30hELygfYSdVlSQ6oGXSkqCWqvyyWrT1GmltiRcbGLQNsnB
	HcwWKWTKJOV0/QGbsdEU3n0IKCLvvv3UD6u27tGCi7fhwtm2igdLzJK1HH4/aGqQ==
X-Received: by 2002:a05:600c:354c:b0:499:51cc:4e57 with SMTP id 5b1f17b1804b1-49951cc6d0fmr90151725e9.0.1785993284727;
        Wed, 05 Aug 2026 22:14:44 -0700 (PDT)
Received: from term011.lan (95C81D0F.dsl.pool.telekom.hu. [149.200.29.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542183b2sm35765355e9.4.2026.08.05.22.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:14:44 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 2/3] mesa-libclc: New recipe for forking libclc for Rusticl purposes in Mesa
Date: Thu,  6 Aug 2026 07:14:36 +0200
Message-ID: <20260806051437.276400-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806051437.276400-1-zboszor@gmail.com>
References: <20260806051437.276400-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242897

See the reasoning and discussion at
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
which was merged and backported to 26.2.0.

TL;DR: LLVM constantly introduces breaking changes that cause
regressions for running OpenCL CTS with Rusticl and finally
Karol Herbst had enough.

This fork is from the LLVM 22 version of libclc and contains the
necessary fixes to make Rusticl pass OpenCL CTS.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../mesa/mesa-libclc_22.1.8.3.bb              | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c5b701c244..feccf29ce4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -524,6 +524,7 @@ RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mesa = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-mesa-libclc = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-mesa-tools-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-meson = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
new file mode 100644
index 0000000000..c93b5b9d9d
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Mesa fork of libclc: Implementation of the library requirements of the OpenCL C programming language."
+HOMEPAGE = "https://gitlab.freedesktop.org/karolherbst/mesa-libclc/"
+SECTION = "devel"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=7cc795f6cbb2d801d84336b83c8017db"
+
+SRC_URI = "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;protocol=https;branch=llvm_22"
+
+SRCREV = "87f66007242ff10e9e84bf32be84f9057f6abc75"
+
+inherit cmake pkgconfig
+
+# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
+# objects from this recipe are build explicitly using clang for GPU targets.
+# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we need
+# to wrestle CMake to configure without a toolchain.
+DEPENDS += "clang-native spirv-llvm-translator-native"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?= "all"
+
+EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
+
+FILES:${PN} += "${datadir}/mesa-clc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


