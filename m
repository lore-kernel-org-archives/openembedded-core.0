Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4p-0008G6-5I
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0Bw4008212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:11 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:11 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:34 -0600
Message-ID: <9cc2aab76c01d9c768198ad3b7d7d9328747cf57.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 02/22] tar: Split RMT from tar
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
split the rmt app from tar as it's likely not useful to many users.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/tar/tar.inc     |   11 +++++++++--
 meta/recipes-extended/tar/tar_1.17.bb |    2 +-
 meta/recipes-extended/tar/tar_1.26.bb |    2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index b50425e..f49c7de 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -8,6 +8,8 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
 inherit autotools gettext
 
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+
 EXTRAINSTALL = "do_install_extra"
 
 do_install () {
@@ -21,11 +23,16 @@ do_install_extra () {
     rmdir ${D}${bindir}/
 }
 
+PACKAGES =+ "${PN}-rmt"
+
+FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "tar rmt"
+ALTERNATIVE_${PN} = "tar"
+ALTERNATIVE_${PN}-rmt = "rmt"
 
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
-ALTERNATIVE_LINK_NAME[rmt] = "${libexecdir}/rmt"
+ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
diff --git a/meta/recipes-extended/tar/tar_1.17.bb b/meta/recipes-extended/tar/tar_1.17.bb
index 9425f14d..b9ca206 100644
--- a/meta/recipes-extended/tar/tar_1.17.bb
+++ b/meta/recipes-extended/tar/tar_1.17.bb
@@ -3,7 +3,7 @@ require tar.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://m4extensions.patch \
     file://gcc43build.patch \
diff --git a/meta/recipes-extended/tar/tar_1.26.bb b/meta/recipes-extended/tar/tar_1.26.bb
index 4c8ab2c..03a35c3 100644
--- a/meta/recipes-extended/tar/tar_1.26.bb
+++ b/meta/recipes-extended/tar/tar_1.26.bb
@@ -3,7 +3,7 @@ require tar.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://remove-gets.patch \
            "
-- 
1.7.3.4



