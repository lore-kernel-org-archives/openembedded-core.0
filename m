Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E2CD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 12:59:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7424.1765198756799843702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 04:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FQMDupXK;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2984dfae043so44869695ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1765198756; x=1765803556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY2fa0z0pVFGKyJ66uvoLbrfBJEdJk4ZvnvmF7YsozA=;
        b=FQMDupXKSDq4Lgh5Nv8XeKZMcCWTPyGx363HNlohMJneSHmHlLTCFTqOLYLdqKNZHg
         1TYTHPWweldIljzFVF7grgZD4hVJcF+3KYg//ZV717M3kvas9Mpn9YstpYbMH9+7rPvJ
         HWkNp5drKI1gXNWCK5T51HLyHYxZrF1CQuKuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765198756; x=1765803556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY2fa0z0pVFGKyJ66uvoLbrfBJEdJk4ZvnvmF7YsozA=;
        b=BIkawwJVkburrsaHQ+3Bnh4Fz2ELtAYyI52rUVN+reIHotO1paKcylGMXlc2sfgeik
         5dxGttdGKo9ztxSc9S4fQPR3OJO+qs8WSvDPQSDKPvQVPtE4QUtwMxMrKOEWJ6BOEPa/
         WYMiVAlSN77By5qGI8xVhT09hY387XL0uF7avuWpjB8RMgzVDpu7mlcCZ9xwZEI9mTBe
         IxRiEdPnr7kvZUhqXgN7OrXfINYExx1Y4rlUb76Z+Sq4no2Tfi04asMSLKWi9yGg6kZH
         SsvNUjgvet/eDrfD1/eu4A5qzWu5ehI7WlUTTdBRlH/3bxTyv4ftZMRH53Tu3SL749bq
         x7yg==
X-Gm-Message-State: AOJu0Yzk9DRsmGO1kXxui4nBEJJLLSrdxAXpZdlfClgIOyxAcXvkSQlS
	CnIU1LWYlNlgCHLFF7mSPF4bGpVmmjNCjz43NsmlU6bYaOUhuZZfEX+zPQtrtXXiViOR1i/pCRH
	sUl+/
X-Gm-Gg: ASbGncuWLKCzuWt3ESfdL9WGgGJO0FOjw+wZoguTXNqM7AeVhVL8h6zn1NjLiYWQkaL
	eBa3b/PLTjrtErOhkw0KqjHIj5OQcDcv+IQOs1xIQYfHRrTj7Kt8WHHbHVGZ/2gyJogLVrq8wqI
	opesPm6a6enHwyBQTXcbjQiTR5XdZ8I8plGFKnbtEPxHazGqpn3kCwwVeNstOz62WI2MFsWdosg
	9W0sxbc/ylFvXMQxCKiepFqJ7zxm5lCq3PRaXGTsC1Yiwh5Dvx7kLCDi/WUiI3285MAK06Lui6t
	CBSmDzm1JjRRFpLoXeiBbfgIXB82hVmrENUhAgtcrQHBcSAGFDkBoj4HSmZ/KsmBnCo/n5pzDzg
	5VZfATStmPt+uiceDpVlPbDSDPeGAfE+5xaX1QQh4MDppyd9uqfUr5GMTGMZVl+jhYeSugKhWfb
	8vd4Bfz5BRh1+skBcoOVzkyJoH5xhV0OuB
X-Google-Smtp-Source: AGHT+IELj+vQItrW0HengnjEL6/jTzrg652qol3vmtL91lYr5oNKbEAWGerBoK+XHcwPJfMwH79Lcw==
X-Received: by 2002:a17:902:ebc4:b0:297:d6c2:d06 with SMTP id d9443c01a7336-29df5572556mr49657585ad.20.1765198755599;
        Mon, 08 Dec 2025 04:59:15 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:922:f769:b213:6c9f:8a30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm127191775ad.58.2025.12.08.04.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 04:59:14 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][patch] libssh2: fix regression in KEX method validation (GH-1553)
