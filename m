Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D52446C3FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 05:47:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE5klmG009386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 21:46:57 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 13 Nov 2018 21:46:36 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2018 00:46:32 -0500
Message-ID: <5987e51fa513daf0435d17b376ad754014c84e9e.1542174292.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1542174292.git.kai.kang@windriver.com>
References: <cover.1542174292.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gettext: fix CVE-2018-18751
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
X-List-Received-Date: Wed, 14 Nov 2018 05:47:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2018-18751 for gettext. Because po-gram-gen.y
has been modified by fix-CVE-2018-18751.patch, it requires yacc which
provided by bison-native to re-create po-gram-gen.c. Please remove
bison-native from DEPENDS* when next upgrade.

Ref:
https://security-tracker.debian.org/tracker/CVE-2018-18751

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gettext-0.19.8.1/fix-CVE-2018-18751.patch | 141 ++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb |   8 +-
 2 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch

diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
new file mode 100644
index 0000000000..6dfe200d65
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
@@ -0,0 +1,141 @@
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=dce3a16]
+CVE: CVE-2018-18751
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From dce3a16e5e9368245735e29bf498dcd5e3e474a4 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 15 Sep 2016 13:57:24 +0200
+Subject: [PATCH] xgettext: Fix crash with *.po file input
+
+When xgettext was given two *.po files with the same msgid_plural, it
+crashed with double-free.  Problem reported by Davlet Panech in:
+http://lists.gnu.org/archive/html/bug-gettext/2016-09/msg00001.html
+* gettext-tools/src/po-gram-gen.y: Don't free msgid_pluralform after
+calling do_callback_message, assuming that it takes ownership.
+* gettext-tools/src/read-catalog.c (default_add_message): Free
+msgid_plural after calling message_alloc.
+* gettext-tools/tests/xgettext-po-2: New file.
+* gettext-tools/tests/Makefile.am (TESTS): Add new test.
+---
+ gettext-tools/src/po-gram-gen.y   | 13 ++++-----
+ gettext-tools/src/read-catalog.c  |  2 ++
+ gettext-tools/tests/Makefile.am   |  2 +-
+ gettext-tools/tests/xgettext-po-2 | 55 +++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 63 insertions(+), 9 deletions(-)
+ create mode 100755 gettext-tools/tests/xgettext-po-2
+
+diff --git a/gettext-tools/src/po-gram-gen.y b/gettext-tools/src/po-gram-gen.y
+index becf5e6..4428e77 100644
+--- a/gettext-tools/src/po-gram-gen.y
++++ b/gettext-tools/src/po-gram-gen.y
+@@ -221,14 +221,11 @@ message
+                   check_obsolete ($1, $3);
+                   check_obsolete ($1, $4);
+                   if (!$1.obsolete || pass_obsolete_entries)
+-                    {
+-                      do_callback_message ($1.ctxt, string2, &$1.pos, $3.string,
+-                                           $4.rhs.msgstr, $4.rhs.msgstr_len, &$4.pos,
+-                                           $1.prev_ctxt,
+-                                           $1.prev_id, $1.prev_id_plural,
+-                                           $1.obsolete);
+-                      free ($3.string);
+-                    }
++                    do_callback_message ($1.ctxt, string2, &$1.pos, $3.string,
++                                         $4.rhs.msgstr, $4.rhs.msgstr_len, &$4.pos,
++                                         $1.prev_ctxt,
++                                         $1.prev_id, $1.prev_id_plural,
++                                         $1.obsolete);
+                   else
+                     {
+                       free_message_intro ($1);
+diff --git a/gettext-tools/src/read-catalog.c b/gettext-tools/src/read-catalog.c
+index 571d18e..6af6d20 100644
+--- a/gettext-tools/src/read-catalog.c
++++ b/gettext-tools/src/read-catalog.c
+@@ -397,6 +397,8 @@ default_add_message (default_catalog_reader_ty *this,
+          appropriate.  */
+       mp = message_alloc (msgctxt, msgid, msgid_plural, msgstr, msgstr_len,
+                           msgstr_pos);
++      if (msgid_plural != NULL)
++        free (msgid_plural);
+       mp->prev_msgctxt = prev_msgctxt;
+       mp->prev_msgid = prev_msgid;
+       mp->prev_msgid_plural = prev_msgid_plural;
+diff --git a/gettext-tools/tests/Makefile.am b/gettext-tools/tests/Makefile.am
+index 23b09b1..0dfb4d8 100644
+--- a/gettext-tools/tests/Makefile.am
++++ b/gettext-tools/tests/Makefile.am
+@@ -95,7 +95,7 @@ TESTS = gettext-1 gettext-2 gettext-3 gettext-4 gettext-5 gettext-6 gettext-7 \
+ 	xgettext-perl-1 xgettext-perl-2 xgettext-perl-3 xgettext-perl-4 \
+ 	xgettext-perl-5 xgettext-perl-6 xgettext-perl-7 xgettext-perl-8 \
+ 	xgettext-php-1 xgettext-php-2 xgettext-php-3 xgettext-php-4 \
+-	xgettext-po-1 \
++	xgettext-po-1 xgettext-po-2 \
+ 	xgettext-properties-1 \
+ 	xgettext-python-1 xgettext-python-2 xgettext-python-3 \
+ 	xgettext-python-4 \
+diff --git a/gettext-tools/tests/xgettext-po-2 b/gettext-tools/tests/xgettext-po-2
+new file mode 100755
+index 0000000..c4bd9d0
+--- /dev/null
++++ b/gettext-tools/tests/xgettext-po-2
+@@ -0,0 +1,55 @@
++#! /bin/sh
++. "${srcdir=.}/init.sh"; path_prepend_ . ../src
++
++# Test PO extractors with multiple input files.
++
++cat <<EOF > xg-po-2-1.po
++msgid "first msgid"
++msgid_plural "first msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++
++msgid "second msgid"
++msgid_plural "second msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++EOF
++
++cat <<EOF > xg-po-2-2.po
++msgid "third msgid"
++msgid_plural "third msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++
++msgid "second msgid"
++msgid_plural "second msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++EOF
++
++: ${XGETTEXT=xgettext}
++${XGETTEXT} --omit-header xg-po-2-1.po xg-po-2-2.po -o xg-po-2.tmp.po || Exit 1
++LC_ALL=C tr -d '\r' < xg-po-2.tmp.po > xg-po-2.po || Exit 1
++
++cat <<EOF > xg-po-2.ok
++msgid "first msgid"
++msgid_plural "first msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++
++msgid "second msgid"
++msgid_plural "second msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++
++msgid "third msgid"
++msgid_plural "third msgid (plural)"
++msgstr[0] ""
++msgstr[1] ""
++EOF
++
++: ${DIFF=diff}
++${DIFF} xg-po-2.ok xg-po-2.po
++result=$?
++
++exit $result
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 68f5cc329a..933baccd94 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -8,8 +8,11 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "gettext-native virtual/libiconv"
-DEPENDS_class-native = "gettext-minimal-native"
+# Because po-gram-gen.y has been modified by fix-CVE-2018-18751.patch,
+# it requires yacc which provided by bison-native
+# Please remove bison-native from DEPENDS* when next upgrade
+DEPENDS = "bison-native gettext-native virtual/libiconv"
+DEPENDS_class-native = "bison-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
@@ -18,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://add-with-bisonlocaledir.patch \
 	   file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
 	   file://use-pkgconfig.patch \
+	   file://fix-CVE-2018-18751.patch \
 "
 
 SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
-- 
2.19.0.rc2


