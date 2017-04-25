Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AB23877ACD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 22:33:59 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1d3920-0001WW-By from Nathan_Lynch@mentor.com ;
	Tue, 25 Apr 2017 15:34:00 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 25 Apr 2017 15:33:57 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Apr 2017 17:33:55 -0500
Message-ID: <20170425223355.13155-1-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH] lttng-modules: work around GCC 7 changes
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
X-List-Received-Date: Tue, 25 Apr 2017 22:33:59 -0000
Content-Type: text/plain

Avoid using LTTng's BUILD_RUNTIME_BUG_ON macro, as it appears to run
into a similar problem as Linux experienced with __builtin_constant_p
and dead code elimination.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../BUILD_RUNTIME_BUG_ON-vs-gcc7.patch             | 43 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb   |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch b/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch
new file mode 100644
index 000000000000..76063607a831
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch
@@ -0,0 +1,43 @@
+From ab07574ef90fa510f293c37897d577066a88fe0d Mon Sep 17 00:00:00 2001
+From: Nathan Lynch <nathan_lynch@mentor.com>
+Date: Tue, 25 Apr 2017 16:26:57 -0500
+Subject: [PATCH] BUILD_RUNTIME_BUG_ON vs gcc7
+
+Avoid using LTTng's BUILD_RUNTIME_BUG_ON macro, as it appears to run
+into a similar problem as Linux experienced with ilog2.
+
+See:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=474c90156c8dcc2fa815e6716cc9394d7930cb9c
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72785
+
+Upstream-Status: Pending
+Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
+---
+ lib/align.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/align.h b/lib/align.h
+index 5b91ae87410b..5e134cd485fe 100644
+--- a/lib/align.h
++++ b/lib/align.h
+@@ -48,7 +48,7 @@
+  */
+ #define offset_align(align_drift, alignment)				       \
+ 	({								       \
+-		BUILD_RUNTIME_BUG_ON((alignment) == 0			       \
++		BUG_ON((alignment) == 0					       \
+ 				   || ((alignment) & ((alignment) - 1)));      \
+ 		(((alignment) - (align_drift)) & ((alignment) - 1));	       \
+ 	})
+@@ -63,7 +63,7 @@
+  */
+ #define offset_align_floor(align_drift, alignment)			       \
+ 	({								       \
+-		BUILD_RUNTIME_BUG_ON((alignment) == 0			       \
++		BUG_ON((alignment) == 0					       \
+ 				   || ((alignment) & ((alignment) - 1)));      \
+ 		(((align_drift) - (alignment)) & ((alignment) - 1));	       \
+ 	})
+-- 
+2.9.3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
index abff79d06f26..b48f9cff9a78 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
@@ -11,7 +11,8 @@ inherit module
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch"
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch"
 
 SRC_URI[md5sum] = "5a16bca52233cc2bdff572b1120a88f6"
 SRC_URI[sha256sum] = "62078fe3254ca65969db4b72e59042cd797dbf2740848f8f82384877ae460d54"
-- 
2.9.3


