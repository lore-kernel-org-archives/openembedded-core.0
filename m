Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DD38A731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 04:44:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2016 21:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,599,1455004800"; d="scan'208";a="99608797"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2016 21:44:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:43:28 +1200
Message-Id: <325e4f058e886c69ab0da5ca7f226bf3ffb5784c.1462768634.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH 2/6] eudev: check for required kernel config options
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
X-List-Received-Date: Mon, 09 May 2016 04:44:45 -0000

Use the list in the udev 220 README (since that is apparently what this
is equivalent to; unfortunately eudev doesn't provide the same document)
to set required Linux kernel config options, with the exception of
CONFIG_HOTPLUG which is always on for 3.11 and later kernels.

Fixes [YOCTO #5574].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index e42630f..41d72f6 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -23,7 +23,27 @@ UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 SRC_URI[md5sum] = "e130f892d8744e292cb855db79935f68"
 SRC_URI[sha256sum] = "ce9d5fa91e3a42c7eb95512ca0fa2a631e89833053066bb6cdf42046b2a88553"
 
-inherit autotools update-rc.d qemu
+inherit autotools update-rc.d qemu kernel-check
+
+# All the required options from the udev README
+# (except for CONFIG_HOTPLUG which is always on in
+# 3.11 and later kernels.)
+REQUIRED_KERNEL_OPTIONS = "\
+                           CONFIG_DEVTMPFS \
+                           CONFIG_CGROUPS \
+                           CONFIG_INOTIFY_USER \
+                           CONFIG_SIGNALFD \
+                           CONFIG_TIMERFD \
+                           CONFIG_EPOLL \
+                           CONFIG_NET \
+                           CONFIG_SYSFS \
+                           CONFIG_SYSFS_DEPRECATED=n \
+                           CONFIG_SYSFS_DEPRECATED_V2=n \
+                           CONFIG_PROC_FS \
+                           CONFIG_FHANDLE \
+                           CONFIG_UEVENT_HELPER_PATH='' \
+                           CONFIG_FW_LOADER_USER_HELPER=n \
+                           "
 
 EXTRA_OECONF = " \
     --sbindir=${base_sbindir} \
-- 
2.5.5


