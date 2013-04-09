Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UPZeM-0003nN-Kn
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:35:57 +0200
Received: by mail-we0-f172.google.com with SMTP id r3so5371514wey.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ARCkNUznVwZDv49JoYD4eziJuSpeTqVtdQOrNe5My+s=;
	b=Nk7CdzyMobIEaJjNeEm0URP2PZol75FNVpOA2Gc+MKRsnZKEEWQvl0aTiAK4dBTx0e
	8LRdMXSjMbr54Vb/9zLEBancHqnuL5CYYB24sDFCB5COgL6nXT9Q7rg07h8dniwQiq9E
	t/CUwsg3HS4xcc4fgo70GdRsgCbleOlTU4a9Le06o2RYWv1AE9PBJ32RvkEjKV16glbD
	qaM6dFpgvU4e4AIGgHDFZGvCIkNSo6y2xSoIHV59aAhRCx5ulzlLRBvjavKJ/2aQ0C2e
	ZSnFot8iGLnqKGW17eyNFZhijydCs6m6+fIKLviar50/1fdlK8Gk1FJPQvoeLHjpToND
	y/Ag==
X-Received: by 10.180.188.141 with SMTP id ga13mr20383360wic.9.1365517114390; 
	Tue, 09 Apr 2013 07:18:34 -0700 (PDT)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id dm9sm26085842wib.3.2013.04.09.07.18.32
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:18:33 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 16:21:15 +0200
Message-Id: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.8.2.1
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
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
X-List-Received-Date: Tue, 09 Apr 2013 14:36:34 -0000

 * Recipe taken from oe-classic
 * Required by xinput-calibrator

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 meta/recipes-graphics/xorg-app/xterm_277.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-app/xterm_277.bb

diff --git a/meta/recipes-graphics/xorg-app/xterm_277.bb b/meta/recipes-graphics/xorg-app/xterm_277.bb
new file mode 100644
index 0000000..18abe35
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xterm_277.bb
@@ -0,0 +1,23 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
+DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
+
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=71d7532e485b8d325906bd751617e2a4"
+
+SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
+SRC_URI[md5sum] = "c0de5c2f7b3a50244c5cdd53dcab1de5"
+SRC_URI[sha256sum] = "6cd38606e4179a874220f33dfd41063f93cd1c717aa26c742beb7adea3c1471e"
+
+EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
+                 --x-libraries=${STAGING_LIBDIR} \
+                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
+                 --disable-imake \
+                 --disable-setuid"
+
+do_configure() {
+        gnu-configize --force
+        sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
+        oe_runconf
+}
+
+FILES_${PN} += " /usr/lib/X11"
-- 
1.8.2.1