Date: Mon,  8 Dec 2025 18:29:04 +0530
Message-ID: <20251208125905.2296641-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 12:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227393

Resolves: https://github.com/libssh2/libssh2/issues/1553

Regression caused by
https://github.com/libssh2/libssh2/commit/00e2a07e824db8798d94809156e9fb4e70a42f89

Backport fix
https://github.com/libssh2/libssh2/commit/4beed7245889ba149cc372f845d5969ce5103a5d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...rror-if-user-KEX-methods-are-invalid.patch | 73 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch

diff --git a/meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch b/meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch
new file mode 100644
index 0000000000..9e7bb9a905
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch
@@ -0,0 +1,73 @@
+From 4beed7245889ba149cc372f845d5969ce5103a5d Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 28 Feb 2025 09:32:30 -0800
+Subject: [PATCH] Return error if user KEX methods are invalid #1553 (#1554)
+
+Notes:
+Fixes #1553. Restores error case if user passes in invalid KEX method value to libssh2_session_method_pref.
+
+Credit:
+Amy Lin
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/4beed7245889ba149cc372f845d5969ce5103a5d]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/kex.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index ebee54f987..bafda0e611 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -4196,23 +4196,11 @@ libssh2_session_method_pref(LIBSSH2_SESSION * session, int method_type,
+     char *tmpprefs = NULL;
+     size_t prefs_len = strlen(prefs);
+     const LIBSSH2_COMMON_METHOD **mlist;
+-    const char *kex_extensions = "ext-info-c,kex-strict-c-v00@openssh.com,";
+-    size_t kex_extensions_len = strlen(kex_extensions);
+ 
+     switch(method_type) {
+     case LIBSSH2_METHOD_KEX:
+         prefvar = &session->kex_prefs;
+         mlist = (const LIBSSH2_COMMON_METHOD **)libssh2_kex_methods;
+-        tmpprefs = LIBSSH2_ALLOC(session, kex_extensions_len + prefs_len + 1);
+-        if(!tmpprefs) {
+-            return _libssh2_error(session, LIBSSH2_ERROR_ALLOC,
+-                                  "Error allocated space for kex method"
+-                                  " preferences");
+-        }
+-        memcpy(tmpprefs, kex_extensions, kex_extensions_len);
+-        memcpy(tmpprefs + kex_extensions_len, prefs, prefs_len + 1);
+-        prefs = tmpprefs;
+-        prefs_len = strlen(prefs);
+         break;
+ 
+     case LIBSSH2_METHOD_HOSTKEY:
+@@ -4314,6 +4302,27 @@ libssh2_session_method_pref(LIBSSH2_SESSION * session, int method_type,
+                               "supported");
+     }
+ 
++    /* add method kex extension to the start of the user list */
++    if(method_type == LIBSSH2_METHOD_KEX) {
++        const char *kex_extensions =
++                    "ext-info-c,kex-strict-c-v00@openssh.com,";
++        size_t kex_extensions_len = strlen(kex_extensions);
++        size_t tmp_len = kex_extensions_len + strlen(newprefs);
++        tmpprefs = LIBSSH2_ALLOC(session, tmp_len + 1);
++        if(!tmpprefs) {
++            return _libssh2_error(session, LIBSSH2_ERROR_ALLOC,
++                                  "Error allocated space for kex method"
++                                  " preferences");
++        }
++
++        memcpy(tmpprefs, kex_extensions, kex_extensions_len);
++        memcpy(tmpprefs + kex_extensions_len, newprefs, strlen(newprefs));
++        tmpprefs[tmp_len] = '\0';
++
++        LIBSSH2_FREE(session, newprefs);
++        newprefs = tmpprefs;
++    }
++
+     if(*prefvar) {
+         LIBSSH2_FREE(session, *prefvar);
+     }
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 6d2580072b..11d7448687 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
+           file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.43.0


