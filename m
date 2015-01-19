Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6E472C9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7Gjg7002790
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:45 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:42 -0800
Message-ID: <baacb6c7c78a13a3888914bf956ee72097992643.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] texi2html: update po_document/Makefile.in.in for new gettext
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

* The autotools_do_configure updates po/Makefile.in.in, we also need
  update po_document and po_messages.

Fixed:
 *** error: gettext infrastructure mismatch:
using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.19

* Remove fix_gettext_version.patch, it wasn't a correct fix.

* Remove unneeded code from do_configure_append/prepend().

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../texi2html-5.0/fix_gettext_version.patch        |   31 --------------------
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   15 ++++------
 2 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch

diff --git a/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch b/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
deleted file mode 100644
index d1c9fe5..0000000
--- a/meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: texi2html-5.0/po_document/Makefile.in.in
-===================================================================
---- texi2html-5.0.orig/po_document/Makefile.in.in
-+++ texi2html-5.0/po_document/Makefile.in.in
-@@ -9,7 +9,7 @@
- # General Public License and is *not* in the public domain.
- #
- # Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
-Index: texi2html-5.0/po_messages/Makefile.in.in
-===================================================================
---- texi2html-5.0.orig/po_messages/Makefile.in.in
-+++ texi2html-5.0/po_messages/Makefile.in.in
-@@ -9,7 +9,7 @@
- # General Public License and is *not* in the public domain.
- #
- # Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index aa5f1fd..eac289e 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 PR = "r2"
 
 SRC_URI     = "${SAVANNAH_GNU_MIRROR}/texi2html/${BPN}-${PV}.tar.bz2 \
-               file://fix_gettext_version.patch"
+               "
 
 SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
 SRC_URI[sha256sum] = "e8a98b0ee20c495a6ab894398a065ef580272dbd5a15b1b19e8bd1bc89d9f9fa"
@@ -15,15 +15,10 @@ SRC_URI[sha256sum] = "e8a98b0ee20c495a6ab894398a065ef580272dbd5a15b1b19e8bd1bc89
 inherit autotools gettext texinfo
 
 do_configure_prepend() {
-	# Make a directory for the old gettext setup
-	if [ ! -d ${S}/po ]; then
-		mkdir ${S}/po
-	fi
-}
-
-do_configure_append() {
-	# Clean up the phony po directory
-	rm -rf ${S}/po
+	# autotools_do_configure updates po/Makefile.in.in, we also need
+	# update po_document.
+	cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po_document/
+	cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po_messages/
 }
 
 do_install_append () {
-- 
1.7.9.5


