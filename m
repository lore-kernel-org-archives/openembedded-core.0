Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A569EE49B5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:46 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.5232.1692732218730238926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qeRGDyUU;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52a06f5f556so3454984a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732216; x=1693337016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=qeRGDyUUqb056HJ59+Pt6tXD1kOxIs/ukraOVUvBVndNqwfnRztzLtTw6H/+45sOZM
         yymQtB+ZvsBFOz9BqWA8z6alaD3axDTkhmWlscGGuoW6ngFEKTLVVMlX8K5kFqzGOrpi
         BCw1rh8PvRJtbuBSaTsD4nDmu7NmMvhHIe+W0b+/vT8M0lXGueYC833VFIwL++N75oNr
         vBZpidCz1J3ljeztycbsSRKY/MLFXp5ocrXTLCHV3D3EqWGK6Un54KDY6WvwFzr9WdcP
         ZSpMHsKDa1f8MyGD6imKEeXrmoWAsyjCoQ/d3xxW2u1HBtkxUI0d+cpJj6J3D67VLG2q
         8lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732216; x=1693337016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=XYzs41jpshxuYyZhYzoIwE3mUgtKLdKDS8aKlLiPXLIN9CAL10Sy9e590MAciEEtrl
         5NVUx72rE8bd25U6+qN/gM4Sdkp+d0j9zLR3BrZy827z1xrItHLBju9dsL8QPshS3nXl
         r46nG4mvuGoTSdJw4d+TgxvUlHP6ra/KHQt8kT0teru11xnyBat7o6gO34L8axvfE5xq
         sLLtD/pNb/wLMIyvfOp/z7LarjNaFmBLvicAzxBnpQ7s89sQv3IgCFiJmGkPW0g30vrM
         IiWgZ1IWyDmdU2Mpue/1QZ0uSIr2XLJEgCshP9htVF5Y2svCR5jyj5k9BnMVzHowgvIo
         a2rQ==
X-Gm-Message-State: AOJu0Ywto0emU321QfHtbQPqM+8tg1wG0tnwSvefvgv2f8XQlSW75od+
	+9TOZWtK1aq13g/dyCrbMGwPf+Bh5WU=
X-Google-Smtp-Source: AGHT+IEsgHZZ4Hbw4tBHQP81jw0WF6NewsprCtwqXsv2cEW9zOjxleFj32qd4w+ciZhgvicG112mlg==
X-Received: by 2002:a17:906:8477:b0:991:c566:979 with SMTP id hx23-20020a170906847700b00991c5660979mr8649657ejc.36.1692732216477;
        Tue, 22 Aug 2023 12:23:36 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:36 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 02/13] cmake.bbclass: refactor cmake args
Date: Tue, 22 Aug 2023 21:20:08 +0200
Message-ID: <20230822192300.3235896-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186525

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


