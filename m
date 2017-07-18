Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 01D2D77F38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:52:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2017 03:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,377,1496127600"; d="scan'208";a="112591749"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2017 03:52:35 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E69B158038F;
	Tue, 18 Jul 2017 03:52:34 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 13:52:29 +0300
Message-Id: <1500375149-7407-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] systemd-bootchart: Fix build with glibc 2.26
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
X-List-Received-Date: Tue, 18 Jul 2017 10:52:41 -0000

xlocale.h is no more, don't include it.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-parse-util-Don-t-use-xlocale.h.patch      | 32 ++++++++++++++++++++++
 .../systemd-bootchart/systemd-bootchart_231.bb     |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch

diff --git a/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch b/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
new file mode 100644
index 0000000..5aa0463
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
@@ -0,0 +1,32 @@
+From d379126d56d0b6e935b2d97ca71579e6cc54d1bb Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 18 Jul 2017 13:37:27 +0300
+Subject: [PATCH] parse-util: Don't use xlocale.h
+
+glibc 2.26 no longer contains the non-standard xlocale.h
+(http://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27)
+
+This change shouldn't break anything as xlocale.h was a subset of
+locale.h.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/35]
+---
+ src/parse-util.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/parse-util.c b/src/parse-util.c
+index 5635a68..1b2169c 100644
+--- a/src/parse-util.c
++++ b/src/parse-util.c
+@@ -21,7 +21,6 @@
+ #include <locale.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <xlocale.h>
+ 
+ #include "macro.h"
+ #include "parse-util.h"
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
index 1d88036..4da000e 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
@@ -2,7 +2,9 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https"
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
+           file://0001-parse-util-Don-t-use-xlocale.h.patch \
+"
 
 # Modify these as desired
 PV = "231+git${SRCPV}"
-- 
2.1.4


