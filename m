Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F794C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.27581.1677860289592608573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gfisfuJz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id i10so3160702plr.9
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBdb7h866JIkWIWUPARzfGhexWB+VeEHHIyiw3IuXVU=;
        b=gfisfuJzk3ZILoVJi7isz7WTDH4dpiVv+PWIlXtrJ+3lXh8leoL5Un0t4HuX+bwRV5
         aQ/VN9d/6LoAEAwzV6qdLUVX7UiYahX5MrZ8icNEFecmZwy1mTQRL9vAtnFXGuWlVQ2q
         trx3WkdgzrWRFGTNbBuZj+Y7yyQsNUx4qSxztJZ/ukZQr3JnmWaQ1of5VF0ex5spk10W
         7wC6O9ut1P6ulu+v1B1RkVlvUhCw0rgLjAYHvsiX7yju1u9l/PtEXmWnlbSUB6dKgaOe
         0hTmZSiVDLwWIk44gtspVobMT8XdyfKHX6qsqa9Rc+JHsvvAfhweYxQnND47+Q8l8cDI
         NfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBdb7h866JIkWIWUPARzfGhexWB+VeEHHIyiw3IuXVU=;
        b=ZUSn1eh4OMgTUmTyjWSFQ3bIiZSiuSMQ3rTOLJhO4hVBhoXLmWeAL3F6DR1yP+uFug
         QMthouJQjo0nJT4pzlq7wrg7lhx4c6UgxZvrUw2B3v3jUiiPj4/YzkgY4/fnQfrlt41K
         iICwBU4Bgidk3qE2bQv2Yl8LWgLBSsJ1UZmVkv1i7ew7ktYXUH1clZvJBAZnduPTR91x
         HAOQfYyisaZ4yh6gTPFt2t+gnFXe5VBabMlxOjNQMLjNDkytJ7OQOHoy8NkX9eggxQ1M
         0c6oqeuucYzpOWtB8ztY7JGuiFiCAIZH4Ylgu/kl88xAn9iLOVQDJZpo85g+DXDkDeNI
         wQkw==
X-Gm-Message-State: AO0yUKXka8qKaY+v1im5YKlhdFigtc/rL8WswwyX8Rr71sQzon4mpM1g
	X3jSKZJ9nJdGhy+0ArbLkQAf538KaFmyFmtUHPM=
X-Google-Smtp-Source: AK7set8McP4OSvGPHBE6A+PB87QQLIzdz1U3A19CYzDGJAAnx3B3v61VrnDnTgv7rI+ZqbMJeMTrUQ==
X-Received: by 2002:a17:902:e744:b0:19c:d169:cb3f with SMTP id p4-20020a170902e74400b0019cd169cb3fmr2892608plf.21.1677860288596;
        Fri, 03 Mar 2023 08:18:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/29] lttng-modules: fix for kernel 6.2+
Date: Fri,  3 Mar 2023 06:17:19 -1000
Message-Id: <5377410f29ba094b613571677b3f6a3f30e08d97.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178010

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Backporting a patching from the 2.13.x stable branch of lttng
to fix the build against kernel 6.2+.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3aed7dfe5ff6f52497dcffa58bc2f06cf709ea18)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


