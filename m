Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF97F31E28
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.134997.1775748530496466952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S78BJBxj;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd96354aso651402f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748529; x=1776353329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuD2t07dqSiyQbPAoL4L3Ck2fIgIeMA5gwuBViFd0co=;
        b=S78BJBxjEvTHFfsgOp5s34VrFJZtmHs+a/ojHdNewD8wtXorkjeD78LpiHJis4z9V4
         c4ZOTxoDHC/OefCRR542dgL5XEwmGwMUeqVGQpi01ZQGs0cJ1mnA9WPQoOnDSF3GLiFZ
         NbgpoaC+SaKRAuLGEOc56ziH+Y5WLpZF4zAZ5+rafTYtlHCCMyqoEE4MeCLLzj189Rrv
         3EyCpUu4PljWsZwMyg3pq2fby5Fgnk+hgWpR8eCfxtmhn9o3o/BwtlM1mxSjhyrMv2o6
         fRvwf9b1TJc58fv4UN5mP3L+S1Ixi9uufsWjAWN+cTxLmJ+e7aEemZY8RpJqx6ItruFB
         4fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748529; x=1776353329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kuD2t07dqSiyQbPAoL4L3Ck2fIgIeMA5gwuBViFd0co=;
        b=gq6aCgSYdmieXqAVgZB99Uy19kefbjVVsdf+a/H5qKoHJYpHbTBLDoImIoaSM1V/Fw
         FM95ViC2aGqe+DbuqlTvGRythS6CF9rHOX3uuZgLooAs19pbx3JO6zXwLOhZMC76Y9ya
         arQDZgntS1ZqXYnAO3NXudprEOFCb3JNQ+DQ8sJK+6w9nxsCdvCEnbG2zvx3OXvr+ju+
         ofTCHvX0aJbXEpwduj0hxFjS8F8W428cSG+PZ4r2Xusj7EOAQMpWW5TuGZEVP7iiWtPn
         O6sH4I9Xd4oqMN3NfKAF+0g/Xt6kqHSTykVFXbfhBJRfVAXcYNC2Wc1h6tNvJ1zWYVTg
         rXiA==
X-Gm-Message-State: AOJu0YxOgz44ei3c83OCEhnxnmi/XMH4vgpA/px4n/G6PWoVFTyqSxtt
	hzQ99KyVg7OZsIdg4Y/5yi2ks0GRUuX04RvvbCUc8xVQjGPK5dH6TbYBYGsOMA==
X-Gm-Gg: AeBDies7I7dyp95Z2MySxB4teJRzFh+NXhvGQFGT748i3u54D7QxHuvAGs+uFH67a0i
	ad/SX/Jg1cvBjcbp5bQWaP1nXjEVTY0RcTKlkshU2TtrBKcsk7Qi7X5SnClDZ1Ekd1cJq2vGmjN
	GSrlQXnTE7hZguelPZ5scuvQ8xbVwVtOkEH082DbjV5tLaRoPzreT31ibM1IzqGHirma68frRze
	+YEAkUfJ/WDX+eGtrrUQJJOMnsfUnH01E9XQ7P26AhUZ8WpxXpbpV2xIkf45crZTlh9a4aPaQQt
	zhNfvibhGqjNz6UhzzQGCTXaLqjXmVhtr/C5Odsfj0R9gwT2pXv8EJSD3b/9JPnNs2lBfeNSi98
	eF0g50Qv6uwC0O7Cgu5kBESGcj9dF65/PfN0o20FnuQ1zerR6Z3rjGSFpPTEMP5OXP9DIeR52ML
	nbwTasMK6h44MwIGKw+9Gs7EqObQ==
X-Received: by 2002:a05:6000:400a:b0:43d:578:586f with SMTP id ffacd0b85a97d-43d292d3562mr38600897f8f.25.1775748528720;
        Thu, 09 Apr 2026 08:28:48 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d27a8sm68813125f8f.17.2026.04.09.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:48 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH 9/9] binutils: backport patch to fix build with glibc-2.43 on host
Date: Thu,  9 Apr 2026 17:28:28 +0200
Message-ID: <20260409152839.2894434-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234925

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
../../../gprofng/libcollector/linetrace.c: In function ‘__collector_ext_line_install’:
../../../gprofng/libcollector/linetrace.c:219:45: error: expected identifier before ‘_Generic’
  219 |   if (java_follow_env != NULL && CALL_UTIL (strstr)(java_follow_env, COLLECTOR_JVMTI_OPTION))
      |                                             ^~~~~~
../../../gprofng/libcollector/linetrace.c:219:34: note: in expansion of macro ‘CALL_UTIL’
  219 |   if (java_follow_env != NULL && CALL_UTIL (strstr)(java_follow_env, COLLECTOR_JVMTI_OPTION))
      |                                  ^~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 16a63cabc5..f5456c0b0f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -39,6 +39,7 @@ SRC_URI = "\
      file://0015-CVE-2025-11081.patch \
      file://0016-CVE-2025-11082.patch \
      file://0017-CVE-2025-11083.patch \
+     file://0022-gprofng-protect-against-standard-library-macros.patch \
      file://CVE-2025-11414.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 0000000000..0fa0a93991
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,31 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream-Status: Backport [2.46 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().

