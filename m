Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD5A37108D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T8hl89025283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:43:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 01:43:47 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 16:38:36 +0800
Message-ID: <36a722d493c52d16f6d55ed07df82e865e7f3db7.1409301362.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409301362.git.Chong.Lu@windriver.com>
References: <cover.1409301362.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libunwind: add recipes
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
X-List-Received-Date: Fri, 29 Aug 2014 08:43:49 -0000
Content-Type: text/plain

Add libunwind from meta-oe to oe-core, since perf depends on it.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/libunwind/libunwind.inc    | 30 +++++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb |  4 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
new file mode 100644
index 0000000..b27b9e5
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -0,0 +1,30 @@
+DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
+HOMEPAGE = "http://www.nongnu.org/libunwind"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
+
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+inherit autotools
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,lzma"
+
+EXTRA_OECONF_arm = "--enable-debug-frame"
+
+CFLAGS += "${ATOMICOPS}"
+ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
+ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
+ATOMICOPS ?= ""
+
+LDFLAGS += "${LIBATOMICS}"
+LIBATOMICS_armv5 = "-latomic_ops"
+LIBATOMICS_armv4 = "-latomic_ops"
+LIBATOMICS ?= ""
+
+DEPENDS += "${DEPLIBATOMICS}"
+DEPLIBATOMICS_armv5 = "libatomics-ops"
+DEPLIBATOMICS_armv4 = "libatomics-ops"
+DEPLIBATOMICS ?= ""
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
new file mode 100644
index 0000000..bc38e36
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -0,0 +1,4 @@
+require libunwind.inc
+
+SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
+SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.9.1


