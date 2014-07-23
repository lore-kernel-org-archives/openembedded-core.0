Return-Path: <roxana.ciobanu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0031470821
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 07:45:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jul 2014 00:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,715,1400050800"; d="scan'208";a="574072110"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.53])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2014 00:45:42 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 10:46:02 +0300
Message-Id: <b606fe8ebe43736c866be7d7bcdec3e5f158ed05.1406101517.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406101517.git.roxana.ciobanu@intel.com>
References: <cover.1406101517.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1406101517.git.roxana.ciobanu@intel.com>
References: <cover.1406101517.git.roxana.ciobanu@intel.com>
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
X-List-Received-Date: Wed, 23 Jul 2014 07:45:44 -0000

Currently, BB_NUMBER_THREADS and PARALLEL_MAKE default to unset and
are set in local.conf. Now that we have the automatic probing,
the default values can be set in bitbake.conf and an example of
explicitly defining how many tasks to run can be moved to
local.conf.sample.extended.

[YOCTO #6217]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta-yocto/conf/local.conf.sample          | 22 ----------------------
 meta-yocto/conf/local.conf.sample.extended | 23 +++++++++++++++++++++++
 meta/conf/bitbake.conf                     |  6 ++++++
 3 files changed, 29 insertions(+), 22 deletions(-)

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
index b156319..89b80a6 100644
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
index f4870d5..1354615 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -698,6 +698,12 @@ IMAGE_ROOTFS_SIZE ?= "65536"
 # MACHINE don't change the path to the cache
 CACHE := "${CACHE}"
 
+# Default to setting automatically based on cpu count
+BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
+
+# Default to setting automatically based on cpu count
+PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
-- 
1.9.1


