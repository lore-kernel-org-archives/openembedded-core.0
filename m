Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1BD66CED7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 09:55:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM9tMkx025429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 01:55:22 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.203) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 22 Nov 2013 01:55:22 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 17:55:17 +0800
Message-ID: <1385114118-4630-2-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1385114118-4630-1-git-send-email-Chong.Lu@windriver.com>
References: <1385114118-4630-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lttng-ust: Using toolchain to compile examples
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
X-List-Received-Date: Fri, 22 Nov 2013 09:55:22 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

1. Some head files wouldn't be found when compiled with host gcc.
   So, We should use cross compile toolchain to build examples.
2. Because the .o file couldn't be generated through lttng-gen-tp in
   cross-compiling environment. Implement the .o file generation
   manually instead of lttng-gen-tp.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../lttng-ust/0001-lttng-ust-several-fixes.patch   |   97 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb       |    1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-several-fixes.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-several-fixes.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-several-fixes.patch
new file mode 100644
index 0000000..a51d0e5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-several-fixes.patch
@@ -0,0 +1,97 @@
+From ea7d68aba7723633dcc3944a58f0b30191ea782b Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Fri, 22 Nov 2013 16:11:53 +0800
+Subject: [PATCH] lttng-ust: several fixes
+
+This patch fixes below issues:
+
+1. Using cross compile toolchain to build examples.
+2. Implement the .o file generation manually instead of lttng-gen-tp.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ doc/examples/demo/Makefile             |    1 -
+ doc/examples/easy-ust/Makefile         |    1 -
+ doc/examples/gen-tp/Makefile           |   17 ++++++++---------
+ doc/examples/hello-static-lib/Makefile |    1 -
+ 4 files changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/doc/examples/demo/Makefile b/doc/examples/demo/Makefile
+index 27e4146..d0d83e5 100644
+--- a/doc/examples/demo/Makefile
++++ b/doc/examples/demo/Makefile
+@@ -14,7 +14,6 @@
+ #
+ # This makefile is purposefully kept simple to support GNU and BSD make.
+ 
+-CC = gcc
+ LIBS = -ldl	# On Linux
+ #LIBS = -lc	# On BSD
+ LOCAL_CPPFLAGS += -I.
+diff --git a/doc/examples/easy-ust/Makefile b/doc/examples/easy-ust/Makefile
+index 966c474..0cfeec4 100644
+--- a/doc/examples/easy-ust/Makefile
++++ b/doc/examples/easy-ust/Makefile
+@@ -16,7 +16,6 @@
+ #
+ # This makefile is purposefully kept simple to support GNU and BSD make.
+ 
+-CC = gcc
+ LIBS = -ldl -llttng-ust		# On Linux
+ #LIBS = -lc -llttng-ust		# On BSD
+ LOCAL_CPPFLAGS += -I.
+diff --git a/doc/examples/gen-tp/Makefile b/doc/examples/gen-tp/Makefile
+index bc979d9..b9fe757 100644
+--- a/doc/examples/gen-tp/Makefile
++++ b/doc/examples/gen-tp/Makefile
+@@ -17,7 +17,6 @@
+ #
+ # This makefile is purposefully kept simple to support GNU and BSD make.
+ 
+-CC = gcc
+ 
+ LIBS = -ldl -llttng-ust		#On Linux
+ #LIBS = -lc -llttng-ust		#On BSD
+@@ -33,17 +32,17 @@ sample.o: sample.c sample_tracepoint.h
+ 		-c -o $@ $<
+ 
+ # Use this command to compile the .c manually
+-#sample_tracepoint.o: sample_tracepoint.c sample_tracepoint.h
+-#	$(CC) $(CPPFLAGS) $(CFLAGS) $(AM_CPPFLAGS) $(AM_CFLAGS) \
+-#		-I. -c -o $@ $<
++sample_tracepoint.o: sample_tracepoint.c sample_tracepoint.h
++	$(CC) $(CPPFLAGS) $(CFLAGS) $(AM_CPPFLAGS) $(AM_CFLAGS) \
++		-I. -c -o $@ $<
+ 
+ # This rule generate .o only and depends on rules for generating
+ # the .h and .c
+-%.o: %.tp %.c %.h
+-	CPPFLAGS="$(CPPFLAGS) $(AM_CPPFLAGS)" \
+-	CFLAGS="$(CFLAGS) $(AM_CFLAGS)" \
+-	LDFLAGS="$(LDFLAGS) $(AM_LDFLAGS)" \
+-	$(LTTNG_GEN_TP_PATH)lttng-gen-tp -o $@ $<
++#%.o: %.tp %.c %.h
++#	CPPFLAGS="$(CPPFLAGS) $(AM_CPPFLAGS)" \
++#	CFLAGS="$(CFLAGS) $(AM_CFLAGS)" \
++#	LDFLAGS="$(LDFLAGS) $(AM_LDFLAGS)" \
++#	$(LTTNG_GEN_TP_PATH)lttng-gen-tp -o $@ $<
+ 
+ # The following rule can be used to generate all files instead of having one
+ # for each file type. Note that the sample.o has a dependency on the
+diff --git a/doc/examples/hello-static-lib/Makefile b/doc/examples/hello-static-lib/Makefile
+index 9a079ec..4ed5dcf 100644
+--- a/doc/examples/hello-static-lib/Makefile
++++ b/doc/examples/hello-static-lib/Makefile
+@@ -14,7 +14,6 @@
+ #
+ # This makefile is purposefully kept simple to support GNU and BSD make.
+ 
+-CC = gcc
+ LOCAL_CPPFLAGS += -I.
+ LIBS = -ldl -llttng-ust	# On Linux
+ #LIBS = -lc -llttng-ust	# On BSD
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
index fa157d2..f9421ac 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
@@ -22,6 +22,7 @@ PV = "2.3.0"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git \
+           file://0001-lttng-ust-several-fixes.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


