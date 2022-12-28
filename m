Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FA3C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 04:06:41 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.174038.1672200400144833905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 20:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=QhihK00Z;
 spf=pass (domain: underview.tech, ip: 209.85.161.54, mailfrom: vince@underview.tech)
Received: by mail-oo1-f54.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso2518968ooi.10
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 20:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQupQI/e5WOjLoPxFjAKJdfcEvYOJowSaHYRx7Gak4U=;
        b=QhihK00ZR0VOwZZrg3P4OpvNjRGqkeVpvXecIvQtiuI+vILpGnwM/8HlUug98jROQo
         6+5aeW5XVwFskz2DCZwrp+PuAfI0gnVhZ7xCUK8nBIJzuTmerV8BOIT4niYf18x4QEtc
         z5H81EZYARNxR1ma8/KlkFUhKOeJ7Hl3fYaLVmgEFoE73xyZgj27v/lvAElF8wlgArow
         qpuBMwQ+kYSTDO8Z3keZLIqVbORAOWRfGIz5s2yT0tprwi3Q2ckg04hU8fm6xr0heZo4
         iLen4jKhoDjrciVqlJ46NvCHeRczG3aQJiRDHhnl76gnezpPAw3VJYtUvEwjiBXZ9bGt
         /jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQupQI/e5WOjLoPxFjAKJdfcEvYOJowSaHYRx7Gak4U=;
        b=Ic1/xnTnYiCWM46kQ/DQz8UEn4Iwje1c00AoTTmyvG0WwYPLwjxjhxSvay0RQ72H1C
         dCEUwI4kP9F3pXKWYw+HFj9U5vLJ3jz6gnCHCe/sTc0O4LgW/t2W+BrAOYVeg7ai69UW
         XRG/HIrFcf8aEJaL2bQTgyc3tmACS4233odDwRD6Avq+5S7hFfJjCoNAshK90pBH/GrL
         xq4LWbr7jinV4mKqgYZKF8ZxphhznRxR2ptmLrZ72OSvVB8BTmrVMZVHxmBkKq3qfFVH
         ZoYKBUG2dYNpP300aqc2YOqoIfM8JNOjn9swPb7uTB+RWFl8g+ejo+lFpOMo62HCMnJZ
         +Tng==
X-Gm-Message-State: AFqh2koYFG7r5/fdjmSSj6HJBGo0CqSXu84aq0NvviSMTquuzUBZyYuq
	VkZDbV/uMKPnIqNY99OoYFYJB1cFQYoYAKXO87I=
X-Google-Smtp-Source: AMrXdXvDQA0b3YCOPyLc6JV0IY0UxAM5vBI/px9utJ5TRa3GRRoJvBEqgLhfBQYDsFV3+1WU+qK0jg==
X-Received: by 2002:a4a:ac88:0:b0:4a3:b889:4c21 with SMTP id b8-20020a4aac88000000b004a3b8894c21mr11900258oon.0.1672200398896;
        Tue, 27 Dec 2022 20:06:38 -0800 (PST)
Received: from localhost.localdomain (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.googlemail.com with ESMTPSA id c124-20020a4a4f82000000b004a3c359fdaesm6084042oob.30.2022.12.27.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 20:06:38 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] mesa-gl: allow mesa (gbm) to compile without backend
Date: Tue, 27 Dec 2022 22:05:46 -0600
Message-Id: <20221228040546.1790437-1-vince@underview.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 04:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175038

Commit introduces a patch that allows for gbm to
be built with an empty backend. There are situation
where mesa-gl is the preferred provider for virtual/libgbm,
virtual/libgl, virtual/mesa, etc... But the x11 DISTRO_FEATURE
isn't included this leads to build errors such as

| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function
`find_backend':
| backend.c:(.text.find_backend+0xa4): undefined reference to
`gbm_dri_backend'
| /../../../ld:
src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
undefined reference to `gbm_dri_backend'
| collect2: error: ld returned 1 exit status

Add patch bypasses compilation issue by excluding gbm dri backend.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 ...0001-undefined-reference-gbm-backend.patch | 51 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb  |  6 +++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch b/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch
new file mode 100644
index 0000000000..c9681e13a9
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch
@@ -0,0 +1,51 @@
+Fix gbm compile without dri 
+
+Upstream-Status: Inappropriate
+
+Only required if mesa-gl is the preferred provider
+of virtual/libgl, etc and the x11 DISTRO_FEATURE
+not included.
+
+Patch allows for gbm to be built with an
+empty backend. Thera are situation where mesa-gl
+is the preferred provider for virtual/libgbm,
+virtual/libgl, etc... But the x11 DISTRO_FEATURE
+isn't included this leads to build errors such as
+
+| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function `find_backend':
+| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_backend'
+| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
+undefined reference to `gbm_dri_backend'
+| collect2: error: ld returned 1 exit status 
+
+Relevant previous mesa bug:
+* https://bugs.freedesktop.org/show_bug.cgi?id=78225
+
+Build libgbm without backend if its known that libgbm
+won't be utilized in OE system image.
+
+Signed-off-by: Vincent Davis Jr <vince@underview.tech>
+Index: mesa-22.2.3/src/gbm/main/backend.c
+===================================================================
+--- mesa-22.2.3.orig/src/gbm/main/backend.c
++++ mesa-22.2.3/src/gbm/main/backend.c
+@@ -42,7 +42,9 @@
+ #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
+ #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
+ 
++#ifdef HAVE_DRI
+ extern const struct gbm_backend gbm_dri_backend;
++#endif
+ 
+ struct gbm_backend_desc {
+    const char *name;
+@@ -51,7 +53,9 @@ struct gbm_backend_desc {
+ };
+ 
+ static const struct gbm_backend_desc builtin_backends[] = {
++#ifdef HAVE_DRI
+    { "dri", &gbm_dri_backend },
++#endif
+ };
+ 
+ #define BACKEND_LIB_SUFFIX "_gbm"
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
index f2bc8f6b5b..1571002317 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
@@ -6,6 +6,12 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
+SRC_URI:append = "\
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://0001-undefined-reference-gbm-backend.patch', d)} \
+  "
+
+TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
+
 # At least one DRI rendering engine is required to build mesa.
 # When no X11 is available, use osmesa for the rendering engine.
 PACKAGECONFIG ??= "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
-- 
2.38.1


