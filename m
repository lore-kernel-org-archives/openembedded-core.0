Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqo0M-00051n-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:18:38 +0200
Received: by bkcik5 with SMTP id ik5so3680749bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pQXksCQ9ULTr14aTOEAZNIw54bCrdFyP88bghz8kGqY=;
	b=qqH8JC0j5d7d/cn8Gn86qqIkntxYJZ26U6Gz1kMLSOvEV+ZQQ/za2eKQfFRA4hzqeX
	YRHB0mRVqBXfSjNXdanl9EydOsqEncPBHI1nwmX8GxBieguNbJFbAQyF5ptpVC/zbLVw
	gJp7PLVqCT3+JMM+X0+IfvOTSqyKePpW5zIvkML1O2ZBLZHiLHAt2SlwfClDEinpVa3v
	lFUkDbuD3v/KEvenKGQ9LbXVGNkTuXPtkx0hBN3C1XtgJ4jew/1H6FnZCguQPqWm1Ouv
	lSWl5LxdmqeXJCrFSdfKQXx3kLhvzYltxf5TJZQn3voqxzVbe+5E3lah4FyFak+jKYRj
	jtPQ==
Received: by 10.205.134.6 with SMTP id ia6mr5226551bkc.51.1342454840329;
	Mon, 16 Jul 2012 09:07:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hg13sm8469177bkc.7.2012.07.16.09.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 09:07:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 18:07:18 +0200
Message-Id: <1342454838-31263-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC 2/2] glib: package bash-completion files in separate package and move ${PN}-codegen to .inc
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
X-List-Received-Date: Mon, 16 Jul 2012 16:18:39 -0000

* 2.32.4 has completion files in ${datadir}/bash-completion
  and dbus also packages bash-competion files in separate package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    5 +----
 meta/recipes-core/glib-2.0/glib.inc           |    9 +++++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index fca5f8d..85352ed 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,5 +1,6 @@
 require glib.inc
 
+PR = "r1"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -46,7 +47,3 @@ do_install_append() {
     sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/glib-mkenums
   fi
 }
-
-PACKAGES += "${PN}-codegen"
-FILES_${PN}-codegen = "${libdir}/gdbus-2.0/codegen/*.py"
-FILES_${PN} += "${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e7d547a..9ae02d9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -16,7 +16,7 @@ SECTION = "libs"
 DEPENDS = "glib-2.0-native gtk-doc-native zip virtual/libiconv"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
-PACKAGES =+ "${PN}-utils "
+PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
@@ -31,12 +31,17 @@ EXTRA_OECONF = "--disable-debug --enable-included-printf=no ${CORECONF}"
 EXTRA_OECONF_virtclass-native = "${CORECONF}"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
+               ${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
                     ${libdir}/gio/modules/.debug"
+FILES_${PN}-codegen = "${libdir}/gdbus-2.0/codegen/*.py"
+FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
+                               ${datadir}/bash-completion"
 
 ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
-- 
1.7.8.6



