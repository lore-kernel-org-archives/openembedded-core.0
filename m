Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TZ4Hc-0005As-2G
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 19:35:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAFILP4J015728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 10:21:25 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 15 Nov 2012 10:21:24 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 10:21:25 -0800
Message-ID: <1353003685-1168-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] zip: pay some attention to our CFLAGS
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
X-List-Received-Date: Thu, 15 Nov 2012 18:35:24 -0000
Content-Type: text/plain

Makefile makes use of CFLAGS_NOOPT.  If we set that
when calling make we can options like -g.  The Makefile
will override any optimization to -O3.

Upstream-Status: Pending

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/zip/zip_3.0.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 1238071..1e96110 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -1,9 +1,15 @@
 require zip.inc
 
-PR="r1"
+PR="r2"
 
 # zip-2.32 still uses directory name of zip-2.30
 S = "${WORKDIR}/zip30"
 
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
+
+# zip.inc sets CFLAGS, but what Makefile actually uses is
+# CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
+# whatever we set.
+#
+EXTRA_OEMAKE_append = " 'CFLAGS_NOOPT=-I. -DUNIX ${CFLAGS}'"
-- 
1.7.3.4



