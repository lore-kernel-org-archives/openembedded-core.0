Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91C7E6B24A
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88337.1766436305921265489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6P3C/Gc;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b72b495aa81so721268566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436304; x=1767041104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqkYOoDIlJkB9TKN3CeULCdQ9OMYI+YLDmOf91nt2FA=;
        b=F6P3C/GcEA/3aGlW7iEDjrzBlCX24ZMcRWLeC3/SCKiYFXzYGAggmpH0ZvmwgT98Fe
         flLntzgRaYsgo8I3zqYLhL44OP+IriFdfJS0KDw1ciPnwuV0lF57bU1je2RiMfcRwexj
         7bwPufEx5eAaR4XlKBUbNWxaSXbJuViKNSfRm+EWPYixTvZzyAWUv1xVTbi8kRUIeCac
         371MgX2uQ3HD9FtJaWxBPSBDogi6/DxCUP/iVeKBoDxlfALR6ONLtsCwvxFgWFJI/ksN
         30ywZPdmSEH5pX8DDWtCdYNvCiHJpE8bw+X+ay3Kdrx6TfgigBmWERn9NlVw8yO2PjyC
         XzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436304; x=1767041104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqkYOoDIlJkB9TKN3CeULCdQ9OMYI+YLDmOf91nt2FA=;
        b=F1mM8z6c+aAc9mReBzGWWR1JmAPiznzu6e11tWP6h9FCPy7vogvQ69RKzlshkmn9vA
         WSxuf7qFE24DB5oFB2pNsI9hCPkMqaRFDna3+d0ftK6KLhFrhfkQKdS1YZdWLdw0zX5j
         lZkhV50GdTXv138+HgsVJFE5gcvoxI5ZjNUPPN2bHJHp4AfF44lh43qJoceZfmvi3MJ+
         6yQxIuY/25OpNwfiv+Q3nmU2828uOkqOxz1r/9VqZ9M1nyJ2lCOVjB0cA2Vsi5kw+kfD
         XYkDkVfUCWd5weBxAuA55/92EekFzJuyfbTAoUIhlfwoB0tMpaiNZXC9+9idED3SgxBF
         LxMw==
X-Gm-Message-State: AOJu0Yy8DdCD8xmFT8YsqwfdgELhnELIOffEbt4YDn0aVvhzUUaf207c
	Xv3frITK9uwRCV/ebnVtpTrKMSad7dxieTuZFq4ixKV1qTWVOZ07UZVfNzj7zg==
X-Gm-Gg: AY/fxX6mzMgf5mBb9u8X7ASSKmDO6BSUUXiOgkIZiJ/YyTxFFcRK2YZiLdLgU3tAcut
	qhgbd6iEylFfYM+O2Tz2RDNCKy9hD/E+vKsqT77IiiWoi7MfnonpIgCilpgio2nxnqAR1SbSJyA
	hQXqiKq2bUEqjsXXRTs0UT7JYcTEdUTUo9kJCBnzpqaRQwtTDVY1h7cSokHVh/1DkeK0taJ+sdG
	BVZ712NuC8eSZslgHkDgb586ojwcnbMKZ/kmN5q0Exr3gL9wx7gt1MAjWsfQL10lM+WR2Lm/I0Y
	sl//AGlmFvdMEXGX4RAPxoiw5tbik7RzW95TWnVEcUkKNxY7BNUNtacEb6s1kTzGyb+0xmY8WQt
	nMWuH/UAOsECDb4GM5lBUasWXWK/0mJU72NUZCxGi758zxb086fBU5t5idhz+hUjrqEAHNN3+jW
	aZ4CG/Pt8P/pqjZ4+fwrJXtgmgrsiTjuny1dSbP11JcoLT1p4=
X-Google-Smtp-Source: AGHT+IGP7CBgWg/i0MfZYoGZGjZWkhAMiymx0aG/Dpu9kexIOVQAAQAXbzqL0XCqlenDdfV6uG9fvg==
X-Received: by 2002:a17:907:3f89:b0:b72:134a:48c8 with SMTP id a640c23a62f3a-b8036f63805mr1316660066b.14.1766436304170;
        Mon, 22 Dec 2025 12:45:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/15] wpebackend-fdo: upgrade 1.16.0 -> 1.16.1
Date: Mon, 22 Dec 2025 21:44:27 +0100
Message-ID: <20251222204455.2284529-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228434

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to fix musl failures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-egl.cpp-add-missing-unistd.h-header.patch | 36 +++++++++++++++++++
 ...fdo_1.16.0.bb => wpebackend-fdo_1.16.1.bb} |  6 ++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo/0001-src-ws-egl.cpp-add-missing-unistd.h-header.patch
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.16.0.bb => wpebackend-fdo_1.16.1.bb} (77%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo/0001-src-ws-egl.cpp-add-missing-unistd.h-header.patch b/meta/recipes-sato/webkit/wpebackend-fdo/0001-src-ws-egl.cpp-add-missing-unistd.h-header.patch
new file mode 100644
index 0000000000..ccb79cfd8f
--- /dev/null
+++ b/meta/recipes-sato/webkit/wpebackend-fdo/0001-src-ws-egl.cpp-add-missing-unistd.h-header.patch
@@ -0,0 +1,36 @@
+From cc7c8ef7b92849ad97f402f51d88bc6136a1eb9b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 19 Dec 2025 15:00:16 +0100
+Subject: [PATCH] src/ws-egl.cpp: add missing unistd.h header
+
+This addresses build failures with musl:
+
+| ../../../../../../workspace/sources/wpebackend-fdo/src/ws-egl.cpp: In destructor 'virtual WS::ImplEGL::~ImplEGL()':
+| ../../../../../../workspace/sources/wpebackend-fdo/src/ws-egl.cpp:83:9: error: 'close' was not declared in this scope; did you mean 'clone'?
+|    83 |         close(m_dmabuf.formatTable.fd);
+|       |         ^~~~~
+|       |         clone
+| ../../../../../../workspace/sources/wpebackend-fdo/src/ws-egl.cpp: In member function 'void WS::ImplEGL::initFormatTable()':
+| ../../../../../../workspace/sources/wpebackend-fdo/src/ws-egl.cpp:397:15: error: 'ftruncate' was not declared in this scope; did you mean 'strncat'?
+|   397 |         ret = ftruncate(fd, size);
+|       |               ^~~~~~~~~
+|       |               strncat
+
+Upstream-Status: Submitted [https://github.com/Igalia/WPEBackend-fdo/pull/203]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/ws-egl.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ws-egl.cpp b/src/ws-egl.cpp
+index 76d6194..cc7a8f2 100644
+--- a/src/ws-egl.cpp
++++ b/src/ws-egl.cpp
+@@ -33,6 +33,7 @@
+ #include <vector>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ 
+ #ifndef EGL_WL_bind_wayland_display
+ #define EGL_WAYLAND_BUFFER_WL 0x31D5
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb
similarity index 77%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb
index aa6c58d176..11a1ce6bd7 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb
@@ -12,8 +12,10 @@ inherit meson features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635"
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-src-ws-egl.cpp-add-missing-unistd.h-header.patch \
+           "
+SRC_URI[sha256sum] = "544ae14012f8e7e426b8cb522eb0aaaac831ad7c35601d1cf31d37670e0ebb3b"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.47.3


