Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TZ3l9-0003hm-5x
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 19:01:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAFHloaO009182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 09:47:53 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 15 Nov 2012 09:47:49 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 09:47:49 -0800
Message-ID: <1353001669-31806-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] iproute2: pass CFLAGS to Makefile\
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
X-List-Received-Date: Thu, 15 Nov 2012 18:01:51 -0000
Content-Type: text/plain

Makefile computes CFLAGS, but we can see that our
defaults get included by using CCOPTS to pass them
to make.

Upstream-Status: Pending

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../iproute2/iproute2_3.5.1.bb                     |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
index c1e9bd3..3d402cf 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
@@ -1,9 +1,13 @@
 require iproute2.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch"
 
 SRC_URI[md5sum] = "d4425b44edd5eacd6099e672e4baacbf"
 SRC_URI[sha256sum] = "36f2674e5436289f3ccfb0a58707aca9dcfa295d06afc36d2117674508f5ef72"
+
+# CFLAGS are computed in Makefile and reference CCOPTS
+#
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
1.7.3.4



