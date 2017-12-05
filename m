Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7067C78681
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 23:00:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 15:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,365,1508828400"; d="scan'208";a="10872719"
Received: from swold-mobl2.jf.intel.com ([10.24.10.97])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2017 15:00:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  5 Dec 2017 15:00:06 -0800
Message-Id: <20171205230006.22740-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel-devsrc: Use full mrproper to clean
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
X-List-Received-Date: Tue, 05 Dec 2017 23:00:06 -0000

By using the full mrproper clean target it also removes some generated files
that are not required on the target to build. It also helps to fix reprodudible
builds as the generated files could have different permissions causing the
check to fail.

Tested with building and booting kernel from source on the target

[YOCTO #12137]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index c1b5b7786d7..d925a33aeb1 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -52,7 +52,7 @@ do_install() {
         # The main build artifacts. We clean the directory to avoid QA errors on mismatched
         # architecture (since scripts and helpers are native format).
         KBUILD_OUTPUT="$kerneldir"
-        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
+        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean mrproper
         # make clean generates an absolute path symlink called "source"
         # in $kerneldir points to $kerneldir, which doesn't make any
         # sense, so remove it.
-- 
2.13.6


