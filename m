Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 58B3C71C70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:02:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 11:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,465,1505804400"; d="scan'208";a="10214429"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.95.206])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2017 11:02:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 27 Nov 2017 11:01:54 -0800
Message-Id: <20171127190154.19351-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH v2] kernel.bbclass: Add cleandirs for do_shared_workdir
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
X-List-Received-Date: Mon, 27 Nov 2017 19:02:07 -0000

We add the kernel-build-artifacts to the cleandirs list to ensure
that there are no remaining artificats in the kernel-build-artifacts
directory which is STAGING_KERNEL_BUILDDIR. Without this change
multiple System.map files are visiable in the STAGING_KERNEL_BUILDDIR,
which could cause problems for some tools.

[YOCTO #11880]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a3c25..7ef4f47981c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
 
+do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
 do_shared_workdir () {
 	cd ${B}
 
-- 
2.13.6


