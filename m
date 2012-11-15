Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TZ4aZ-0005vq-9A
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 19:55:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAFIf1JI010166
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 10:41:01 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 15 Nov 2012 10:41:00 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 10:41:00 -0800
Message-ID: <1353004860-2369-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] unzip: pay some attention to our CFLAGS
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
X-List-Received-Date: Thu, 15 Nov 2012 18:55:00 -0000
Content-Type: text/plain

Makefile makes use of CFLAGS_NOOPT.  If we set that
when calling make we can enable options like -g.  The
Makefile will override any optimization to -O3.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index a1547fc..0f634c8 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://avoid-strip.patch"
@@ -13,7 +13,12 @@ SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 S = "${WORKDIR}/unzip60"
 
-EXTRA_OEMAKE += "STRIP=true LF2=''"
+# Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
+# Makefile and add CFLAGS.  Optimization will be overriden by unzip
+# configure to be -O3.
+#
+EXTRA_OEMAKE += "STRIP=true LF2='' \
+                'CF_NOOPT=-I. -Ibzip2 -DUNIX ${CFLAGS}'"
 
 export LD = "${CC}"
 LD_class-native = "${CC}"
-- 
1.7.3.4



