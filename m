Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 418676F5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 04:26:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 20:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,605,1389772800"; d="scan'208";a="495612684"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 20:26:28 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 22:26:19 -0600
Message-Id: <ea745b1400818f32c456aed53d3eece25e0e69fd.1394165774.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394165774.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394165774.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394165774.git.tom.zanussi@linux.intel.com>
References: <cover.1394165774.git.tom.zanussi@linux.intel.com>
Subject: [PATCH 4/7] lttng-modules: Exclude arm
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
X-List-Received-Date: Fri, 07 Mar 2014 04:26:27 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

lttng-modules and gcc-4.8 don't mix, according to the lttng ML
'current_thread_info() not respecting program order with gcc 4.8.x',
so remove it from arm builds.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb                   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 4a97c24..80f3031 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -58,6 +58,7 @@ LTTNGTOOLS_aarch64 = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_aarch64 = ""
+LTTNGMODULES_arm = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE_aarch64 = ""
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
index 0b7d5e8..797ed4e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
@@ -13,6 +13,9 @@ inherit module
 SRCREV = "fb2c37799306d16fb590aebee6fad8be431264b7"
 PV = "2.4.0"
 
+# lttng currently blacklists arm with gcc-4.8
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
-- 
1.8.3.1


