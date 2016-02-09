Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id AAB336067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:31:29 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q029X60BTz3hjQf;
	Tue,  9 Feb 2016 12:31:28 +0100 (CET)
X-Auth-Info: NjxBaSfPbuwGQT31a6gjNYBMQjphOuhZxCOHkRjlvmM=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q029X4NLjzvdWV;
	Tue,  9 Feb 2016 12:31:28 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 12:31:11 +0100
Message-Id: <1455017471-6682-7-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455017471-6682-1-git-send-email-marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 7/7] oprofile: Add nios2 support
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
X-List-Received-Date: Tue, 09 Feb 2016 11:31:29 -0000

Add support for the nios2 architecture.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |  3 ++-
 ...Add-rmb-definition-for-NIOS2-architecture.patch | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index faf0e53..cf3ad43 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -23,7 +23,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://automake-foreign.patch \
            file://oprofile-cross-compile-tests.patch \
            file://run-ptest \
-           file://root-home-dir.patch"
+           file://root-home-dir.patch \
+           file://0001-Add-rmb-definition-for-NIOS2-architecture.patch"
 
 SRC_URI_append_libc-musl = " file://musl.patch"
 
diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
new file mode 100644
index 0000000..12bf809
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
@@ -0,0 +1,30 @@
+From 34b0d9b1a32fb404a30327a7ae8931c7c75583bf Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 9 Feb 2016 02:00:29 +0100
+Subject: [PATCH] Add rmb() definition for NIOS2 architecture
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Pending
+---
+ libperf_events/operf_utils.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.h
+index 32954cc..8270e53 100644
+--- a/libperf_events/operf_utils.h
++++ b/libperf_events/operf_utils.h
+@@ -178,6 +178,11 @@ void op_release_resources(void);
+ #define cpu_relax()	asm volatile("" ::: "memory")
+ #endif
+ 
++#ifdef __nios2__
++#define rmb()		asm volatile("" ::: "memory")
++#define cpu_relax()	asm volatile("" ::: "memory")
++#endif
++
+ #ifdef __tile__
+ #include <asm/unistd.h>
+ #define rmb()		__insn_mf()
+-- 
+2.7.0
+
-- 
2.1.4


