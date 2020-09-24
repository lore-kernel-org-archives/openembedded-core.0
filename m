Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.9571.1600924978000529383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 22:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SsN8YTg7;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id n14so1170488pff.6
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OH+CCWkKKkLnJefHCCyCQ30uunPUAU5CJjTNqxc1TCA=;
        b=SsN8YTg7UfCwCarLbc3urXyLyXXy2geAf2IGL4ro7Cx8FVKm8NcUt+6K5GjHHqqhSc
         WxKROqPe9mZG4HVipRg8MVywhKHIebx06qtrDYn7SFP1Ox1YBAPRDOC8g3QnSwvVERh0
         sJU3OrIHdyAAUHI/IVwnvceALZSsdRqnmOCozT4QqRHnmiFUOsR4ouwFtbqnoDk2RMOs
         nnDW0c6QZr7sCMFH4HmaUq66++eH+m94dizkN2k0ZgFzgWhAjrlGOBVByGFl1Z1mErt1
         n9sM9tcIZCqX/3mWDola2xAu/SNrX2migUMLus2WEglTrS/lCsm8vkbcbwM+wgaq9/V+
         CNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OH+CCWkKKkLnJefHCCyCQ30uunPUAU5CJjTNqxc1TCA=;
        b=cm0pSLLoh4c6iIdzPLVP9/ue1P1JwFNZnoXu8GrFWlSIVWAyhCml39qXnz8gG22WUF
         V6+qoC6WkKTi3HbccHm2rZozlpCdX54xMXQbzhUkKrF4eGdwSUziAug+fea/MK7KSFWx
         5aUq/Fwz/IZGfSKG+Trt4d4cH7ReW1IqlUak5AXwob7p7jobqvEUswiIyoPzdw82YLXm
         jTNPYYDVYBap9KqRH+QnVe3ptThD5J4Gbfs4PV2UbMU9TeqCup8MTgQp5Bs3ffyMwRa/
         9usNd762f+NIovdbRAt0DuydfkFGjqgbnBo7bL28498mAqRT7St3oSVn/nEOOTcem+vS
         dJsQ==
X-Gm-Message-State: AOAM532/XwiIrgmDBcaa/oZf4OfS1hg+NwxPgM0IwUh6B0bfLYvrZ4Bh
	8dqHWTJFjSKGjnNjqE7NorAUzVGNFx3dxQ==
X-Google-Smtp-Source: ABdhPJz8zWFzMMt+yR4f2p9DnEXMnAXiQXgkcCu4pPFsex5rkic/JEqvH7j0i6l+2EpZx+HOPyYIKg==
X-Received: by 2002:a63:b64a:: with SMTP id v10mr2496068pgt.192.1600924977256;
        Wed, 23 Sep 2020 22:22:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5470])
        by smtp.gmail.com with ESMTPSA id h10sm1221259pfh.217.2020.09.23.22.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 22:22:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gettext: Fix ptest failure
Date: Wed, 23 Sep 2020 22:22:54 -0700
Message-Id: <20200924052254.1087738-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msgmerge-29 is a script without execute permissions but executed as
./msgmerge-29 which results in this test failing.

It is only one test which fails on gettext/qemux86-64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rge-29-Add-executable-file-mode-bits.patch | 23 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.21.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch

diff --git a/meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch b/meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch
new file mode 100644
index 0000000000..e42a6c0a4d
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch
@@ -0,0 +1,23 @@
+From 71988f83b69c4ed98d1b9418da80edf11a931894 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 23 Sep 2020 22:08:34 -0700
+Subject: [PATCH] msgmerge-29: Add executable file mode bits
+
+This script is installed with default mode bits and executed directly
+e.g ./msgmerge-29 when doing make check which results in
+
+/bin/bash: line 9: ./msgmerge-29: Permission denied
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gettext-tools/tests/msgmerge-29 | 0
+ 1 file changed, 0 insertions(+), 0 deletions(-)
+ mode change 100644 => 100755 gettext-tools/tests/msgmerge-29
+
+diff --git a/gettext-tools/tests/msgmerge-29 b/gettext-tools/tests/msgmerge-29
+old mode 100644
+new mode 100755
+-- 
+2.28.0
+
diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/gettext/gettext_0.21.bb
index 3af77bb4c8..bc14867bbb 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            file://mingw.patch \
+           file://0001-msgmerge-29-Add-executable-file-mode-bits.patch \
            "
 SRC_URI[sha256sum] = "c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12"
 
-- 
2.28.0

