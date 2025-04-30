Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C74C3ABAA
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.8206.1745981648433453819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PrzEi4zv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30332dfc820so8001053a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981648; x=1746586448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtVu8rKqN/ZtvdZYbGy7DCLFaspGdjAuPVgsMP7Mkt0=;
        b=PrzEi4zvVUyyHSbFeL+0WTH+KvRKZ5/94CTiHidyRLKAl7XOX0PVedi2F2ILftMb9l
         trZJBf2mPJTmfNCHhsmofXWldKdzIQB2Bxd7U95AD/5EBfMPgmE30xk5ETnHUhWVOpFl
         NEe5kqFuCuvIj3Vj4+F211jVkDcbIhk5gL0qxlaDodrfSr+Rs9dkkLAS9Xq0Hd/qBJt1
         SeJtQTK3vZ5Sate9Sc6L4SsL8uScSJiUZYDdJcOyBrsz6XSmRytciC5h42rnOIWIXiH/
         jRV9UuIWBqqcTLCT8jHRqwvT+NIVudQcX8wF4237Js1NXHSSARbHEJZTDhWF5gmsp7gO
         dMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981648; x=1746586448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtVu8rKqN/ZtvdZYbGy7DCLFaspGdjAuPVgsMP7Mkt0=;
        b=cOUPOEmLjHuDY7OEAPeKr/Yn/sJ3Dd/vKnuB1CW3I4EtX4y5B2PfSe8CZWEqNg1Vzx
         2VWRy12qcI8JWLH3TwzYGApu/O+Osdml/5x7nbJ+TwtaL9Bpiy8pVm621iy6fn2M+nIe
         vhEWTZD1VxUrHlSjDfkW/D2EAPJFT+g4z8w3ourozGvCE/vJPshblr/voMwbxXBkJcUM
         TVi/WddVhp5Dyh9lJYCB7KT9IbtujGzIUluFCu0RM+bEj6V6loFwnm4gumJy8zukMjHv
         7KDanE9bGoHaklIF+whMndt4dBo62Y9tTe0Cp5qQxYfN2Mx8Q6bcrHasiFNfC9X5MUb0
         c+sQ==
X-Gm-Message-State: AOJu0Yx/RM9GM4wZDzZvhLmu0QXfhMBWZ57KEz1Gy3ilzBek7pO4I1Go
	haIU3+PksOXBQNUXE6r/zJ4iaz8bzWTiI3HglRBw2NFvHRQhVqam+y7RpDfAmG9DH1boBuYZPy6
	H
X-Gm-Gg: ASbGncueBj5xuYFaVcOlUpiVxJx1FME8LftCbKYAWwWRDt5pN3+RRV5ipddkjN0eqrB
	F2Z0435oSvBedn6bYwkPEDIMnhKypPPA1pQFkS87g5rSOoWAVdvO+Z/3xEpjQO5PB4Tec5fyarq
	UItpPjsGTxY9AM4qnc/5NOACIPJJ97urJIszk0r2xUj85tnNFdJP+aw+PsseoqaZ0s3FaBerzQE
	Y6Z3hLgviTsiFeq5X9zQLsY5IRGGXcwhwgWk/t+OAfIBZ+zg+hb9/z/Whcw206IqDyXS7r9zRYy
	pnLeDOeVK6OIAEo9TcA2Xox28D1Ofvk=
X-Google-Smtp-Source: AGHT+IHAgmUkafUen89n7bbLeaGYepeWoisEXavDT1bjNZjvK5FGU7cwxv0IIOFmYGaFu7rxtoSidw==
X-Received: by 2002:a17:90b:2d4b:b0:2fe:b735:87da with SMTP id 98e67ed59e1d1-30a331d4e32mr2626002a91.0.1745981647594;
        Tue, 29 Apr 2025 19:54:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/14] libxml2: patch CVE-2025-32414
Date: Tue, 29 Apr 2025 19:53:31 -0700
Message-ID: <fbd708438aba0381a6c4f3d6cfbbd743f89a4f97.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215697

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.12 branch as 2.9 branch is unmaintained now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-32414.patch       | 74 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch
new file mode 100644
index 0000000000..23a2316672
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch
@@ -0,0 +1,74 @@
+From d7657811964eac1cb9743bb98649278ad948f0d2 Mon Sep 17 00:00:00 2001
+From: Maks Verver <maks@verver.ch>
+Date: Tue, 8 Apr 2025 13:13:55 +0200
+Subject: [PATCH] [CVE-2025-32414] python: Read at most len/4 characters.
+
+Fixes #889 by reserving space in the buffer for UTF-8 encoding of text.
+
+CVE: CVE-2025-32414
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d7657811964eac1cb9743bb98649278ad948f0d2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ python/libxml.c | 28 ++++++++++++++++++----------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/python/libxml.c b/python/libxml.c
+index 1fe8d685..2bf14078 100644
+--- a/python/libxml.c
++++ b/python/libxml.c
+@@ -287,7 +287,9 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
+ #endif
+     file = (PyObject *) context;
+     if (file == NULL) return(-1);
+-    ret = PyEval_CallMethod(file, (char *) "read", (char *) "(i)", len);
++    /* When read() returns a string, the length is in characters not bytes, so
++       request at most len / 4 characters to leave space for UTF-8 encoding. */
++    ret = PyEval_CallMethod(file, (char *) "read", (char *) "(i)", len / 4);
+     if (ret == NULL) {
+ 	printf("xmlPythonFileReadRaw: result is NULL\n");
+ 	return(-1);
+@@ -322,10 +324,12 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
+ 	Py_DECREF(ret);
+ 	return(-1);
+     }
+-    if (lenread > len)
+-	memcpy(buffer, data, len);
+-    else
+-	memcpy(buffer, data, lenread);
++    if (lenread < 0 || lenread > len) {
++	printf("xmlPythonFileReadRaw: invalid lenread\n");
++	Py_DECREF(ret);
++	return(-1);
++    }
++    memcpy(buffer, data, lenread);
+     Py_DECREF(ret);
+     return(lenread);
+ }
+@@ -352,7 +356,9 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
+ #endif
+     file = (PyObject *) context;
+     if (file == NULL) return(-1);
+-    ret = PyEval_CallMethod(file, (char *) "io_read", (char *) "(i)", len);
++    /* When io_read() returns a string, the length is in characters not bytes, so
++       request at most len / 4 characters to leave space for UTF-8 encoding. */
++    ret = PyEval_CallMethod(file, (char *) "io_read", (char *) "(i)", len / 4);
+     if (ret == NULL) {
+ 	printf("xmlPythonFileRead: result is NULL\n");
+ 	return(-1);
+@@ -387,10 +393,12 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
+ 	Py_DECREF(ret);
+ 	return(-1);
+     }
+-    if (lenread > len)
+-	memcpy(buffer, data, len);
+-    else
+-	memcpy(buffer, data, lenread);
++    if (lenread < 0 || lenread > len) {
++	printf("xmlPythonFileRead: invalid lenread\n");
++	Py_DECREF(ret);
++	return(-1);
++    }
++    memcpy(buffer, data, lenread);
+     Py_DECREF(ret);
+     return(lenread);
+ }
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 1cbd620b34..e281a39fd4 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -37,6 +37,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-27113.patch \
            file://CVE-2024-56171.patch \
            file://CVE-2025-24928.patch \
+           file://CVE-2025-32414.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


