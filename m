Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RuW6o-0004z9-Sz
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:28:23 +0100
Received: by yenr5 with SMTP id r5so2534737yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RN4sWwHuifP7n2gXtedwtQUDJTWePDcGvXrO6vwhMzE=;
	b=Y8qDTaR3OBrjX01auhWLdGamW+HIbWVz9XXsFsZhY7pZQaE4vlKqVlFKnfXcFWk4tj
	30FnQMO1vr31X4Pc1T8w78akCIr/0ch0a8p8jjzTqY+xUBGCTNp8FjHZ41VLZI/5u7G+
	IdR1WeJU/xroDo/K/3vxa3ZpKbZBEwnjv/8Jo=
Received: by 10.236.78.193 with SMTP id g41mr26739741yhe.25.1328563221209;
	Mon, 06 Feb 2012 13:20:21 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id u11sm37999299anc.12.2012.02.06.13.20.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 13:20:20 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 15:20:13 -0600
Message-Id: <b2025f4e4189e33a6ea174635285be9c0d1cabf1.1328563142.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] external-csl-toolchain: split out gdbserver packages
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
X-List-Received-Date: Mon, 06 Feb 2012 21:28:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 5b4134e..d15578b 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -64,6 +64,7 @@ do_install() {
 		install -d ${D}${bindir}/.debug
 		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
 	fi
+	ln -s ../../bin/gdbserver ${D}${libdir}/bin/sysroot-gdbserver
 
 	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
@@ -87,7 +88,7 @@ external_toolchain_sysroot_adjust() {
        fi
 }
 
-PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev"
+PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
 
 INSANE_SKIP_libgcc = "1"
 INSANE_SKIP_libstdc++ = "1"
@@ -127,7 +128,8 @@ PKGV_libstdc++ = "${CSL_VER_GCC}"
 PKGV_libstdc++-dev = "${CSL_VER_GCC}"
 PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
 PKGV_linux-libc-headers-dev = "${CSL_VER_KERNEL}"
-PKGV_gdbserver = "${CSL_VER_GDBSERVER}"
+PKGV_gdbserver = "${CSL_VER_GDB}"
+PKGV_gdbserver-dbg = "${CSL_VER_GDB}"
 
 FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
 FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
@@ -146,3 +148,5 @@ FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/sound \
 	${includedir}/video \
 "
+FILES_gdbserver = "${bindir}/gdbserver ${libdir}/bin/sysroot-gdbserver"
+FILES_gdbserver-dbg = "${bindir}/.debug/gdbserver"
-- 
1.7.7



