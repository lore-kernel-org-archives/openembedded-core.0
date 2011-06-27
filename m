Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbFAj-0004Av-EQ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 19:00:30 +0200
Received: by wyg30 with SMTP id 30so1428130wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 09:56:49 -0700 (PDT)
Received: by 10.217.7.66 with SMTP id z44mr5359125wes.100.1309193807473;
	Mon, 27 Jun 2011 09:56:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n21sm2872814wed.19.2011.06.27.09.56.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 09:56:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 18:56:42 +0200
Message-Id: <1309193802-17201-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gcc-cross-kernel: update to match new toolchain sysroot layout
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
X-List-Received-Date: Mon, 27 Jun 2011 17:00:31 -0000

The versioned gcc binary gets installed and the needed binutils symlinks are made.

To make it fully work again the following is needed in kernel recipes/classes:

PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel:"

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/gcc/gcc-cross-kernel.inc |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-kernel.inc b/meta/recipes-devtools/gcc/gcc-cross-kernel.inc
index 5347762..be772ba 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-kernel.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-kernel.inc
@@ -6,5 +6,14 @@ PROVIDES = "virtual/${TARGET_PREFIX}gcc-${PV}"
 do_install () {
 	cd gcc
 	oe_runmake 'DESTDIR=${D}' install-common install-headers install-libgcc
-	install -m 0755 xgcc ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}
+	install -m 0755 xgcc  ${D}${bindir}/${TARGET_PREFIX}gcc-${PV}
+
+    # Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+    # found. These need to be relative paths so they work in different locations.
+    dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
+    install -d $dest
+    for t in ar as ld nm objcopy objdump ranlib strip cpp; do
+        ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+        ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
+    done
 }
-- 
1.6.6.1



