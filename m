Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD65C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:14:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.29105.1745770433751058828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PffYdaxu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202504271613498d0abcaa881277ded6-yu6g0k@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202504271613498d0abcaa881277ded6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 18:13:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hDzLma+qxDIfaRZoA6F168GgPp3MA+WZX9ehYRYq5EI=;
 b=PffYdaxuw6ihmeC7NndMHLqsgT+q0rTouqpYaGtfwlgWPcEM1lezS0fRKX/566TrM3NU9Z
 8yjraMCFQ1LgkItVyqiHfZJ8OfXCdjvM8E9OO0nJLVOWHfTnFGlLRkMM4nMX6S5A48pFkPoY
 W45jj8vbKgfnuHIWUtz6G1eaZ5XRgvUKuav87NJWIr6E3K5UdDyvb+991St4bL3UsMRQRsoo
 k/zovRdtRMmy0tr2HCXzslDtAkcMBQPA0sFFk9qv0NRSId6BBKE+KBCB/52ID7Bx40cjss6b
 7KuhX1EHiNAOoGNpxOs8hqzOvSMrRzO2pg38ZWGPUw0lyhAznfpYpDTQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] libxml2: patch CVE-2025-32414
Date: Sun, 27 Apr 2025 18:13:01 +0200
Message-Id: <20250427161302.4064196-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215560

From: Peter Marko <peter.marko@siemens.com>

Pick commit which has been backported to 2.12 release branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

