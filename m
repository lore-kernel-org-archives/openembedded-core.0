Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma7-0004e0-35
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809745"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:13 -0700
Message-Id: <30ce08ea498fbc4af5215bb5278a81eb8064ed0d.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/25] Move meta-rt recipes to oe-core (meta)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 07:55:06 -0000

From: Darren Hart <dvhart@linux.intel.com>

Keeping the rt recipes in their own layer has led to maintenance issues,
particularly with the linux-yocto-rt recipes. As these kernel types are part of
the same linux-yocto source repository, it seems reasonable to include the rt
kernel recipes alongside the standard recipes. A new recipes-rt directory for
the other recipes provides adequate separation and eliminates the need for a
separate layer.

As there is no meta-rt/conf/layer.conf to force the kernel, users must now
specify the rt kernel in their local.conf or in the machine.conf:

PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"

The merging of the rt recipes into the core also eliminates complications with
multiple layer dependencies for new BSP layers. Having to either separate RT
BSPs from standard BSPs or force users to add meta-rt to bblayers even when not
building an RT BSP (because the RT BSPs in the same layer would fail to parse
without it) was sub-optimal at best.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta-rt/conf/layer.conf                            |   18 ------------------
 .../recipes-kernel/linux/linux-yocto-rt_2.6.34.bb  |    0
 .../recipes-kernel/linux/linux-yocto-rt_3.0.bb     |    0
 .../recipes-rt}/images/core-image-rt-sdk.bb        |    0
 .../recipes-rt}/images/core-image-rt.bb            |    0
 .../recipes-rt}/rt-tests/rt-tests_0.73.bb          |    0
 6 files changed, 0 insertions(+), 18 deletions(-)
 delete mode 100644 meta-rt/conf/layer.conf
 rename {meta-rt => meta}/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb (100%)
 rename {meta-rt => meta}/recipes-kernel/linux/linux-yocto-rt_3.0.bb (100%)
 rename {meta-rt => meta/recipes-rt}/images/core-image-rt-sdk.bb (100%)
 rename {meta-rt => meta/recipes-rt}/images/core-image-rt.bb (100%)
 rename {meta-rt/recipes-tests => meta/recipes-rt}/rt-tests/rt-tests_0.73.bb (100%)

diff --git a/meta-rt/conf/layer.conf b/meta-rt/conf/layer.conf
deleted file mode 100644
index 59f42b6..0000000
--- a/meta-rt/conf/layer.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-# Default to first disk/first partition
-RSP_ROOT ?= "sda1"
-
-# We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
-
-# We have an images and various recipe-* directories, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/images/*.bb ${LAYERDIR}/images/*.bbappend \
-            ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "rt"
-BBFILE_PATTERN_rt := "^${LAYERDIR}/"
-BBFILE_PRIORITY_rt = "8"
-
-# This layer builds images using a PREEMPT_RT kernel. Override any machine
-# specified kernel providers and leave it up to the kernel recipe to 
-# determine COMPATIBLE_MACHINE.
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb b/meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
similarity index 100%
rename from meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
rename to meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
similarity index 100%
rename from meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
rename to meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
diff --git a/meta-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
similarity index 100%
rename from meta-rt/images/core-image-rt-sdk.bb
rename to meta/recipes-rt/images/core-image-rt-sdk.bb
diff --git a/meta-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
similarity index 100%
rename from meta-rt/images/core-image-rt.bb
rename to meta/recipes-rt/images/core-image-rt.bb
diff --git a/meta-rt/recipes-tests/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
similarity index 100%
rename from meta-rt/recipes-tests/rt-tests/rt-tests_0.73.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.73.bb
-- 
1.7.3.4



