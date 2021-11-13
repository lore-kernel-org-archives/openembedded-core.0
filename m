Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DECBC433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 12:25:22 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.5347.1636806321072973969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 04:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=pPztcpB8;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636806321;
  x=1668342321;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hivsvReGT1/wGHhPfyVhR2pOGqRd1/MlZcl/U21tqmM=;
  b=pPztcpB881oP1ZEKfPj5gZatzsnJztX3cLXoa1iQZ2IjC/NfOvqSxbU4
   oSBlLGnpArB7yNphADg9iWZ6TB78rDr+J0UeHVCtecrFKYIZhQLY9FoBF
   lIks3kEW7J49VhTLnMowQCrjsIwzGGhNY8xURt92NS9PMDJXqW9awGgId
   VZ9FI8tq0X6R0PWh895tYJRVmnHf+5wJFHf/9y7SgzsLywsPmdjRRaX/D
   L0WxOK6B7IXrnIevoNNoqBOx0ljYAHs/HffOvrpUNNu0t2exOQzBxsWe2
   OVQgB3/e26kk/lKxnIYMk37PZkc/jt21YTnKSNYCTn7ScGQ8dHb5X4EIb
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCHv2] insane.bbclass: Add a check for directories that
 are expected to be empty
Date: Sat, 13 Nov 2021 13:25:16 +0100
Message-ID: <20211113122516.21366-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 12:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158243

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The empty-dirs QA check verifies that all directories specified in
QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
which will then be included in the error message if the directory is
not empty. If it is not specified for a directory, then "but it is
expected to be empty" will be used.

Compared to the corresponding patch for master, there are two
differences:

* "/var/volatile" is not added to QA_EMPTY_DIRS by default, and
* "empty-dirs" is not enabled in ERROR_QA (nor in WARN_QA).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Do not enable "empty-dirs" in WARN_QA. Also updated the commit
message to indicate the differences compared to master.

 meta/classes/insane.bbclass  | 30 ++++++++++++++++++++++++++++++
 meta/conf/documentation.conf |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f2d2ca3689..bfaf2577d0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
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

