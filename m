Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.6600.1601504137618939570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xs0MTR2Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d6so2336527pfn.9
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yH1UDjlh52vg5M3gZgq6HJmRIMLGfgQ51BvdoTZDbIQ=;
        b=xs0MTR2Zp3FEeAoTNZjljZSvpPPIZmeqo5L4nZ3HrqBRxRo+1PeQo2hnCzTsH2TMHD
         ZEFF2nRrGIGPcEEwrH8nVOUfS3IukaiERPpR/1KSg+e/qZSz71oUeB5SSCnRox7V2j5a
         07Pi7g1hdUYXQe7XiVybs5iyVc2CjI26gWh3uotY0G71XtfPPkiF0YR+I1cQldPIY+k1
         G6NVueD+GktvfMJT78rk+Rqjc4i0DhofSv2rAFaovMKezIZnuWPONFvQMePE5PkW/+kw
         8XcOGn1+dGnegeUrFmXQek3MZvMWkCK4WAcmbFT6UYoVBejKB2hs3gnZFRElGtS7HhQi
         HRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yH1UDjlh52vg5M3gZgq6HJmRIMLGfgQ51BvdoTZDbIQ=;
        b=DVeOt5XNQJ5ZTkaC5LjqJZq25TwMqz2MjJ+GbcoFeqJ7Tmks8DCcOXLNVIHJa2ND3t
         dZILJY7moR3WpwOUNA8HnTrai8RaCpng3rr9RMrfiyq55kzLBIzVOFfVOtdQZLbzD22m
         oJ8GJ+9U9ZXtGWgo5vbQthw2dX+eJ1gRkKDp0W70WMKNugIPC7B0br5uw0KWdxdHluUJ
         +gtoMd3hg0YkCg8Fwijngsiz52Lu8eNwTBbLe2sgQzH7qOSsz5nuyEsfb6LRj00O6PKQ
         msyEhzKoI343FYvCScH/0sdD9bzlDQ561vQYlEA6ga9y7Gp+g0LTinIEnsUvS0+YgKMn
         74TQ==
X-Gm-Message-State: AOAM531zJQi29KZd6mUYSDizQv/HkySHRXywnypHVwVcl2nKTyGmBAeb
	tntMxjZzn7uX/CdYHJjnq5PC+yQEs23jB+/Ciko=
X-Google-Smtp-Source: ABdhPJz0uBeaXj17p1Rkx506OHSrXy7Nl1yQM8p93/WnVBP5qAva5mrj4/QMGeYXzJWi/t7FXKicQw==
X-Received: by 2002:a63:77c4:: with SMTP id s187mr3642213pgc.303.1601504136648;
        Wed, 30 Sep 2020 15:15:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/41] lttng-modules: backport writeback.h changes from 2.12.x to fix kernel 5.4.62+
Date: Wed, 30 Sep 2020 12:11:39 -1000
Message-Id: <348c666b2dca230308c8462dac2117b04cca6ae7.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Backporting the kernel version changes for writeback.h to fix
compilation against kernel stable versions 5.4.62+

This is a combination of upstream commits:

 87b2aff [fix: writeback: Fix sync livelock due to b_dirty_time processing (v5.9)]
 b74b25f [fix: version ranges for ext4_discard_preallocations and writeback_queue_io

Upstream-status: Backport

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ckport-writeback.h-changes-from-2.12.patch | 128 ++++++++++++++++++
 .../lttng/lttng-modules_2.11.2.bb             |   7 +-
 2 files changed, 132 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
new file mode 100644
index 0000000000..25b0a57bc6
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
@@ -0,0 +1,128 @@
+From 66d0869cf54ed79a33345f537dce2f7840e279f0 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Tue, 29 Sep 2020 10:28:20 -0400
+Subject: [PATCH] lttng-modules: backport writeback.h changes from 2.12.x to
+ fix kernel 5.4.62+
+
+Backporting the kernel version changes for writeback.h to fix
+compilation against kernel stable versions 5.4.62+
+
+This is a combination of upstream commits:
+
+ 87b2aff [fix: writeback: Fix sync livelock due to b_dirty_time processing (v5.9)]
+ b74b25f [fix: version ranges for ext4_discard_preallocations and writeback_queue_io
+
+Upstream-status: Backport
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ .../events/lttng-module/writeback.h           | 48 +++++++++++++------
+ 1 file changed, 33 insertions(+), 15 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/writeback.h b/instrumentation/events/lttng-module/writeback.h
+index 3327a0f..8d2250e 100644
+--- a/instrumentation/events/lttng-module/writeback.h
++++ b/instrumentation/events/lttng-module/writeback.h
+@@ -372,34 +372,55 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait, writeback_wbc_balanc
+ #endif
+ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_writepage)
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0) || \
++	LTTNG_KERNEL_RANGE(5,8,6, 5,9,0) || \
++	LTTNG_KERNEL_RANGE(5,4,62, 5,5,0) || \
++	LTTNG_KERNEL_RANGE(4,19,143, 4,20,0) || \
++	LTTNG_KERNEL_RANGE(4,14,196, 4,15,0) || \
++	LTTNG_KERNEL_RANGE(4,9,235, 4,10,0) || \
++	LTTNG_KERNEL_RANGE(4,4,235, 4,5,0) || \
++	LTTNG_UBUNTU_KERNEL_RANGE(4,15,18,119, 4,16,0,0))
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
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+@@ -425,7 +446,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+ 		ctf_integer(unsigned long, dirty_limit, global_dirty_limit)
+ 	)
+ )
+-#else
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+ 
+ 	writeback_global_dirty_state,
+@@ -450,7 +471,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
+ 	)
+ )
+ #endif
+-#endif
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+ 
+@@ -661,7 +681,6 @@ LTTNG_TRACEPOINT_EVENT(writeback_sb_inodes_requeue,
+ )
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37))
+ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_congest_waited_template,
+ 
+ 	TP_PROTO(unsigned int usec_timeout, unsigned int usec_delayed),
+@@ -687,7 +706,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_congest_waited_template, writeback_wai
+ 
+ 	TP_ARGS(usec_timeout, usec_delayed)
+ )
+-#endif
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_single_inode_template,
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
index 6fff096a37..8e56a3c10a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
@@ -11,6 +11,7 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch \
            "
 
 SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
@@ -33,11 +34,11 @@ python do_package_prepend() {
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "17c413953603f063f2a9d6c3788bec914ce6f955"
-PV_class-devupstream = "2.11.2+git${SRCPV}"
+SRCREV_class-devupstream = "01a12501e0b0395b60c7e392cb7dded51ae572ca"
+PV_class-devupstream = "2.12.2+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.17.1

