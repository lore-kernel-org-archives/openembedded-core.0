Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1998EF327A7
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:42:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11376.1776750174463820383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O2QSMZs0;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so33156495e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750173; x=1777354973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLgBXGidngh5A0UDckreeThiTMFjaCb6mV1NOTr+aC0=;
        b=O2QSMZs0zgwPxvFN1HuikEvjbN+zQnGach6Es8TqrYcXoNAFVG+9gnhVzRHW/ciiid
         ImMVuyC+jHbV2GDGc6f9+H5POBFALPd343sM73fjbTg2EoEcQTW32TimdGJhRGc6djvA
         fLgxj4Wbir1sL1NqGBrv7KmRK0TE88tCOXhlFo/WM78MYHQ2vU6FYuMi84jEDHu66dW6
         Lesfof49VOulseVRhqROzqgH72UW58p6x8bFMEJ0G7zEJmNzQ4oXc/Y0Tu/v99/Xyi4F
         yRK+tsfciTYCQk1+6DGJCJmnvgQmCcAZ2SzLd+sA0lYso+/AGV9DN7dq9eMHmo9eg7/g
         Gnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750173; x=1777354973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLgBXGidngh5A0UDckreeThiTMFjaCb6mV1NOTr+aC0=;
        b=jqvUqq/1j6k0yYbDRy65N8rBIJfv8JODQUer8SfbRSflginFwbSvXu/0iud0zSWFkz
         S+jcxB1+SzHs4FcLP5Vw7LeIY789ywHo2qbBGBCBFW6cBqKvM74XVTpP40z/GO8LgixJ
         vgKE8jcHZ+mTvcoAoqf5D7UxYYxdBxVbNcXVoum2YHof54xMhGUAfsuirOBdZvr+MH/J
         fnfZybCB7XLl5rrAbd99GXjLfYVNEGAuE7bmByjvLcziAaXWwd2toqtuSjW10ar6eHwf
         srcoTVkHPeBaS8qc5s76M5gp0FCoynadr/8VJA+rushBmM6ChnCyWAT7IedvJ9mZP9PO
         MS6A==
X-Gm-Message-State: AOJu0YxqbgaYVUD9mh0OtwXe6dvz8i2KhnC9go2N+UihwWhA/qn4cbGq
	S9yjB2A7Gmdu428K+G8P4phws9qUnWcD9PPOLnPd7e2KJMD57o5FbTDIlBEFdw==
X-Gm-Gg: AeBDietFGgTmPEVMRR+Zf4kH16q6c9GK7P2vOWU2l2exaLIhMS0uMQ9qIR1FhDoMM8/
	7XUAncky2DKKmE3dMiNwbc/fu6lOeBUHK+x4rskpD4Gwvohp7M7vF0XQnv5ufTEXLk1Un2kUWu6
	/8UJujMFFB/zO/FV1D24VihljWsFO7h92b8wBblUlAVHuXfw+l2RMC/RkWKKq/lEqJFYtNlKkE5
	Rhk55+P+N6n49AQygANCH8zIJ9oyHm1patUs6wx9ODcO6SwYPmg0pUMfuWVir9Tez16CKDbQKgz
	QyDUtfhScOWUKlotmbcBdWnJ8oWAJDx0cQjHmJ4DLVzQyuQOyHL4j+z4LWPAOqiyOmV5TahAXXA
	bea1kS03gY/ztlk+urizg8SKQrQhdemYryKW58Baon0FUVLbpe9dQebe09RYdW1My4AvAfsXz8J
	6wEWwx4uedj4aX4B28EiNtwE/9ZC8zP1MKJ+7IN6WtH/KAeHdmDIMEeivXKvneTt+8z3vxHHNs+
	SEFv1sX/aU7otb80tdI
X-Received: by 2002:a05:600c:c101:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a54a6b3aemr22646575e9.17.1776750172723;
        Mon, 20 Apr 2026 22:42:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4896c2a1804sm44741645e9.4.2026.04.20.22.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:42:52 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 6/6] binutils: backport patch to fix build with glibc-2.43 on host
Date: Tue, 21 Apr 2026 07:42:40 +0200
Message-ID: <20260421054240.3264-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421054240.3264-1-martin.jansa@gmail.com>
References: <20260421054240.3264-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235596

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
 .../binutils/binutils-2.42.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e27502af72..096ccf42c2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://0019-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch \
      file://0020-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch \
      file://0021-gprofng-fix-build-with-std-gnu23.patch \
+     file://0022-gprofng-protect-against-standard-library-macros.patch \
      file://0018-CVE-2025-0840.patch \
      file://CVE-2025-1176.patch \
      file://CVE-2025-1178.patch \
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

