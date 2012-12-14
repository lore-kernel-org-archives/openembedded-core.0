Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6l-0003t3-9U
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:56:00 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2447209pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+fmFFozi9WbXe36y3E9aGufCFTP+Wf/g5zF7/r6GwUA=;
	b=wBDbvB9gKhVM06Rwvc3MlR+i3WYmJl3CrtdKPCXckvc25df+GafkWm7HS9LsNVW/e7
	XjsgUBq/a6q/NNlQwWIPF+QSnnvHdwo9Y8eZPyEk58eMMU21gczdocEfnRE1s7ESITTd
	EbTX45pekELq1DJ4RYLx0mYEvdt3iUCzWWO+RL65VTTCSxWDpOZEpYP4azdawuRwmjY5
	R19Ch361uDDDlaP23hCBVUuXWlB999p3yjuLoZlDygpH8J9kSipAr8QVlR2PoFGSki/I
	lcW90Vzx7V0onRLz4i32yqiiqWYuRtnz59+kHSacmSgCx7FswrDrSF3cK/fBUNBnH90L
	ViFw==
Received: by 10.68.237.6 with SMTP id uy6mr19710407pbc.147.1355528481824;
	Fri, 14 Dec 2012 15:41:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id sg7sm3668378pbb.50.2012.12.14.15.41.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:41:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:47 +0100
Message-Id: <382d46ff682740b34236630d0c397cc5c962091f.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/10] gettext: move remove-potcdate.sin from gettext-native to gettext-minimal-native
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
X-List-Received-Date: Fri, 14 Dec 2012 23:56:00 -0000

* now autotools.bbclass are copying not only Makefile.in.in but also
  remove-potcdate.sin which is used by Makefile.in.in, so we need to
  provide this file already in gettext-minimal-native otherwise build
  can fail, when autotools.bbclass is used before gettext-native (full)
  is built.

* Please be aware that this needs one manual step.
  clean gettext-native before upgrading gettext-minimal-native
  or
  clean gettext-minimal-native after gettext-native was rebuilt

  Without this manual step it will cause missing remove-potcdate.sin in
  native sysroot, because

  1) gettext-minimal-native_0.18.1.1.bb installs it with warning:
     WARNING: The recipe gettext-minimal-native is trying to install files
     into a shared area when those files already exist. Those files and their
     manifest location are:
        /OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/gettext/po/remove-potcdate.sin
        Matched in manifest-x86_64-gettext-native
     Please verify which package should provide the above files.

  2) building gettext-native will clean its own sstate data from sysroot
     including remove-potcdate.sin because it was part of gettext-native
     before, then installs without error, but also without remove-potcdate.sin

  It's the same problem as with config.rpath before:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/031120.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gettext-minimal-0.18.1.1/remove-potcdate.sin      | 19 +++++++++++++++++++
 .../gettext/gettext-minimal-native_0.18.1.1.bb        |  4 +++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb         |  3 ++-
 3 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
new file mode 100644
index 0000000..2436c49
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
@@ -0,0 +1,19 @@
+# Sed script that remove the POT-Creation-Date line in the header entry
+# from a POT file.
+#
+# The distinction between the first and the following occurrences of the
+# pattern is achieved by looking at the hold space.
+/^"POT-Creation-Date: .*"$/{
+x
+# Test if the hold space is empty.
+s/P/P/
+ta
+# Yes it was empty. First occurrence. Remove the line.
+g
+d
+bb
+:a
+# The hold space was nonempty. Following occurrences. Do nothing.
+x
+:b
+}
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
index a46a40d..f008a79 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
@@ -1,6 +1,7 @@
 SRC_URI = "file://aclocal.tgz \
            file://config.rpath \
            file://Makefile.in.in \
+           file://remove-potcdate.sin \
            file://COPYING"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -11,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
 
 inherit native
 
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}"
 
@@ -21,4 +22,5 @@ do_install () {
 	install -d ${D}${datadir}/gettext/po/
 	cp ${WORKDIR}/config.rpath ${D}${datadir}/gettext/
 	cp ${WORKDIR}/Makefile.in.in ${D}${datadir}/gettext/po/
+	cp ${WORKDIR}/remove-potcdate.sin ${D}${datadir}/gettext/po/
 }
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index c3265e1..4639481 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r18"
+PR = "r19"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -104,6 +104,7 @@ do_install_append_class-native () {
 	rm ${D}${datadir}/aclocal/*
 	rm ${D}${datadir}/gettext/config.rpath
 	rm ${D}${datadir}/gettext/po/Makefile.in.in
+	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.0.2



