Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB91D65D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:56:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA78u8JE000683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:56:08 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 7 Nov 2014 00:56:07 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 16:51:16 +0800
Message-ID: <1207ad62a548f35b4baf816e825bbeaf851418b9.1415350038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 11/24] lttng: recognize aarch64
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
X-List-Received-Date: Fri, 07 Nov 2014 08:56:09 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

Add aarch64 architecture to liburcu and lttng-ust.
Internally it is treated the same as "arm".

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch | 19 +++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb          |  1 +
 meta/recipes-support/liburcu/files/aarch64.patch      | 19 +++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.8.4.bb         |  1 +
 4 files changed, 40 insertions(+)
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
index 963029e..083b4cb 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            file://Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch \
+           file://aarch64.patch \
           "
 
 SRC_URI[md5sum] = "2ca6671b20a550aa0e8020a1a9a96fd4"
-- 
1.9.1


