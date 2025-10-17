Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B6CCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:41:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.12356.1760697706882277902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPTL47zY;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso3099731a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697705; x=1761302505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlnZg/nx7IFF53NNI35WuWp4qj9SUmwgLhGxJ4fkOuc=;
        b=SPTL47zYAXhEHuEYI3wnaSmxgjpHHULuBNYc8JP0mZxuwyH7vqlm0bSIrhnXOaij36
         O+h26QirCOnLBLqtdY7pxvDmVxA8+4GERF1U3Z6UAzOqYTJFBM0fqPCm5qnMKK0IR3Ej
         ITg8ESkLVp6XOBcqb7GjXN5vLfVvIYD3fYLg1RUMJRqf2D+WBteJn5RP4beQk3Vsd5MF
         UQH5hHQHUXDdT22CDppW/i67pCCLkBgwW/+sik58Qa8QIkRR790lNir0teaNZL1rpcoB
         CC9i5MCOW4ebHUAinIMc25IPZELv30aM+ucwS7/4bJ1gxodc+44nV4cqjT5y3A0UqBsn
         L1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697705; x=1761302505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlnZg/nx7IFF53NNI35WuWp4qj9SUmwgLhGxJ4fkOuc=;
        b=LHZ6IYpV4fAdSiXW8k5qpvgre6rD3rTi1FQy09N7iZlZjALnvZ3kIdcQU/RZSO3dzM
         ZG0sFSmtJQ4TC1vgJJ5pZ4U1IjPnun96tRzUmiuo6prj1mLIoJPC0e5XmxJLhCtRP0n8
         o+wAea0Ppb4CyE5mLKhhJH6doIN0uP+LtBxGgAa6VXeBIMpmlYb5n+J3n9FHblBX8fqJ
         Qw6ntl5yasFb9A9p+FD80cVeI6f4F3hEdaTcAvHjZyE8fYXnV6KqLDi4x9EYXAGWiVSZ
         r/gg1cio3GmD2dosauzNXyMA7CrOl1dFMjI7pmz3J4dNx3r9/oI3ys2QpZowuZaZYb3N
         W9TA==
X-Gm-Message-State: AOJu0YwR9M9I5DoOlC/jK0onu2yRdHUJzpKJMsBF4uvF0COvl5yHL5JD
	ihDAPxN3EAFX719T47vBgUy8AXtH+WqkS9c3h7zcBXiR4fHmFbfCjKaBh0Hhf/J0
X-Gm-Gg: ASbGncsHP5UIowK32z7gNV9SHDSJ2/Pu0+ElU8IEjMv/1NNEnPf8khYafQcrvpcbMmZ
	QrnaRCgtEuM3xW8RDq3xOR4cL8Ev+VsqmA2XWF3i8ekjIcPHqf+ZKOFc+5dv2J1/jtX8FeYSDYH
	Br6JosoxDuoL6f4HQ8DeRsQbO7PCh+TXT76YV8sqySBCta2y+YO1pVAkOGwdnrVLqGZzT2Brd/W
	2lOvgjmAAttOpZfoL8+GJqB3gMjdt/XawVpR//JTa68IOdbVMoxczJb52fOnRoQvPWZXT9sMaBO
	YN5qD3lhrO+1QD1/z0xLLY37vgZaVvKAVqtAQIiM9962RM+lPF5SgyRdANH/8ofP5Y1U0+SKXyi
	1p357JQtvkeOICxUNLAVTL+M934bngrzQJafGufk7dNqC5YQ7TZjsKjbH9mNLB415tRx/yatZZ2
	yqYJOvFFL9ES8uW2oQg1A9l4FbIfvoNC8x
X-Google-Smtp-Source: AGHT+IHvb9c0gATA8gjdbi7VufYkVpH+Wf5hOqbf3o+bXcp0+lOmbMuX87MfsVjQ4c6Q97aXGwsLIQ==
X-Received: by 2002:a05:6402:1446:b0:63c:2d72:56e3 with SMTP id 4fb4d7f45d1cf-63c2d725884mr1344987a12.23.1760697704840;
        Fri, 17 Oct 2025 03:41:44 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63bea024febsm6836119a12.4.2025.10.17.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:41:44 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: update 25.2.4 -> 25.2.5
Date: Fri, 17 Oct 2025 12:41:35 +0200
Message-ID: <20251017104135.2635981-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 10:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225005

Announcement:
https://lists.freedesktop.org/archives/mesa-dev/2025-October/226555.html

Remove 0001-glx-provide-glx.pc.patch because it's merged into
this release.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../mesa/files/0001-glx-provide-glx.pc.patch  | 41 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch b/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
deleted file mode 100644
index dbe58fcc89..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4fed044aaed5911fdc58d2a634f34a7186836935 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Sun, 12 Oct 2025 23:54:25 +0300
-Subject: [PATCH] glx: provide glx.pc
-
-New Vulkan CTS 1.4.4 started requiring glx.pc pkg-config file. Provide
-one if GLVND is not used in order to let VK CTS and other programs find
-Mesa GLX implementation.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37834]
----
- src/glx/meson.build | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/glx/meson.build b/src/glx/meson.build
-index 04fdf26ba6a2..28313f83a783 100644
---- a/src/glx/meson.build
-+++ b/src/glx/meson.build
-@@ -134,6 +134,18 @@ libgl = shared_library(
-   install : true,
- )
- 
-+if not with_glvnd
-+  pkg.generate(
-+    name : 'glx',
-+    description : 'Mesa GLX Library',
-+    version : meson.project_version(),
-+    libraries : libgl,
-+    libraries_private : gl_priv_libs,
-+    requires_private : gl_priv_reqs,
-+    variables : ['glx_tls=yes'],
-+  )
-+endif
-+
- if with_symbols_check
-   libgl_symbols_file = with_glvnd ? 'glvnd-symbols.txt' : 'libgl-symbols.txt'
- 
--- 
-2.51.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1485e0b727..6a36aea259 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,11 +17,10 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-glx-provide-glx.pc.patch \
 "
 
-SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
-PV = "25.2.4"
+SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
+PV = "25.2.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.51.0


