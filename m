Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D699CC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 18:53:19 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.6318.1707331996495663929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 10:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UXX8jevG;
 spf=pass (domain: baylibre.com, ip: 209.85.219.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1086092276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 10:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707331995; x=1707936795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7yxqQeNLp/yLl6XAglMcPthiLASVUZRSmHB0IvrwVY=;
        b=UXX8jevGAbr9atpryoSBMP0LAlzKadLQqoMcXAvxiGNMah7lc0RNNaKq6OcAMxTHaw
         zG1dhBI9sfvCrSjuVCtZGbKuUNMpiG3ZHF6sZjYe9EfFZjSEgxHt70vXJpnBbhIpHjx3
         hwP10PqyQPItrOwngU1Expsh+aio119wyqj+CoG0Hg55Fj037ikWUabb62tKrxF4o6sc
         bIRmKv81mmf8YvXLpcd1S3z/W8GH57FhPDGoztIP1aD8+01uQ06+3kYtOygLTAMm7NFG
         UQyQkNkAYsqZQJW8ASL/kaTgx8SK4coSu9i8Gg+nxkiOKvJqxxNscNJGu38T0jHUPSu8
         RxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707331995; x=1707936795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7yxqQeNLp/yLl6XAglMcPthiLASVUZRSmHB0IvrwVY=;
        b=HsKYujQV6l8D0s4x2zHGf6PNn5gGGiIhx2R+iZACZuW+5ZFnxiniuF4z3ieLF1yGhz
         ejcw5bo0fRv9Q959SLaFPDYEPj72kg/Spmy64Zlt552sBXahFneGcEZV0oQsyaeklFOD
         HIb9XkLYu06h39nL2AzVZ25MFDKgvchskylIZJ5ZRHF7Ufg74DXkxnXv+JU1C5Iaww2S
         TfBQz4baIzguuDAwpVRkdwmt6RHAS8+8I639dvR7aKO0htZwNy+GAN/kknLqds6UnpGc
         Tx+5bsTW0AUmd9H2QDYe4KQYRQSg+0htr2xo8dqEdZwNeOo4ogdN4oi+hxpM3yU5V1fu
         mf7Q==
X-Gm-Message-State: AOJu0Yz5inXPw7XikX1ov4uXkPLuJcaTkS8kWIChl4ajZQQ+7LUyHwWZ
	TVnfUaPbIM9SQ6duJtJ40ZlH4GkeAiWXuFBSyHidwPoHreQWwVNCBLElAOlr9TIqBy9M6E0Yr/Y
	f
X-Google-Smtp-Source: AGHT+IFiDS0D4UTNCDkxkJTmiy5/wM23Og0+AYy2uj2ZVx/FFKag3EK61hFQR+xJDMp0ES7K3excsg==
X-Received: by 2002:a25:ad49:0:b0:dc6:c40d:5396 with SMTP id l9-20020a25ad49000000b00dc6c40d5396mr5338195ybe.53.1707331995334;
        Wed, 07 Feb 2024 10:53:15 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id nh10-20020a056214390a00b0068c4d8a9dcasm824793qvb.140.2024.02.07.10.53.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 10:53:15 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 1.26.3 -> 1.26.4
Date: Wed,  7 Feb 2024 13:53:13 -0500
Message-ID: <20240207185313.1654134-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 18:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195076

Changelog: https://github.com/numpy/numpy/releases/tag/v1.26.4

Upgrade to pull in a variety of bug fixes.

The same number of ptests (6) fail as in 1.26.3, so no regression there.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...le-fallocate-on-32-bit-linux-platfor.patch | 51 -------------------
 ...umpy_1.26.3.bb => python3-numpy_1.26.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.patch
 rename meta/recipes-devtools/python/{python3-numpy_1.26.3.bb => python3-numpy_1.26.4.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.patch b/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.patch
deleted file mode 100644
index 0702b8499ac..00000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 43b9b2626a59e8764f3bfb1d6b0d73b2d665584e Mon Sep 17 00:00:00 2001
-From: Ola x Nilsson <olani@axis.com>
-Date: Fri, 19 Jan 2024 10:26:41 +0100
-Subject: [PATCH] BUG: Use large file fallocate on 32 bit linux platforms
-
-Using a local prototype for fallocate instead of the fcntl.h header
-meant that the redirect triggered by -D_FILE_OFFSET_BITS=64 was not
-triggered.
-
-The prototypes in feature_detection_stdio.h should only be used by
-functions in setup_common.py. If they are used by the feature
-discovery code they might trigger false positives.
-
-Upstream-Status: Backport [https://github.com/numpy/numpy/commit/f49c6f9ea735cd7f718e74f8d637ffbbd3a7a03b]
-Signed-off-by: Ola x Nilsson <olani@axis.com>
-
----
- numpy/core/feature_detection_stdio.h | 3 +++
- numpy/core/src/multiarray/convert.c  | 5 +++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/numpy/core/feature_detection_stdio.h b/numpy/core/feature_detection_stdio.h
-index bc14d16..d8bbfbd 100644
---- a/numpy/core/feature_detection_stdio.h
-+++ b/numpy/core/feature_detection_stdio.h
-@@ -1,6 +1,9 @@
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <fcntl.h>
- 
-+#if 0 /* Only for setup_common.py, not the C compiler */
- off_t ftello(FILE *stream);
- int fseeko(FILE *stream, off_t offset, int whence);
- int fallocate(int, int, off_t, off_t);
-+#endif
-diff --git a/numpy/core/src/multiarray/convert.c b/numpy/core/src/multiarray/convert.c
-index 60c1a1b..8ec0aee 100644
---- a/numpy/core/src/multiarray/convert.c
-+++ b/numpy/core/src/multiarray/convert.c
-@@ -23,8 +23,9 @@
- #include "array_coercion.h"
- #include "refcount.h"
- 
--int
--fallocate(int fd, int mode, off_t offset, off_t len);
-+#if defined(HAVE_FALLOCATE) && defined(__linux__)
-+#include <fcntl.h>
-+#endif
- 
- /*
-  * allocate nbytes of diskspace for file fp
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.3.bb b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-numpy_1.26.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.26.4.bb
index 326e2c35914..d11b03efc3d 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -12,9 +12,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
-           file://0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.patch \
            "
-SRC_URI[sha256sum] = "697df43e2b6310ecc9d95f05d5ef20eacc09c7c4ecc9da3f235d39e71b7da1e4"
+SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


