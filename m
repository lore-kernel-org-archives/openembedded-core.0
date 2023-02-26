Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D35EC7EE2E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.69588.1677430972994155422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tUQsMPag;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id h8so1108003plf.10
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBdb7h866JIkWIWUPARzfGhexWB+VeEHHIyiw3IuXVU=;
        b=tUQsMPagxyfY3GmPpxWK9hLGQOWfbPqf/drhb23Y93jLLqWK0Ki7x3kDoqH2ZFUhok
         vvcczqbDC/Gxvcw0Qa7bFUnx6F1wcNomNaqb+PP9SKaX3OdiFZaiDfMImmRasmfZkd6Y
         jPbIEf2ioLdlkv1Z4lPZQEJHTAl4kYXDGVG3qy4lxNF7Ty4NrTZ2br+wi3mxDOJuwwb/
         dryKZ4geP8N7pqkzc5Sfgzsi/6rLymQEzt6VweDDxkim5tsp/B3FvQSbd5gyrNJxSHSf
         Nhkl/aOKqrLnvQhCNlsb829KoZc4KMS8/BlRoPUg3ABl7+BRA/oCxJrnTcpn6lBULjss
         EWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBdb7h866JIkWIWUPARzfGhexWB+VeEHHIyiw3IuXVU=;
        b=SX/qCpkhSNivR0B/Fj53rr8Z80vXXybbTf5CaDOq8//7mrYRc14SHBa/mFwchRDdSf
         YpP4L1wFO0aGEllfVaMEc0TKFo7rghJ5JAl6+FnxCdYLDRwt8hAWzTa8FYpeQiSgNdds
         JH0V6n4pu0kfEvhAJNB3t6L1smKGbV5Sln30jOsZE2+4EN5XKYMPjQ3l+7/CuPRWvsPF
         8LNHLvn+owyO6n8adHUb0pWedVU+gaGiFXCkZCWpy6RdJZqfmGC6EGDmeUYuFP+V4Sdn
         SEzOgTD5852wNsIZVwwxEebPMrQ59CoAMiBw6nsD0h0o5zdBCDyYIreTYVPqCH28v4w6
         mwjA==
X-Gm-Message-State: AO0yUKV89/w/R+LYxnLttEGu0Gvigo2T6O0xN/jfQyyY2lCPbuyFVF92
	11b/CsROSpCelGwwmB9CRhHMfyAusC2maL1p4J8=
X-Google-Smtp-Source: AK7set/qgGmsEJCOJOuWd7DTjQM0hD7hi/iAUice4HBcsVv3LRbEfE4ns3IkFstFyMWmqTDWiP8OdA==
X-Received: by 2002:a17:90b:3802:b0:234:6c1a:8d9b with SMTP id mq2-20020a17090b380200b002346c1a8d9bmr22996643pjb.0.1677430986269;
        Sun, 26 Feb 2023 09:03:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/28] lttng-modules: fix for kernel 6.2+
Date: Sun, 26 Feb 2023 07:02:16 -1000
Message-Id: <5d36b42406d7cbc152008c9de364eb4187c64b3b.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177758

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


