Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9491A76A6C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:39:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 06:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771742223"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 06:39:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 16:40:49 +0300
Message-Id: <dc16ce17f4805c3120efbdd6841bb61cc5f2e20e.1439991562.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/22] libyaml: add a recipe from meta-oe
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
X-List-Received-Date: Wed, 19 Aug 2015 13:39:53 -0000

libyaml is a dependency of ruby

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libyaml/files/libyaml-CVE-2014-9130.patch      | 32 ++++++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.1.6.bb      | 21 ++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
 create mode 100644 meta/recipes-support/libyaml/libyaml_0.1.6.bb

diff --git a/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch b/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
new file mode 100644
index 0000000..3c4a00e
--- /dev/null
+++ b/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
@@ -0,0 +1,32 @@
+# HG changeset patch
+# User Kirill Simonov <xi@resolvent.net>
+# Date 1417197312 21600
+# Node ID 2b9156756423e967cfd09a61d125d883fca6f4f2
+# Parent  053f53a381ff6adbbc93a31ab7fdee06a16c8a33
+Removed invalid simple key assertion (thank to Jonathan Gray).
+
+The patch comes from 
+
+https://bitbucket.org/xi/libyaml/commits/2b9156756423e967cfd09a61d125d883fca6f4f2
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+diff -r 053f53a381ff -r 2b9156756423 src/scanner.c
+--- a/src/scanner.c	Wed Mar 26 13:55:54 2014 -0500
++++ b/src/scanner.c	Fri Nov 28 11:55:12 2014 -0600
+@@ -1106,13 +1106,6 @@
+             && parser->indent == (ptrdiff_t)parser->mark.column);
+ 
+     /*
+-     * A simple key is required only when it is the first token in the current
+-     * line.  Therefore it is always allowed.  But we add a check anyway.
+-     */
+-
+-    assert(parser->simple_key_allowed || !required);    /* Impossible. */
+-
+-    /*
+      * If the current position may start a simple key, save it.
+      */
+ 
diff --git a/meta/recipes-support/libyaml/libyaml_0.1.6.bb b/meta/recipes-support/libyaml/libyaml_0.1.6.bb
new file mode 100644
index 0000000..b015577
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml_0.1.6.bb
@@ -0,0 +1,21 @@
+SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
+DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
+a human-readable data serialization format. "
+HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+SECTION = "libs/devel"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://libyaml-CVE-2014-9130.patch \
+          "
+
+SRC_URI[md5sum] = "5fe00cda18ca5daeb43762b80c38e06e"
+SRC_URI[sha256sum] = "7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749"
+
+S = "${WORKDIR}/yaml-${PV}"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


