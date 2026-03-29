Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ED7FC981C
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38501.1774824399483087567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xWESXuGp;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so37166975e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824397; x=1775429197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRa06zBwHlV5Ag93Oy22/3Js8afWQqIL+H84bObHBSI=;
        b=xWESXuGp2avY+4uwrZk90zWz5z+3qUlFptPZJBxJKxwjmiy6iLOk/CN6hMEnAs4MLF
         6bewo/rYwWryoQhUxK//TGESFv+4SQTCB5ENwxO9VcFqDk/jH74tfx3jpL6SHlws3j2D
         OecQ6XQdeGIM7Ba8x0fZYTlcXNKqDv9gL2org=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824397; x=1775429197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRa06zBwHlV5Ag93Oy22/3Js8afWQqIL+H84bObHBSI=;
        b=cD3ar0/lurILQ5EfZkzy7TpvVzY+34IpTEbN4lt/RZsEDXWYeQLz0X2S5UGb1agXfN
         zmx/4hMZTF27Lxo+h1LLZXuFrsayOatWXa73KSxlPJGzWqirkH718jT4Kz2ynzPP+TKS
         No/1b7OGRzLiyBZUZEu31Z2j3IIBVMaWCnsa3t70Qr/u1rVPfIoEH52K4meEPI5ZofSM
         U6bCvc46sjFOiJiVT0eBj11Eu0CZCEg1K6eKk5sSleENPqQMfjhVSROt4CMpnU3u2ZG9
         QKhlz6a88GSg3MZ0RjQgbc/zJrJs9fN0rKT72jXXjN6jYD9Qj0+21QFWWKfoSihKlclI
         VdQQ==
X-Gm-Message-State: AOJu0Yw2+xloF3Qmbf+uEfSDseLcy0OjbKE1eTts0OUjVRmtaYBxFxEw
	qhEMWXoYO+I7TWY9Q8wHjJC498G9TQir65jwiVxqgVSiXl6sJqdbyCJVzGAy3OAJ5xqK/M95RhG
	YAWtL2Rw=
X-Gm-Gg: ATEYQzwCN/zesjT5MeQ1L4rl6WfZR2FOj3fzOI/OH5HdN1BrlQxqj6W2JeP7jJvNkRK
	xbGgJzh2P/ylywxdA9OjyFAFokan85KTKfnHoeJXj8ZSmzhPJKz+HUwTXG9GmSL7AelUxWbRLo0
	XAQ2EUoZfbm5JED8vVtWAmNDGav7Ut2aaldXntvo0G4Rl8reaK5XZ7RKVVKVtBMScfoBgdLpkaT
	gzuig27xBju8qpnHSEzymnG+/eRC3vIvXeV4BHJ8HVz9l15NsLtpqCHBjceVyGlVY2M72YeHk+O
	mc2vw7hN33OBbYZOabQKLK9zDsEojPU+YDcaafDfkm54RVSsMQKsUMiLWP8z9rTi8nGtCXPfEfs
	8dWkVlvPXrWAnLbxVsC831FWYsl1lNLS7qsFf78q2NuHbbugszxrlaZpqL9yPGnracVfgKD6NnF
	rY0sq+ns8ijJalyCopVl7p1S34CCRgX8kGbuf8nZM3k3R2XmEQNDbSjWWGXXBCmu9abEOy87e8m
	4aji/7fFcvbUH9IjKXritshBnQ=
X-Received: by 2002:a05:600c:2d09:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-48735159152mr36445075e9.14.1774824397512;
        Sun, 29 Mar 2026 15:46:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] binutils: backport patch to fix build with glibc-2.43 on host
Date: Mon, 30 Mar 2026 00:46:16 +0200
Message-ID: <4618b2cc830e53ede824ec0d9abbd939013d1c94.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234191

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 839d31242ef..36bd49ad03d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -43,6 +43,7 @@ SRC_URI = "\
      file://0019-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch \
      file://0020-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch \
      file://0021-gprofng-fix-build-with-std-gnu23.patch \
+     file://0022-gprofng-protect-against-standard-library-macros.patch \
      file://0018-CVE-2025-0840.patch \
      file://CVE-2025-1176.patch \
      file://CVE-2025-1178.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 00000000000..0fa0a939918
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

