Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94436C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:37:22 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.2647.1676489837075127899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 11:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZASGTjJg;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id l7so8910567qvw.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 11:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szVJq/VcQyGURVaw2DDzX+/zEEpC17YTnCIQ/I+Dghs=;
        b=ZASGTjJg6Isknae8CZBUOTeEL02P15iHrUuc+dkpO4XOFxdCpb4xOpyRy4c8V6M83q
         X4s7dFkE64d5Jrc3oxplVTnrq4LszrbBV6Un2DDwMgJHM9NOSlJ7ebxIKCYNtRsgCVu4
         2786QGAOzDoMXMlFEU6O9+D9pg4mXfPzv7xQBsIKU7rBs8iaFO+2YtdJny/J2BQKvx6s
         dpqWdGzSCLLF+bBJ/01XU0ZGjIQ7Uq6X+44rD+x7pJuzgNE6ygFRMM3OlgK5d3mt5vVw
         7hHM5OwSsiY38DBFjf3zEX5Yu7trk7HhaW6FRZJ+h+qskUbLGRV/luun8/rlSN+OAzHG
         fO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szVJq/VcQyGURVaw2DDzX+/zEEpC17YTnCIQ/I+Dghs=;
        b=k56S6bIfl80YaM1bOW2o+OTZhVVMyeVDczxCY3YNgPVkcPYF1mlCxemDA+YI0k/7ts
         f4zSckTD8v5XXhGkSEIqbLCy3GWwsmuGC8m/bHH+JUMN2/pe5ePEbV4Jyxk19oIf2zgM
         XErqzcjFmbBt2tuy+Vp4dvHFwza7/bz5R9NyJJ8j92ZOrh/rxxS/VIaNmceViV09I6Lp
         ZcNsh9ApDpc0PBir/hXfi2v74dcfM6y58slRV+be4dzajgRku5ECk85ggYDvs+8xLTRT
         8QvMrFdPB5ULT0ne6Vd7V8jYMkF7uOxercjkGMvU9TKQV9bCdj5Vq6scvYlPD0KdrnhU
         1gew==
X-Gm-Message-State: AO0yUKUtXNBODeSpE+lv7EDXzUbt2A7fgtIVy9sD2FvX2g/0VgN22usN
	pbi8s/doQ4m1GFKwZfACbZ3xax+4tjPxow==
X-Google-Smtp-Source: AK7set/us85At+zQiPgPrdA3XE6PcbEXtrsT4mYI4e+agN4BKXc08YSRLt4ASknOhIS2KBQ4myu+VA==
X-Received: by 2002:a05:6214:76f:b0:54a:a9a2:251a with SMTP id f15-20020a056214076f00b0054aa9a2251amr6217323qvz.1.1676489836054;
        Wed, 15 Feb 2023 11:37:16 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id w3-20020a379403000000b006bb29d932e1sm14582348qkd.105.2023.02.15.11.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:37:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: fix for kernel 6.2+
Date: Wed, 15 Feb 2023 14:37:12 -0500
Message-Id: <20230215193712.3596002-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 19:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177210

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Backporting a patching from the 2.13.x stable branch of lttng
to fix the build against kernel 6.2+.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...ccessor-helpers-into-accessors.h-v6..patch | 45 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.8.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
new file mode 100644
index 0000000000..26ae605b31
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
@@ -0,0 +1,45 @@
+From 69d3aa79a641f539cfd5c11b46b2dd9b4df9b0f0 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 16 Jan 2023 15:01:51 -0500
+Subject: [PATCH] fix: btrfs: move accessor helpers into accessors.h (v6.2)
+
+See upstream commit :
+
+  commit 07e81dc94474eb62705c6f96d9ab1a5a797b8703
+  Author: Josef Bacik <josef@toxicpanda.com>
+  Date:   Wed Oct 19 10:51:00 2022 -0400
+
+    btrfs: move accessor helpers into accessors.h
+
+    This is a large patch, but because they're all macros it's impossible to
+    split up.  Simply copy all of the item accessors in ctree.h and paste
+    them in accessors.h, and then update any files to include the header so
+    everything compiles.
+
+Upstream-Status: Backport
+
+Change-Id: I1f0876dd8b7a8687f6802b60c3e3baabd017cc52
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index 785f16ac..01157107 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -9,6 +9,10 @@
+ #include <linux/writeback.h>
+ #include <lttng/kernel-version.h>
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0))
++#include <../fs/btrfs/accessors.h>
++#endif
++
+ #ifndef _TRACE_BTRFS_DEF_
+ #define _TRACE_BTRFS_DEF_
+ struct btrfs_root;
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
index 3cfc1bc58e..c04796be16 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
            file://fix-jbd2-use-the-correct-print-format-v5.10.163.patch \
            file://fix-jbd2-upper-bound-for-v5.10.163.patch \
+           file://0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.34.1


