Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77DDC35280
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.1104.1649350847086195588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hx/iqhHX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id dr20so12090588ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7IyCG4r82wbcx0FGrLfMpQm81yPXa3kSCxcyfwaj+ZM=;
        b=Hx/iqhHXvalNGXVBcIP0NNTQZmwSvjoVXK+LNqJHPLbFPbIPNxZOKuAIMYh0NU+IZa
         X1ia0ux6XvMhDknnYHcIjQmiYFEyutnRwf6aGc2MGT0kgBNJcWSXGZIxlSkq8zSzoeaI
         lNKu/yXyju/OlXajYo9XDgC4OW0CIl0j6FH+Jou7clPpPGfGU+aa6BeT9r4ExhMdYISh
         KQ0wJvpqIkuXvLzFPnY/cA8qFpK0oLWReko8xrvPF4+HpbAkxYT6Hza9EQ/EFjayBMrI
         Ug+J2/lnNRs1FKNp/jeFJqQcFVW0M9VAA8roWu6BqTn6Zd4h4VCwDgGGkz17Mx/rs64X
         HVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7IyCG4r82wbcx0FGrLfMpQm81yPXa3kSCxcyfwaj+ZM=;
        b=UI6Ax+RaYlAqfA5qXKfkaat/HGLN5xmQSwuv/ixSVPcwE867pm266sFpkS6i3Tn20t
         MMuxVdFb7ZhychXllNEGJr9YfERyWw9BZ9RW9+me2AXrXOhj/XwWccZ74kJhW8Tsj9Tk
         SthFXp7vZ/0ocjtuSfr25UMGIm+pZEdwBTWV9NkhZf6Pu7uWFCUcMoZbqAKXuhlvSEFk
         QS/Jtm2PKcTuufyAJslwlf4Vp2QpH25wu6Km2vYKQSuEy1AzPj4tMS3J+5zZ8G5EL16W
         IyCNnPUTh1izbJMg5hrx4T5usiT28ZH6+sRV4d/NAOPFTvpkFJEPFRfpgvPHPFKnZwoz
         cTxQ==
X-Gm-Message-State: AOAM530fGRBr9CWhcSH8NhwzwGgl61tbsIClJI0w4OjVZ7L78aolEJfe
	UIe5S7HoTBKkZHV3I9YOofYjbmPPPPE=
X-Google-Smtp-Source: 
 ABdhPJxmgmIVDT97D1LSPvtbr3RudZRo3cYJfsSvd8EcrMHd+d9TxmPF+AJ3s/nVa8aQdZVdrEEGIA==
X-Received: by 2002:a17:907:7e92:b0:6e0:8c4f:b5a with SMTP id
 qb18-20020a1709077e9200b006e08c4f0b5amr14039155ejc.572.1649350845642;
        Thu, 07 Apr 2022 10:00:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/17] piglit: update to latest revision
Date: Thu,  7 Apr 2022 19:00:18 +0200
Message-Id: <20220407170029.3500874-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164121

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ssing-include-for-htobe32-definition.patch | 27 -------------------
 ...Lists.txt-add-missing-endian.h-check.patch | 25 +++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  4 +--
 3 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-add-missing-endian.h-check.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
deleted file mode 100644
index 7b0cb17925..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d623e9797b7ee9b3739a8a4afe1a01f7e03754aa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 1 Nov 2020 20:08:49 +0000
-Subject: [PATCH] Add a missing include for htobe32 definition
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/609]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
-index 5f45e0c23..c755ee29a 100644
---- a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
-+++ b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
-@@ -34,6 +34,8 @@
- 
- #include "piglit-util-gl.h"
- 
-+#include <endian.h>
-+
- #define IMAGE_WIDTH 60
- #define IMAGE_HEIGHT 60
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-add-missing-endian.h-check.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-add-missing-endian.h-check.patch
new file mode 100644
index 0000000000..68f783ebe4
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-add-missing-endian.h-check.patch
@@ -0,0 +1,25 @@
+From a8ea135125b284a8a9c965d8091b3d1d9a31849c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 5 Apr 2022 16:51:34 +0200
+Subject: [PATCH] CMakeLists.txt: add missing endian.h check
+
+This is needed to actually have HAVE_ENDIAN_H defined properly in config.h.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/648]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9fb0508da..158fac4bc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -481,6 +481,7 @@ check_include_file(sys/stat.h  HAVE_SYS_STAT_H)
+ check_include_file(unistd.h    HAVE_UNISTD_H)
+ check_include_file(fcntl.h     HAVE_FCNTL_H)
+ check_include_file(linux/sync_file.h HAVE_LINUX_SYNC_FILE_H)
++check_include_file(endian.h    HAVE_ENDIAN_H)
+ 
+ if(DEFINED PIGLIT_INSTALL_VERSION)
+ 	set(PIGLIT_INSTALL_VERSION_SUFFIX
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3ae7a14e46..840050bfc9 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
-           file://0001-Add-a-missing-include-for-htobe32-definition.patch \
            file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
+           file://0001-CMakeLists.txt-add-missing-endian.h-check.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "2f80c7cc9c02d37574dc8ba3140b7dd8eb3cbf82"
+SRCREV = "445711587d461539a4d8f9d35a7fe996a86d3c8d"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


