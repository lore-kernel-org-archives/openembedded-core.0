Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAE6C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 10:36:24 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.31273.1640255783042519636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 02:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WUyaDe+A;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640255783;
  x=1671791783;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pQqGlBbf1G9CIBOFubX/VhGt2QtOOnXtH7QX0q7uoUM=;
  b=WUyaDe+AJPxSWAZdjNZ8UJTb1g7nGUkvSeB3ao51elvYcoUAuR5IAmSr
   ColI7V1tMhdXNtkrwSnZI5YsV5UUZht9ybPIrc4qXstvt/8Kb3FQ3zf0d
   pt6MfewBWPWOAwzkfMwHjRnjSKOlKsjO6CdnCseoLsORxZ5ztP1yXbnXn
   rY8/ED2TS+LoK1NEN/7AX1w+6H/vmklujq/yBoN2/ReOcdKku6Hhf0WJ0
   FT7olHibFckNVWQSX9CPek9WKOxvjBuL5ut+9woCdBi4z/QaP+pK3fOSU
   hlAlEbxoqFOdaGo55XFsBypuA9rZXyI/beaMGcln7zU3gJ/aSaN2ZKDS9
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] package.bbclass: Add support for specifying a suffix for
 debug files
Date: Thu, 23 Dec 2021 11:36:17 +0100
Message-ID: <20211223103617.4172-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 10:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159974

The suffix is added to the names of all files with debug symbols
produced by split_and_strip_files(). It can be used to make the debug
files produced by one recipe unique to avoid them conflicting with
identically named debug files produced by another recipe. This may be
needed since while the target files may be split in multiple packages,
the debug files for one recipe are all in one package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 11 +++++++++++
 meta/conf/documentation.conf |  1 +
 2 files changed, 12 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 09cd376f4a..3df1edd4a8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -62,6 +62,14 @@ PACKAGE_DEPENDS += "rpm-native dwarfsrcfiles-native"
 # tools at rootfs build time.
 PACKAGE_WRITE_DEPS ??= ""
 
+# This suffix is added to the names of all files with debug symbols produced by
+# split_and_strip_files(). It can be used to make the debug files produced by
+# one recipe unique to avoid them conflicting with identically named debug files
+# produced by another recipe. This may be needed since while the target files
+# may be split in multiple packages, the debug files for one recipe are all in
+# one package.
+PACKAGE_DEBUG_FILE_SUFFIX ??= ""
+
 def legitimize_package_name(s):
     """
     Make sure package names are legitimate strings
@@ -1117,6 +1125,9 @@ python split_and_strip_files () {
         debugstaticlibdir = ""
         debugsrcdir = "/usr/src/debug"
 
+    debugappend += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
+    debugstaticappend += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
+
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index f63f4b223a..ad49410249 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -311,6 +311,7 @@ PACKAGE_ARCH[doc] = "The architecture of the resulting package or packages."
 PACKAGE_ARCHS[doc] = "A list of architectures compatible with the given target in order of priority."
 PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN} so that the packages can pick up files that would normally be included in the default package."
 PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
+PACKAGE_DEBUG_FILE_SUFFIX[doc] = "This suffix is added to the names of all files with debug symbols in the dbg package."
 PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed package is required, an error is generated."
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."

