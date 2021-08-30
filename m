Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.1314.1630349293687758789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 11:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qrs3N2W9;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so713867wma.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcxB3z4d07GChrGJKZ2WLkLa7GD0Defu0XYJOIEJCDQ=;
        b=qrs3N2W9kL9Nw8NnTiOGIyb1b7nQtzdGM8dKBgr5xZ3XSH7ZO82yq29niwlhS8UZ5B
         6egCvk7qvLvZac1VqKMIEsjl7j8zSU7IqhGWSgJH2QX5NsO29VsH/f2IPLhi273Syw0k
         HBE8KMQZf5j8auA+BAlvpwPeoN/73gPwlzDhYIcuHYbXTQ0Du2AOa+mZKDz4gggS5L20
         bAetnuNHfVv4jltsLwJAwKBhYIBhQYZIW/N5WbGzF5Y9jzByHNfLNnh9FAI8pot4gN15
         kz45Ln/4BtksMpYX9eblI2z+hvzFK3ibYoKtzdRRbSspM8IyAN/BaaPwTiLx2LSILeTk
         V5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcxB3z4d07GChrGJKZ2WLkLa7GD0Defu0XYJOIEJCDQ=;
        b=ZGQPTIBZ23n0weMrnkTJRfSaVdblWC+/83aWSUxfWTrttkiJJnP4kAwveAFQ3lsSoG
         JtedYKH5s6Mr+v34SR7lvnpFvmqQl4Ec+/BHesDMUn+JOhZD+LyuLhCudgP1lccc88UO
         TGD1wtTdnovhk0Cdbu/FgwxztdiB91jkVf1+bgPMA6KMMktuWaMNw7puAAClXvTCFoI3
         ABNjw0Ta3kTPxNInrj8Ytsa81PpFHAZQTOb3Ptmzocem0CIPdyaaEGLId8eD/Tll3OZJ
         YJebmTNaBtjPfKxe74IFsZFpBwzzLqTUsWcAMZdq2jV1tZ+/+OFBvFaaF7YNya7INMmq
         0+7g==
X-Gm-Message-State: AOAM5318gs6/3kipc4LJchmBNnYsAj+0q918Jby9JaJ62p8VfVGwIt1n
	0YvH7ZnXOZY9QStmFhECMQNyE4+mdJvKUw==
X-Google-Smtp-Source: ABdhPJy+Yfqzz3p2ALzs+ptTm3YQoqayuZSB7bDZqs7+VV/vE4pcy3HlK8ab/ZNZus5z9q5DV4TEDQ==
X-Received: by 2002:a05:600c:b4e:: with SMTP id k14mr423434wmr.139.1630349292351;
        Mon, 30 Aug 2021 11:48:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id e2sm18141487wrq.56.2021.08.30.11.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:48:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 7/7] package_rpm: use zstd instead of xz
Date: Mon, 30 Aug 2021 20:48:00 +0200
Message-Id: <20210830184800.954770-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830184800.954770-1-alex.kanavin@gmail.com>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
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

