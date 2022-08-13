Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED8C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 20:35:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.8725.1660422906775265820
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VzWS8DVz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id n4so4641495wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=cVDaQefTx1FNLwIEbxzuPvNDk2il0+RhFEGU8oqbjNU=;
        b=VzWS8DVzZT6i1XKvo7TTLPkiFCKBulwfF9WjNTbx4MVhk/Xf6PWyxsY9x9sJ2Zr9kk
         RpWWhZcN5yvy21IGeoOC+RFLs342r5p5uHD3YfBu8UgkU0cAbzL3h73mFtelcMkP5i50
         0Fn8hoUzb0XG5kkoGu5UhdOgPsVKdfZZzkv6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=cVDaQefTx1FNLwIEbxzuPvNDk2il0+RhFEGU8oqbjNU=;
        b=Iu8M3vpMddEsXIEebbocB49cwP8c2xH2+q46EK4rhMlWpYab/LfmsAB1GdDjQSt35b
         FaoHEuiuCaOWdfUbsS2UPxTVYoW+azHCFzwz9FFcom2Esq5FNG+dkEog0HyE4Fxxb8OF
         nJk36wUtjyhbE3yMC5nSZooD8SKvCa1IsShmBwe2MPEyOMuzyG+aApPEpThZq0ogS1vv
         QmRi0bDs9Fng+sBZZFu6i3v+PVNamG6GA6LGo/wpnVTxFCZP0FfJpqJbzZBHCb7p91iJ
         AU/d43o+soZJ1LxSIMaV3SQxopzjpNuV2eFoOjM2upBFOkI2eqHyJTp9L9jSrvy+5BfH
         9ncw==
X-Gm-Message-State: ACgBeo0/gRA7HilAJBbZBpkiEPNFTWh6fkzPEOki6BaObtlZo262r7Wp
	QDa2ojDzf+fS2kh/xTiF4qA9sDVS3GU05g==
X-Google-Smtp-Source: 
 AA6agR79a8Dy6KPtpb2TK3gMfGeqdxCo90WzsBUkb2FApODyWuG20ikAKzXlmHBDK5cyujQa69P5aQ==
X-Received: by 2002:a05:6000:186f:b0:222:c091:9c59 with SMTP id
 d15-20020a056000186f00b00222c0919c59mr5156585wri.78.1660422904921;
        Sat, 13 Aug 2022 13:35:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003a1980d55c4sm4182050wmq.47.2022.08.13.13.35.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 13:35:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] bitbake.conf: Handle S and B separately for debug mapping
Date: Sat, 13 Aug 2022 21:35:00 +0100
Message-Id: <20220813203501.1111519-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
References: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 20:35:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169316

We don't really need to keep S and B separate for debug source purposes
and there shouldn't be source references in WORKDIR that isn't S and B
either.

Separating these out simplifies the shared-work directory handling for
gcc and should also help fix external source usage. Therefore handle
S and B in DEBUG_PREFIX_MAP separately and clean up other code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                      | 11 +++++++----
 meta/recipes-devtools/gcc/gcc-runtime.inc   | 13 -------------
 meta/recipes-devtools/gcc/libgcc-common.inc |  8 --------
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdfb6784371..dd2df8a5520 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -645,10 +645,13 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                     -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+ -fmacro-prefix-map=${STAGING_DIR_HOST}= \
+ -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 35a3077a4a7..fa5b048dab7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -50,19 +50,6 @@ RUNTIMETARGET:libc-newlib = "libstdc++-v3"
 # libiberty
 # libgfortran needs separate recipe due to libquadmath dependency
 
-# Relative path to be repaced into debug info
-DEBUGSOURCE = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
-
-DEBUG_PREFIX_MAP = " \
-   -ffile-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
-   -ffile-prefix-map=${WORKDIR}/recipe-sysroot-native= \
-   -ffile-prefix-map=${B}=${DEBUGSOURCE} \
-   -ffile-prefix-map=${S}=${DEBUGSOURCE} \
-   -fdebug-prefix-map=${B}=${DEBUGSOURCE} \
-   -fdebug-prefix-map=${S}=${DEBUGSOURCE} \
-   -ffile-prefix-map=${B}/${HOST_SYS}/libstdc++-v3/include=${includedir}/c++/${BINV} \
-   "
-
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -L${WORKDIR}/dummylib"
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index e8139263132..d9084af51ad 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -4,14 +4,6 @@ require gcc-configure-common.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-DEBUGSOURCE = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
-DEBUG_PREFIX_MAP = " \
-   -fdebug-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
-   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
-   -fdebug-prefix-map=${B}=${DEBUGSOURCE} \
-   -fdebug-prefix-map=${S}=${DEBUGSOURCE} \
-   "
-
 do_configure () {
 	install -d ${D}${base_libdir} ${D}${libdir}
 	mkdir -p ${B}/${BPN}
-- 
2.34.1


