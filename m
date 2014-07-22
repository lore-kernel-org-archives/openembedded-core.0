Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 814A5705E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:58:21 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2014 06:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="459959283"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2014 06:58:21 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 16:58:41 +0300
Message-Id: <eb52483d72008b797160d1423aa289b1e111dac8.1406037471.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406037471.git.roxana.ciobanu@intel.com>
References: <cover.1406037471.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1406037471.git.roxana.ciobanu@intel.com>
References: <cover.1406037471.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] bitbake.conf: move BB_NUMBER_THREADS and PARALLEL_MAKE to bitbake.conf
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
X-List-Received-Date: Tue, 22 Jul 2014 13:58:21 -0000

Currently, BB_NUMBER_THREADS and PARALLEL_MAKE default to unset and
are set in local.conf. Now that we have the automatic probing, the
default values can be set in bitbake.conf and an example of explicitly
defining how many tasks to run can be moved to
local.conf.sample.extended.

[YOCTO #6217]
Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta-yocto/conf/local.conf.sample          | 22 ----------------------
 meta-yocto/conf/local.conf.sample.extended | 23 +++++++++++++++++++++++
 meta/conf/bitbake.conf                     |  4 ++++
 3 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index bcb0864..da4a01e 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -12,28 +12,6 @@
 # variable as required.
 
 #
-# Parallelism Options
-#
-# These two options control how much parallelism BitBake should use. The first 
-# option determines how many tasks bitbake should run in parallel:
-#
-#BB_NUMBER_THREADS ?= "4"
-#
-# Default to setting automatically based on cpu count
-BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
-# 
-# The second option controls how many processes make should run in parallel when
-# running compile tasks:
-#
-#PARALLEL_MAKE ?= "-j 4"
-#
-# Default to setting automatically based on cpu count
-PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
-#
-# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
-# be appropriate for example.
-
-#
 # Machine Selection
 #
 # You need to select a specific machine to target the build with. There are a selection
diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index b156319..e247a9c 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -2,6 +2,29 @@
 # certain recipes.
 #BBMASK = ""
 
+#
+# Parallelism Options
+#
+# These two options control how much parallelism BitBake should use. The first 
+# option determines how many tasks bitbake should run in parallel:
+#
+#BB_NUMBER_THREADS ?= "4"
+#
+# Default to setting automatically based on cpu count
+#BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
+# 
+# The second option controls how many processes make should run in parallel when
+# running compile tasks:
+#
+#PARALLEL_MAKE ?= "-j 4"
+#
+# Default to setting automatically based on cpu count
+#PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
+#
+# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
+# be appropriate for example.
+
+
 # eglibc configurability is used to reduce minimal image's size.
 # the all supported eglibc options are listed in DISTRO_FEATURES_LIBC
 # and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f4870d5..6e7260d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -527,6 +527,10 @@ export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
 ALLOWED_FLAGS = "-O -mcpu -march -pipe"
 
+# Default to setting automatically based on cpu count
+BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
+# Default to setting automatically based on cpu count
+PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
 PARALLEL_MAKEINST ??= "${PARALLEL_MAKE}"
-- 
1.9.1


