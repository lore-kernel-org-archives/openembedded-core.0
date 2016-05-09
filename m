Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8B6273163
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 04:44:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2016 21:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,599,1455004800"; d="scan'208";a="99608831"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2016 21:44:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:43:31 +1200
Message-Id: <35665d96131a41adc73cd9149f0d21d23e796714.1462768634.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH 5/6] classes/kernel: check OLDEST_KERNEL at configure time
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
X-List-Received-Date: Mon, 09 May 2016 04:44:53 -0000

If the kernel being built is older than OLDEST_KERNEL and we're building
with glibc, then the C library we're building is probably not going to
be compatible with the kernel and we should warn the user. (This is
easier to do here rather than when building glibc, because we don't
necessarily have the information we need to determine the kernel version
there, whereas we do here.)

Fixes [YOCTO #8653].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fa0864c..af88cc0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -330,6 +330,20 @@ sysroot_stage_all () {
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
 
+python check_oldest_kernel() {
+    oldest_kernel = d.getVar('OLDEST_KERNEL', True)
+    kernel_version = d.getVar('KERNEL_VERSION', True)
+    tclibc = d.getVar('TCLIBC', True)
+    if tclibc == 'glibc':
+        kernel_version = kernel_version.split('-', 1)[0]
+        if oldest_kernel and kernel_version:
+            if bb.utils.vercmp_string(kernel_version, oldest_kernel) < 0:
+                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of the kernel you are building is "%s" - therefore %s as built may not be compatible with this kernel. Either set OLDEST_KERNEL to an older version, or build a newer kernel.' % (d.getVar('PN', True), oldest_kernel, kernel_version, tclibc))
+}
+
+check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
+do_configure[prefuncs] += "check_oldest_kernel"
+
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
-- 
2.5.5


