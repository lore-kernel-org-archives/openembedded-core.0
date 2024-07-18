Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E62C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:21 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.15399.1721310375701806095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LrY7AY/P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc49c0aaffso8185615ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310375; x=1721915175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+l69buO2Wot0B/nRIlGbsK1ZN0Hnnt178uKQlw7V1k=;
        b=LrY7AY/PxpgYfr/lqSNp4UoBQGHVzpr+bUWofi92rQpP+V7+yOQZIU7p3kpkEoJ9Vm
         kIDTAIS5E9ZTWFvtoaL/noDcYDXuqDV2mEyKqPFXbiR2aejaRD6efg1QE00KxfCoADnD
         6YyKfpLJfQj/5Wwtrgrc82APoYExRji6Zib5o+1tcAwAxMCCJ+7DQgLCRTMQ+gxrDmXe
         312MXZ0nLKWNWOxo4m9R6GeRdYx38GI5lm0JtCg8IqZwLK33Mb0ZSLI9cLMawdCPh2dW
         UsH9cVEGVJVFk/2MSeIgLTdhIeozq3vkWJJos3Pvl/Qyz4v2QoR+2bC7LJf4QDONgoiI
         Vd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310375; x=1721915175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+l69buO2Wot0B/nRIlGbsK1ZN0Hnnt178uKQlw7V1k=;
        b=YT33xfdJzymL9pIOSEo6lIVsxa9dodYnLItPBCjrCvIG3XzUriqRcj5xHWJUW5qFp/
         221Tdm36rt6akAvTE1A3YVauhUatbhwyip7H5D0Hv0TQ7dQM+mi4xqRTUtFnh+e0wqTV
         ZqF9qo+2WZ8o/zXJrU6E1wCT/MVzNmmLP+0oxt3e3Xz3pXgEQcgHrAWIOMgD4luixxUm
         2AQl64tNvbkws6PL8e5sV/A+VFrja74wMzDWiLRQXy6qWT3a++IFuWXrMr0x1IAyK8CN
         zgJtrpPxeSrhYpP9NuuzPskGx4Fzw761VSTvedALiZUqsFLbvljfd+5b1zJFUbBPFb76
         QBmw==
X-Gm-Message-State: AOJu0Yz34U+WFXoTm2faq5OdsAElLp6Jj/1vGI0QIjSKtJowyDt9HdID
	kKAE4r0/l4ROs5QVR+hEqTHlGaGvACZmgyN+G2OUhxtgtB67XIaA8N6iPIqIEkjH+8mkeTQ6Nem
	e
X-Google-Smtp-Source: AGHT+IEv7dLqyZkozyKCg06kHhRMuO+EkS7W0n6dIAuJdkTCL6ZVFJWQmMSkxBCCX698/4SsH2P3/A==
X-Received: by 2002:a17:903:22cf:b0:1fb:438a:5e4b with SMTP id d9443c01a7336-1fc4e56242cmr43643105ad.41.1721310374924;
        Thu, 18 Jul 2024 06:46:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.46.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:46:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] pixman: fixing inline failure with -Og
Date: Thu, 18 Jul 2024 06:45:41 -0700
Message-Id: <6cd503c5e84bf8090b840c69c7569ae1a46528d0.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202225

From: Changqing Li <changqing.li@windriver.com>

When debug build is enabled(-Og is used), pixman-native do_compile
failed with error:
In function ‘combine_inner’,
    inlined from ‘combine_soft_light_ca_float’ at ../pixman-0.42.2/pixman/pixman-combine-float.c:655:1:
../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining failed in call to ‘always_inline’ ‘combine_soft_light_c’: function not considered for inlining
  370 |     combine_ ## name ## _c (float sa, float s, float da, float d)

Refer [1], always_inline is not suggested to use with indirect function
call, replace always_inline with __inline__ to fix the issue

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107931

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
 .../xorg-lib/pixman_0.42.2.bb                 |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
new file mode 100644
index 0000000000..5c79754e50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
@@ -0,0 +1,56 @@
+From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 16 Jul 2024 15:31:16 +0800
+Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
+ always_inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Refer [1], always-inline is not suggested to be used if you have indirect
+calls. so replace force_inline with inline to fix error:
+In function ‘combine_inner’,
+    inlined from ‘combine_soft_light_ca_float’ at ../pixman/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call to ‘always_inline’ ‘combine_soft_light_c’: function not considered for inlining
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115679
+
+Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pixman/pixman-combine-float.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float.c
+index f5145bc..f65eb5f 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float da)
+ }
+ 
+ #define MAKE_PD_COMBINERS(name, a, b)					\
+-    static float force_inline						\
++    static float inline						\
+     pd_combine_ ## name (float sa, float s, float da, float d)		\
+     {									\
+ 	const float fa = get_factor (a, sa, da);			\
+@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,		ONE_MINUS_DA_OVER_SA,		ONE_MINUS_SA_OVER_DA)
+  */
+ 
+ #define MAKE_SEPARABLE_PDF_COMBINERS(name)				\
+-    static force_inline float						\
++    static inline float						\
+     combine_ ## name ## _a (float sa, float s, float da, float d)	\
+     {									\
+ 	return da + sa - da * sa;					\
+     }									\
+     									\
+-    static force_inline float						\
++    static inline float						\
+     combine_ ## name ## _c (float sa, float s, float da, float d)	\
+     {									\
+ 	float f = (1 - sa) * d + (1 - da) * s;				\
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index 23ae0cbb27..3c55c1705a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+           file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch \
            "
 SRC_URI[sha256sum] = "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3fe62626e38e234a625e"
 
-- 
2.34.1


