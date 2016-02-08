Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1162F6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 21:29:16 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 686040974; Mon, 08 Feb 2016 16:29:18 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aStMw-0003ZB-5X; Mon, 08 Feb 2016 21:29:14 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aStMw-0004E6-4Q; Mon, 08 Feb 2016 21:29:14 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 21:29:10 +0000
Message-Id: <1454966950-16208-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] hdparm: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Mon, 08 Feb 2016 21:29:17 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
this explicit so that the default in bitbake.conf can be changed.

Unlike the other recipes that I've fixed recently, this one manifests
itself in a more subtle way by failing a QA check.

Reported-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-extended/hdparm/hdparm_9.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
index 8267fd9..ec3d26f 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz "
 SRC_URI[md5sum] = "213efdbe7471fad3408198918e164354"
 SRC_URI[sha256sum] = "ce97b4a71cb04146f54cf6f69787e7f97ddfda9836dc803b459d3b3df3a4fbee"
 
-EXTRA_OEMAKE += 'STRIP="echo"'
+EXTRA_OEMAKE = '-e MAKEFLAGS= STRIP="echo"'
 
 inherit update-alternatives
 
-- 
2.1.4


