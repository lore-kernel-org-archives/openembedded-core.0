Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF3CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16709.1741190347240167173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2CPVhnG2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f4c06e9fso16589925ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190346; x=1741795146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnsLbBVOXuuSioqP9PnrzqOLx6rIIRiocH/PhMxqrFM=;
        b=2CPVhnG2VOBWulFUopk+ZNqWw6NzDjaD/Gk9Yt/j9FcsX9kmjZ77WzK+wrNz6vxl0S
         tKCvXIrfWtOf64iF6qJLuMe1ZFVvtSdOoWwwvQwPLudkALIop15rX8xjL+oeEVjKpJs2
         fTgJyHI+qg5O0wCMHkqQhZm47kJixiGVOgq/uIes1cFURiGk5RTO2nNTYbTyb+aTeGbo
         OQ/iI6tnTK8MSh9mEbs64Jv5vF0Gjs109UEAz9aB4DwIXVVWw1PyC87FS3FNgfmtWsW+
         VvHccMfxtTA3CbvUvJkqfUdBqPnEm4kRIOzI/mYQn1gP/57V2Kn6j4vBAeMD6CC29j83
         gF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190346; x=1741795146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnsLbBVOXuuSioqP9PnrzqOLx6rIIRiocH/PhMxqrFM=;
        b=taerpwztyVvBM1VZRF4bGsVMqJePSxTsponwlwdyBTQaxL56fVsS5dWQQDqHqku08+
         xP8lAqSLFLIWTIrzUZXV1DLk7iynhXLCGJtqbXwmwDl3MBJK4pGr+R49LmLJWKijmypd
         t65o3uPg2WtTigtmvvS79N1zdUOflzDzvrURP332I+twB8zfVS1ghVIDsUb3RUsNlOmv
         RTXWqUMXypRtTgOYafUJkSmmgKgWQnvSNsb7E0nfncrwnxSkJ52Nmx6U7smPoFmtgWk1
         9wVZjiJeyOpoiG9i7RGGuWM2HP8a12r4ZQSLZSPrmYLVUc/uLCYAy0in1oUSg10iXZJn
         OUZw==
X-Gm-Message-State: AOJu0YxMKugZn0gFmJpo0dfvnvLEbRmtcdrj+/E3/kuUYfFInq67dayW
	uYtxJ51+AjxiMlhFk5k8UAU5hEedmQcWIy/tL/TZK9r0F+MHFGFDAmuUPUVO7/RDjIqk7DmHtNq
	i
X-Gm-Gg: ASbGncuCEGJ48nLJPEOOzO1UIP2MfX791Njl/krkFX0cOZ7hlcRWjxpV9OdLmbizJZj
	B8uG7p7c6O7WWlhegPae7nvEov5+JrBzKZGXsUInlGuij4LNKDL9UJEdhfg41ErpnPDjEubFLiu
	hZrqGdxZSIp/c2h5DNXQoS1sqOBysRFgjafYcClCGLzLA8wEXl5WZKf6wSO+uXm7t7XX+V1DIKJ
	5yFlIvZk3yEWNlRZg8d6TQgeWoSYndK/CrVWXzAyPIRnBQzN25vAD0k8IDrY0I5O0ej4fyygpMz
	9bFLK1/FNacedlkMyqi9WhO2EzwIgRIQpYc=
X-Google-Smtp-Source: AGHT+IHpMSFLkNJaWyhNFLahSH2JGuQC62RqWw/KCvSsbfg3eZTecH/Id8+wn4sl7Jz4E28E9NIxUg==
X-Received: by 2002:a17:903:41cd:b0:220:fe36:650c with SMTP id d9443c01a7336-223f1e074e1mr62690025ad.23.1741190346524;
        Wed, 05 Mar 2025 07:59:06 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] xwayland: Fix CVE-2024-9632
Date: Wed,  5 Mar 2025 07:58:36 -0800
Message-ID: <2158a34839068b878344d214d3fc9feeb17e504a.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212329

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2024-9632.patch     | 59 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch
new file mode 100644
index 0000000000..54888f6347
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch
@@ -0,0 +1,59 @@
+From ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Thu, 10 Oct 2024 10:37:28 +0200
+Subject: [PATCH] xkb: Fix buffer overflow in _XkbSetCompatMap()
+
+The _XkbSetCompatMap() function attempts to resize the `sym_interpret`
+buffer.
+
+However, It didn't update its size properly. It updated `num_si` only,
+without updating `size_si`.
+
+This may lead to local privilege escalation if the server is run as root
+or remote code execution (e.g. x11 over ssh).
+
+CVE-2024-9632, ZDI-CAN-24756
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Tested-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: José Expósito <jexposit@redhat.com>
+(cherry picked from commit 85b77657)
+
+Part-of: <!1734>
+
+CVE: CVE-2024-9632
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 276dc19..7da00a0 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,13 +2992,13 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped = 0;
+
+-        if ((unsigned) (req->firstSI + req->nSI) > compat->num_si) {
+-            compat->num_si = req->firstSI + req->nSI;
++        if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
++            compat->num_si = compat->size_si = req->firstSI + req->nSI;
+             compat->sym_interpret = reallocarray(compat->sym_interpret,
+-                                                 compat->num_si,
++                                                 compat->size_si,
+                                                  sizeof(XkbSymInterpretRec));
+             if (!compat->sym_interpret) {
+-                compat->num_si = 0;
++                compat->num_si = compat->size_si = 0;
+                 return BadAlloc;
+             }
+         }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 258a875697..23575b387e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-31081.patch \
            file://CVE-2024-31083-0001.patch \
            file://CVE-2024-31083-0002.patch \
+           file://CVE-2024-9632.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


