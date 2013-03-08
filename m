Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UE1lJ-00086t-H1
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 19:11:22 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r28HpA0k010788
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Mar 2013 11:51:11 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r28Hp9R1028827
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Mar 2013 23:21:10 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 8 Mar 2013 23:21:09 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r28Hp6k4025055;
	Fri, 8 Mar 2013 23:21:08 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Mar 2013 11:51:04 -0600
Message-ID: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] soc-family: fix SOC_FAMILY override order
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 18:11:40 -0000
Content-Type: text/plain

* the current order has SOC_FAMILY settings, which are generic
  settings for a group of devices, overriding the machine specific
  settings.  For example:

  KERNEL_DEVICETREE_ti33x = "xxxx"
  KERNEL_DEVICETREE_beaglebone = "yyyy"

  Should yield "yyyy" when building for the beaglebone because
  that is a more specific device than ti33x.  However, without this
  change the result is that the value is set to "xxxx" meaning the
  more generic setting overrides the more specific setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/conf/machine/include/soc-family.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/soc-family.inc b/meta/conf/machine/include/soc-family.inc
index 612039c..0251da0 100644
--- a/meta/conf/machine/include/soc-family.inc
+++ b/meta/conf/machine/include/soc-family.inc
@@ -1,2 +1,2 @@
 # Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
-MACHINEOVERRIDES .= "${@['', ':${SOC_FAMILY}']['${SOC_FAMILY}' != '']}"
+MACHINEOVERRIDES =. "${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' != '']}"
-- 
1.7.0.4



