Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA136F003
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:22:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 06:22:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,860,1384329600"; d="scan'208";a="484721930"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 06:22:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 14:22:29 +0000
Message-Id: <847cee60c8a619044eb8cab9e28fed8275282c8e.1392646768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/populate_sdk_base: fix race condition with do_rootfs
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
X-List-Received-Date: Mon, 17 Feb 2014 14:22:45 -0000

do_rootfs has ${S} in cleandirs, and during do_populate_sdk we call
exec_func() several times, which by default uses ${B} as the working
directory. If do_populate_sysroot and do_rootfs race against eachother,
the directory may not exist at the exact instant that the setup code
for do_populate_sdk tries to cd into it. We don't actually use ${B}
for do_populate_sysroot so we can set it to something else just for that
task to avoid the race.

NOTE: because this task name contains an underscore, the override will
not work; the BitBake patch that changes these to hyphens for the
task override is required for this patch to work (but won't break things
without it.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ee2a7c1..e2e013a 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -26,6 +26,8 @@ SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
+B_task-populate-sdk = "${SDK_DIR}"
+
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
-- 
1.8.5.3


