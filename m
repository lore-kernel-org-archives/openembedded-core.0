Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADD3731F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 04:44:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2016 21:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,599,1455004800"; d="scan'208";a="99608808"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2016 21:44:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:43:29 +1200
Message-Id: <992d6a28565d33b924df7e500eaff1de952ef926.1462768634.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH 3/6] systemd: check for required kernel config options
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
X-List-Received-Date: Mon, 09 May 2016 04:44:48 -0000

Use the list in the systemd 225 README to set required Linux kernel
config options.

Fixes [YOCTO #5574].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..d64b3cd 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -22,7 +22,7 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion
+inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion kernel-check
 
 SRCREV = "714c62b46379abb7558c544665522aca91691e10"
 
@@ -192,6 +192,23 @@ CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', ''
 # disable problematic GCC 5.2 optimizations [YOCTO #8291]
 FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
 
+# All the required options from the systemd README
+REQUIRED_KERNEL_OPTIONS = "\
+                           CONFIG_DEVTMPFS \
+                           CONFIG_CGROUPS \
+                           CONFIG_INOTIFY_USER \
+                           CONFIG_SIGNALFD \
+                           CONFIG_TIMERFD \
+                           CONFIG_EPOLL \
+                           CONFIG_NET \
+                           CONFIG_SYSFS \
+                           CONFIG_PROC_FS \
+                           CONFIG_FHANDLE \
+                           CONFIG_SYSFS_DEPRECATED=n \
+                           CONFIG_UEVENT_HELPER_PATH='' \
+                           CONFIG_FW_LOADER_USER_HELPER=n \
+                           "
+
 do_configure_prepend() {
 	export NM="${HOST_PREFIX}gcc-nm"
 	export AR="${HOST_PREFIX}gcc-ar"
-- 
2.5.5


