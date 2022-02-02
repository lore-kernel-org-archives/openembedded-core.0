Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8944C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 01:59:58 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.58096.1643767197237197926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 17:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=asrJwHYe;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643767197;
  x=1675303197;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hY71pWerMNibfr8QvMdA84awOgU3ROnfy0CreqTE0q8=;
  b=asrJwHYel+FnZMbbUdc7X/ihzBLoVuCRo7dbJDe6HN47wC6Gx0OVRxur
   w9gkNT0e5deSsSI/iJS9ho0Xnt0LM1dyCfaxBfq/CN97CGFrzwh5GHAYK
   3WZXlUTavS6cDHuzbJoMBjVMp2CJcBPhraeEWuQL5pE5VnPsI8bG4z2vT
   ePgY1zBbUxE7K4AUZOQ+RL1b2ry+PJCxJgUoIcwvOVVS2OPfgb/OTsLTd
   OqT1htwMz2siYVDKt5QFU5ecaSAXK+NtgjU+d6DQ5219V3X2cB3DefOAc
   9ymcUE0FKO8dEBtJ3mI2MAnrDELB+XiqQONox6ZQnXmKdS3WKvT5OcZvv
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] package.bbclass: Split out package_debug_vars from
 split_and_strip_files
Date: Wed, 2 Feb 2022 02:59:48 +0100
Message-ID: 
 <5f76ceb2f372085c691d01ed375a8d8b18c797d0.1643766962.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1643766962.git.pkj@axis.com>
References: <cover.1643766962.git.pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 01:59:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161172

The split_and_strip_files() function is big and hard to follow. This
takes a small step to improve that by splitting out the part that sets
up the variables used to implement the various debug splitting methods
specified by PACKAGE_DEBUG_SPLIT_STYLE.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4927fb99ff..545471468c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1065,17 +1065,7 @@ python fixup_perms () {
                     fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
 }
 
-python split_and_strip_files () {
-    import stat, errno
-    import subprocess
-
-    dvar = d.getVar('PKGD')
-    pn = d.getVar('PN')
-    hostos = d.getVar('HOST_OS')
-
-    oldcwd = os.getcwd()
-    os.chdir(dvar)
-
+def package_debug_vars(d):
     # We default to '.debug' style
     if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
         # Single debug-file-directory style debug info
@@ -1113,6 +1103,23 @@ python split_and_strip_files () {
         debugstaticlibdir = ""
         debugsrcdir = "/usr/src/debug"
 
+    return (debugappend, debugstaticappend, debugdir, debugstaticdir,
+            debuglibdir, debugstaticlibdir, debugsrcdir)
+
+python split_and_strip_files () {
+    import stat, errno
+    import subprocess
+
+    dvar = d.getVar('PKGD')
+    pn = d.getVar('PN')
+    hostos = d.getVar('HOST_OS')
+
+    oldcwd = os.getcwd()
+    os.chdir(dvar)
+
+    debugappend, debugstaticappend, debugdir, debugstaticdir, \
+    debuglibdir, debugstaticlibdir, debugsrcdir = package_debug_vars(d)
+
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #

