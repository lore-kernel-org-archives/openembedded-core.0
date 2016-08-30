Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3447A60110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:28:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2016 05:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1033127055"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2016 05:28:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 15:26:53 +0300
Message-Id: <20160830122653.16162-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160830122653.16162-1-alexander.kanavin@linux.intel.com>
References: <20160830122653.16162-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] libyaml: update to 0.1.7
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
X-List-Received-Date: Tue, 30 Aug 2016 12:28:25 -0000

Drop backported libyaml-CVE-2014-9130.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libyaml/files/libyaml-CVE-2014-9130.patch      | 33 ----------------------
 .../libyaml/{libyaml_0.1.6.bb => libyaml_0.1.7.bb} |  5 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
 rename meta/recipes-support/libyaml/{libyaml_0.1.6.bb => libyaml_0.1.7.bb} (72%)

diff --git a/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch b/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
deleted file mode 100644
index 61fa7e5..0000000
--- a/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-# HG changeset patch
-# User Kirill Simonov <xi@resolvent.net>
-# Date 1417197312 21600
-# Node ID 2b9156756423e967cfd09a61d125d883fca6f4f2
-# Parent  053f53a381ff6adbbc93a31ab7fdee06a16c8a33
-Removed invalid simple key assertion (thank to Jonathan Gray).
-
-The patch comes from 
-
-https://bitbucket.org/xi/libyaml/commits/2b9156756423e967cfd09a61d125d883fca6f4f2
-
-Upstream-Status: Backport
-CVE: CVE-2014-9130
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-diff -r 053f53a381ff -r 2b9156756423 src/scanner.c
---- a/src/scanner.c	Wed Mar 26 13:55:54 2014 -0500
-+++ b/src/scanner.c	Fri Nov 28 11:55:12 2014 -0600
-@@ -1106,13 +1106,6 @@
-             && parser->indent == (ptrdiff_t)parser->mark.column);
- 
-     /*
--     * A simple key is required only when it is the first token in the current
--     * line.  Therefore it is always allowed.  But we add a check anyway.
--     */
--
--    assert(parser->simple_key_allowed || !required);    /* Impossible. */
--
--    /*
-      * If the current position may start a simple key, save it.
-      */
- 
diff --git a/meta/recipes-support/libyaml/libyaml_0.1.6.bb b/meta/recipes-support/libyaml/libyaml_0.1.7.bb
similarity index 72%
rename from meta/recipes-support/libyaml/libyaml_0.1.6.bb
rename to meta/recipes-support/libyaml/libyaml_0.1.7.bb
index b015577..5c422ef 100644
--- a/meta/recipes-support/libyaml/libyaml_0.1.6.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.1.7.bb
@@ -8,11 +8,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 
 SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
-           file://libyaml-CVE-2014-9130.patch \
           "
 
-SRC_URI[md5sum] = "5fe00cda18ca5daeb43762b80c38e06e"
-SRC_URI[sha256sum] = "7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749"
+SRC_URI[md5sum] = "1abf45bd3a96374fa55ca63b32f9f2f9"
+SRC_URI[sha256sum] = "8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-- 
2.9.3


