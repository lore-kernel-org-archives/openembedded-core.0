Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C8AC4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 20:27:47 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.190692.1672259259673584454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 12:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=VDIKAwVt;
 spf=pass (domain: underview.tech, ip: 209.85.160.43, mailfrom: vince@underview.tech)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-14fb7fdb977so13001072fac.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 12:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGfOnpaUM44vAGrvVYIEkOj6N7GT9GKK6dZfn5v88Bw=;
        b=VDIKAwVtBrxXNEG5nF1EA0oAHTIwAhBnjzIK4QvABNW7WKcuW3MyYaBUs8Yl8m+6Q0
         hBMPn76+rl56WEvP5Lw+DjJu89KngG8yaHhRFSOiRYCqq7eB2V5MJdU/QcmdAvP9jmRH
         0FP5HZIWKHQrpblUPthrIWmtxa0o4JTdcOKSzW1AGH1p9HhNmmq7btYr8f0ab6aPOpsf
         /GxwuomFAFGYaOe1DoilJEXqUKw3V37MBp8jc0PAY1+N2sWDCp5NMrAE8i6+q8Glxqvx
         S0/sseUe5zBaa9B2bEWm1RpBh1zwlpk7LhuhEnl7yaAWF26e0YWBao5Eq5vjrNUhWUkM
         m0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGfOnpaUM44vAGrvVYIEkOj6N7GT9GKK6dZfn5v88Bw=;
        b=g9lvWvpojU7Rdevpk6XU/HWtHHpJu3+cJYee4KZpzYTx7YSjazszo7M+FL8eKWHhie
         IEyorULHensfDzcKo3G4nk/kpviOsJOfrOBga3rE/emduXkaNxTteZbRROw+HdAfsqqi
         GkUfHb4z/up48FJ9Yuucn6nCf3klFE/UES6U+2oFaEtqEH2ytatW1ASItqd5FXMONoM3
         GLwQBehwg26F3EQEKmh6KRU/bpQPGsiHXV/vyjrqRFr2BPlwJBb8KF9O9LkBxlge1Tgo
         UK05lmQmiGNt+XCB5RTDLb1BNQBcg/soM97dhl9YfsjHmxJYDWCoQwHUgWhZUuWAoIgL
         2lBQ==
X-Gm-Message-State: AFqh2krxm8fF0UEmPUHsUGhzTBHiB64LyxDB7colMXG2CPwYcNv13CHa
	nbRpgyUXMWwqmYI1adcRa5cAOuvblcLqJJj+F6A=
X-Google-Smtp-Source: AMrXdXu9tMpj+1BrhYOfn6tPqQGM9Dby6GE7DLdKRerRFqEQiMWJXXJc0RGuA7oi79BYI7HX/91PSg==
X-Received: by 2002:a05:6870:8e08:b0:150:4af9:b29e with SMTP id lw8-20020a0568708e0800b001504af9b29emr729034oab.33.1672259258618;
        Wed, 28 Dec 2022 12:27:38 -0800 (PST)
Received: from localhost.localdomain (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.googlemail.com with ESMTPSA id l2-20020a056870218200b00142fa439ee5sm7847639oae.39.2022.12.28.12.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 12:27:38 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] mesa-gl: allow mesa (gbm) to compile without backend
Date: Wed, 28 Dec 2022 14:26:49 -0600
Message-Id: <20221228202649.91106-1-vince@underview.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 20:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175086

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
index 0000000000..66ab52fdaa
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch
@@ -0,0 +1,51 @@
+Fix gbm compile without dri 
+
+Upstream-Status: Backport
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


