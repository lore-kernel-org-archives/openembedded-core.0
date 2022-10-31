Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE40FA374B
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:51 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.8315.1667216864938150048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f+/we6Kr;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id o4so15589848wrq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggL70Fc95T6XRKk/zzRPiRKHz4Aaze2/73IvR3CWKJU=;
        b=f+/we6KrczjKyNvnSDCL0Xd/1QIBKHid6IW12icvN5cjPju1tvBJpznURH7Q+bw85V
         r9gYpGw4gHHxBnqMZneD3bXZTPsEsrb+mLGGHrts3TNbAqJwwgNmjiU3+CfriK7+/6/3
         tIe1qGNCHnFB8fTce1n4Raw/5fH/V0BrtimLUklAsc+lLY/FLQRM5cebamSqDqQXTmZS
         4YhfjpRjWcqarwf/qsJmvLrT64tkl7/2zQ17D42Ehcs7jr3cXhWvPb70AsitgC+2xfMj
         p2s7XVdBPK7YNcd1vJjmFh2v+cgyaP+f9KMG2KRSbtn8oZWYT/RrrJhqkWlzrQBBoZtK
         teFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggL70Fc95T6XRKk/zzRPiRKHz4Aaze2/73IvR3CWKJU=;
        b=J3/XLPCYuLH0Iv/euDnHDxWTee9NnhB9PfS6WwVjP+w6u2FTVR6pI+GfCNfEftleNe
         Tlf2r9NeU1wj6aIGreOBCNJ/wkB6V45Dkmt4u0uIHuFGD3qMkY7kVMN4zgcatA5As/El
         wGO2R6UfDmH76AFEA6vRrP6W3NqBPziY3H1f25q5onjQ5kg3WHoFpOt3nzPBBjovYe65
         ePgzSeZYLKOeZcLwJ/PBjCKqFJCH/CUsekJfXvQgOuCkC0ELbNXdaCM9ZM4fN8pnkyUO
         XgOH4m/BUW/xB6MzeLGzk7WX5OfIa4mEDbc0OTTKYt7R6LYWaohmdb7EJSRMHozgdwVb
         Mm9A==
X-Gm-Message-State: ACrzQf3O1lCCk42gdxVcbEBlSZ8mwENbkBfjhkzQ2/vAKutUvp679YHL
	sNbHmL0yIcMBQwcKkiujPDqolbCClzY=
X-Google-Smtp-Source: AMsMyM5fltIbahS6YO6YH2J350bnZwO8halZdcICT0heWWMBczMYBpYBEiAygqmakaMqpMPVqfhL1Q==
X-Received: by 2002:adf:e992:0:b0:236:70ad:3bd9 with SMTP id h18-20020adfe992000000b0023670ad3bd9mr7748361wrm.136.1667216863274;
        Mon, 31 Oct 2022 04:47:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/13] cmake: drop qt4 patches
Date: Mon, 31 Oct 2022 12:47:14 +0100
Message-Id: <20221031114719.2725967-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172310

Qt4 has been dead for a very long time now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/cmake/cmake.inc         |  2 -
 ...t-OpenEmbedded-Qt4-tool-binary-names.patch | 56 -------------
 ...-if-system-Qt-installation-is-broken.patch | 79 -------------------
 3 files changed, 137 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1ede8eee61..7561e851c6 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,6 @@ LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
-           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
-           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
 SRC_URI[sha256sum] = "0d9020f06f3ddf17fb537dc228e1a56c927ee506b486f55fe2dc19f69bf0c8db"
diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
deleted file mode 100644
index 575a5cb7fb..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2d02ac91d5a5d72eaddba4894eaa6db3ed8fee62 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Thu, 12 May 2011 15:36:03 +0000
-Subject: [PATCH] cmake: support OpenEmbedded Qt4 tool binary names
-
-The FindQt4 module looks for Qt4 binaries to be able to gather the
-paths used for compilation and also to be using during other processes
-(translation update, translation binary generating and like) however
-OpenEmbedded has renamed those to allow old QMake to be used in
-parallel with the current one. This patch adds support for the
-OpenEmbedded specific binary names.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-The patch was slightly adapted in order to match cmake 3.2.2:
-Instead of find_program, _find_qt4_program is now used.
-
-Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
----
- Modules/FindQt4.cmake | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 3993968..b2a8585 100644
---- a/Modules/FindQt4.cmake
-+++ b/Modules/FindQt4.cmake
-@@ -518,7 +518,7 @@ endfunction()
- 
- set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
- 
--set(_QT4_QMAKE_NAMES qmake qmake4 qmake-qt4 qmake-mac)
-+set(_QT4_QMAKE_NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac)
- _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
- 
- if (QT_QMAKE_EXECUTABLE AND
-@@ -1136,12 +1136,12 @@ if (QT_QMAKE_EXECUTABLE AND
-   _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
-   _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
-   _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
--  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc)
--  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbuscpp2xml)
--  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbusxml2cpp)
-+  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc4 rcc)
-+  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbuscpp2xml4 qdbuscpp2xml)
-+  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbusxml2cpp4 qdbusxml2cpp)
-   _find_qt4_program(QT_LUPDATE_EXECUTABLE Qt4::lupdate lupdate-qt4 lupdate4 lupdate)
-   _find_qt4_program(QT_LRELEASE_EXECUTABLE Qt4::lrelease lrelease-qt4 lrelease4 lrelease)
--  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollectiongenerator qcollectiongenerator-qt4 qcollectiongenerator)
-+  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollectiongenerator qcollectiongenerator-qt4 qcollectiongenerator qcollectiongenerator4)
-   _find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer designer-qt4 designer4 designer)
-   _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 linguist4 linguist)
- 
diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
deleted file mode 100644
index 1b196db81a..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 60864efbe52cc12018efaafbc4e4c3c8b4af2b65 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Thu, 5 Jul 2018 10:26:48 -0300
-Subject: [PATCH] Fail silently if system Qt installation is broken
-
-Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
-following error if the system Qt installation is broken:
-
-CMake Error at Modules/FindQt4.cmake:1028 (set_property):
-  set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
-  been created.
-Call Stack (most recent call first):
-  Tests/RunCMake/CMakeLists.txt:79 (find_package)
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-The patch was slightly adapted in order to match cmake 3.2.2:
-Another set_property was introduced which had to be included
-within the if(QT_QTCORE_FOUND) statement.
-
-Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
----
- Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
- 1 file changed, 20 insertions(+), 19 deletions(-)
-
-diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index b2a8585..77c89aa 100644
---- a/Modules/FindQt4.cmake
-+++ b/Modules/FindQt4.cmake
-@@ -988,25 +988,26 @@ if (QT_QMAKE_EXECUTABLE AND
-     endif()
-   endmacro()
- 
--
--  # Set QT_xyz_LIBRARY variable and add
--  # library include path to QT_INCLUDES
--  _QT4_ADJUST_LIB_VARS(QtCore)
--  set_property(TARGET Qt4::QtCore APPEND PROPERTY
--    INTERFACE_INCLUDE_DIRECTORIES
--      "${QT_MKSPECS_DIR}/default"
--      ${QT_INCLUDE_DIR}
--  )
--  set_property(TARGET Qt4::QtCore APPEND PROPERTY
--    INTERFACE_COMPILE_DEFINITIONS
--      $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
--  )
--  set_property(TARGET Qt4::QtCore PROPERTY
--    INTERFACE_QT_MAJOR_VERSION 4
--  )
--  set_property(TARGET Qt4::QtCore APPEND PROPERTY
--    COMPATIBLE_INTERFACE_STRING QT_MAJOR_VERSION
--  )
-+  if(QT_QTCORE_FOUND)
-+    # Set QT_xyz_LIBRARY variable and add
-+    # library include path to QT_INCLUDES
-+    _QT4_ADJUST_LIB_VARS(QtCore)
-+    set_property(TARGET Qt4::QtCore APPEND PROPERTY
-+      INTERFACE_INCLUDE_DIRECTORIES
-+        "${QT_MKSPECS_DIR}/default"
-+        ${QT_INCLUDE_DIR}
-+    )
-+    set_property(TARGET Qt4::QtCore APPEND PROPERTY
-+      INTERFACE_COMPILE_DEFINITIONS
-+        $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
-+    )
-+    set_property(TARGET Qt4::QtCore PROPERTY
-+      INTERFACE_QT_MAJOR_VERSION 4
-+    )
-+    set_property(TARGET Qt4::QtCore APPEND PROPERTY
-+      COMPATIBLE_INTERFACE_STRING QT_MAJOR_VERSION
-+    )
-+  endif()
- 
-   foreach(QT_MODULE ${QT_MODULES})
-     _QT4_ADJUST_LIB_VARS(${QT_MODULE})
-- 
2.30.2


