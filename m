Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Jul 2014 11:45:09 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 562977052B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 11:45:09 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.9)
	with ESMTPS id 419893883; Thu, 24 Jul 2014 07:30:07 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1XAHDk-0004Xh-1F; Thu, 24 Jul 2014 12:30:00 +0100
Received: from mac by chuckie with local (Exim 4.82_1-5b7a7c0-XX)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1XAHDk-0000RM-0R; Thu, 24 Jul 2014 12:30:00 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 12:24:53 +0100
Message-Id: <1406201093-1546-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.0.1
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] allarch: Generate same package for MIPS and non-MIPS targets
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
X-List-Received-Date: Thu, 24 Jul 2014 11:45:10 -0000

LINKER_HASH_STYLE differs between MIPS and non-MIPS targets. This means
that LDFLAGS differs too. LDFLAGS is exported so it influences all task
hashes. Unfortunately this means that packages with architecture "all"
differ depending on whether they are built for a MIPS or non-MIPS target.
This causes a lot of unnecessary churn in the ipk/all directory when
switching build targets.

The simplest way to fix this is to ensure that LDFLAGS stays the same for
architecture "all" packages by clearing it. It shouldn't being used by such
packages anyway.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/allarch.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index d41dd4b..c953e7c 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -28,6 +28,11 @@ python () {
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
 
+        # Avoid this being unnecessarily different due to nuances of
+        # the target machine that aren't important for "all" arch
+        # packages.
+        d.setVar("LDFLAGS", "")
+
         # No need to do shared library processing or debug symbol handling
         d.setVar("EXCLUDE_FROM_SHLIBS", "1")
         d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
-- 
2.0.1


