Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id C0D2B72864
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:41:01 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so28946815pde.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AT18R9X9bVFnsrD171j1pHd50mZrPKhwzFRrCRzwxTQ=;
	b=u949Xs+S2JM/zDKR/WbUm0MRJ+CM+GdlDroVBwMCJuw5Ted6FzcjS01fDv93dvM3ci
	SZMRMlTc9Pu9AkJlus1ZEpMXJr6OrA9WeEyLrDSEK74KTPIQt2TF68pI87i3+mWNclrQ
	jRxQD0xbpZJDYYoTl4DN0+/qlsYAa9IKXSg4avJdfuZFEImpQnMjrb+D3GV8Zi8CQBNu
	dDFZpU2fxdMlBKuLQYR/AL2+jdOwe8WThlyMWq6NjHIVABkZNvY0G+eDtLMavROm20Vr
	vSeiFlj9Sbol7efm7s9D9rdEKa3ZD6HXkPc/BLpgSXPf1EA2avytwifnIp3WRLMMcLTT
	J//g==
X-Received: by 10.66.149.98 with SMTP id tz2mr82976272pab.63.1420490462742;
	Mon, 05 Jan 2015 12:41:02 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.41.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:41:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:44 -0800
Message-Id: <07128481436a91855ff912c9793ed1575157ab8a.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 10/12] lttng-modules: fix mm_compaction_isolate_template build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 20:41:01 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

linux-stable integrated the 3.16 commit f8c9301fa5a2a [mm/compaction: do
not count migratepages when unnecessary] with the 3.14.25 update.

So we have to update the lttng-module linux version codes to use the
new definition in builds greater than 3.14.24 or 3.16.

(From OE-Core rev: cf76820379746e91fc4cf01895cb98cc56987002)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-fix-mm_compaction_isolate_template-build.patch | 41 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch b/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
new file mode 100644
index 0000000..a99871a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
@@ -0,0 +1,41 @@
+From af48c7b08de4b811d3d974e65e362b86ce8c4a34 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Wed, 10 Dec 2014 03:19:28 -0500
+Subject: [PATCH] compaction: fix mm_compaction_isolate_template build
+
+linux-stable integrated the 3.16 commit f8c9301fa5a2a [mm/compaction: do
+not count migratepages when unnecessary] with the 3.14.25 update.
+
+So we have to update the lttng-module linux version codes to use the
+new definition in builds greater than 3.14.24 or 3.16.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ instrumentation/events/lttng-module/compaction.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/compaction.h b/instrumentation/events/lttng-module/compaction.h
+index 22024e9ee582..07afbe06f1a6 100644
+--- a/instrumentation/events/lttng-module/compaction.h
++++ b/instrumentation/events/lttng-module/compaction.h
+@@ -46,7 +46,7 @@ DEFINE_EVENT(mm_compaction_isolate_template, mm_compaction_isolate_freepages,
+ 	TP_ARGS(nr_scanned, nr_taken)
+ )
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0) || LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,25))
+ TRACE_EVENT(mm_compaction_migratepages,
+ 
+ 	TP_PROTO(unsigned long nr_all,
+@@ -87,7 +87,7 @@ TRACE_EVENT(mm_compaction_migratepages,
+ 		__entry->nr_migrated,
+ 		__entry->nr_failed)
+ )
+-#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0) || LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,25)) */
+ TRACE_EVENT(mm_compaction_migratepages,
+ 
+ 	TP_PROTO(unsigned long nr_migrated,
+-- 
+2.1.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
index 6ff961a..0f98aa5 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://Update-statedump-to-3.17-nsproxy-locking.patch \
            file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
            file://fix_build_with_v3.17_kernel.patch \
+           file://compaction-fix-mm_compaction_isolate_template-build.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
1.9.1


