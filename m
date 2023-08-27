Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBBFC83F13
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:29 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.4409.1693164746444976677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xckuozcy;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-997c4107d62so319151566b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164744; x=1693769544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=XckuozcymOr6dalhlpcT2L0VuKNcf/UYGrKdZbxSMjXMCfZM/id7ESdPzVwOSmEFYC
         3hlSheIFq4v1YfkByL97BStnwt6vKR+WP3E/dKS7FKQX+Sa14XSMHrxb6LDs7VDWfOTq
         6tnNPxfv4lNv0TkQ+DUhCCyemBqW/uJ6M3zDtom5j/s/CWMZS2jGHFbuTUPlJ+cnj/OL
         1Fhyg0uem5mPZOtl1JWSO3SSBNnDBYpsldb1g2N+LPDk+YiaVj5xV37HdREcnuKnObmg
         0w9GlvJACcMq2UahlF6N04B/+kIdUo3OyVx/jSs3BOq2hw1OCDlfZeGco6JVvLFxSgww
         cBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164744; x=1693769544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmUX6U4agbW3t1fGqkeP7lfXrBnRaDzuSONNIii4H+Q=;
        b=dKV2a/dTSXJjrGwgdl99203VuhIniF6QZNAQ5hIrfww5RmoE3l7dS8Dm88arBYexXc
         u4H20O/QNP02bOyegvABKGmEiPrJc3Eol9uB83TaYWgrQonzdojR0ZQj29ixkBg2y+zF
         8FMF/OYLoANahxLDarmEyxpUIbbneJ1noiJNJC6HJErx0igvgXsbPNoBs6BXjeePYHee
         U1hUxL25FwFfASY4O4oqlfeXVYbiLneeSnu3lP/iarEFpwEiZ5eyofNbO/xR8fVHGjur
         6q4GTBHrHKGkz7FCbqChU7wqUPr+P4vaRjjtLimoUabHBS0UDsVtE/ebGnbCHJ1LPDNK
         mPwQ==
X-Gm-Message-State: AOJu0YxQyFLYEUCtvEKJcxbMQGx5Y1eLT+7Bu0ioBvsvkM+SezURuAO3
	Z+QRezWHWutdx7SzNR0O39tnfSqQG20=
X-Google-Smtp-Source: AGHT+IHZv8uwt9xoiOY7gqg1m8o4AEvB2BkGcVqX738M2fAieu7T2mFx2oQEkDmhXIV5aQfODcARJQ==
X-Received: by 2002:a17:906:74cf:b0:9a2:b89:f82a with SMTP id z15-20020a17090674cf00b009a20b89f82amr7184485ejl.49.1693164744663;
        Sun, 27 Aug 2023 12:32:24 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:24 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 02/13] cmake.bbclass: refactor cmake args
Date: Sun, 27 Aug 2023 21:29:44 +0200
Message-ID: <20230827193200.4083340-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186782

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


