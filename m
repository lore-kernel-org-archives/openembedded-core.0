Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id EF7EC6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:39:08 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:39:06 +0100
Message-Id: <1427125146-4871-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel-module-split.bbclass: fix autoloading from postinst script
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
X-List-Received-Date: Mon, 23 Mar 2015 15:39:09 -0000

When using KERNEL_MODULE_AUTOLOAD, autoload was empty, causing
"modprobe None" to get appended to the postinst script.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 68a23f8..e1a70e6 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -148,7 +148,7 @@ python split_kernel_module_packages () {
             postinst = d.getVar('pkg_postinst_%s' % pkg, True)
             if not postinst:
                 bb.fatal("pkg_postinst_%s not defined" % pkg)
-            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
+            postinst += d.getVar('autoload_postinst_fragment', True) % (autoload or basename)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
         # Write out any modconf fragment
-- 
1.9.1


