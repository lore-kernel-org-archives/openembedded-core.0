Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81527C74A5B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.5731.1678402729207634917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lEnrLxbm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id z11so2538898pfh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh8d7IoZV7V8+Ennzkbdwww37b5usdcTKY197Qk6Ok4=;
        b=lEnrLxbm+C20SeoxkWKMVZ054fCYjHK6wzPizTc9Sm2UcDSTu7IwElkf8AA+XnkT/+
         mqZuROWsdAP5Tks4Ty+vPZ7jDK2PVuLXHAj2saZAEmDqGjNY1aqeCAaxUXOU0K16I5ay
         jVzYmgQjvKO+fQk/ZqDqVXLgR3UbxP56gg8Jd3lR4kWq1v6JwAuaUmVJOpWq8cpy9SeO
         0UeL3cw8yQR368/B2TVnE5wwj9Bwx8ViI5fQZdSxOHoV4dHAj8kNGVYDOFjkQ9dm7+nm
         v7JgqTC6QvvqeCFXxOM5pbWNRrEjC95XP+tEaqYpH9gMWjae19rFTHyMZ7yE7t4AG7JI
         tDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oh8d7IoZV7V8+Ennzkbdwww37b5usdcTKY197Qk6Ok4=;
        b=iBxsrmCIUiC05A7KccUx/iFHhAPrcmFL5oWiLiE2rCpyTgJrqFmE1alzbE0ISwNQXn
         spmunKLkZe6M1i32jHINu49fFZjqBdxicZehyz8miFgxIfBxAAhmsOg1+t5M6XznkcW+
         zXcr2qd724TEyLk8VApLP66SvRg1wCSXFwkopjAJWV893bZDaMUzbgOeyuKTaXhXZZmi
         waTSaHrtORe6ArZUcC6Zv0uJSY+gQG//81ZhPX0z5NKLDPWNqz0o9YdNuzjXxcsh4+pN
         L/VpTIZgkfftJCtAWfZTW1eEZ0b4b36RKjcASkytxbaNEMb4fRTWFT57WRgIc8LrNCRs
         k1+w==
X-Gm-Message-State: AO0yUKW331KJQKYeSWAZJkYZF+tDDWTyDnQ6QYdF//DgNiABZacWAGip
	pr9T1Wcuf93ANPM8+4FA7chkJbGoBEUBueRclgU=
X-Google-Smtp-Source: AK7set99Wo/LvxCRscp7p8+tKG3nIEZgo8/yQXcT/5y6CtDn1Siae+Kdw4MF/NeJOwivlCgCdePIRg==
X-Received: by 2002:a05:6a00:3318:b0:5a8:aa5e:4bc3 with SMTP id cq24-20020a056a00331800b005a8aa5e4bc3mr362350pfb.1.1678402728172;
        Thu, 09 Mar 2023 14:58:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/27] libcomps: Fix callback function prototype for PyCOMPS_hash
Date: Thu,  9 Mar 2023 12:57:55 -1000
Message-Id: <1a458a3682a82ea401fa54022b59d68503fe6773.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178293

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5e1f6fd8a93e38ec3ee1271ab319ea2d125c442b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


