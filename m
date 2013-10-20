Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5A9B6CBA4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 08:02:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9K82c4J022838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 01:02:39 -0700 (PDT)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 20 Oct 2013 01:02:38 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Oct 2013 16:02:29 +0800
Message-ID: <1382256149-14223-3-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1382256149-14223-1-git-send-email-ming.liu@windriver.com>
References: <1382256149-14223-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 3/3] screen: dynamically add or remove a entry to/from /etc/shells
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
X-List-Received-Date: Sun, 20 Oct 2013 08:02:37 -0000
Content-Type: text/plain

1 Add base-files to RDEPENDS.
2 Add pkg_postinst and pkg_postrm to add and remove a entry in
/etc/shells.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/screen/screen_4.0.3.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 1a7eb20..be42fb9 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
 SECTION = "console/utils"
 DEPENDS = "ncurses \
           ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} = "base-files"
+
 PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
@@ -41,3 +43,11 @@ do_install_append () {
 		fi
 	done
 }
+
+pkg_postinst_${PN} () {
+	grep -q "^${bindir}/screen$" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+	printf "$(grep -v "^${bindir}/screen$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
+}
-- 
1.8.4.1


