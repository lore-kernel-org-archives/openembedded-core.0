Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71A-0004kU-7J
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:40 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=YVboXbqCUDhwmNGdGqhYlCTUVtmBqS4xqUDS4Ic7MFk=;
	b=OwoudR4t05yIMV0fCirf4UGtSzklYHwC1z498M5KFbfYfVOK9pHsFLFlfBVe2LKQSx
	wsW81OgTeyw9y5Z7IRUFG/lIV3Z+9PKShIXudmOUPzlOTcNU9NxAuATVeulWXT9LdhLg
	Jp6HyWF732XnbHpX1g1/piCkG4dVxirHlR8Xz5uweoDE7/KN+32buuxTZ8ZoUzcTmy5O
	qcQqn0FfSELlEFA3DZz8U1yIf2+GmwM3sj59yYL0J5Oc1lGOxBc/9uWPH7rLS+8Py+Dj
	uklcBkyXHPYJ2lMCV9gkvKurO43zB85j+LFhjbOzADBRzB8A4I5YZ27wK0RM7auhQ5Qr
	Ldrg==
Received: by 10.180.86.226 with SMTP id s2mr12398063wiz.9.1344196198838;
	Sun, 05 Aug 2012 12:49:58 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:58 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:41 +0200
Message-Id: <1344196136-7643-14-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkRTEZqCtbOYfY0CoRvpWhGJJhqbD0aPsloeI5IVHauNrTzouD/78ilerF7izIdzptrWkpi
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 13/28] external-sourcery: use ${prefix} and ${libdir} instead of /usr and /usr/lib
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:40 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../meta/external-sourcery-toolchain.bb            |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index 74c82ec..1def79e 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -24,7 +24,7 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r7"
+PR = "r8"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
@@ -38,10 +38,10 @@ do_install() {
 	cp -a $sysroot/etc/. ${D}${sysconfdir}
 	cp -a $sysroot/sbin/. ${D}${base_sbindir}
 
-	install -d ${D}/usr
+	install -d ${D}${prefix}
 	for usr_element in bin libexec sbin share ${base_libdir}; do
 		usr_path=$sysroot/usr/$usr_element
-		cp -a $usr_path ${D}/usr/
+		cp -a $usr_path ${D}${prefix}/
 	done
 	for datadir_element in man info; do
 		datadir_path=$sysroot/usr/$datadir_element
@@ -81,7 +81,7 @@ external_toolchain_sysroot_adjust() {
 
 	# If the usr/lib directory doesn't exist, the toolchain fails to even
 	# try to find crti.o in a completely different directory (usr/lib64)
-	install -d ${SYSROOT_DESTDIR}/usr/lib
+	install -d ${SYSROOT_DESTDIR}${libdir}
 }
 
 PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
-- 
1.7.7.6



