Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63D6B7FC2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 01:18:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2019 17:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,345,1571727600"; d="scan'208";a="299536373"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2019 17:18:48 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Dec 2019 17:18:37 -0800
Message-Id: <20191223011837.4646-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191223011837.4646-1-timothy.t.orling@linux.intel.com>
References: <20191223011837.4646-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [RFC][PATCH 2/2] buildtools-extended-tarball: add recipe with build-essentials
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
X-List-Received-Date: Mon, 23 Dec 2019 01:18:48 -0000
Content-Transfer-Encoding: 8bit

* For some aging distros, such as CentOS 7, the native version
  of gcc is simply too ancient and is a constant source of
  headaches for moving forward.

* Add an extended version of buildtools-tarball which adds all
  of build-essential, so that the host is now modernized and
  capable of compiling the latest versions of components.

Fixes [YOCTO #13714]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../meta/buildtools-extended-tarball.bb       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-extended-tarball.bb

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
new file mode 100644
index 00000000000..d756036373e
--- /dev/null
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -0,0 +1,32 @@
+require recipes-core/meta/buildtools-tarball.bb
+
+DESCRIPTION = "SDK type target for building a standalone tarball containing build-essentials, python3, chrpath, \
+               make, git and tar. The tarball can be used to run bitbake builds on systems which don't meet the \
+               usual version requirements and have ancient compilers."
+SUMMARY = "Standalone tarball for running builds on systems with inadequate software and ancient compilers"
+LICENSE = "MIT"
+
+# Add nativesdk equivalent of build-essentials
+TOOLCHAIN_HOST_TASK += "\
+    nativesdk-automake \
+    nativesdk-autoconf \
+    nativesdk-binutils \
+    nativesdk-binutils-symlinks \
+    nativesdk-cpp \
+    nativesdk-cpp-symlinks \
+    nativesdk-gcc \
+    nativesdk-gcc-symlinks \
+    nativesdk-g++ \
+    nativesdk-g++-symlinks \
+    nativesdk-gettext \
+    nativesdk-libatomic \
+    nativesdk-libgcc \
+    nativesdk-libstdc++ \
+    nativesdk-libstdc++-dev \
+    nativesdk-libtool \
+    nativesdk-pkgconfig \
+    "
+
+TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
+
+SDK_TITLE = "Extended Build tools"
-- 
2.20.1


