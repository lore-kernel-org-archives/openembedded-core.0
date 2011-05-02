Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QGyXb-0005Ws-4b
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 21:12:19 +0200
Received: by gxk3 with SMTP id 3so606762gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 12:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=VlgouIyTZWhpP4HPX1Ybgp7+mbe3nJi0W5xHj5DKBLM=;
	b=jWIpS8ErS/cKFYT1cmh92JZ7aAhAfjBu6VLE8TE0Osc6nPpASrZwNOv2LBAB9E7L0x
	RfMVMW8BUmKc3yFA5Sq/mnhNSNdJUwMMNzQEJOaDuJ3WzXF8G1AbbEcKXgsuD3R6KaLc
	1JPlL3UfExHCSAo3nCNyodHIQe4WPfeU58Dtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=CkKNRTBG/nw85wtYcvlp51ahPM9U0ZazQc5lfwriBCRvpV6boTkG5aMGk/rxbXAXM1
	OOHVB838b/U72Et1OBRUv/wVoVMblCXIohvD4emwMFwnVvB1lJJ/1F/TSyrqafRxceMq
	vknY/qn6RbV0X5vLyTcl8LubOIODmbj2vojmo=
Received: by 10.150.207.13 with SMTP id e13mr6884433ybg.58.1304363381534;
	Mon, 02 May 2011 12:09:41 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm856452yba.16.2011.05.02.12.09.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 12:09:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2011 19:09:15 +0000
Message-Id: <1304363356-27535-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
References: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 3/4] syslinux: improve packaging
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
X-List-Received-Date: Mon, 02 May 2011 19:12:19 -0000

Usually only parts of syslinux are used by products and thus syslinux
can be greatly reduced in size. This changes does it as:

 - syslinux: syslinux binary
 - syslinux-extlinux: extlinux binary
 - syslinux-mbr: mbr.bin
 - syslinux-chain: chain.c32
 - syslinux-pxelinux: pxelinux.0
 - syslinux-isolinux: isolinux.bin

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 05bcb21..dc0785e 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
@@ -46,4 +46,14 @@ do_install() {
 	install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/syslinux/
 }
 
+PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux"
+
+FILES_${PN} = "${bindir}/syslinux"
+FILES_${PN}-extlinux = "${sbindir}/extlinux"
+FILES_${PN}-mbr = "${libdir}/${PN}/mbr.bin"
+FILES_${PN}-chain = "${libdir}/${PN}/chain.c32"
+FILES_${PN}-isolinux = "${libdir}/${PN}/isolinux.bin"
+FILES_${PN}-pxelinux = "${libdir}/${PN}/pxelinux.0"
+FILES_${PN}-dev += "${datadir}/${PN}/com32"
+
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



