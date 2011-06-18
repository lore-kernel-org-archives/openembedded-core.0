Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXzsm-0003pw-7v
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 20:04:34 +0200
Received: by wwg12 with SMTP id 12so1086188wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 11:01:02 -0700 (PDT)
Received: by 10.227.195.71 with SMTP id eb7mr3275957wbb.100.1308420059967;
	Sat, 18 Jun 2011 11:00:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fw15sm1851980wbb.44.2011.06.18.11.00.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Jun 2011 11:00:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2011 20:00:55 +0200
Message-Id: <1308420055-25820-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] glib-2.0 2.28.x: update to 2.28.8
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
X-List-Received-Date: Sat, 18 Jun 2011 18:04:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb |   18 ------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |   19 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |    3 ++-
 3 files changed, 21 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
deleted file mode 100644
index ca5f4c8..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require glib.inc
-
-PE = "1"
-PR = "r1"
-
-SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
-           file://configure-libtool.patch \
-           file://60_wait-longer-for-threads-to-die.patch \
-           file://g_once_init_enter.patch \
-          "
-# Only apply this patch for target recipe on uclibc
-SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-
-SRC_URI[md5sum] = "7d8fc15ae70d5111c0cf2a79d50ef717"
-SRC_URI[sha256sum] = "557fb7c39d21b9359fbac51fd6b0b883bc97a2561c0166eef993a4078312f578"
-
-SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
new file mode 100644
index 0000000..dd34c78
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
@@ -0,0 +1,19 @@
+require glib.inc
+
+PE = "1"
+
+SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
+           file://configure-libtool.patch \
+           file://60_wait-longer-for-threads-to-die.patch \
+           file://g_once_init_enter.patch \
+          "
+# Only apply this patch for target recipe on uclibc
+SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
+
+SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+
+SRC_URI[md5sum] = "789e7520f71c6a4bf08bc683ec764d24"
+SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0488490..0800c85 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -31,7 +31,8 @@ EXTRA_OECONF = "--disable-debug --enable-included-printf=no"
 EXTRA_OECONF_virtclass-native = ""
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no"
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
 FILES_${PN}-dev += "${libdir}/glib-2.0/include"
+FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.6.6.1



