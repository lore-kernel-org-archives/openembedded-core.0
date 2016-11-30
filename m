Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id F402371B13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:36:55 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id A86D4B8A4A6; Thu,  1 Dec 2016 00:36:51 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:36:48 +0100
Message-Id: <1480549011-12168-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
References: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/5] kernel.bbclass: Use real filenames in kernel packages
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
X-List-Received-Date: Wed, 30 Nov 2016 23:36:56 -0000

When iterating over kernel image types to set up their packaging
variables, don't use make targets but the real names.

It was surprising if both vmlinux.bin and vmlinux.gz were enabled
and only the latter had its filename extension removed from the
package name.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4aeeacb..0e7ebd4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -43,7 +43,7 @@ python __anonymous () {
     typeformake = re.sub(r'\.gz', '', types)
     d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 
-    for type in typeformake.split():
+    for type in types.split():
         typelower = type.lower()
 
         d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
-- 
2.7.4


