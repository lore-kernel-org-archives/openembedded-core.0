Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5N-0004Vi-L4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736800"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:36 -0700
Message-Id: <9ac6da9d0e0b9f7678752ff7b9c91e39c140b4e7.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/18] tune-ppc476.inc: Support ppc476
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:18 -0000

From: Peter Seebach <peter.seebach@windriver.com>

A couple of boards use chips which perform noticably better
when optimized for the 476. Add a trivial tune file to let
them run better.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/tune-ppc476.inc |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppc476.inc

diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/tune-ppc476.inc
new file mode 100644
index 0000000..5d10261
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppc476.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppc476"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppc476] = "Enable ppc476 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-mcpu=476", "", d)}"
+
+AVAILTUNES += "ppc476"
+TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476"
+TUNE_PKGARCH_tune-ppc476 = "ppc476"
+PACKAGE_EXTRA_ARCHS_tune-ppc476 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc476"
+
+# glibc configure options to get 476 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-with-cpu=476", "", d)}"
-- 
1.7.7.6



