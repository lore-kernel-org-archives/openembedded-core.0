Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1UFVyJ-0000YH-GL
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:38:57 +0100
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJK002RYDX0UTB0@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 15:22:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E274A2008D; Tue,
	12 Mar 2013 16:22:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 16:22:05 -0400
Message-id: <1363119725-5341-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH][for-danny] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Tue, 12 Mar 2013 20:38:58 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/soc-family.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/soc-family.inc b/meta/conf/machine/include/soc-family.inc
index 612039c..0251da0 100644
--- a/meta/conf/machine/include/soc-family.inc
+++ b/meta/conf/machine/include/soc-family.inc
@@ -1,2 +1,2 @@
 # Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
-MACHINEOVERRIDES .= "${@['', ':${SOC_FAMILY}']['${SOC_FAMILY}' != '']}"
+MACHINEOVERRIDES =. "${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' != '']}"
-- 
1.8.1.5



