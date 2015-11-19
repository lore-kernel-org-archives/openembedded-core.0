Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id F36E9606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:05 +0000 (UTC)
Received: by qgea14 with SMTP id a14so55291924qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7X9NVTV2IpnmN80FbzlHq9Yt37a0hnMZ1ceXWM1faws=;
	b=ZZ3XCwcbDNjWMl35PeKjvEkFglcE2vYHLccx0JoCN/txEdpmvk7Luh2BTVmC9yJbx8
	R1HXDsOoPomK1FEA0S1izPnw99pRkX6ssyEMGoP5MvzyCwnB5lWoM29ChDPBMqnwKFgw
	JDsYrmw6afXZctEpZ2qkFWhF6rUyzmE80M3osYttc4U13+jt3GxvO34ctAaEy6CQ0wwy
	SLkAUddIEHQwAfUUTdIKz8yzMIxZ2mrglVy7QhitokEHA/BGZeslx2TyUwg6FRXPERAA
	tMyDCdY60K3GM0SV+QzKoWGk869S2HQjfsdrD6lWYTgUc9DS4hZJbmpTaleoCMGnovzV
	FNPg==
X-Received: by 10.140.20.242 with SMTP id 105mr3099636qgj.18.1447953066748;
	Thu, 19 Nov 2015 09:11:06 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:50 +0000
Message-Id: <a84d885d2235edef7159fffa522fe0f41a6d623e.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
Subject: [PATCH 03/13] gdb: Fix build with musl
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:06 -0000

This is a patch that has been submitted upstream as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 88c0213..2162cad 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -5,6 +5,7 @@ inherit gettext
 SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
             file://fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch \
+            file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
new file mode 100644
index 0000000..1302330
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
@@ -0,0 +1,52 @@
+From 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jun 2015 20:21:38 -0700
+Subject: [PATCH] Use exorted definitions of SIGRTMIN
+
+Define W_STOPCODE if not defined already
+
+__SIGRTMIN is internal to glibc and other libcs e.g. musl
+may not provide them
+
+Fixes
+https://sourceware.org/bugzilla/show_bug.cgi?id=13012
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdb/linux-nat.c     | 4 ++--
+ gdb/nat/linux-nat.h | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
+index 396c30c..50320ee 100644
+--- a/gdb/linux-nat.c
++++ b/gdb/linux-nat.c
+@@ -4856,10 +4856,10 @@ lin_thread_get_thread_signals (sigset_t *set)
+      fortunately they don't change!  */
+ 
+   if (restart == 0)
+-    restart = __SIGRTMIN;
++    restart = SIGRTMIN;
+ 
+   if (cancel == 0)
+-    cancel = __SIGRTMIN + 1;
++    cancel = SIGRTMIN + 1;
+ 
+   sigaddset (set, restart);
+   sigaddset (set, cancel);
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 83a6d91..efbe0fd 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,4 +25,8 @@
+    instead SIGTRAP with bit 7 set.  */
+ #define SYSCALL_SIGTRAP (SIGTRAP | 0x80)
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #endif /* LINUX_NAT_H */
+-- 
+2.1.4
+
-- 
2.6.3


