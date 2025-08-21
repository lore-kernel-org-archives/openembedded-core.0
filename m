Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D9BCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:14:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6830.1755774836977282803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 04:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqvZJS9H;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so6067795e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755774835; x=1756379635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6nojg24/s0JVw9dqbz7k8shPVGuUVwSLAdlGFHMwY8=;
        b=mqvZJS9HzFCrhuNGi/wmS08pgt2iiNjtjcur75220uRA8cIWO9lWvU1BF6GtMvBUf9
         IMQ8joKQm1ZBlbgFcdrAPtIBWNZCo2ykQKoKqMhJ/wVGdk60iyV91QPLJLhKAKskeFMH
         X4dlg4fCYTpqn2XjK4L8h5g+juaoPbgF71M81fGffkxCZG6TRMtnUpxNpGTUjlZijmoX
         2RWfyOJpHxnkknjTPUOOzD+SyDzNugdk6gdenC5VCFCBjASRWMaJpXQJpxv/906N/jwq
         6AUWoMp1bcI3nTSIO7qr1YKSilWOdqwR1ppJpU0IoqMLhwokTnkPueNFza8SVoHlKrnY
         Kxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755774835; x=1756379635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6nojg24/s0JVw9dqbz7k8shPVGuUVwSLAdlGFHMwY8=;
        b=g6tyWiYRXbHdxjZgzE/Q+90wmYhOqG6vbHxgFguipetDLurfUBkevoxoRaQesDTH+d
         gQvoPGpMOmGdeXqRK67Kb5dm5r7pavs1lORKDt8PPrg/dFHhzHw6OHaO/2/HHxtd3vm4
         sPwsVUiJ34xC4YX6SOMJCmzPWREaXBfuB4FHNlSVx7A8zDVuY1//SvMMvhlfJuoXKGq6
         v0ANYhrmP7Qs6vM038wJRQCCfmv+fneaRwlLo14vjDEWt3KpnBL/KrV4oQ/7IXt+QA+E
         xkp/fXjyOZyTcL64V0gVLzvN6QOf2fXJqfaRz3ON2GIvgBUe1cezjBGkGGzktyVxTdmK
         PVgA==
X-Gm-Message-State: AOJu0YxvPGyggYyyRubPosBCU4b9ax12nmT6vM+EahxnEqklVVpwG0WD
	qKYeTGIq+S9RlpIL5PGJCQXodLgd/IO1dtLbqnopRW53SnXxaZvMsswO4I6kKQ==
X-Gm-Gg: ASbGncvWZ+GIKtAtkS1JGlyZoprfdNPB0engUP7lxW5wbdi7Lx3iIFr02Luah/rS8Qu
	fLMBdhBnTDWbryz+8p165wo+VXEvc5gzTw4RyRXD2QJxCk3liWjQqDaB6ONkVBmDTqFVfRj7QHX
	H+0s59JLNOLyWv1tKXmuBrA2IXft1FxMmp3KRr81UjBQPJMgKFPTaKPBoBmKb20i9wOPZEW/GC8
	x1vY1swhBM6wMIhLH5ZYRtlMHq/5jdGzuyREtatmAYHf3NynTk360p6OgOoqd4/4MqRvv7J/GSa
	kpuENQU1a6fEl5jmpoSZfqv5MuaCpRVMaZENtEtysW8LteHcTAGAQdv65piBKck1IfSyt+rKifZ
	ttX3z5Xz1r+VhP0S/52B2OlZdHB6+hn6v8knC2A5AM7FiyN3QFtRj7nL8
X-Google-Smtp-Source: AGHT+IHyb2EX7D6HwEoODermD4f+yeNUxItUsJlkw7q7M0wc8useQxn6bvt8O63CX9Synn1PtIZpMw==
X-Received: by 2002:a05:6000:310c:b0:3b8:d69b:93b with SMTP id ffacd0b85a97d-3c4973690d8mr1788541f8f.52.1755774835245;
        Thu, 21 Aug 2025 04:13:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789106sm11235997f8f.51.2025.08.21.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:13:54 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 2/3] cmake: fix build with gcc-15 on host
Date: Thu, 21 Aug 2025 12:58:39 +0200
Message-ID: <20250821105840.3045170-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821105840.3045170-1-martin.jansa@gmail.com>
References: <20250821105840.3045170-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222228

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 .../0001-cppdap-fix-build-with-gcc-15.patch   | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a52506a8ea..b8667832e2 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,6 +18,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
+           file://0001-cppdap-fix-build-with-gcc-15.patch \
            "
 
 SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch b/meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..1ff0764018
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-cppdap-fix-build-with-gcc-15.patch
@@ -0,0 +1,30 @@
+From f742c298a0d6b70059e5c98c89d301e62a3e2087 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christoph=20Gr=C3=BCninger?= <foss@grueninger.de>
+Date: Thu, 8 Aug 2024 20:26:35 +0200
+Subject: [PATCH] cppdap: include/dap/network.h: add <stdint.h> include for GCC
+ 15
+
+GCC 15 requires the include for the declaration of `uint32_t`.
+Backport [cppdap PR 133](https://github.com/google/cppdap/pull/133).
+
+Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/commit/f742c298a0d6b70059e5c98c89d301e62a3e2087]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ Utilities/cmcppdap/include/dap/network.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Utilities/cmcppdap/include/dap/network.h b/Utilities/cmcppdap/include/dap/network.h
+index 9d14f6b70fa..dd3e0062407 100644
+--- a/Utilities/cmcppdap/include/dap/network.h
++++ b/Utilities/cmcppdap/include/dap/network.h
+@@ -17,6 +17,7 @@
+ 
+ #include <functional>
+ #include <memory>
++#include <stdint.h>
+ 
+ namespace dap {
+ class ReaderWriter;
+-- 
+GitLab
+

