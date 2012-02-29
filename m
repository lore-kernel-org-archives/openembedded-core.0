Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2clR-0005EG-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 07:11:49 +0100
Received: by ghbz2 with SMTP id z2so1529797ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 22:03:20 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.180.18 as permitted sender) client-ip=10.101.180.18; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.180.18 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.180.18])
	by 10.101.180.18 with SMTP id h18mr2802025anp.23.1330495400591
	(num_hops = 1); Tue, 28 Feb 2012 22:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=4HyXnZakuQ4cp2QOoTTRe+dTNsm7WI1Go/MsVhcIhUw=;
	b=tMAo2Z6+EgQfxIFD4fCgU72AfIlb4hJuJd7C8Si0t6KRaGAM48BUowt6Nz+VkKFlEZ
	DHbwf5dYQmQwwwsWGSP7Q2Ha2f4Es0AuEmDlRXHYvzljmzI0Jj6eSa4Ucg355Opp0iR9
	GsmardBIQ2ZEoRixRuXXYtbwyE7AqwEBsHezc=
Received: by 10.101.180.18 with SMTP id h18mr2167459anp.23.1330495400514;
	Tue, 28 Feb 2012 22:03:20 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 34sm32861741anu.6.2012.02.28.22.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 22:03:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 06:03:13 +0000
Message-Id: <1330495393-19751-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] syslinux: fix packaging of ${PN} and ${PN}-staticdev
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
X-List-Received-Date: Wed, 29 Feb 2012 06:11:49 -0000

 - ${PN} where not being build due ordering;
 - ${PN}-staticdev lacked the ${libdir} files.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 823465c..2ab6878 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
@@ -46,7 +46,7 @@ do_install() {
 	install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/syslinux/
 }
 
-PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
+PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
 
 RDEPENDS_${PN} += "mtools"
 
@@ -57,7 +57,7 @@ FILES_${PN}-chain = "${libdir}/${PN}/chain.c32"
 FILES_${PN}-isolinux = "${libdir}/${PN}/isolinux.bin"
 FILES_${PN}-pxelinux = "${libdir}/${PN}/pxelinux.0"
 FILES_${PN}-dev += "${datadir}/${PN}/com32/lib*${SOLIBS} ${datadir}/${PN}/com32/include ${datadir}/${PN}/com32/com32.ld"
-FILES_${PN}-staticdev += "${datadir}/${PN}/com32/lib*.a"
+FILES_${PN}-staticdev += "${datadir}/${PN}/com32/lib*.a ${libdir}/${PN}/com32/lib*.a"
 FILES_${PN}-misc = "${libdir}/${PN}/* ${bindir}/*"
 
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



