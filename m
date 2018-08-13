Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50CD578F2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7D9d6v8017980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 02:39:06 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 02:39:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 17:43:22 +0800
Message-ID: <fc7450968aaa84381f5d4a05f7fe3235e618ccdc.1534150669.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1534150669.git.Qi.Chen@windriver.com>
References: <cover.1534150669.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] man-db: add volatile configuration file for sysvinit
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
X-List-Received-Date: Mon, 13 Aug 2018 09:39:05 -0000
Content-Type: text/plain

Add volatile configuraiton file for man-db so that in sysvinit systems
we don't get failure when running `mandb'. The error message is like
below.

  mandb: can't create index cache /var/cache/man/579: No such file or
  directory

[YOCTO #12872]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/man-db/files/99_mandb  |  1 +
 meta/recipes-extended/man-db/man-db_2.8.3.bb | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/man-db/files/99_mandb

diff --git a/meta/recipes-extended/man-db/files/99_mandb b/meta/recipes-extended/man-db/files/99_mandb
new file mode 100644
index 0000000..9b8a171
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/99_mandb
@@ -0,0 +1 @@
+d man man 0755 /var/cache/man none
diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb b/meta/recipes-extended/man-db/man-db_2.8.3.bb
index a214bd7..e1a7ad9 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
@@ -4,7 +4,8 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
+           file://99_mandb"
 SRC_URI[md5sum] = "6f3055e18fdd1ce5cbbdb30403991ec7"
 SRC_URI[sha256sum] = "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"
 
@@ -17,6 +18,15 @@ inherit gettext pkgconfig autotools
 
 EXTRA_OECONF = "--with-pager=less"
 
+do_install() {
+	autotools_do_install
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	        install -d ${D}/etc/default/volatiles
+		install -m 0644 ${WORKDIR}/99_mandb ${D}/etc/default/volatiles
+	fi
+}
+
 do_install_append_libc-musl() {
         rm -f ${D}${libdir}/charset.alias
 }
-- 
1.9.1


