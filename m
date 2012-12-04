Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4o-0008G5-KU
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0Bio026314
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:11 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:10 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:33 -0600
Message-ID: <f187e2a58d9ad54de5d8cd8cc8fc0b7f861154de.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 01/22] cpio: Split RMT from cpio
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:35 -0000
Content-Type: text/plain

After the recent change of the libexecdir definition, the update-alternatives
for the libexec rmt broke.  Fix this by moving rmt from libexec to /sbin.  Also
split the rmt app from cpio as it's likely not useful to many users.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/cpio/cpio_2.11.bb |    2 +-
 meta/recipes-extended/cpio/cpio_2.8.bb  |    2 +-
 meta/recipes-extended/cpio/cpio_v2.inc  |   11 +++++++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 9b37dcd..5f88b30 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -3,7 +3,7 @@ include cpio_v2.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://remove-gets.patch \
            "
diff --git a/meta/recipes-extended/cpio/cpio_2.8.bb b/meta/recipes-extended/cpio/cpio_2.8.bb
index cabc1cd..b6da207 100644
--- a/meta/recipes-extended/cpio/cpio_2.8.bb
+++ b/meta/recipes-extended/cpio/cpio_2.8.bb
@@ -3,7 +3,7 @@ require cpio_v2.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b7f772ea3a2489231cb4872656cac34b"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://m4extensions.patch \
     file://avoid_heap_overflow.patch \
diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 3b3402b..30446b0 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -14,6 +14,8 @@ inherit autotools gettext
 
 S = "${WORKDIR}/cpio-${PV}"
 
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+
 do_install () {
     autotools_do_install
     install -d ${D}${base_bindir}/
@@ -21,13 +23,18 @@ do_install () {
     rmdir ${D}${bindir}/
 }
 
+PACKAGES =+ "${PN}-rmt"
+
+FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "cpio rmt"
+ALTERNATIVE_${PN} = "cpio"
+ALTERNATIVE_${PN}-rmt = "rmt"
 
 ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 
 ALTERNATIVE_PRIORITY[rmt] = "50"
-ALTERNATIVE_LINK_NAME[rmt] = "${libexecdir}/rmt"
+ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
-- 
1.7.3.4



