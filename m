Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69469C3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 06:47:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.2079.1720766850929525239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 23:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BJ2g9eA8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so1776222e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720766849; x=1721371649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV6BhBnZSmg/jM2PqXcVjKgBnLeiXbgZFA9i8L1MGYM=;
        b=BJ2g9eA8Tu8eNAeCfVt1oQHngYiQTdLfaFs7/PH6NAKOM4CwvyaZvZE4KtXVys9M6W
         tg7lYkz8hKk3+ZTo+6v3LgszmMQn4AkvvV9Em6MUXBrrL7tfb7fyW/b2p2bX+RpexFOg
         yj7Br1LzpzVVGnUegOw1LPSk12YENc6Mj+hs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720766849; x=1721371649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV6BhBnZSmg/jM2PqXcVjKgBnLeiXbgZFA9i8L1MGYM=;
        b=U+esV2gLvfQkAOU9mYF4nVtE1kNRms32ljkZcpmOOCIJ3d3oGWLSiAD9Y9gF9DRi+p
         01w3FzhamlEXPGN/G2DLV3kuxb6nnVpxL7zSGKoTh/nSZrC0wfBhTyBhaFkuraUbB+9r
         zeKBi1AG1kspJIcLBfir3YBXK47hUNIQqeXk5dVSj0yYsMrLD8V2CjUrePKY/6YzV3PU
         2KZ+QflLojFTvuRfUZnI4VlJN0uZqgBY8Esvho3rOk48Ss84veEBSngTr0aGZAT95b6z
         k0mBmPf58Smhq1kwA7lSEzwHAYSgR61PqYnAvX+Vp219TKTr5dxKjyQDmxd8C6nldZpK
         Bejw==
X-Gm-Message-State: AOJu0YwvnuBX7ShHJRYs23XsD5SB3+N5A25iHw0lqC6idEj6X/ZquwqD
	YBnQzS72+gsgKRqaeRfkd/mNoNdM6vjpjvPLJwN7v5PpV/+hROJzHjrTgt19LtUSdFOdPDSlLaO
	F
X-Google-Smtp-Source: AGHT+IFv619mDw4zfmkv2imTmiKtpIKLOqf6hnpicD6JHD/Y3VLKECtGFY1SzcOuUdhUmcMmmuEE1A==
X-Received: by 2002:a19:e012:0:b0:52c:d90d:77aa with SMTP id 2adb3069b0e04-52eb99d6cf8mr5722300e87.61.1720766848857;
        Thu, 11 Jul 2024 23:47:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2448ebsm12139635e9.1.2024.07.11.23.47.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 23:47:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] bitbake.conf: Further cleanup compiler optimization flags
Date: Fri, 12 Jul 2024 07:47:25 +0100
Message-ID: <20240712064726.1448710-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712064726.1448710-1-richard.purdie@linuxfoundation.org>
References: <20240712064726.1448710-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201804

Move the -pipe option out of the optimization flags and directly into
the flags variables since we always use it now.

Also move the debug prefix mapping there to match the nativesdk case
which already does this.

Fix the documentation and two recipe usages to match the change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf             | 15 ++++++++-------
 meta/conf/documentation.conf       |  4 ++--
 meta/recipes-core/ovmf/ovmf_git.bb |  2 +-
 meta/recipes-kernel/perf/perf.bb   |  7 +++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 02fe872d2c4..aba560dd292 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -610,10 +610,10 @@ BUILDSDK_CPPFLAGS = ""
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
 TARGET_CPPFLAGS = ""
 
-export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
-BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
+export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION} -pipe"
+BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION} ${DEBUG_PREFIX_MAP} -pipe"
 export CFLAGS = "${TARGET_CFLAGS}"
-TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP} -pipe"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
 BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
@@ -663,13 +663,14 @@ DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-DEBUG_FLAGS ?= "-g ${DEBUG_PREFIX_MAP}"
+DEBUG_FLAGS ?= "-g"
 
-FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"
+FULL_OPTIMIZATION = "-O2 ${DEBUG_FLAGS}"
+DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS}
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)} -pipe"
+# compiler flags for native/nativesdk
+BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
 BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 ##################################################################
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index b0591881ba9..53170fd34e3 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -132,7 +132,7 @@ D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
 DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_FLAGS} -pipe'."
+DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_FLAGS}'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
@@ -180,7 +180,7 @@ FILESPATH[doc] = "The default set of directories the OpenEmbedded build system u
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
 FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
-FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 -pipe ${DEBUG_FLAGS}'."
+FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_FLAGS}'."
 
 #G
 
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 35ca8d1834b..085574c0cbd 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -55,7 +55,7 @@ DEPENDS = "nasm-native acpica-native ovmf-native util-linux-native"
 EDK_TOOLS_DIR="edk2_basetools"
 
 # OVMF has trouble building with the default optimization of -O2.
-BUILD_OPTIMIZATION="-pipe"
+BUILD_OPTIMIZATION = ""
 
 # OVMF supports IA only, although it could conceivably support ARM someday.
 COMPATIBLE_HOST:class-target='(i.86|x86_64).*'
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index fc9f70f9f66..f3f350aa98c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -75,11 +75,10 @@ LDFLAGS="-ldl -lutil"
 # Perf's build system adds its own optimization flags for most TUs,
 # overriding the flags included here. But for some, perf does not add
 # any -O option, so ensure the distro's chosen optimization gets used
-# for those. Since ${SELECTED_OPTIMIZATION} always includes
-# ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
-# ensures perf is built with appropriate -f*-prefix-map options,
+# for those. Also include ${DEBUG_PREFIX_MAP} which nsures perf is
+# built with appropriate -f*-prefix-map options,
 # avoiding the 'buildpaths' QA warning.
-TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
 
 EXTRA_OEMAKE = '\
     V=1 \

