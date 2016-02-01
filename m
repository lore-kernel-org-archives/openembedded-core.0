Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 35B1477253
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:04:27 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 682178348; Mon, 01 Feb 2016 10:49:28 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQGjF-000C0X-W0; Mon, 01 Feb 2016 15:49:25 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQGjF-0002f9-Vb; Mon, 01 Feb 2016 15:49:25 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 15:49:19 +0000
Message-Id: <1454341759-10198-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [RESEND PATCH] kernel: Permit overriding of KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Mon, 01 Feb 2016 16:04:28 -0000

Commit a1690131691507bbf5853540229b3ad775b836bf removed the ability of
recipes to set KERNEL_IMAGETYPE_FOR_MAKE. This can be fixed by only
setting KERNEL_IMAGETYPE_FOR_MAKE if it doesn't already have a
value. This should hopefully be a good enough approximation to the
behaviour prior to that commit to keep such recipes working.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f37affc..73ae7ca 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -21,7 +21,8 @@ python __anonymous () {
 
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
 
-    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
+    if not d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", False):
+        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
-- 
2.1.4


