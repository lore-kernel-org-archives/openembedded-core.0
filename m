Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19CBA6AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 21:59:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u71Lxi2f024040
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2016 14:59:44 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 1 Aug 2016 14:59:43 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2016 14:59:43 -0700
Message-ID: <1470088783-13272-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] dpkg: put start-stop-daemon into a separate package
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
X-List-Received-Date: Mon, 01 Aug 2016 21:59:47 -0000
Content-Type: text/plain

This is useful for supplying start-stop-daemon to
images that do not include busybox.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index da6985c..5897801 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -72,4 +72,14 @@ RPROVIDES_update-alternatives-dpkg += "update-alternatives"
 PACKAGES += "${PN}-perl"
 FILES_${PN}-perl = "${libdir}/perl"
 
+# Split out start-stop-daemon to its own package.  Note that it
+# is installed in a different directory than the one used for
+# the bitbake version.
+#
+PACKAGES =+ "${PN}-start-stop"
+FILES_${PN}-start-stop = "${sbindir}/start-stop-daemon"
+
+RDEPENDS_${PN} += "${PN}-start-stop"
+
+
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


