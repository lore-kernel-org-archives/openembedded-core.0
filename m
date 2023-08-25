Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B0DEE49BC
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:43 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.2724.1693002459336029072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pd/GYzTk;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so1983832a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002457; x=1693607257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=pd/GYzTkc6FxAw2qhMkvTHv4Rw8VNsSEBGuZ2GBqHujwsDoJ+pkTRFshwuHtF3Ykff
         flkrl7Hwi9nqN5wK+dPHx6eGLTJbvJBIVYMZA2yiisOxAVJdJRX66Kh12HlGvxe1dUt/
         zqBmrDoOTHvQPVKXFSXWlA2FXtUfX1xR240vTmYlkfcJMUVJFfrYkCvFTUzybgFfU7d+
         S3pHN2RF0eMidJhz4XrmI2eWD4Ln54ly2uaV5ca0byCYw9Vleji60+qYKO/lgdJ1K1Vf
         7kuYhrk8/QnEwrXthsIVd+o6wDInhmK6ztDDQdGNNQ3cYF3bmLnlCI2FeMpeoc60pgIR
         EplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002457; x=1693607257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=Yew2CevjerqoyodT7Wx4SZWE/BvUI7IbpcvNYI4FW+gUheH0WdvfrzU70ukrPGi7bz
         61Xpo2XoCP+1+HU55MAES2CYlnUP9VCdaUbokEARJhBbyMnME+4LGUp6IPIzZM4jnA7H
         F0fPhiMg6xQrtz2LKneIM3CaSEbxi31cVuRCmeV2ZXkl0BQ+o0l4E7KkOBQgfCYJsvIF
         5Zc3sMyRQ8IOf4+gxqh8pVZYH/HjQfDviK2rH376k8Fb8XlbHCo/rI2EvDmBpNoU1Qot
         AJfGBAjgozUQPTfMJJm+tCBFymrz10mSVOC4izKez6rPyMWvQ5KGuf0B2/KQJJ8TGJDe
         HijA==
X-Gm-Message-State: AOJu0YxaO9QG07YQ7f3VCIQkmZhANIcB+iot9uHnIxrT525FgRb74RLg
	V4zlsZnF/21nWSyxq8i2P3Aas8w4nOY=
X-Google-Smtp-Source: AGHT+IHfB3PMxRY/DtjGzs7n0JwRBuda093+hK91jMZSne9bD4b7THLT2medv1VXY+INg/F18fl4fQ==
X-Received: by 2002:a05:6402:3447:b0:523:bfec:490f with SMTP id l7-20020a056402344700b00523bfec490fmr16835814edc.0.1693002457565;
        Fri, 25 Aug 2023 15:27:37 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:37 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 02/13] cmake.bbclass: refactor cmake args
Date: Sat, 26 Aug 2023 00:25:42 +0200
Message-ID: <20230825222711.2735745-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186729

Make the details of the cmake configure arguments available to
d.getVar(). This allows to share them with devtool via tinfoil.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 43 +++++++++++++++++--------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 0dda104a695..7c40df4cdbf 100644
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


