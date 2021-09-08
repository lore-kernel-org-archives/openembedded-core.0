Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.15611.1631124096675556234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NCmoNDHN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id j17-20020a05600c1c1100b002e754875260so2189797wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcxB3z4d07GChrGJKZ2WLkLa7GD0Defu0XYJOIEJCDQ=;
        b=NCmoNDHNSw0XE22zE4l0ZeaKIz7CDzotbFjwxopBQOUqtbN2trrxen/Q/lGrEgB1AL
         912Fq3FBA36dx4mNmo65dfd2YRFBnfQJkw7V11M2fvhio9F6w+mei3IbdDDWv66MIrZb
         JOYoPWhBxoXNQrv1PvNzPMbH2XSXhhoGEy/pbhiQsDH1KCgddirm+n4MkTUI23vR2vGB
         VWN8oB4c2J3jCEy0Axg5OBqS+J+gCUoewgiFObxiQyBWHogLqptz4Q31FA4l5BZ1vSft
         xaTihtQ7MB9SiWgK5kbTKp47PTs9TGuh2AY6ZxKIFitblzJUBFP/aBLny5pGxiV9d9lB
         2Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcxB3z4d07GChrGJKZ2WLkLa7GD0Defu0XYJOIEJCDQ=;
        b=KCw2t27Ut/kYL2ZPlcGz+KGl3f5orjGNHAhCvKjlaBN+ua5V41lwY4jhtwqzBGLBc7
         V+LUoFf8FajpO/9AwRKjZ+rBoX/bfoMEgYaZTH7dS9pkWzTyqXpUm0/LwR4H8Ei4vnxr
         uCbnoFTaLlas/Dx0y0+tuc9oH797G6W9QGTqA+XB8Z6AHv6FaohaDHrQUz21HNrBoOyh
         OKxzQgYlF/i22d8GCGvuASEfiwEC2SgMxE1E1cjK69qIcFKMzVoU5A9tOQgyhtdxvuWJ
         h9gUFApxltf2ZtJxEuNSGVOCXv7Drgv9uTISk2sTb/mBJ9dY3321LYOqVg07VrIIFjbY
         L5bQ==
X-Gm-Message-State: AOAM532WNqHRpKvnjp6DISqJahNdQz3/s/NBS4+PSYudQh5bwEUv2Bw+
	8M+SXKJdxgYalY9UVykSYzf3PXwhLb4=
X-Google-Smtp-Source: ABdhPJzgQwFB2jNvTgFEQTX4F0ZcT7gQAMh3+qMHXtL8yglKs6NiPP9FH+jFGxOR48PTu88lLgh4Rg==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr4680868wmm.182.1631124095124;
        Wed, 08 Sep 2021 11:01:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/26] package_rpm: use zstd instead of xz
Date: Wed,  8 Sep 2021 20:01:08 +0200
Message-Id: <20210908180125.103473-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zstd has similar time and space performance in compression but is
vastly faster in decompression, which benefits rootfs creation
(especially when installing very large packages) and on-target
package installation.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 meta/conf/bitbake.conf           | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 88d861c0e7..fc1e4b3a4a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -684,8 +684,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
-    cmd = cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
-    cmd = cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
+    cmd = cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
+    cmd = cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2140d498f7..52d40738f4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -814,6 +814,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
+# Default parallelism for zstd
+ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
+
 # Limit the number of threads that OpenMP libraries will use. Otherwise they
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
-- 
2.31.1

