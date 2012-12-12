Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TikqO-0000Lt-L6
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 12:51:21 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBCBahaF031498;
	Wed, 12 Dec 2012 05:36:45 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 16:35:41 +0500
Message-Id: <1355312141-20291-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] libacpi: Remove QA warning: No GNU_HASH in the elf binary
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
X-List-Received-Date: Wed, 12 Dec 2012 11:51:21 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Handle LDFLAGS properly in the Makefile to remove warning:
QA Issue: No GNU_HASH in the elf binary

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-bsp/libacpi/files/ldflags.patch |   41 ++++++++++++++++++++++++++
 meta/recipes-bsp/libacpi/libacpi_0.2.bb      |    3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/libacpi/files/ldflags.patch b/meta/recipes-bsp/libacpi/files/ldflags.patch
new file mode 100644
index 0000000..a7424c3
--- /dev/null
+++ b/meta/recipes-bsp/libacpi/files/ldflags.patch
@@ -0,0 +1,41 @@
+libacpi: Remove QA warning: No GNU_HASH in the elf binary
+
+Upstream-Status: Inappropriate [other]
+  Useful within bitbake environment only.
+
+Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
+
+---
+ Makefile  |    3 ++-
+ config.mk |    1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+--- libacpi-0.2.orig/Makefile
++++ libacpi-0.2/Makefile
+@@ -19,6 +19,7 @@ options:
+ 	@echo "CFLAGS   = ${CFLAGS}"
+ 	@echo "CC       = ${CC}"
+ 	@echo "SOFLAGS  = ${SOFLAGS}"
++	@echo "LDFLAGS  = ${LDFLAGS}"
+ 	@echo "LD       = ${LD}"
+ 
+ .c.o:
+@@ -34,7 +35,7 @@ libacpi.a: ${OBJ}
+ 
+ libacpi.so: ${OBJ}
+ 	@echo LD $@
+-	@${CC} ${SOFLAGS} -o $@.${SOVERSION} ${OBJ}
++	@${CC} ${SOFLAGS} ${LDFLAGS} -o $@.${SOVERSION} ${OBJ}
+ 
+ test-libacpi: ${OBJ_test}
+ 	@echo LD $@
+--- libacpi-0.2.orig/config.mk
++++ libacpi-0.2/config.mk
+@@ -10,6 +10,7 @@ MANPREFIX = ${PREFIX}/share/man
+ SOFLAGS = -shared -Wl,-soname,${SONAME}
+ CFLAGS += -fPIC -g --pedantic -Wall -Wextra
+ ARFLAGS = cr
++LDFLAGS =
+ 
+ # Compiler and linker
+ CC = cc
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index b0fbf0b..f4c323d 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -10,7 +10,8 @@ PR = "r6"
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
 	   file://libacpi_fix_for_x32.patch \
-	   file://use_correct_strip_in_cross_environment.patch"
+	   file://use_correct_strip_in_cross_environment.patch \
+	   file://ldflags.patch "
 
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
-- 
1.7.9.5



