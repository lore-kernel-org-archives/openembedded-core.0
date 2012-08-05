Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Ls-0007d8-JS
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:49 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm11so885140wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=FsIyX6VQrVnHthset91qfM3xcNn0Z+pVEipt5ue4X+A=;
	b=kcNI6mkivIsve9tGSKKCEGEa0IVKvtuMsmWWCxkTDHfENWPzAp5F5pqXzcGE1CyWSW
	eIN2n+oj8i136S64tWyaLLDW3Jj7pliupW/tAUK6mRhpyekkn6kv3g/RhaHQSDrrxpYu
	uzghvaVD2wmCfqIDTcdpdlLNRKchm7sEAOoNzvACxLTXrvqeYLWh484zlw7R6SGwkC8L
	GAADTEU9OtHtRAkBrEpQPrA6nS5+3F/Ys9imYGWQoO1gXrVH8aBNykE/4rWHBDPubdct
	ki5z44sCJw7j30aPHslfd8Ld30Bbhbv8dZt+MB+4xC+UQjI6rquwj3Duy4T0WssWedIJ
	IxrQ==
Received: by 10.180.105.6 with SMTP id gi6mr11534966wib.4.1344182107290;
	Sun, 05 Aug 2012 08:55:07 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:06 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:00 +0200
Message-Id: <1344182057-15981-14-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlXzjXvirhmaUOriNvgRdNCcJdjFG9JTduxNmOeRLBqnlXFFFfmszlSwV7hy318pyuWGruk
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/30] external-sourcery: use ${prefix} and ${libdir} instead of /usr and /usr/lib
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:49 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../meta/external-sourcery-toolchain.bb            |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index 74c82ec..18c3105 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
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



