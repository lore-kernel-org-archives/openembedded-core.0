Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD2EC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:08 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.2515.1685558946139508166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ag3K8EhO;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6260a9ef126so645316d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558945; x=1688150945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGEs4nE3oYDq+LJj6ui2ai38KMrF3aydZjCId6JNVso=;
        b=ag3K8EhOePKQAF2cNV11StF01K35IPpbOTGSf+MrCfTVf5G7f91m+i6SdLAguNlPjd
         ieARDomAIc2Sn9wMdXdc0HjnUY2I2ql3TtE8TeWUW74oIaozs7JZkA0DPXYoSo53QCF+
         4MWaXD7RN8jkcXIccIJRvUKe4LBMymtvKmYU4itG2TfbQv0mr+nLt5cLMbLTDT648CBs
         L13LrvEx9cyTVYW10y50bfVzZsf8Q1YVqffLY8H6OWBJ9DKYLeYz3tKkcSzCpUoxs2Di
         mWvamXyw4XDaMA30aUo7HfquumlMvaoQ4kSrDoIuCug3zWjYFeqaRbhy8kMk27W1bU5n
         jEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558945; x=1688150945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGEs4nE3oYDq+LJj6ui2ai38KMrF3aydZjCId6JNVso=;
        b=KAvJjgr63msm3dSZZMPULmZYRCpwkf6IqzftmOaYGdoFWKoJx2Hp1GT9VMqAqU1rh+
         S6BtJfXtR2ySI9vzuM2FVpvStfm8rda/Sn4f+HT5wm6fLkct8qo+DvOG8Gk+t1zOA1R+
         1oCAu9oY0ab01jO7+rzsx50sAzNkjPGFzt1HOk3clmCTzquWxapvbfW5eicXyTvSLpLE
         MIGO+17ZoDMtJysxDkgWNIIteFlwoQcfxsyIp/o63mBlynXw5S8BF7H5tNEYh3vxeC9Y
         WmOv3TnE+kDbR/uinnx+1/+stffx2g8GXJw4MNOwNNr4bADHD6mvVOrU0nxpWEIqUc8S
         6jcQ==
X-Gm-Message-State: AC+VfDwe61xcaUaDUp9kxcZn9OhtfrxJm/Vzy9pJPm51n8AUiFJG4ePZ
	pR3eTD6JB2Tf1krQriE5OY0=
X-Google-Smtp-Source: ACHHUZ47Ii9BBfOHEnbJCQqk2q1AbbsJyBB9jDMGd86yJ99HOEmGec0MWTf+dEwM7gmX3dpP37RA9w==
X-Received: by 2002:a05:6214:e48:b0:625:aa1a:b6db with SMTP id o8-20020a0562140e4800b00625aa1ab6dbmr6672873qvc.61.1685558945013;
        Wed, 31 May 2023 11:49:05 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] make-mod-scripts: force static linking and make dependencies explicit
Date: Wed, 31 May 2023 14:48:53 -0400
Message-Id: <2634b1693aace6d17e9bddb4596a67585d38fcfe.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182024

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When the scripts are prepared from the kernel soure, there are some
executables that can also be created (depending on kernel
configuration). sign-file and objtool are two examples which are
commonly created.

Due to the way that the kernel source is staged, and build artifacts
are stored for reuse and performance we can end up in a scenario where
the build artifacts based executable is linked against shared
libraries in the recipe native sysroot (ssl or crypto).

We could manipulate rpath, install the libraries to build-artifacts
and arrange to have available when the host tools are used or even
created a full native package from the tools generated out of scripts.

Those approaches have drawbacks in complexity, relocatability and/or
synchronization issues with the kernel source.

The chosen approach here is to force static linking on the tools,
which allows them to be placed into build artifacts without any
references to the recipe native sysroot.

kernel's newer than 5.15+ allow us to add the -static parameter
to pkg-config, but older kernels do not have that flexiblity. As
a result, we have two approaches to ensure that the libraries
needed for static linking are detected (one via pkg-config and
the other via host ldflags). In the future we can drop the ldflags
approach (when the oldest supported kernels are > 5.15).

There are also some potentially missing dependencies when tools
like sign-file are built, so we add them explicitly to the recipe
and avoid any races or implicit dependencies.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 28e0807d1d..1c972f0d44 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -10,25 +10,49 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}"
 
-do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
+# zlib is required when module signing is enabled
+do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot zlib-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
 DEV_PKG_DEPENDENCY = ""
 
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
+# required for module signing support
+DEPENDS += "elfutils-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
+# we are statically building the support tools, since the output of the build is
+# stored in STAGING_KERNEL_BUILDDIR. We do not want any dynamic references to
+# libraries that are only present in the recipe native sysroot
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -static" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS} -static" CROSS_COMPILE=${TARGET_PREFIX}"
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
 #
 do_configure() {
+	# setup native pkg-config variables, HOSTPKG_CONFIG is available in newer kernels
+	# but we keep these to support older kernels that may not have the variable to
+	# abstract calls to pkg-config
+	export PKG_CONFIG_DIR="${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig"
+	export PKG_CONFIG_PATH="$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkgconfig"
+	export PKG_CONFIG_LIBDIR="$PKG_CONFIG_DIR"
+	export PKG_CONFIG_SYSROOT_DIR=""
+
+	# override CRYPTO_LIBS to support older kernels without HOSTPKG_CONFIG
+	CRYPTO_LIBS="$(pkg-config --static --libs libcrypto 2>/dev/null || echo -lcrypto)"
+
+	# for pre-5.15 kernels
+	LIBELF_LIBS=$(pkg-config --static libelf --libs 2>/dev/null || echo -lelf)
+	export LIBELF_LIBS="$LIBELF_LIBS -lz"
+	export HOSTLDFLAGS="-lz"
+
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	for t in prepare scripts_basic scripts; do
 		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
+		HOSTPKG_CONFIG="pkg-config --static" \
+		CRYPTO_LIBS="${CRYPTO_LIBS}" \
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
-- 
2.34.1


