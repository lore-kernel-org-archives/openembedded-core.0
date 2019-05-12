Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D06E57E0DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4C8H7jS024232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:07 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:17:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:23 +0800
Message-ID: <3a6210cb6b75224895cc07d93f7b29a4c46d9a83.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] man-db: upgrade 2.8.4 -> 2.8.5
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
X-List-Received-Date: Sun, 12 May 2019 08:17:07 -0000
Content-Type: text/plain

Upstream shipped a systemd service in the following commit
[bc52248 Ship a systemd timer for daily DB maintenance]
Backward compatible, disable it by default

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-extended/man-db/{man-db_2.8.4.bb => man-db_2.8.5.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.4.bb => man-db_2.8.5.bb} (86%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.4.bb b/meta/recipes-extended/man-db/man-db_2.8.5.bb
similarity index 86%
rename from meta/recipes-extended/man-db/man-db_2.8.4.bb
rename to meta/recipes-extended/man-db/man-db_2.8.5.bb
index aa36465..441e2f4 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.4.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.5.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "ab41db551f500e4a595b11203b86c67a"
-SRC_URI[sha256sum] = "103c185f9d8269b9ee3b8a4cb27912b3aa393e952731ef96fedc880723472bc3"
+SRC_URI[md5sum] = "c5c6c3434be14a5527d43b5ad0f09a13"
+SRC_URI[sha256sum] = "b64d52747534f1fe873b2876eb7f01319985309d5d7da319d2bc52ba1e73f6c1"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "base-passwd"
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
 USE_NLS_libc-musl = "no"
 
-inherit gettext pkgconfig autotools
+inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = "--with-pager=less"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
@@ -54,3 +54,6 @@ def compress_pkg(d):
     return ""
 
 RDEPENDS_${PN} += "${@compress_pkg(d)}"
+
+SYSTEMD_SERVICE_${PN} = "man-db.timer man-db.service"
+SYSTEMD_AUTO_ENABLE ?= "disable"
-- 
2.7.4


