Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B95E74E86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 10:59:15 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w54AxFiR010278
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2018 03:59:15 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 04 Jun 2018 03:59:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 03:58:28 -0700
Message-Id: <20180604105828.24004-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] man-db: create man db index file
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
X-List-Received-Date: Mon, 04 Jun 2018 10:59:16 -0000

The man db index file doesn't exist, it causes commands whatis, apropos
and 'man -f' don't work as expect:

| root@qemux86-64:# whatis hosts
| hosts: nothing appropriate.

Run command mandb to create man db index file when first boot.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/man-db/man-db_2.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.2.bb b/meta/recipes-extended/man-db/man-db_2.8.2.bb
index 797f770408d..f47d66ce3df 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.2.bb
@@ -21,6 +21,10 @@ do_install_append_libc-musl() {
         rm -f ${D}${libdir}/charset.alias
 }
 
+pkg_postinst_ontarget_${PN} () {
+        ${bindir}/mandb -q
+}
+
 FILES_${PN} += "${prefix}/lib/tmpfiles.d"
 
 FILES_${PN}-dev += "${libdir}/man-db/libman.so ${libdir}/${BPN}/libmandb.so"
-- 
2.11.0


