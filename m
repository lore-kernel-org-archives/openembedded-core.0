Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8039FC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:58:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.20968.1660683470621077407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R7BRHhmI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id j7so14019889wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2nZBEjSLiiiqUvn5aUmkTeb1qxqzSzmPC21vyQyeQF4=;
        b=R7BRHhmI/WydiGkHPFxloi2hdO6VsVayGrW661rifdkUuMZTJ3NVlMOhFTWrWubl7j
         BmC+Rbl22hoGlunEXPBsuB7W23ANH2UqnNxD1fV6GtIvz2Dl2TKW4KsrhU7rjLkoWjmz
         nHVON9LWzNoRebTBHr75zMvdFLBUD6xc3i39g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2nZBEjSLiiiqUvn5aUmkTeb1qxqzSzmPC21vyQyeQF4=;
        b=FgcS0QxrjntrMWzxEchgZcEgxAQCji7o0kShmbrxdgQqckXFNAVi3DvdnkZ3edAEdx
         4kHd6mYtobCWGH7EQGkh4qIj2KTMcKs9FfNfd1BpGAVkcCUQh23D2Z9VSxwDmCUsL0GJ
         nXNX7Oxf97SwjfVI2iNfbePwRmZmhJiJf3uGJBKvoBlbOKsPv1UyCHQ3w0+Uft+uwMfE
         PiMfzWqtIcn4Xw1QkVS7jWHrU2tvJXCKzAbaP6fQSgEXADB/1naatRWlvDf/YQo4E/uN
         Of29zE7mCvVCcGtetm5OrpccYd4Cs1N+vkgpQi2nYzWwh6UQL6Ta/akAqIpeeu/0Ox3B
         4g3A==
X-Gm-Message-State: ACgBeo2asmHzjqyAqDyXb68QqNUJ6Ochmn2a5MSZApO3gLxYzW4FN8Bl
	1JSi7pbjOa/FY4jvLvV2hLkU+CdtHpiAiw==
X-Google-Smtp-Source: 
 AA6agR63uBckdUXTZ+qwsGV2p5Qfot/Cu1qlbqTDlhmaCxYEn2DMA4Xp28GJOPVEJgxZjlXtoI9zQQ==
X-Received: by 2002:a5d:64eb:0:b0:220:6bf8:70b6 with SMTP id
 g11-20020a5d64eb000000b002206bf870b6mr12554655wri.235.1660683468803;
        Tue, 16 Aug 2022 13:57:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] bitbake.conf: Handle S and B separately for debug mapping
Date: Tue, 16 Aug 2022 21:57:41 +0100
Message-Id: <20220816205746.1672987-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169457

We don't really need to keep S and B separate for debug source purposes
and there shouldn't be source references in WORKDIR that isn't S and B
either.

Separating these out simplifies the shared-work directory handling for
gcc and should also help fix external source usage. Therefore handle
S and B in DEBUG_PREFIX_MAP separately and clean up other code.

Indentation is reduced here as it is introduced on every compiler
commandline so minimising it is helpful.

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


