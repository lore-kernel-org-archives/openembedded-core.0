Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47ED7719DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:59:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="1122912393"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.85.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2017 12:59:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  6 Feb 2017 12:59:08 -0800
Message-Id: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] iucode-tool: Add support for MUSL
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
X-List-Received-Date: Mon, 06 Feb 2017 20:59:14 -0000

iu-code needs the arpg API which is not part of MUSL, so add argp-standalone as
a dependency. The arpg library is also required for linking, so add a patch to
the Makefile.am

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...am-Add-arg-parse-library-for-MUSL-support.patch | 29 ++++++++++++++++++++++
 common/recipes-core/microcode/iucode-tool_2.1.1.bb |  6 ++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 common/recipes-core/microcode/iucode-tool/0001-Makefile.am-Add-arg-parse-library-for-MUSL-support.patch

diff --git a/common/recipes-core/microcode/iucode-tool/0001-Makefile.am-Add-arg-parse-library-for-MUSL-support.patch b/common/recipes-core/microcode/iucode-tool/0001-Makefile.am-Add-arg-parse-library-for-MUSL-support.patch
new file mode 100644
index 0000000..ca97d2a
--- /dev/null
+++ b/common/recipes-core/microcode/iucode-tool/0001-Makefile.am-Add-arg-parse-library-for-MUSL-support.patch
@@ -0,0 +1,29 @@
+From 5f6826b3a59dedf508d5a6122362d69a4813e8e6 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Fri, 3 Feb 2017 16:08:51 -0800
+Subject: [PATCH] Makefile.am: Add arg-parse library for MUSL support
+
+iucode-tool needs argp-standalone when used with MUSL, so add this
+patch to the Makefile to link with argp
+
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 415a241..764fb61 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,6 +5,7 @@
+ sbin_PROGRAMS	 = iucode_tool
+ man_MANS	 = iucode_tool.8
+ 
++iucode_tool_LDADD = -largp
+ iucode_tool_SOURCES = intel_microcode.h intel_microcode.c iucode_tool.c
+ EXTRA_DIST	= autogen.sh CONTRIBUTING
+ 
+-- 
+2.7.4
+
diff --git a/common/recipes-core/microcode/iucode-tool_2.1.1.bb b/common/recipes-core/microcode/iucode-tool_2.1.1.bb
index e98bca6..9cae8e2 100644
--- a/common/recipes-core/microcode/iucode-tool_2.1.1.bb
+++ b/common/recipes-core/microcode/iucode-tool_2.1.1.bb
@@ -16,7 +16,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://iucode_tool.c;beginline=1;endline=15;md5=5d8e3639c3b6a80e7d5e0e073933da16"
 
-SRC_URI = "https://gitlab.com/iucode-tool/releases/raw/master/iucode-tool_${PV}.tar.xz"
+DEPENDS_append_libc-musl = " argp-standalone"
+
+SRC_URI = "https://gitlab.com/iucode-tool/releases/raw/master/iucode-tool_${PV}.tar.xz \
+           file://0001-Makefile.am-Add-arg-parse-library-for-MUSL-support.patch \
+           "
 SRC_URI[md5sum] = "306d20b43da847812af4bf973f46045d"
 SRC_URI[sha256sum] = "8f94ec73f5d4d1a6801aaa894fa1c6544d9b27aec16e1a00e18e8241c7e0f6ba"
 
-- 
2.7.4


