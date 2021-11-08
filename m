Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78381C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 17:11:13 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1218.1636391471781000302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 09:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lyyZ7qgr;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636391472;
  x=1667927472;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XQwxwt9pp45cJCccmjTcHlGvgEq5JyCkDsvhmZrqePA=;
  b=lyyZ7qgru8l8nKeTQ0Fgoc09h5jDQg3A/1+Hl8sqk7FJOYQ+fT9REWZ0
   Rsg8qzhY6lwZ3/IZT99qhZ93SoW4j+AE8iAQUjnsCmpdZ3zrvjmLA7QU9
   4mv0Av2g2wQ69A7lAU4Obp9vIuIBxgJ2BumOOzbUKIX2Kwq/DRYJD1vVK
   yI73706Vmabg7I4+hHOLD00N/KIrxVLKU4fe/IC/99bz+7VzjHAmADXSR
   0uOTDLvOTcwTEf6H2HbLqlT3m3g+7BGwZf/54gzK9u1A25HuIMzG/9MNr
   8M6azPSKU7Vrw0HW+z2luOvNRV6fsL4eScdaPVT8hPMPYpCa3lt3mJmQD
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH] insane.bbclass: Add a check for directories that
 are expected to be empty
Date: Mon, 8 Nov 2021 18:10:57 +0100
Message-ID: <20211108171057.23971-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 17:11:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157986

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The empty-dirs QA check verifies that all directories specified in
QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
which will then be included in the error message if the directory is
not empty. If it is not specified for a directory, then "but it is
expected to be empty" will be used.

Change-Id: Ic61019528f4b22f26e42e78125a99666ae27c7f5
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Compared to the corresponding patch for master, there are two
differences:

* "/var/volatile" is not added to QA_EMPTY_DIRS by default.
* "empty-dirs" is added to WARN_QA instead of ERROR_QA.

This should make it safe to add this QA test to Honister without
introdusing any new QA errors, while still allowing the QA test to be
activated for those who wants to use it.

 meta/classes/insane.bbclass  | 32 +++++++++++++++++++++++++++++++-
 meta/conf/documentation.conf |  2 ++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f2d2ca3689..7d4ba28e40 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,7 +27,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
-            missing-update-alternatives native-last missing-ptest \
+            missing-update-alternatives native-last missing-ptest empty-dirs \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -50,6 +50,20 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
 UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
 
+# This is a list of directories that are expected to be empty.
+QA_EMPTY_DIRS ?= " \
+    /dev/pts \
+    /media \
+    /proc \
+    /run \
+    /tmp \
+    ${localstatedir}/run \
+"
+# It is possible to specify why a directory is expected to be empty by defining
+# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included in the error
+# message if the directory is not empty. If it is not specified for a directory,
+# then "but it is expected to be empty" will be used.
+
 def package_qa_clean_path(path, d, pkg=None):
     """
     Remove redundant paths from the path for display.  If pkg isn't set then
@@ -917,6 +931,22 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
                            "listed in LICENSE" % (package, ' '.join(unlisted)))
     return False
 
+QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
+def package_qa_check_empty_dirs(pkg, d, messages):
+    """
+    Check for the existence of files in directories that are expected to be
+    empty.
+    """
+
+    pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
+    for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
+        empty_dir = oe.path.join(pkgd, dir)
+        if os.path.exists(empty_dir) and os.listdir(empty_dir):
+            recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
+                              "but it is expected to be empty")
+            msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
+            oe.qa.add_message(messages, "empty-dirs", msg)
+
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
         sane = True
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c5a38b0764..d38a88fb49 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhoste
 
 #Q
 
+QA_EMPTY_DIRS[doc] = "A list of directories that are expected to be empty."
+QA_EMPTY_DIRS_RECOMMENDATION[doc] = "This specifies a recommendation for a directory why it must be empty, which will be included in the error message if the directory is not empty."
 QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
 
 #R

