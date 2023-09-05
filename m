Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49600CA1004
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.27269.1693933174933087128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lkPNSy+y;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401b0d97850so28958165e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933173; x=1694537973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsYHOSA9LHD1Fi0M0tsmfeVBU63JK+QmlGbN1QhUnDU=;
        b=lkPNSy+yJ3omHYZ6rLQpmDg6FDXcPcxcVYdTUh2AULuXZNxZz+hAYeXKYRGZJ6muJQ
         gCJfteWPcbTz70j9fym4HEgVjWA4CxNaP4HcxdMYAavZ3kiSMOBCw3ts/BKTyK55MPrk
         mSrMimd/x20ovpe3adH/ExIPh03B0bwAoKdPrRu8rB4yDvOdCb3fsuauwoRWcdV62gwK
         jW9pzQehnrFTadA+mWPwAUolbx4J9Irlj3oLXQoU1UHm0/oAl2R2Q3zbrWf5zyscIWra
         JN4vhyqId0EfGqck4GrUkESqoHoeUBopAPLd7+dKMu5F0Bx/oRIp6JoM3c5Z5XETOOTQ
         3tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933173; x=1694537973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsYHOSA9LHD1Fi0M0tsmfeVBU63JK+QmlGbN1QhUnDU=;
        b=dkoiJSZGj0u5USi/B7YVqst9Iv8GFjic4eSEsgEzlz712qsbg+ZDKSmeYS5dT3dPdV
         oHVHE+TW8OLdI4fevLoVqTKRRey7tIYH/C7qMjpJTVOAicP0zwck8R71y7QyI2V9GdRf
         V96ju2dKr0zgwZsZic0RWseEuuuhiq3Yl4bHKaDtwX1BeNNiBXGTHBkGlTd5BYHWvl4w
         PZbogpBJAmt5qMhqiYrhClowDqNsqsLiIjkqSZn99ybQp+ll+PNXG9reeFUp2BMVoyrN
         c4+acX9tkwQV6oVjZMXm48VGZBiKo6SOVAm2DYPknjh0fxWjyzPbesvi5N/zvDKO0bsb
         8G5w==
X-Gm-Message-State: AOJu0Yx4bjL9ywnYsDmBphOQwf4v8FkH/PwJJ494i5id9+5a2H622Mss
	5x7GgRqvcpIG/YTITjjwLaHa1WDmV6o=
X-Google-Smtp-Source: AGHT+IHBphMzF97GfHP/ZtgbHOGB7ujLyC73tlklCtHypeEysexcyNZMaIOnTvSqT6D48lbPmwpapg==
X-Received: by 2002:adf:e0c5:0:b0:31a:e73f:3fe7 with SMTP id m5-20020adfe0c5000000b0031ae73f3fe7mr305185wri.3.1693933172535;
        Tue, 05 Sep 2023 09:59:32 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:32 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 02/14] cmake.bbclass: refactor cmake args
Date: Tue,  5 Sep 2023 18:51:11 +0200
Message-ID: <20230905165913.2560907-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187234

Make the details of the cmake configure arguments available to
d.getVar(). This allows to share them with devtool via tinfoil.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 43 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index ea836d5c0d9..69d566d3154 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -158,6 +158,29 @@ CONFIGURE_FILES = "CMakeLists.txt"
 
 do_configure[cleandirs] = "${@d.getVar('B') if d.getVar('S') != d.getVar('B') else ''}"
 
+OECMAKE_ARGS = "\
+    -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
+    -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
+    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
+    -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
+    -DPYTHON_EXECUTABLE:PATH=${PYTHON} \
+    -DPython_EXECUTABLE:PATH=${PYTHON} \
+    -DPython3_EXECUTABLE:PATH=${PYTHON} \
+    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+    -DCMAKE_INSTALL_SO_NO_EXE=0 \
+    -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake \
+    -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
+    -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
+    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+    -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON \
+"
+
 cmake_do_configure() {
 	if [ "${OECMAKE_BUILDPATH}" ]; then
 		bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
@@ -178,25 +201,7 @@ cmake_do_configure() {
 	  ${OECMAKE_GENERATOR_ARGS} \
 	  $oecmake_sitefile \
 	  ${OECMAKE_SOURCEPATH} \
-	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix') + '/')} \
-	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix') + '/')} \
-	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix') + '/')} \
-	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix') + '/')} \
-	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
-	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
-	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
-	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
-	  -DPYTHON_EXECUTABLE:PATH=${PYTHON} \
-	  -DPython_EXECUTABLE:PATH=${PYTHON} \
-	  -DPython3_EXECUTABLE:PATH=${PYTHON} \
-	  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
-	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
-	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
-	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
-	  -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
-	  -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	  ${OECMAKE_ARGS} \
 	  ${EXTRA_OECMAKE} \
 	  -Wno-dev
 }
-- 
2.41.0


