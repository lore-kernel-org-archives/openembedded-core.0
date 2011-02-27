Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyI-0007Da-BA
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:22 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:01 -0800 (PST)
Received: by 10.227.59.133 with SMTP id l5mr2805380wbh.151.1298798994352;
	Sun, 27 Feb 2011 01:29:54 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x1sm2272643wbh.2.2011.02.27.01.29.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:54 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:28 +0100
Message-Id: <257a29e829560999f5962709cb25ac95df8dd7b4.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 21/50] libuser: enable documentation
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:22 -0000

From: Scott Garman <scott.a.garman@intel.com>

Added popt to DEPENDS. This fixes the following build error:

apps/luserdel.c:25:18: fatal error: popt.h: No such file or directory

Remove patch and configure flag which had disabled doc generation

Add docbook-utils-native and linuxdoc-tools-native to DEPENDS

This fixes [BUGID #213]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../libuser/libuser-0.57.1/disable-sgml-doc.patch  |   18 ------------------
 meta/recipes-extended/libuser/libuser_0.57.1.bb    |    9 ++++-----
 2 files changed, 4 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-extended/libuser/libuser-0.57.1/disable-sgml-doc.patch

diff --git a/meta/recipes-extended/libuser/libuser-0.57.1/disable-sgml-doc.patch b/meta/recipes-extended/libuser/libuser-0.57.1/disable-sgml-doc.patch
deleted file mode 100644
index a2017c5..0000000
--- a/meta/recipes-extended/libuser/libuser-0.57.1/disable-sgml-doc.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Disable generating docs from sgml, which requries linuxdoc-tools.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-Index: libuser-0.56.16/docs/Makefile.am
-===================================================================
---- libuser-0.56.16.orig/docs/Makefile.am	2010-08-12 13:29:43.000000000 +0800
-+++ libuser-0.56.16/docs/Makefile.am	2010-08-12 13:29:51.000000000 +0800
-@@ -14,8 +14,8 @@
- 
- sgml/libuser.txt: $(srcdir)/sgml/libuser.sgml
- 	[ -d sgml ] || mkdir sgml
--	cd sgml; sgml2txt ../$(srcdir)/sgml/libuser.sgml
-+#	cd sgml; sgml2txt ../$(srcdir)/sgml/libuser.sgml
- 
- sgml/libuser.html: $(srcdir)/sgml/libuser.sgml
- 	[ -d sgml ] || mkdir sgml
--	cd sgml; sgml2html ../$(srcdir)/sgml/libuser.sgml
-+#	cd sgml; sgml2html ../$(srcdir)/sgml/libuser.sgml
diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb b/meta/recipes-extended/libuser/libuser_0.57.1.bb
index d2e7c3a..2dd3f11 100644
--- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
+++ b/meta/recipes-extended/libuser/libuser_0.57.1.bb
@@ -11,15 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 SECTION = "base"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
-           file://disable-sgml-doc.patch;patch=1"
+SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "be82c6941264d0b4bd04f95fb342ec7d"
 SRC_URI[sha256sum] = "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
-PR = "r0"
+PR = "r1"
 
-DEPENDS = "gettext libpam glib-2.0 xz-native"
+DEPENDS = "gettext popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native"
 
-EXTRA_OECONF += "--disable-gtk-doc --without-python"
+EXTRA_OECONF += "--without-python"
 
 inherit autotools
-- 
1.6.6.1



