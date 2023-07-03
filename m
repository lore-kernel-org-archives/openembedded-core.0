Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C07DEB64DA
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 03:00:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.19538.1688353203743219086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 20:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ajy22k+q;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b801e6ce85so24202095ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688353203; x=1690945203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjgA2qr+ReHmwHz7NqtpAViVNDwICVXwue42qCToFl0=;
        b=ajy22k+qr0LtCOAhEjYIbSIoW4EtZ4MeMq4E5AbFdDKfBEIz2WxmEsPNdS6MMBV2uL
         l2qHyFIOasMNfOsw98h6cLJlSzGw4qdogQZjv4Ul3JJdIqp1ZikESJlEOzzs4zHXTrme
         9q03BYR3k4G+S3e4boOynNMuOs7neR7q1bdgHlpXDuajAqBFCbUTvg1We2ecAer684CL
         YXlhDW+9zv3al0PbJmPpFr0C5aRMnebp5hCYelFhg4AgSmwEpNyQ5F+CUXdN8bOAlYap
         ri3+wQQEspNouDkwseJOqrjTNpnxhM5WYy8rCXopAVNYQJmukssNkPg+zXYmIqtn3mNg
         NBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688353203; x=1690945203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjgA2qr+ReHmwHz7NqtpAViVNDwICVXwue42qCToFl0=;
        b=d9FbZh2Pf2FQ9mwk8NTS2oj+DM+Zkv5uB1D2JfZDrZbwNRISB749ddxxh03rpG6I4g
         ST2s3hC8T8AnOzJMDmYRJovEt9b6khOwfGabj8xO1it6t79wDJBvfsfqKd5rZiU9RZ9c
         NclZ1xf8rgzTBSjNXkpZ47Ljk7XSQ4Kl87QEx7kxjzW9307z8QVdfqFulNiScNJe5wEM
         q8K3dUqabALa8xHQRQy1dUjjt/a9l9Hf9XLuqzOermns9Pbh5wRhzMejYh/4jeLcsU2y
         o+q4CYkPqj+AhTMtVOHlhSLbVzT0d9jNVYgkreIXrlGUTyzsJr2AYNs97iy38wHiJ2W0
         QMyQ==
X-Gm-Message-State: AC+VfDxjJaPORDP+PpvaIHaKz5Digv7d4EiBY7MzIq8xg7iKAHx42WCZ
	87m/hzfpWSBQft1c2/e4CkRZABuI3eo=
X-Google-Smtp-Source: ACHHUZ6dQ/j5cQfSMehQ3X+UwnOWo0f7Blp0YMyVW5tKaS0CJwmJOIWv/fzK9dJc4dHDXKC9tWQvCg==
X-Received: by 2002:a17:902:e84e:b0:1b7:de50:7d9c with SMTP id t14-20020a170902e84e00b001b7de507d9cmr22432082plg.15.1688353202557;
        Sun, 02 Jul 2023 20:00:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1fb3])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f54400b001b03a1a3151sm5622855plf.70.2023.07.02.20.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 20:00:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] mesa: Fix build with upcoming LLVM 17
Date: Sun,  2 Jul 2023 19:59:58 -0700
Message-ID: <20230703025959.3968541-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 03:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183786

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
new file mode 100644
index 00000000000..3631a918b0c
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -0,0 +1,34 @@
+From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 23 Jun 2023 01:20:38 -0700
+Subject: [PATCH] gallium: Fix build with llvm 17
+
+These headers are not available for C files in llvm 17+
+and they seem to be not needed to compile after all with llvm 17
+so add conditions to exclude them for llvm >= 17
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+index 24d0823..3d4573e 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+@@ -42,8 +42,10 @@
+ 
+ #include <llvm/Config/llvm-config.h>
+ #include <llvm-c/Analysis.h>
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Scalar.h>
+-#if LLVM_VERSION_MAJOR >= 7
++#endif
++#if LLVM_VERSION_MAJOR >= 7 && LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Utils.h>
+ #endif
+ #include <llvm-c/BitWriter.h>
+-- 
+2.41.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a944a7bdd5c..928899008e6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-gallium-Fix-build-with-llvm-17.patch \
            "
 
 SRC_URI[sha256sum] = "2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162f8f7da18eea8aed9"
-- 
2.41.0


