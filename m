Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiwGU-0002Lk-Ex
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 01:03:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so858907eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=k2ZqqvKal8d0LqJaifZaaA7WxrsaNRq4r6vdFUhK3og=;
	b=p3cpQaeTeTwQgWi6neafKvXS2mMibACCuID2XbyZkrVO/bhJ3ql41VWHs7wmaQ+VyL
	yBQ+9ZYBnAegbrI42I1xcO/J8+sRM3WNPzDx7Mi+Tlb+UU5qyOW673PH+AI56cCu6/My
	nZUairPCC6BWvGISQChpo/BB1r4r9m0HwQnaIUI8FIH320n2UAfP7TNNbZiLRvqzJ3j8
	dv7LkZOKadzvIS105PfJGZ62yaJFD7Xb2Ll7PI5hVPlD8kJpbryJr1Cw73xPHhnuTMgZ
	Ui6gIrulde/sYm6C6FsZGwNYy6a+zU79n8q21eb8N3Ft9K5TKShu2hiluBuaj0CxP2wU
	Kf/Q==
Received: by 10.14.223.200 with SMTP id v48mr7073034eep.24.1355356108302;
	Wed, 12 Dec 2012 15:48:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm58921764eeo.8.2012.12.12.15.48.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 15:48:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 00:48:40 +0100
Message-Id: <1355356120-20313-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <50C91323.10204@linux.intel.com>
References: <50C91323.10204@linux.intel.com>
Subject: [PATCHv2 2/2] gettext: move remove-potcdate.sin from gettext-native to gettext-minimal-native
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
X-List-Received-Date: Thu, 13 Dec 2012 00:03:02 -0000

* now autotools.bbclass are copying not only Makefile.in.in but also 
  remove-potcdate.sin which is used by Makefile.in.in, so we need to
  provide this file already in gettext-minimal-native otherwise build 
  can fail, when autotools.bbclass is used before gettext-native (full) 
  is built.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

 v2: only commit message

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
1.8.0



