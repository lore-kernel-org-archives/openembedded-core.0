Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3B700760AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:05:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2017 09:05:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="1097834243"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2017 09:05:19 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 09:01:25 +0000
Message-Id: <feb5fda47557e35441548e9245406d190704f9f2.1485162050.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485162050.git.mariano.lopez@linux.intel.com>
References: <cover.1485162050.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] testimage.bbclass: Add systemd test automatically
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
X-List-Received-Date: Mon, 23 Jan 2017 17:05:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds systemd test automatically when an image
is build with systemd DISTRO_FEATURE

[YOCTO #10935]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 96e41c6..73a5c1a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -36,8 +36,9 @@ TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
 TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 
 RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
+SYSTEMDSUITE = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 MINTESTSUITE = "ping"
-NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog"
+NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog ${SYSTEMDSUITE}"
 DEVTESTSUITE = "gcc kernelmodule ldd"
 
 DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
-- 
2.6.6


