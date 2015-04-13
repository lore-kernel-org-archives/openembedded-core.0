Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98FAE72D74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 09:05:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3D95IJF026218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 02:05:18 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 13 Apr 2015 02:05:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 02:05:17 -0700
Message-ID: <23b227aea2cf5a59a34099160df37b0c50077701.1428915889.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428915889.git.liezhi.yang@windriver.com>
References: <cover.1428915889.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] syslinux: add syslinux-nomtools to PACKAGES
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
X-List-Received-Date: Mon, 13 Apr 2015 09:05:19 -0000
Content-Type: text/plain

The default installed syslinux depends on mtools, we install
syslinux-nomtools too, which has the ext2/3/4 support.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.03.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 33dd776..ddb8744 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -66,14 +66,17 @@ do_install() {
 	install -d ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.bss ${D}${datadir}/syslinux/
+	install -m 644 ${S}/bios/linux/syslinux-nomtools ${D}${bindir}/
 }
 
-PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
+PACKAGES += "${PN}-nomtools ${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
 
 RDEPENDS_${PN} += "mtools"
+RDEPENDS_${PN}-nomtools += "libext2fs"
 RDEPENDS_${PN}-misc += "perl"
 
 FILES_${PN} = "${bindir}/syslinux"
+FILES_${PN}-nomtools = "${bindir}/syslinux-nomtools"
 FILES_${PN}-extlinux = "${sbindir}/extlinux"
 FILES_${PN}-mbr = "${datadir}/${BPN}/mbr.bin"
 FILES_${PN}-chain = "${datadir}/${BPN}/chain.c32"
-- 
1.7.9.5


