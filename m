Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2647FC981C
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38623.1774823890399043602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AFz49f4m;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so2532985f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823888; x=1775428688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRa06zBwHlV5Ag93Oy22/3Js8afWQqIL+H84bObHBSI=;
        b=AFz49f4m75Mi+9jmZxrbVBia1xqHRO2q2vFofA5+V6mYN4Jhu6j3D57SR2bidoKSU0
         Up9gSWsiYykKUe7Hdcu879StYfs2OftWw/3+3scZIZOako6Kl5/vP1VwbG89t3dpxb5S
         xuHeiEi/rvPj2thhjmZi4k6yYj7BRvMQnSBvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823888; x=1775428688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRa06zBwHlV5Ag93Oy22/3Js8afWQqIL+H84bObHBSI=;
        b=bugWeaJm/nHLHomb/RrGwWytjyisWFpRbG80tgUSlQefu9jmc1DROiuue/c1OnzmdR
         PAQfXbGARpNPYxENgEGoxVxCNZG3JslHy9ILwMQcWaXtROV08IZd9BGt3pYa6Q02c5CF
         4eCC8LNuWmSVaFZo52KmGkkrp/ZTo8GhvNcjUjqa8tEJLb9jAb3dORa8o33rMI0GIp1l
         w59NS+up68nO8L07CgtMHq5feLdRhu552STkf1LsMwGLITQS+Z+PC3biX/eTNKAnKEaK
         CMbLJEIwLu3S4JIC7huxFxuvXBOoVkMytlS5WqoLYf4KQtnlDzuwBfGv1M30PwJpFspQ
         P4tg==
X-Gm-Message-State: AOJu0YyUhdI4S8U1/gIRIHudu9toXEB6TSyL6N0dcPW65SNorrPCEVGN
	qS1bCOw4wPNS9+CWZezk2rOSc07ZaPI5gd8z/niIaNjmG16p5VnlCCMyHqXoDXbSus7dcLeJybf
	4F1KzmfA=
X-Gm-Gg: ATEYQzxqzrwF5m776FtuiFbyt6fCDx/bcOxgGIw1RgrlgQYNsTsK3tTWf7MNj5Uwhih
	n1ZNDCApPFMZ/y181RZ/LAlOzvcQHVXYQHBJmg9riWMefdErsNvvP/bV3e6XWQ274BhPKROLtcs
	cQkKilcG8wrF7ffUBonH4WI9dwklLF7hnrjLdvFeLlSFVGLhgLgwUwVdlxFFyZ357h1dYB5NuCG
	R90BJP0mjNMwrZSnJccZFKFNNt3UuuLIvV43mT3BtWHMVOcg/0FLohGBg8zmEwAnC0ipltKeSEO
	JQPZQY8ScKcKCcf0qng+3BeCzohHE2ORRhkok0fUmTLRMjsiRfBv2LtqkYFDYbbSs4z2mjHWqHQ
	D0CSGTOFkDfNG9R+kUDJ8yxB4Vxt/Z89PfKJkgeStdgTeKLLm8Yuh0GrG86QJPWrrNYjNiS+oYM
	oV/zN57V9fz33j/M418fH3N5jrIFGMIU0X4QHAsmZFc3Nz7cDo0DH44/FbwAWHTzT3cOVxIssu0
	dgaFnkI15ZodgFy4oaXdk8JYKI=
X-Received: by 2002:a5d:5d08:0:b0:43c:f90b:5668 with SMTP id ffacd0b85a97d-43cf90b57fcmr6548445f8f.23.1774823888409;
        Sun, 29 Mar 2026 15:38:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/16] binutils: backport patch to fix build with glibc-2.43 on host
Date: Mon, 30 Mar 2026 00:37:41 +0200
Message-ID: <4618b2cc830e53ede824ec0d9abbd939013d1c94.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234167

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

