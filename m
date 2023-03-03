Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64195C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:47:27 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.28586.1677862042692547448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oUf1B8nW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id ay18so1967390pfb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677862042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uc3FTONkaF0H4UzLBGIDcJf5tttdSGq0c6SZV2Taxew=;
        b=oUf1B8nWUU7oqZqZcVRa/xp1hhmY8AYKldWtjj40laNpkHdOUBHgZqZcrNeBS8A93y
         CzVho3DkJagO/rMA/UmDBBM2mSK4JYqrQMFoGrG+l3YMvo7fcKovWPyQwKefXFQ2mXVh
         4OuiRUOyGQYSusHz7pa3Ev6HQHLteC61OSPNMpx+ti9wH92PGEZDlPsy3YigtsJJRIjA
         zY649w9znPRWuNsXiS7w8h9pN9hDhD2t7UvoQSppsFpxaiurF4cIINMPma/ItMJfFc0g
         WOCLsRZn1JPbDi4eJ0bIzWV267GN9yqVl1yjJGM6WHduf8FOlNaZjW7TJmq/krnl3W7u
         S35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677862042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc3FTONkaF0H4UzLBGIDcJf5tttdSGq0c6SZV2Taxew=;
        b=pgPL2BSuANpPDmDdOFo1IjVSqtmn5V7vBplBXvb9CH75yAV2GYCqKypcLvFDcHA6CI
         MBfrQerZwDDXgTlhFh17jKI4pSmfoeXTm3WkjvIn+/J7eVJyYvcW4eTSDl6Rg0kWytwI
         V3Sxs8J8Ql+X6WSqWPIU6LgfLjkpTdpbbWXl/HVM9dbdiBp7SpTTZZ8cBt9yaPPiITUo
         n1JSsh6P+KW3vsv42RuxBoN9j/WBp2zLEDmsbCdMNpemzTvk05irFTZnDgDScbq6m909
         oZ8msw7yTVn5sI/oX7xN5/LAhMvKGvoz53ob/JwMxEnYJwVITsa3+p1PDdwc2Ts3/E3d
         kQBw==
X-Gm-Message-State: AO0yUKXOt8EdBt4JdAavUma542d2yoU9xI9XjN04ueVfWqaX6cFdPuVU
	ympFhRDTGN1vH2J2BPCZXIa3jPty0JE=
X-Google-Smtp-Source: AK7set+TyuA2CmgzdTz27usmh6rW7KaVc9w4MHvUeNMc7LXWH2X0p0AA5HYN2liS1ljjT1eIipZJqQ==
X-Received: by 2002:aa7:948e:0:b0:5a8:b911:a264 with SMTP id z14-20020aa7948e000000b005a8b911a264mr2478822pfk.28.1677862041571;
        Fri, 03 Mar 2023 08:47:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id q25-20020a62ae19000000b005d3730383a7sm1833770pff.220.2023.03.03.08.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:47:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libcomps: Fix callback function prototype for PyCOMPS_hash
Date: Fri,  3 Mar 2023 08:47:19 -0800
Message-Id: <20230303164719.3050315-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178019

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hash_t-instead-of-long-in-PyCOMPS_ha.patch | 66 +++++++++++++++++++
 .../libcomps/libcomps_0.1.19.bb               |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch b/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
new file mode 100644
index 0000000000..dd9ebc8af4
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
@@ -0,0 +1,66 @@
+From 26a9647c832de15248ee649e5b77075521f3d4f0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Mar 2023 08:37:35 -0800
+Subject: [PATCH] libcomps: Use Py_hash_t instead of long in PyCOMPS_hash()
+
+This function is used as a hashfunc callback in
+_typeobject defined python3.11/cpython/object.h
+compilers detect the protype mismatch for function pointers
+with clang16+
+
+Fixes
+libcomps/src/python/src/pycomps_sequence.c:667:5: error: incompatible function pointer types initializing 'hashfunc' (aka 'int (*)(struct _object *)') with an expression of type 'long (*)(PyObject *)' (aka 'long (*)(struct _object *)') [-Wincompatible-function-pointer-types]
+    &PyCOMPS_hash,             /*tp_hash */
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libcomps/pull/101]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcomps/src/python/src/pycomps_hash.c  | 4 ++--
+ libcomps/src/python/src/pycomps_hash.h  | 2 +-
+ libcomps/src/python/src/pycomps_utils.h | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libcomps/src/python/src/pycomps_hash.c b/libcomps/src/python/src/pycomps_hash.c
+index 474afd5..4577769 100644
+--- a/libcomps/src/python/src/pycomps_hash.c
++++ b/libcomps/src/python/src/pycomps_hash.c
+@@ -20,9 +20,9 @@
+ #include "pycomps_hash.h"
+ #include "pycomps_utils.h"
+ 
+-long PyCOMPS_hash(PyObject *self) {
++Py_hash_t PyCOMPS_hash(PyObject *self) {
+     char *cstr = NULL;
+-    long crc;
++    Py_hash_t crc;
+ 
+     cstr = comps_object_tostr(((PyCompsObject*)self)->c_obj);
+     crc = crc32(0, cstr, strlen(cstr));
+diff --git a/libcomps/src/python/src/pycomps_hash.h b/libcomps/src/python/src/pycomps_hash.h
+index b664cae..54e08d9 100644
+--- a/libcomps/src/python/src/pycomps_hash.h
++++ b/libcomps/src/python/src/pycomps_hash.h
+@@ -26,6 +26,6 @@
+ #include "pycomps_utils.h"
+ 
+ 
+-long PyCOMPS_hash(PyObject *self);
++Py_hash_t PyCOMPS_hash(PyObject *self);
+ 
+ #endif
+diff --git a/libcomps/src/python/src/pycomps_utils.h b/libcomps/src/python/src/pycomps_utils.h
+index ba9bc2f..b34e4dc 100644
+--- a/libcomps/src/python/src/pycomps_utils.h
++++ b/libcomps/src/python/src/pycomps_utils.h
+@@ -137,7 +137,7 @@ COMPS_Object* __pycomps_bytes_in(PyObject *pobj);
+ PyObject* __pycomps_str_out(COMPS_Object *obj);
+ PyObject *str_to_unicode(void* str);
+ 
+-long PyCOMPS_hash(PyObject *self);
++Py_hash_t PyCOMPS_hash(PyObject *self);
+ 
+ PyObject* PyCOMPSSeq_extra_get(PyObject *self, PyObject *key);
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
index fa1fbc8f0d..f8063d9400 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
@@ -5,6 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
+           file://0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-- 
2.39.2


