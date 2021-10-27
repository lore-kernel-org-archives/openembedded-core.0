Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393EEC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:37:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.14447.1635352643742823335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gB7Fy38U;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635352645;
  x=1666888645;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GAgPmB2x4lIDbe0SNQmJVz6OmNSXVzyZNDVCU7U2kh8=;
  b=gB7Fy38U32FISg9VRatQxCvv+asyBDp+azjh9mWRF049PF98KSpj2xhm
   V63NEIBP4SJHArVqgBUyKmLJj1e4gbcIj05DYURn8bGCj226CZXu96Uss
   7HpAUgD3rxquN7qIHSPnNyRFpeln/w/gCSsdPbhzNqSBS2Sxxti0gLo1u
   uurrmVXrLJ7CvSh0Ajiibriwn+//n11XsfJfD2S5QVnhJnWYVEqGrioTT
   3bwtLul53Ngrf4JmBT7JRFLJ4LosL0zCWMpDEw5/9lqOs6lTdkYyfNnML
   KeHoT5/oXUwJxemFj+GSfEqXGEuF5Oy32IjbNz7afYRL1sfD/eeNwsxmy
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] insane.bbclass: Add a check for directories that are
 expected to be empty
Date: Wed, 27 Oct 2021 18:37:13 +0200
Message-ID: <20211027163713.17300-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211027163713.17300-1-pkj@axis.com>
References: <20211027163713.17300-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 16:37:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157556

The empty-dirs QA check verifies that all directories specified in
QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
which will then be included in the error message if the directory is
not empty. If it is not specified for a directory, then "but it is
expected to be empty" will be used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass  | 33 ++++++++++++++++++++++++++++++++-
 meta/conf/documentation.conf |  2 ++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1e2f1b768a..1675adf6ac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -37,7 +37,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             configure-gettext perllocalpod shebang-size \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
-            useless-rpaths rpaths staticdev \
+            useless-rpaths rpaths staticdev empty-dirs \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -50,6 +50,21 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
 UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
 
+# This is a list of directories that are expected to be empty.
+QA_EMPTY_DIRS ?= " \
+    /dev/pts \
+    /media \
+    /proc \
+    /run \
+    /tmp \
+    ${localstatedir}/run \
+    ${localstatedir}/volatile \
+"
+# It is possible to specify why a directory is expected to be empty by defining
+# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included in the error
+# message if the directory is not empty. If it is not specified for a directory,
+# then "but it is expected to be empty" will be used.
+
 def package_qa_clean_path(path, d, pkg=None):
     """
     Remove redundant paths from the path for display.  If pkg isn't set then
@@ -885,6 +900,22 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
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
index 80ad8e10d5..45cd01374a 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhoste
 
 #Q
 
+QA_EMPTY_DIRS[doc] = "A list of directories that are expected to be empty."
+QA_EMPTY_DIRS_RECOMMENDATION[doc] = "This specifies a recommendation for a directory why it must be empty, which will be included in the error message if the directory is not empty."
 QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
 
 #R

