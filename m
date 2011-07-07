Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QepLj-0006n6-Br
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:14:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2011 07:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="24486637"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 07:10:41 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  7 Jul 2011 22:10:05 +0800
Message-Id: <5d98e0ea5f84335cd2b5030565e07a01d4fc4e45.1310047266.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
In-Reply-To: <cover.1310047266.git.ke.yu@intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
Subject: [PATCH 1/8] native.bbclass: generate libdir from libdir_native
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
X-List-Received-Date: Thu, 07 Jul 2011 14:14:39 -0000

currently, the libdir in native.bbclass is inherited from target libdir
defined in bitbake.conf. This is not correct in concept, instead, it
should be inherited from libdir_native. Current code works because both
the target libdir and libdir_native are the same value "/usr/lib".
But if libdir changes (e.g. to /usr/lib64), then build will break.

This patch make libdir generated from libdir_native to fix this issue.

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/native.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 90fcd13..d34d1e5 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -67,6 +67,8 @@ base_prefix = "${STAGING_DIR_NATIVE}"
 prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
+libdir = "${STAGING_DIR_NATIVE}${libdir_native}"
+
 NATIVE_PACKAGE_PATH_SUFFIX = ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
-- 
1.7.0.4



