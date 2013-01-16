Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TvVTv-0006Nm-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:05:11 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B19F8D22B4;
	Wed, 16 Jan 2013 16:49:31 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:49:16 +0100
Message-Id: <1358351356-5969-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] oprofile: add AArch64 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:05:21 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 ...d-rmb-definition-for-AArch64-architecture.patch | 31 ++++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-AArch64-architecture.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-AArch64-architecture.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-AArch64-architecture.patch
new file mode 100644
index 0000000..195bfb2
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-AArch64-architecture.patch
@@ -0,0 +1,31 @@
+From 27edaef9c6d66dfc324630ef40cb27e78031eeeb Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+Date: Tue, 15 Jan 2013 07:37:33 +0100
+Subject: [PATCH] Add rmb() definition for AArch64 architecture
+
+Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-status: backport
+---
+ libperf_events/operf_utils.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.h
+index 815d51d..2df00b7 100644
+--- a/libperf_events/operf_utils.h
++++ b/libperf_events/operf_utils.h
+@@ -148,6 +148,11 @@ void op_release_resources(void);
+ #define cpu_relax()	asm volatile("":::"memory")
+ #endif
+ 
++#ifdef __aarch64__
++#define rmb()		asm volatile("dmb ld" ::: "memory")
++#define cpu_relax()	asm volatile("yield" ::: "memory")
++#endif
++
+ #ifdef __mips__
+ #include <asm/unistd.h>
+ #define rmb()		asm volatile(					\
+-- 
+1.8.0
+
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
index 939c1ba..d283b5c 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
@@ -2,7 +2,8 @@ require oprofile.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+            file://0001-Add-rmb-definition-for-AArch64-architecture.patch"
 
 SRC_URI[md5sum] = "6d127023af1dd1cf24e15411229f3cc8"
 SRC_URI[sha256sum] = "ab45900fa1a23e5d5badf3c0a55f26c17efe6e184efcf00b371433751fa761bc"
-- 
1.8.0



