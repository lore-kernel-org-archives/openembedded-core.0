Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PscGH-0002wv-8r
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Feb 2011 15:33:45 +0100
Received: by wwe15 with SMTP id 15so659498wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Feb 2011 06:32:24 -0800 (PST)
Received: by 10.216.30.80 with SMTP id j58mr5633613wea.64.1298557944579;
	Thu, 24 Feb 2011 06:32:24 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m50sm3780172wek.32.2011.02.24.06.32.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Feb 2011 06:32:23 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Feb 2011 15:32:20 +0100
Message-Id: <1298557940-2290-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 14:33:45 -0000

* Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
  setting for a recipe.
* This will allow recipes to work for entire families of
  devices without having to maintain/update the compatible
  devices as new devices are added into a family

Based on 07076390358f211bd96779bec2d6eb5eaa0ad699 by Chase Maupin <chase.maupin@ti.com>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a674f52..aaf99da 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -342,7 +342,9 @@ python () {
             import re
             this_machine = bb.data.getVar('MACHINE', d, 1)
             if this_machine and not re.match(need_machine, this_machine):
-                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
+                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
+                if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
+                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
 
         dont_want_license = bb.data.getVar('INCOMPATIBLE_LICENSE', d, 1)
-- 
1.6.6.1



