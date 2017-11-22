Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B78CC783FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 18:47:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 10:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; 
   d="scan'208";a="5881394"
Received: from swold-mobl2.jf.intel.com ([10.24.8.72])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2017 10:47:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, bruce.ashfield@windriver.com
Date: Wed, 22 Nov 2017 10:47:24 -0800
Message-Id: <20171122184724.21416-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] kernel.bbclass: Add cleandirs for do_shared_workdir
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
X-List-Received-Date: Wed, 22 Nov 2017 18:47:24 -0000

Ensure we have a clean and empty STAGING_KERNEL_BUILDDIR (kernel-build-artifacts)
before creating it, otherwise there might be older artifacts from a prior
kernel build.

[YOCTO #11880]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a3c25..2a0a7707a14 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
 
+do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
 do_shared_workdir () {
 	cd ${B}
 
@@ -655,8 +656,6 @@ kernel_do_deploy() {
 		fi
 	done
 }
-do_deploy[cleandirs] = "${DEPLOYDIR}"
-do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
-- 
2.13.5


