Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 65CD465FCA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 08:34:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2014 01:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,995,1389772800"; d="scan'208";a="535335964"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2014 01:24:42 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 11:26:15 +0300
Message-Id: <e0b5fbdc213eaf7f567e96bf2a870c1212518447.1399364699.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399364698.git.cristiana.voicu@intel.com>
References: <cover.1399364698.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1399364698.git.cristiana.voicu@intel.com>
References: <cover.1399364698.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/2] babeltrace: upgrade to 1.2.1
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
X-List-Received-Date: Tue, 06 May 2014 08:34:39 -0000

The release for 1.2.1 is on branch stable-1.2.
Backported a patch to fix out of tree build.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 ...-Support-out-of-tree-builds-in-babeltrace.patch |   17 +++++++++++++++++
 .../{babeltrace_1.1.1.bb => babeltrace_1.2.1.bb}   |    7 ++++---
 2 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.1.1.bb => babeltrace_1.2.1.bb} (72%)

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
new file mode 100644
index 0000000..258eedd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
@@ -0,0 +1,17 @@
+Upstream-Status: backport
+
+babeltrace: Fix support out of tree builds in babeltrace
+
+Signed-off-by: Lars Persson <larper@axis.com>
+
+diff --git a/formats/lttng-live/Makefile.am b/formats/lttng-live/Makefile.am
+index c834699..2c6b0bd 100644
+--- a/formats/lttng-live/Makefile.am
++++ b/formats/lttng-live/Makefile.am
+@@ -1,4 +1,4 @@
+-AM_CFLAGS = $(PACKAGE_CFLAGS) -I$(top_srcdir)/include -I$(top_builddir)/include
++AM_CFLAGS = $(PACKAGE_CFLAGS) -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_srcdir)
+ 
+ lib_LTLIBRARIES = libbabeltrace-lttng-live.la
+ 
+
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
similarity index 72%
rename from meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
index a6b8a97..5c105d8 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
@@ -10,10 +10,11 @@ inherit autotools
 
 DEPENDS = "glib-2.0 util-linux popt"
 
-SRCREV = "a386e24609752742b100120db6798d311fab512a"
-PV = "1.1.1+git${SRCPV}"
+SRCREV = "66c2a20b4391fb5c7f870aeb0dde854f0ae1fc79"
+PV = "1.2.1+git${SRCPV}"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git"
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2 \
+           file://0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


