Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 20C467E821
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 01:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E20A540BC0;
	Tue, 18 Jun 2019 01:28:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aT2WuAd7GnUt; Tue, 18 Jun 2019 01:28:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CBB8340BBA;
	Tue, 18 Jun 2019 01:28:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A981E1703A7;
	Mon, 17 Jun 2019 21:28:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 21:28:07 -0400
Message-Id: <1560821287-20630-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560821287-20630-1-git-send-email-denis@denix.org>
References: <1560821287-20630-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] mtd-utils: add "jffs" and "ubifs" PACKAGECONFIG options
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
X-List-Received-Date: Tue, 18 Jun 2019 01:28:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Enabled by default, but allow to optionally disable them.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 6415fff..49a650a 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -24,10 +24,12 @@ EXTRA_OECONF += "--enable-install-tests"
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
 # regardless whether acl is enabled or disabled in the distro should be okay.
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo jffs ubifs"
 PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
 PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
 PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
+PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
+PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
 
 CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
@@ -59,7 +61,9 @@ do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 }
 
-PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc mtd-utils-tests"
+PACKAGES =+ "mtd-utils-misc mtd-utils-tests"
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "jffs", "mtd-utils-jffs2", "", d)}"
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "", d)}"
 
 FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
 FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
-- 
2.7.4


