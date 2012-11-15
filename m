Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TZ3Tl-0000mV-PE
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 18:43:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAFHTt4C004592
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 09:29:55 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 15 Nov 2012 09:29:54 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 09:29:54 -0800
Message-ID: <1353000594-30786-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] procps: pass CFLAGS to make
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
X-List-Received-Date: Thu, 15 Nov 2012 17:43:54 -0000
Content-Type: text/plain

EXTRA_OEMAKE in the recipe currently discards the
environment CFLAGS when setting CFLAGS passed to make.
We change that to include these options.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/procps/procps_3.2.8.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 7b011a0..3f20bea 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
@@ -13,12 +13,12 @@ SRC_URI += "file://procmodule.patch \
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
 SRC_URI[sha256sum] = "11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535"
 
-EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}" \
                 CPPFLAGS=-I${STAGING_INCDIR} \
                 LDFLAGS="${LDFLAGS}" \
                 CURSES=-lncurses \
-                install='install -D' \
-                ldconfig=echo"
+                install="install -D" \
+                ldconfig=echo'
 
 do_install_append () {
 	install -d ${D}${sysconfdir}
-- 
1.7.3.4



