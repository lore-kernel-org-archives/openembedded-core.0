Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8502C43334
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 05:42:41 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.14255.1657431754809065130
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 22:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XJrGzdEa;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2228576pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 22:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rTehgZpXkFXdAPySnair4tQMh0wIefkZORJDZWK84E4=;
        b=XJrGzdEa+sQNGD04Hq2tY6+3f9g87NxrSUwWsgRCIJqLPPPZBEeuXKYXYbi0PfsCDA
         e4gybG5LoT0wnX06KB04c9lQfoF4gH39igPpORZpi9N07E0i0CpbO5/cEgxhQxitJXMs
         Z/yXN5khYE/Jkzj+YbgZuum/omIxujd/Cbcbfse3BcfpHtGmuk7t5US8X0mgai+VaL3n
         BQH/nmiFxtsIZREvAw+0Nh8lWdh18lq7G4QJ3pw0Xk4FJKBMtanh1fQqITJCdOHN60b1
         C9DhYOS+lZpE8X4PjTRNx/fCbG9KjRUEGDmcmgcK0zK4aNLT6uQ5tGL97s0hlIRHiVqR
         cAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rTehgZpXkFXdAPySnair4tQMh0wIefkZORJDZWK84E4=;
        b=IiHvsYgAJNcpWsX97st8RfpU5D4ruVhUs9eRBYY/vWLs3mnuY/kH4TE6w6QqiswBo4
         fb9SZZMv9Ei/PUfT3ZOyKlDR7dhN7AsMbchLuhw9KUY/x93T73BeILF0Hz7w+MolUWHR
         1dcS2HomvQx00bB3I5sELtG3heE8mgvEz0jgPvnpT5cgoxoij8crMIf3h0iGZO8U1YL9
         wXqqnrr/tywtkuBLluQF/EBbeGROkBL68jMToqvfrP3PUMpnKPNFcqEIYc0w+foldjid
         kDgSJjmEJwrf6cbgUiYTSaCvGRmVhMsMRgl47SNnGjKVB/F7tBUi2VdCXn9WAxwHD2jO
         s4Kg==
X-Gm-Message-State: AJIora+QaAsrmrn5uxv611+xTJpj6xW/ASEdO4K+Ausfh4VtE6g5aZP8
	ILKTyGGiCM/vV+x7SKufCbE=
X-Google-Smtp-Source: 
 AGRyM1s3yHxRnT2KyG6YvLl3aBJ1NW5EGIGFogzi/h4CeBcA/0SGjobaO4vj9aXFkunpGXMQhwl47g==
X-Received: by 2002:a17:90b:1005:b0:1ef:9a54:5837 with SMTP id
 gm5-20020a17090b100500b001ef9a545837mr9998149pjb.102.1657431754117;
        Sat, 09 Jul 2022 22:42:34 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a17090aeb0b00b001ef917f1c30sm2181539pjz.6.2022.07.09.22.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 22:42:33 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH] xen,
 xen-tools: pass prefix maps to fix buildpaths reproducible build issues
Date: Sat,  9 Jul 2022 22:42:16 -0700
Message-Id: <20220710054216.40558-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 05:42:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167842

To fix warnings when the buildpaths QA test is enabled, pass the file
and debug prefix map options that were previously supplied only for
reproducible builds, adding them to the DEBUG_PREFIX_MAP variable
and supplying that to CC.

Testing indicates that passing the prefix maps needs to be via CC
rather than the EXTRA_CFLAGS_XEN_CORE/TOOLS variables.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen.inc | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index ed6e6a7..2bbf1e3 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -88,12 +88,13 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
 
-# Pass through the Yocto distro compiler flags via the Xen-provided variables.
-# Special handling:
-# - The Yocto distro compiler flags are typically set to be appropriate for
-#   user-space software rather than for generation of a hypervisor binary, so
-#   only pass the debug prefix map to the hypervisor build:
-EXTRA_CFLAGS_XEN_CORE="${DEBUG_PREFIX_MAP}"
+# No additional C flags for the main hypervisor build
+EXTRA_CFLAGS_XEN_CORE ?= ""
+# Add prefix maps to support buildpaths QA test and reproducibility
+DEBUG_PREFIX_MAP:append = " \
+    -ffile-prefix-map=${S}=${PN}-source \
+    -fdebug-prefix-map=${WORKDIR}=${PN} \
+    "
 
 # - The Xen tools build for x86 systems with HVM-mode enabled includes hvmloader
 #   which fails to build when "-m64" is included in flags set via the
@@ -109,11 +110,11 @@ TUNE_CCARGS:x86-64=""
 #   It must not be compiled with SSE compiler options enabled and the Xen build
 #   explicitly clears CFLAGS to ensure that, so such options must not be passed
 #   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
-CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
+CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
 EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
 # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
 # in CC to ensure that configure can compile binaries for the right arch.
-CC:arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
+CC:arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
 
 # There are no Xen-provided variables for C++, so append to the tool variables:
 CPP:append = " ${CPPFLAGS}"
@@ -158,9 +159,7 @@ EXTRA_OEMAKE += "${@['', 'XEN_WHOAMI=${PF} XEN_DOMAIN=${DISTRO} XEN_BUILD_HOST=$
                     [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}${@get_build_time_vars(d)}"
 
 # Improve build reproducibility: compiler flags to remove filesystem differences.
-CC_REPRODUCIBLE_OPTIONS = "${@['', '-gno-record-gcc-switches ' + \
-                                   '-ffile-prefix-map=${S}=${PN}-source ' + \
-                                   '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
+CC_REPRODUCIBLE_OPTIONS = "${@['', '-gno-record-gcc-switches'] \
                              [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
 
 # check for XSM in package config to allow XSM_ENABLE to be set
-- 
2.25.1


