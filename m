Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE0373BD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:42:00 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:33:18 +0100
Message-Id: <1427124798-26263-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel-module-split.bbclass: Avoid bogus recommends for modules ending with -dev
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
X-List-Received-Date: Mon, 23 Mar 2015 15:42:01 -0000

Example: lirc-dev.ko -> kernel-module-lirc-dev

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel-module-split.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 32b8085..68a23f8 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -176,6 +176,9 @@ python split_kernel_module_packages () {
                 rdepends[dep] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 
+        # Avoid automatic -dev recommendations for modules ending with -dev.
+        d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
+
     module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
     module_pattern = 'kernel-module-%s'
-- 
1.9.1


