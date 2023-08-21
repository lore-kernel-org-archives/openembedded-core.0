Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85744EE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.1046.1692634306149123289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hqGeuJMJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so4512671a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634304; x=1693239104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=hqGeuJMJbm9wg/IbLl73JJEqbJAiHdNivikO+5H/QUfGzWO+ntKSBMNtn9WTitehbn
         RMOOdbIP/7M1mWgz6PX34esPRuDaTaa/FrBfPD9w6J1OVAGIR4PTPpScs416Eydyyohr
         6QeCvcEk70tdinnFuIMMOfYaRR7vRYltxlEcraB/chmp0D4BEjTKi73OUZs0TTTmadoH
         qZF4TmYdjk6MGrpApwi4LsaORjWyBgnKknQz3WWGbOclyHPIXZQ9e1EvjuO3yzQk0NPa
         OnFdo9AJAo7Stdk4rqkUa3BjH9J0GUCpYjfV4FvOGRMRyIvykBWuiIhocMYVjDsCY6KD
         jwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634304; x=1693239104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=jhRxSAhch1Cq+h15ePbHqsV6rH40GFx54cQUKnOAaf+v6V3Ldb3aZFAQk2bmTStr4u
         7Aa9JakDt5lJ/Ucpps7h0sMuvWU6BA74gJiGO2JTHZW9xPPo+EhMlxldbi43KEkEIFZU
         hb3OIi3dDQf8z+MhBQjftd2fLKq6r3LYBGKpUPEyBZUxyw1jfqKrdw5HBsmzAkK7i39E
         U1gON1e+53Ep8ygWgciv1sxeHnIOrCtZUlhqdlr3Rzi5wWMCv0kkd6JCYC8kJto9hp1l
         kWddSQLx08o1STKOedIgBinMfMg8+p6CYL+TAUSnjXO/pBM8t8WUfNpHA5f+MxR/pUif
         LpYQ==
X-Gm-Message-State: AOJu0YyrFEwDmIAeYMTSFA3sDdYfDR+uv+ylW6K9ZtFP+N2q5eV3e7Sd
	392HXf8TDFExGTGAamJB0O5/J/NVoJ4=
X-Google-Smtp-Source: AGHT+IGHRG6T3KuA/6jQpY+KULfnBMx93b2kmWDTFyjYv4UUqUAdlw9cJ1tFN/jR5V2xjArLvXd/Xw==
X-Received: by 2002:a05:6402:3447:b0:523:1004:1ca0 with SMTP id l7-20020a056402344700b0052310041ca0mr6391664edc.5.1692634304115;
        Mon, 21 Aug 2023 09:11:44 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 03/14] cmake.bbclass: refactor cmake args
Date: Mon, 21 Aug 2023 18:07:06 +0200
Message-ID: <20230821161120.171956-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186466

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


