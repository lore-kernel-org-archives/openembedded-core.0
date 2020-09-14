Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.56396.1600069953041744110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 00:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VmdwxuWe;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id ay8so16539828edb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=bW9qejTkzPMI0UASNWHUbNT7QgSd3sBYyAjBvmEkILM=;
        b=VmdwxuWeQuSM7FSuyHqgzgYI4BTOKo8vJd2Z8BUGf2oHO6x4URZOk5Mt+ACXA/F06B
         RUR+SlJVB6qXuAnQ7TqlOQorEmIGFz2tm00tBttZ+ZRgVCnhjqAe+BKeRrnft2GwlCP/
         ch4ZvhF8VuvSJlWVA/hXFxlpAnEVNjiDlESjh5MoUb+W4piw8d3G2xAOQA8XjxWy7Z+B
         c5fpn9LlN8WxOiZc4ekW8jj0P3+8nocV+y2+Vao8ZE8yEKAvz8hjeM+5UZ62BQUbJmDQ
         woLLaR22AgpuXTbN1w/s7WMqogefyk9JIudVTk4jqEqYyIe42WbtbbJJEZHQVRugUI6U
         tKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=bW9qejTkzPMI0UASNWHUbNT7QgSd3sBYyAjBvmEkILM=;
        b=ZPuuB1Yg0v1yd6DHqrd4yvBMfTdC7gVK6tvG5VEaGARBcXtfyHfhFsNaJGVTVRbDPI
         BHm+UZMNj9hELRtqT+Aq/cJOzyKe+FUTc98HZ9YpVLbDEoB9AWpyPC5sP6QSCzX598qe
         qq3dS3Na+1bmPrNyDHAEKcZZV6BJe8sjxz8NguND6qnVUJ0A2MbUpsCi5s6xDA3JJ1D8
         0xNrp2AU6kVf2sw4lE4fzaYpUhmAKWNOZdxBFFPvqYGK9bzQQmiK0ScjqnK0DAowUJU4
         wylZV7v1VWbbZIl1DExnrjuwnz6q3v6Zp9wAZpV0z35wjSMK0Bd9iDshZeabWwSY2e45
         npUw==
X-Gm-Message-State: AOAM530+Us0apclUDHVlywQpOlaTy6PLu6qvdK+aCedHAB/lVjv1PUoo
	OTWY2wDyLcXB0FR21Dg/ObQc670667c=
X-Google-Smtp-Source: ABdhPJxQU90O7edRpyPBMgn7D7NFOHg+7E4D1TLiNvZyNZ67g/1Q75XbeODAYVravMHM3gZQCbT12Q==
X-Received: by 2002:a05:6402:1d03:: with SMTP id dg3mr15561022edb.249.1600069950893;
        Mon, 14 Sep 2020 00:52:30 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b0d4.dip0.t-ipconnect.de. [91.37.176.212])
        by smtp.gmail.com with ESMTPSA id p25sm8662675edm.60.2020.09.14.00.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 00:52:30 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH] lttng-modules: backport patch to fix build for linux-5.4.62+
Date: Mon, 14 Sep 2020 09:52:22 +0200
Message-Id: <20200914075222.22226-1-sno@NetBSD.org>
X-Mailer: git-send-email 2.17.1

From: Jens Rehsack <sno@netbsd.org>

Backport patch from lttng-modules/stable-2.12
    87b2aff fix: writeback: Fix sync livelock due to b_dirty_time processing (v5.9)

with minor modfication to catch
    6623c19042b6 writeback: Fix sync livelock due to b_dirty_time processing

from linux/stable-5.4 v5.4.62+

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 ++++++++++++++++++
 .../lttng/lttng-modules_2.12.2.bb             |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
new file mode 100644
index 0000000000..96a1c486ef
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
@@ -0,0 +1,117 @@
+From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 31 Aug 2020 14:16:01 -0400
+Subject: [PATCH] fix: writeback: Fix sync livelock due to b_dirty_time
+ processing (v5.9)
+
+See upstream commit:
+
+  commit f9cae926f35e8230330f28c7b743ad088611a8de
+  Author: Jan Kara <jack@suse.cz>
+  Date:   Fri May 29 16:08:58 2020 +0200
+
+    writeback: Fix sync livelock due to b_dirty_time processing
+
+    When we are processing writeback for sync(2), move_expired_inodes()
+    didn't set any inode expiry value (older_than_this). This can result in
+    writeback never completing if there's steady stream of inodes added to
+    b_dirty_time list as writeback rechecks dirty lists after each writeback
+    round whether there's more work to be done. Fix the problem by using
+    sync(2) start time is inode expiry value when processing b_dirty_time
+    list similarly as for ordinarily dirtied inodes. This requires some
+    refactoring of older_than_this handling which simplifies the code
+    noticeably as a bonus.
+
+Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ .../events/lttng-module/writeback.h           | 39 ++++++++++++-------
+ 1 file changed, 26 insertions(+), 13 deletions(-)
+
+Upstream Status: Backport
+
+diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
+index ece67ad..e9018dd 100644
+--- a/instrumentation/events/lttng-module/writeback.h
++++ b/instrumentation/events/lttng-module/writeback.h
+@@ -384,34 +384,48 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
+ #endif
+ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0)) || (LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,62))
++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
++	TP_PROTO(struct bdi_writeback *wb,
++		 struct wb_writeback_work *work,
++		 unsigned long dirtied_before,
++		 int moved),
++	TP_ARGS(wb, work, dirtied_before, moved),
++	TP_FIELDS(
++		ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
++		ctf_integer(unsigned long, older, dirtied_before)
++		ctf_integer(int, moved, moved)
++	)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+ LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
+ 	TP_PROTO(struct bdi_writeback *wb,
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+ 		 struct wb_writeback_work *work,
+-#else
+-		 unsigned long *older_than_this,
+-#endif
+ 		 int moved),
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+ 	TP_ARGS(wb, work, moved),
+-#else
++	TP_FIELDS(
++		ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
++		ctf_integer(int, moved, moved)
++	)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
++	TP_PROTO(struct bdi_writeback *wb,
++		 unsigned long *older_than_this,
++		 int moved),
+ 	TP_ARGS(wb, older_than_this, moved),
+-#endif
+ 	TP_FIELDS(
+ 		ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+-#else
+ 		ctf_integer(unsigned long, older,
+ 			older_than_this ? *older_than_this : 0)
+ 		ctf_integer(long, age,
+ 			older_than_this ?
+ 				(jiffies - *older_than_this) * 1000 / HZ
+ 				: -1)
+-#endif
+ 		ctf_integer(int, moved, moved)
+ 	)
+ )
++#endif
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+ 		ctf_integer(unsigned long, dirty_limit, global_dirty_limit)
+ 	)
+ )
+-#else
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+ 
+ 	writeback_global_dirty_state,
+@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+ 	)
+ )
+ #endif
+-#endif
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
index 0e1a209ce8..f58b3bf0d7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
@@ -10,6 +10,7 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-- 
2.17.1

