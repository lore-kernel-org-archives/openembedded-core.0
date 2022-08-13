Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC10C3F6B0
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 20:35:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.8724.1660422906232708260
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UyunAGRy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id n4so4641470wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 13:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=51CrrLWdwFrBSdjUad5sLuuahz7vZLsIyPTzQ+N5J7M=;
        b=UyunAGRy/P8h+lLdxh6dWsxLy4EA4zmegNt9hs7taK8kvQI/Gshm7ClFpWRsIZHIBN
         XVogiyhhE6ibV4Q0aytBiQPaODBMrEAt+GCOd4oW+XxWyDHbizLq+Riv/eisoMuVAXYG
         wtPsj9nw8yiKFwamtXEmjIyaoAQvK1H8h67M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=51CrrLWdwFrBSdjUad5sLuuahz7vZLsIyPTzQ+N5J7M=;
        b=klGvK6uOnuLgSX9sUr946Hk01f2atNpZi5eE8ujeYmOSTGNUL42INQrr6L6ds2NNNf
         Unxqcz22VP+4ClhZkAddHFjXE9kSj9kwjHMc+3N0UzDWPC0UvCOGu5Tdaf5AAD8fYobt
         U4RNLQ1KXasXsfsNXBDq1arrjOTwhXv81/ocRhSpEE04X3SgpjPQiF7OObAocul1hVG8
         BIAN7SIRj/+EdL+qw452GiB1ROmN5PomMH+zTgOt5XnEQV0LuSSX8IvvCE2bL03CyhRw
         s2L7EEmWPVPbgpMxqFvzH2fCNuN+nOI3SkF18Z+4dcvGiRDmvdNE4cBJ5pLuetiBVidI
         15Zg==
X-Gm-Message-State: ACgBeo3AP5hw/Pnig3nYogaQB5MGA0s5FtKY6nAPI8OroyHBJ2ekF3/+
	1vkoZCdvuc0FoO5m3A17EacVHbdPsh62kw==
X-Google-Smtp-Source: 
 AA6agR75jA1+w9hjeGNuavSD0XreSFDjg5WXyUdV7jDhm6CmxZL9x+Xn/4RSQpyOc7tjRIg+RD3g7A==
X-Received: by 2002:a5d:6852:0:b0:220:5c11:3cda with SMTP id
 o18-20020a5d6852000000b002205c113cdamr5017066wrw.592.1660422904047;
        Sat, 13 Aug 2022 13:35:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003a1980d55c4sm4182050wmq.47.2022.08.13.13.35.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 13:35:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libgcc/gcc-runtime: Improve source reference handling
Date: Sat, 13 Aug 2022 21:34:59 +0100
Message-Id: <20220813203501.1111519-3-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/169315

This code was some of the earliest reproducible build work we did. To
correctly handle the encoding of file paths, we used relative build
paths to run configure which resulted in relative build paths in the
binaries.

We now have more modern approaches used elsewhere with the prefix remapping
options. These work best with absolute paths, not relative ones. As such,
drop the relative path mangling and switch to using prefix mapping
exclusively on absolute paths.

This makes the code matc the rest of the system and triggers the correct
code to be added in /usr/src/debug.

We have to include both file-prefix and debug-prefix since the assembler
only looks at debug-prefix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc   | 22 ++++++++++-----------
 meta/recipes-devtools/gcc/libgcc-common.inc | 11 +++++++++--
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index b8bfdcedadf..35a3077a4a7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -51,16 +51,15 @@ RUNTIMETARGET:libc-newlib = "libstdc++-v3"
 # libgfortran needs separate recipe due to libquadmath dependency
 
 # Relative path to be repaced into debug info
-REL_S = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
-
-DEBUG_PREFIX_MAP:class-target = " \
-   -fdebug-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
-   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
-   -fdebug-prefix-map=${S}=${REL_S} \
-   -fdebug-prefix-map=${S}/include=${REL_S}/libstdc++-v3/../include \
-   -fdebug-prefix-map=${S}/libiberty=${REL_S}/libstdc++-v3/../libiberty \
-   -fdebug-prefix-map=${S}/libgcc=${REL_S}/libstdc++-v3/../libgcc \
-   -fdebug-prefix-map=${B}=${REL_S} \
+DEBUGSOURCE = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
+DEBUG_PREFIX_MAP = " \
+   -ffile-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
+   -ffile-prefix-map=${WORKDIR}/recipe-sysroot-native= \
+   -ffile-prefix-map=${B}=${DEBUGSOURCE} \
+   -ffile-prefix-map=${S}=${DEBUGSOURCE} \
+   -fdebug-prefix-map=${B}=${DEBUGSOURCE} \
+   -fdebug-prefix-map=${S}=${DEBUGSOURCE} \
    -ffile-prefix-map=${B}/${HOST_SYS}/libstdc++-v3/include=${includedir}/c++/${BINV} \
    "
 
@@ -77,8 +76,7 @@ do_configure () {
 		mkdir -p ${B}/${TARGET_SYS}/$d/
 		cd ${B}/${TARGET_SYS}/$d/
 		chmod a+x ${S}/$d/configure
-		relpath=${@os.path.relpath("${S}/$d", "${B}/${TARGET_SYS}/$d")}
-		$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 		if [ "$d" = "libgcc" ]; then
 			(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 		fi
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index cf8d6b7ed6e..e8139263132 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -4,14 +4,21 @@ require gcc-configure-common.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+DEBUGSOURCE = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+DEBUG_PREFIX_MAP = " \
+   -fdebug-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
+   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
+   -fdebug-prefix-map=${B}=${DEBUGSOURCE} \
+   -fdebug-prefix-map=${S}=${DEBUGSOURCE} \
+   "
+
 do_configure () {
 	install -d ${D}${base_libdir} ${D}${libdir}
 	mkdir -p ${B}/${BPN}
 	mkdir -p ${B}/${TARGET_SYS}/${BPN}/
 	cd ${B}/${BPN}
 	chmod a+x ${S}/${BPN}/configure
-	relpath=${@os.path.relpath("${S}/${BPN}", "${B}/${BPN}")}
-	$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 }
 EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
-- 
2.34.1


