Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AFC05780AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 15:53:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2017 08:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,364,1491289200"; d="scan'208";a="1132600171"
Received: from jlock-mobl1.jf.intel.com ([10.24.8.67])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2017 08:53:19 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 16:53:06 +0100
Message-Id: <20170519155306.28317-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] kernel: predefine KBUILD_BUILD_USER and KBUILD_BUILD_HOST
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
X-List-Received-Date: Fri, 19 May 2017 15:53:18 -0000

By exporting KBUILD_BUILD_USER with a pre-defined value we improve the
reproducibility of the kernel and remove the requirement for whoami in the
HOSTTOOLS.
KBUILD_BUILD_HOST also helps improve the reproducibility of the kernel.

For more kernel reproducibility options see:
https://lwn.net/Articles/437864/

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8954b28..7a134d5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -130,6 +130,8 @@ PACKAGES_DYNAMIC += "^kernel-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
+export KBUILD_BUILD_USER = "oe-user"
+export KBUILD_BUILD_HOST = "oe-host"
 
 KERNEL_PRIORITY ?= "${@int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
                        int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[1]) * 100 + \
-- 
2.9.3


