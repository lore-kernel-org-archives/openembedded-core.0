Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QugWO-00027A-4A
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 10:03:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7K7wU4m021707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 00:58:30 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 20 Aug 2011 00:58:29 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Aug 2011 15:58:40 +0800
Message-ID: <fc4770ac723a1fa69bc53a8a887b5892cfb99968.1313826618.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313826618.git.wenzong.fan@windriver.com>
References: <cover.1313826618.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpam: Setting suid bit for unix_chkpwd
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
X-List-Received-Date: Sat, 20 Aug 2011 08:03:12 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

[YOCTO #1252]

While pam_unix.so required by an application on lsb image, it will need to
call the unix_chkpwd to get userinfo from shadow file. This fix get a normal
user could read shadow file via unix_chkpwd.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.4.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb b/meta/recipes-extended/pam/libpam_1.1.4.bb
index ae20a97..ca54bd8 100644
--- a/meta/recipes-extended/pam/libpam_1.1.4.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "bison flex cracklib"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
@@ -85,3 +85,9 @@ do_install() {
 	install -d ${D}${sysconfdir}/pam.d/     
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
 }
+
+pkg_postinst_pam-plugin-unix () {
+    # below is necessary to allow unix_chkpwd get user info from shadow file
+    # on lsb images
+    chmod 4755 /usr/sbin/unix_chkpwd
+}
-- 
1.7.0.4



