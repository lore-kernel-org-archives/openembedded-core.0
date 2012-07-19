Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVC-0000pw-SH
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:22:59 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:36 -0700
Received: by mail-wi0-f172.google.com with SMTP id hm11so5006402wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=FmBPZ5RW1tnW+0fLiDbAtqZBJlatJwPX7NesQeoZIzU=;
	b=ZhOYmjG8KEy9EketSrl5BeBWU55YKrtr9jFtt8V/Ha+L8hAvKzF51IJRlPbQSABXOb
	zLbdne5gCN+4CopDDAUq4NGi/yZ4vXRm0pBpoPtno77lTEliQdL+O6E6Ka4a3HTZBkgM
	BNVGR1s/s2GYTlh0tbrtWygdNRuYcOOHnbweUfz9r5ynrzFeOPGXWME1laXuf2vYCVBc
	4x9BQ5rckBwH9EUsUkFH03eKujD7grSLUYVFOKJnugNZlZjP9XgpKAN9W30qho7gEWbi
	YdN9W6sgpfIhqUL83fdFY5wTfFF58ek2WRseHtpJ0LcrlfMrEkhNal8KbCaNIYVdmvES
	jyQg==
Received: by 10.180.19.169 with SMTP id g9mr17694818wie.9.1342714295752;
	Thu, 19 Jul 2012 09:11:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:50 +0100
Message-Id: <c13a55b5bf714f92da433a47df6fde8d25d2f79b.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlb7VqHE1X4swYzCQhqHe7CG1gq7O8LJ8SiKU8CD3BEEakcyljaJPJI0roitgnr28NWe5a8
Subject: [PATCH 03/26] glib-2.0: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:22:59 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    5 +----
 meta/recipes-core/glib-2.0/glib.inc           |    6 +++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 1f8ad7d..988494b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r2"
+PR = "r3"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -23,9 +23,6 @@ SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
 do_configure_prepend() {
-	# missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
-	sed -i '/^docs/d' ${S}/configure.ac
-	sed -i 's/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po/g' ${S}/Makefile.am
 	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2f48e27..3540cd5 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,15 +13,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0-native gtk-doc-native zip virtual/libiconv"
-DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native"
+DEPENDS = "glib-2.0-native zip virtual/libiconv"
+DEPENDS_virtclass-native = "pkgconfig-native gettext-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools pkgconfig gettext
+inherit autotools gettext gtk-doc pkgconfig
 
 S = "${WORKDIR}/glib-${PV}"
 
-- 
1.7.10



