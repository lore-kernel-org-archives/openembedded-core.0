Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4CFA6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 22:22:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8FMMrAS021760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:22:54 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 15:22:53 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Sep 2014 15:22:53 -0700
Message-ID: <1410819773-1213-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] lttng: recognize aarch64
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
X-List-Received-Date: Mon, 15 Sep 2014 22:23:02 -0000
Content-Type: text/plain

Add aarch64 architecture to liburcu and lttng-ust.
Internally it is treated the same as "arm".

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../lttng/lttng-ust/add-aarch64.patch              |   19 +++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb       |    1 +
 meta/recipes-support/liburcu/files/aarch64.patch   |   19 +++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.8.4.bb      |    1 +
 4 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
 create mode 100644 meta/recipes-support/liburcu/files/aarch64.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch b/meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
new file mode 100644
index 0000000..cec5410
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
@@ -0,0 +1,19 @@
+lttng-ust: add aarch64 recognition
+
+Treat the same as "arm".
+
+Upstream-Status: Pending
+
+Signed-off-by: joe.slater@windriver.com
+
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -230,6 +230,7 @@ changequote([,])dnl
+ 	s390) NO_UNALIGNED_ACCESS=1 ;;
+ 	s390x) NO_UNALIGNED_ACCESS=1 ;;
+         arm*) NO_UNALIGNED_ACCESS=1 ;;
++        aarch64) NO_UNALIGNED_ACCESS=1 ;;
+ 	mips*) NO_UNALIGNED_ACCESS=1 ;;
+ 	tile*) NO_UNALIGNED_ACCESS=1 ;;
+ 	*) AC_MSG_ERROR([unable to detect alignment requirements (unsupported architecture ($host_cpu)?)]) ;;
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
index 71ea5bc..e07d3c7 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
@@ -24,6 +24,7 @@ PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.5 \
            file://lttng-ust-doc-examples-disable.patch \
+           file://add-aarch64.patch \
 	   "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/liburcu/files/aarch64.patch b/meta/recipes-support/liburcu/files/aarch64.patch
new file mode 100644
index 0000000..c6cc8c2
--- /dev/null
+++ b/meta/recipes-support/liburcu/files/aarch64.patch
@@ -0,0 +1,19 @@
+libucru: recognize aarch64
+
+Make the same as "arm" internally.
+
+Upstream-Status: Pending
+
+Signed-off-by: joe.slater@windriver.com
+
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,7 @@ AS_CASE([$host_cpu],
+ 	[alpha*], [ARCHTYPE="alpha"],
+ 	[ia64], [ARCHTYPE="gcc"],
+ 	[arm*], [ARCHTYPE="arm"],
++	[aarch64], [ARCHTYPE="arm"],
+ 	[mips*], [ARCHTYPE="mips"],
+ 	[tile*], [ARCHTYPE="gcc"],
+ 	[ARCHTYPE="unknown"]
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.4.bb b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
index cd7af24..a79d4cf 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://aarch64.patch \
           "
 
 SRC_URI[md5sum] = "2ca6671b20a550aa0e8020a1a9a96fd4"
-- 
1.7.3.4


