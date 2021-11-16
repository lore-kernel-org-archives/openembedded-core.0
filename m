Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD85BC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:32 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.383.1637080346426941201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319941165"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="319941165"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:31 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956827"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/17] insane.bbclass: Add a check for directories
 that are expected to be empty
Date: Wed, 17 Nov 2021 00:31:58 +0800
Message-Id: 
 <9f3fbfc02ae6fadffbcc1bda1fa75dfe140d05c5.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158360

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
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
-- 
2.33.1


