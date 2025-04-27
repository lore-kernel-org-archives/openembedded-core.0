Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A87C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:35:40 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.29339.1745771737148045369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=N0hSrPiq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250427163534ff436ebb42bf1d99ed-dyr3op@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250427163534ff436ebb42bf1d99ed
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 18:35:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mhqDg5ku+9dgu/BCRSnbkkif+SA2VxhvKQiD70ffI58=;
 b=N0hSrPiqBJEjDOemW2k/yR+YBl8DEVpuI1NF3AtJy2VoElEHvG3Fz/mV93Yw1MIYJ4bIyY
 SMD3BjlbnOwGoiUjAJvo6jTDpYANchEQdV96IwYmgkhv0GZVxkdikOQCxEMp9/mG4ri0qK6Y
 Gd1MdmPFHBvHYnljzbhbC53MUx4REZ4AnV+nerML675B4janKaYZhdTBaqBz0CQIeczvw6PY
 6iXPixBGO81n2x/N5sgIojfMrzxbuJPNX6/uUBUMkigElbnXKPoX6ymLKFc0wGD51mZOYpe6
 X9/Q9D3N3Wo/pIrV/e29AdnpTN54U7WdnT52Bihmdr+HLp7erIe9e2OQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] libxml2: patch CVE-2025-32414
Date: Sun, 27 Apr 2025 18:34:46 +0200
Message-Id: <20250427163447.994987-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215562

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.12 branch as 2.9 branch is unmaintained now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

