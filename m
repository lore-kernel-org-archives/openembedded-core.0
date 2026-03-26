Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7D010A88FC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55232.1774548902155978624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J676xxR/;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c56e822eso1349595f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548900; x=1775153700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPBzpdVuG1x1DZ0X/IxI8xVv0BAuIZuLIS+mPPGNWqc=;
        b=J676xxR/jDNYWLngLv27tZb/u4QNZ77/CrIjFFeVAuV5jtA+5ZBAZFjso8vBRPTku1
         jMkND9dlp23kkTfKNr8samcit/H5cpCcKiGXfmFqFMX3YxUYC/soTYgKfDPHTvUZN/hw
         nLH/3pGhyfvMdlU4WP+kozANengcDZ/riPCNf9CNJ1UYA4U/osaCVBzpDKQ/ni3Y6Ush
         d80CHJEmv6Nx2tHaH85+/f5baXNZ18M9z+T3Hfzx+O4kp77HFd2x1RwfwSB3c8M6amaq
         q3BSQxU7j/j0gj7XFRLCa0Ekex0N4K1Goa/CuLdgWYWoMcw7knBAXHnRsZSvLByFicEF
         PUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548900; x=1775153700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPBzpdVuG1x1DZ0X/IxI8xVv0BAuIZuLIS+mPPGNWqc=;
        b=eavwmoMlwOY4plzlANYHvepp/U0jF907h6XAZl2x4gcKcXL8L7jtOVESP5tXXYDyKa
         faHZkbEklWpc5YwqlZMHNWfFPT1r+HOYIH3ESUhgk27UuE0L2UQLgeC03A93I4xReYPq
         x0Fochzvw14NYR3442ApuphW/7BVV8eM2ZSzGsuTljwK6vMZv/4Tz/ZjIynqQffs5jsd
         ig7xSv/JNQ43oFdL31W27hS7RyoKkKZWxVvK6F7qBhjgS7gLt06yVyP2yLQmn+eLVNvF
         dNQ0U8IxOmJ1aTD8739dGD8OUeoICTE5cMdRdh8RuosOuTbu2+iluuuodeKzz7/QkToA
         Oc3g==
X-Gm-Message-State: AOJu0Yz8u6agJZXYTTmpXdi2/fxFNwqe3FRpikDia8pLm6jM0Eg1tNAC
	ohPQtatFhnrdxzgpCva6e0K6z1rvNXntShW8BtJpZxtreO0L0ip/iForPkZGiiHx
X-Gm-Gg: ATEYQzwNIS6+XwNIrzQNcFgYRM4SAN+5hNeDN4MyPpAZylVbh6FeN9icX+rZuw2/a+y
	7Ycf/5ASXlm5+brNT3iD/L7ICgqS1ScpuPcm/A/bZpJxJbTZAOWKYGgQGBTdESnEd6FkMyuFac5
	j07fzRtfTATtCqjTACCyDo/FPkFZ7BrDsR7+pbrdz7JtjqlMTYUy0ScqKbBCEtydN4xwVcPdCLQ
	FhvIc901LTCd1aDh+9rloGPLvdEq5jg1HSm0E4EiD/aGOYt/YCDZineKBnKwLyUgWhFDomRq0X6
	w1ETfCvNXS5Oz43BZWW8+bWfcAhPfqVgclmAX6vHfH2GdKgvGRRJkab2g7/tRMYX4J0LYZLIm1m
	/yc8gASZ4LT9Aqla3rEqtUMI5X7YCHh5T5VusVIRPP5HNwm7cK2hnDalasS5k0IVRR1fZRv1/0L
	LO7F3gslVbLfEhJHKdcEboLEIFfg==
X-Received: by 2002:a05:6000:3112:b0:439:f64b:a82b with SMTP id ffacd0b85a97d-43b88a2161emr12771805f8f.6.1774548900271;
        Thu, 26 Mar 2026 11:15:00 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm10779307f8f.27.2026.03.26.11.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:14:59 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 6/6] binutils: backport patch to fix build with glibc-2.43 on host
Date: Thu, 26 Mar 2026 19:14:50 +0100
Message-ID: <20260326181450.1262870-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181450.1262870-1-martin.jansa@gmail.com>
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234040

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
index 839d31242e..36bd49ad03 100644
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

