Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.3893.1603919197616857137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovisHchR;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id o18so970103edq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/cQ1mf48a2oLQ/BxJXMdcztGhwFFwzMXZUEY14HLrI=;
        b=ovisHchR6QSuwDJ5glTNZE8RZXNjZ6lJ/S54Cwufh4Rr5LSuaspnU6UaHRReWbrhkG
         h3dxHlO1dD70Iz21o2yIgN1Simw7y2uNt+z9C9IdOwZoO6RGg3nAt2GXpqYos1jq6odO
         GIpG035ckl65UbQRy6jbjwLe6IPRlXqcvI4I3r9QfmRylAW5xnn/olF2HT/gEnDroS31
         dmn1TqISiYsER2KpkdtmIeFeJ8i6yqGj/3PaCYRzlhLJkw+9SogEhB1Um0e2JpeP9QcB
         tG2Oz8Cr9w+aZ6BnT3823gz2WGOn7+KJu2v4DyaNyG39Z+N9NNB1iBvCT7SHrGVjbXe1
         Ipvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/cQ1mf48a2oLQ/BxJXMdcztGhwFFwzMXZUEY14HLrI=;
        b=OeIHCaan+mc7/dru+HoP3V7LrIDV+SVsu1GaF0ICLwO66ahqRNHmokzq9u7KGbn6hk
         tcEmKI7YHHJgWlEV39YLG4+0DPLIrIlZaIikFc4Im5d0g0IpXlGdlsTNJ/rPoKDi1ukG
         cSsfj8L0BbkKzDg771IdexpNIo5FrZv9Bv4vCcpBMl+PMnnjyrmjlL/3P/olweudZApH
         90+6x3ji5VKeGtoVZv4cdJ7+ZrIs1RMafBmqDmEajIvwHR7r4qDY9X6cuUg8rDzYb6nP
         iobqO+TU7eWjgZV1OKKxU1wYEUFiGCrRGAT0NY1WkIfXkPAN+jet51K9g0Gui6xdKJse
         dtww==
X-Gm-Message-State: AOAM531ac6QRUXMX2H1pNheNE2PtC8KiOQHLY3iRJhQh76+W+BQrrhzA
	0AwC5NRd4NvTxHPGHZhFjrUs0u6OiPOSHQ==
X-Google-Smtp-Source: ABdhPJzHdMR/4tDFJgtNGlWo/MLIXXrCWvrOd4DetZGhyveILENCHwkWuNqrCT22j9coHEzr6INpOg==
X-Received: by 2002:a05:6402:1298:: with SMTP id w24mr809118edv.280.1603919195871;
        Wed, 28 Oct 2020 14:06:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/33] libxml2: add a patch to fix python 3.9 support
Date: Wed, 28 Oct 2020 22:05:57 +0100
Message-Id: <20201028210558.21070-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libxml/libxml2/fix-python39.patch         | 92 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-python39.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-python39.patch b/meta/recipes-core/libxml/libxml2/fix-python39.patch
new file mode 100644
index 0000000000..76a35d9f10
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix-python39.patch
@@ -0,0 +1,92 @@
+From e4fb36841800038c289997432ca547c9bfef9db1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Fri, 28 Feb 2020 12:48:14 +0100
+Subject: [PATCH] Parenthesize Py<type>_Check() in ifs
+
+In C, if expressions should be parenthesized.
+PyLong_Check, PyUnicode_Check etc. happened to expand to a parenthesized
+expression before, but that's not API to rely on.
+
+Since Python 3.9.0a4 it needs to be parenthesized explicitly.
+
+Fixes https://gitlab.gnome.org/GNOME/libxml2/issues/149
+---
+ python/libxml.c |  4 ++--
+ python/types.c  | 12 ++++++------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/python/libxml.c b/python/libxml.c
+index bc676c4e0..81e709f34 100644
+--- a/python/libxml.c
++++ b/python/libxml.c
+@@ -294,7 +294,7 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
+ 	lenread = PyBytes_Size(ret);
+ 	data = PyBytes_AsString(ret);
+ #ifdef PyUnicode_Check
+-    } else if PyUnicode_Check (ret) {
++    } else if (PyUnicode_Check (ret)) {
+ #if PY_VERSION_HEX >= 0x03030000
+         Py_ssize_t size;
+ 	const char *tmp;
+@@ -359,7 +359,7 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
+ 	lenread = PyBytes_Size(ret);
+ 	data = PyBytes_AsString(ret);
+ #ifdef PyUnicode_Check
+-    } else if PyUnicode_Check (ret) {
++    } else if (PyUnicode_Check (ret)) {
+ #if PY_VERSION_HEX >= 0x03030000
+         Py_ssize_t size;
+ 	const char *tmp;
+diff --git a/python/types.c b/python/types.c
+index c2bafeb19..ed284ec74 100644
+--- a/python/types.c
++++ b/python/types.c
+@@ -602,16 +602,16 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
+     if (obj == NULL) {
+         return (NULL);
+     }
+-    if PyFloat_Check (obj) {
++    if (PyFloat_Check (obj)) {
+         ret = xmlXPathNewFloat((double) PyFloat_AS_DOUBLE(obj));
+-    } else if PyLong_Check(obj) {
++    } else if (PyLong_Check(obj)) {
+ #ifdef PyLong_AS_LONG
+         ret = xmlXPathNewFloat((double) PyLong_AS_LONG(obj));
+ #else
+         ret = xmlXPathNewFloat((double) PyInt_AS_LONG(obj));
+ #endif
+ #ifdef PyBool_Check
+-    } else if PyBool_Check (obj) {
++    } else if (PyBool_Check (obj)) {
+ 
+         if (obj == Py_True) {
+           ret = xmlXPathNewBoolean(1);
+@@ -620,14 +620,14 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
+           ret = xmlXPathNewBoolean(0);
+         }
+ #endif
+-    } else if PyBytes_Check (obj) {
++    } else if (PyBytes_Check (obj)) {
+         xmlChar *str;
+ 
+         str = xmlStrndup((const xmlChar *) PyBytes_AS_STRING(obj),
+                          PyBytes_GET_SIZE(obj));
+         ret = xmlXPathWrapString(str);
+ #ifdef PyUnicode_Check
+-    } else if PyUnicode_Check (obj) {
++    } else if (PyUnicode_Check (obj)) {
+ #if PY_VERSION_HEX >= 0x03030000
+         xmlChar *str;
+ 	const char *tmp;
+@@ -650,7 +650,7 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
+ 	ret = xmlXPathWrapString(str);
+ #endif
+ #endif
+-    } else if PyList_Check (obj) {
++    } else if (PyList_Check (obj)) {
+         int i;
+         PyObject *node;
+         xmlNodePtr cur;
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 90890ffaed..07ae68610c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
+           file://fix-python39.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.29.0

