Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SD2oa-0007Md-7X
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 02:02:08 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1M00AT6D06KV70@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 18:52:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4CEDB2004C; Wed,
	28 Mar 2012 19:52:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 19:52:50 -0400
Message-id: <1332978770-6323-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCHv2] bc: use update-alternatives to make dc play nice with busybox
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 00:02:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

busybox' default configuration enables dc app, which bc also provides,
setup update-alternatives to resolve the conflict.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/bc/bc_1.06.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
index 02915e1..283e2d8 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.06.bb
@@ -11,11 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "base"
 DEPENDS = "flex"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
 SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
 
-inherit autotools
+inherit autotools update-alternatives
+
+ALTERNATIVE_LINKS = "${bindir}/dc"
+ALTERNATIVE_PRIORITY = "100"
-- 
1.7.8.5



