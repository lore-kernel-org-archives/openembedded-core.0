Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0BCC32772
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:57:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.21297.1660683469680583253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WMSvyn7q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z16so13974887wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=51CrrLWdwFrBSdjUad5sLuuahz7vZLsIyPTzQ+N5J7M=;
        b=WMSvyn7qYKsyJOwKUG78GK2rMJSRgaOOO52f65Sqh7rIyzjUZeiZS3UH6uvc91b99Q
         j+g/5jVkOvRNjMEsjb280IyiEo89iouEvEvRllb07Z04ymIcxNr+eAtZMN1czSDgd3F9
         kviQ5Hjn0qjtfUfK+Ag+7XqF6NdS1U2Op+jdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=51CrrLWdwFrBSdjUad5sLuuahz7vZLsIyPTzQ+N5J7M=;
        b=RCNxGyw7eg0QIgyvuvrOsurlFwwJjKn7CWaMOD1azCgvUpRa3x1rDZu+ohztYJq843
         atmiPYSidxT0PnVXJW2ZgBURqHuPfRcFPZHmQkMb4kWq02WlpwkSeVJjd3b4ijVsKut1
         6+1wbOl0rOnwfApuJB7NpVCGDNIcvIF80+wJmFVnHDn4sytn0gCVeS6NpOQUynOBfFsx
         mF/J6YmZszhYbJRIpt6igMqeA5JiRGhODWpPMA2B+EzeoPFXUFGqA+//YobQujdNMG09
         3tr8zJiEv/MebxeoBvA1xQqtjYgwnC7oi6n/IfH8VtZN3HiUBfmvBAgpI6zI+jml/d+6
         uuyA==
X-Gm-Message-State: ACgBeo3UTFJ7DWKdmmRx6eTRzs3jf/5OS1EZX2Vzw2ILGWkiRUEDDYV4
	ZdQrEpb+dZuJLLVEc8g66FP75duBzQhcpw==
X-Google-Smtp-Source: 
 AA6agR5EOg4nxczajyMJqdS99VVHwoer1ei4Fz6y7X+Pg/YAsL3Ud5I5NkGREwCxedCkhPWEGkKP5w==
X-Received: by 2002:a05:6000:71e:b0:223:764f:b2a8 with SMTP id
 bs30-20020a056000071e00b00223764fb2a8mr12872714wrb.79.1660683467918;
        Tue, 16 Aug 2022 13:57:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] libgcc/gcc-runtime: Improve source reference handling
Date: Tue, 16 Aug 2022 21:57:40 +0100
Message-Id: <20220816205746.1672987-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169456

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


