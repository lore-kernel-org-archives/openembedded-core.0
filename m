Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76213C3ABAF
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.8386.1745982019224670167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vM9SjPTI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2255003f4c6so75634185ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982018; x=1746586818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMFxKUxcQhJj3uz+zv0lEKjo6e18FnU4xtxq+HdqfV4=;
        b=vM9SjPTISY82S4xFUfdFCBpT0aUU6YFKZuSrvy9gwNoE9BP8kSYMwmDgY7gBUiz65e
         s51BheppiTGHehxx/F2b/UIiMlxrtC4ZF8JH16Em1ady4Mkto1DRjDf5pt1I2cBU9n1v
         KMTwZyWuGbRd1tKG3boHezvk7YAs2ks3yIMiv38iORpzeCA5POJdeokvA1jYpp2QCLWq
         onPENcuMySF5GpfdgN3cDI6KTxPDFBmLoeBU/a7OU3bQy0iu9GRowR1ABjrtMSpKS/91
         Qk78KcLgaNXpfJb9VgR2Ow/a4TRp4/wmIoWATm7xIRFFdj+aBWZNBSoPT6Hp8IzurKyw
         rS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982018; x=1746586818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMFxKUxcQhJj3uz+zv0lEKjo6e18FnU4xtxq+HdqfV4=;
        b=SF57JQFDcD7CPhodrEuUbj8m0sayoIbnAF4KwviRVd+spW6CRMz/a25uEUgyG8rAwy
         cwSwX8NUrZcxqIKF0X55k2NCnNMQkox4F/u6EAEfs4fvSzw2WR/qYU/w1sAo8FFxKg1R
         jq6CX7TS22YPRTIAeQtzLskSLD+AB0BXoXGWF3IWhxV6Ikz8IKLd0qAAynVaOPHiVQ3m
         6YY0R6jdjv7D4CP9Sj5RjmWjZgPSMGFZvUEUPe667Yi1pCQO9onBDEfObr6vvjbIxQIl
         fWj4ui4GKO8+qyLviGtQPdazM2iL4pd5SvK8h2Bmw1QUA5AUQgnq7KvKlj2QxNKI3G6+
         twDg==
X-Gm-Message-State: AOJu0YyQlFMh+U5Kx+u9RyeGhFDOKCjh1dXVmuFGfQkFKQqeexmha/il
	o9BCuTzp/S/sXPczySrw0Sa54hjCEduSH0ifUymxWjANIGHsA75yTWVtlQ9ZQTUxCKMvapveiVE
	q
X-Gm-Gg: ASbGncsZLywltK78KiwRhJG56RCI/FAWH1PPJ+EWg3yJUeFlnNd8shDhwsGlchXq4Tv
	VPAanMSWFf+FIzKcbQLr8nQtbqIGmr+aXtpUp3EfE/v+30YSN/B5b8/+xbFo6ncoas50uY1AHES
	3d17Ac0TknEtq0mQ6YC2X4N6SZIIioxjw8Urqo86og2PFe032gK9g1icuznM/uSjRkuZFTwT6Oz
	9RvsMCqdBk41lZM+LWTzUBlT4GpNK5/MN3IouIP9pbJqd8kpEjG2a920U6ZcCZRxk8767bW9fkr
	iJo8jUZngxYz+InPcCUroSF1hN+YA00=
X-Google-Smtp-Source: AGHT+IF68rVK6BCmZKUJn17f3yoBNuax8G0UN2k9JJepRBpxiCowO+5SOf8RYndGh0vGj+u4RagoCg==
X-Received: by 2002:a17:903:947:b0:223:66bb:8995 with SMTP id d9443c01a7336-22df34ddb5dmr23093595ad.20.1745982018439;
        Tue, 29 Apr 2025 20:00:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/15] libxml2: patch CVE-2025-32414
Date: Tue, 29 Apr 2025 19:59:51 -0700
Message-ID: <187052ce4ddd43b46b8335cc955a63ca19ee6994.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215709

From: Peter Marko <peter.marko@siemens.com>

Pick commit which has been backported to 2.12 release branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-32414.patch       | 74 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch
new file mode 100644
index 0000000000..97bf75f059
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
+@@ -248,7 +248,9 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
+ 
+     file = (PyObject *) context;
+     if (file == NULL) return(-1);
+-    ret = PyObject_CallMethod(file, (char *) "read", (char *) "(i)", len);
++    /* When read() returns a string, the length is in characters not bytes, so
++       request at most len / 4 characters to leave space for UTF-8 encoding. */
++    ret = PyObject_CallMethod(file, (char *) "read", (char *) "(i)", len / 4);
+     if (ret == NULL) {
+ 	printf("xmlPythonFileReadRaw: result is NULL\n");
+ 	return(-1);
+@@ -283,10 +285,12 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
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
+@@ -310,7 +314,9 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
+ 
+     file = (PyObject *) context;
+     if (file == NULL) return(-1);
+-    ret = PyObject_CallMethod(file, (char *) "io_read", (char *) "(i)", len);
++    /* When io_read() returns a string, the length is in characters not bytes, so
++       request at most len / 4 characters to leave space for UTF-8 encoding. */
++    ret = PyObject_CallMethod(file, (char *) "io_read", (char *) "(i)", len / 4);
+     if (ret == NULL) {
+ 	printf("xmlPythonFileRead: result is NULL\n");
+ 	return(-1);
+@@ -345,10 +351,12 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
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
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index c4f76c281d..42672e35bd 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -18,6 +18,7 @@ inherit gnomebase
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://install-tests.patch \
+           file://CVE-2025-32414.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.43.0


