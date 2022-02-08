Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886CEC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:53:56 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.12947.1644335635256080573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=X4FS7FX+;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644335636;
  x=1675871636;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=veUurRHJw4J3DfNtnLEsdyFiwYRTC4G68rIpdud5ka0=;
  b=X4FS7FX+r/TS4U4ntp8eVHst8Uq8vYZzdnJ3vuFtutGOalujt2VgB6bw
   4N1mh00N16DX6GF3GX0ofjUT1RN/3oW+6BwY4v6A2fzFuy4SQL2+a9Uql
   0sn9oEtueGZaGwTlDb9L6BXi7hAs9vZzbEuVR5B1aExZKUBB+1I5A1kW4
   EbamgVrTSCWYezRN2SKqX/y1IRvniYHQ3x45a0/VxlmgubAevrOkCbx02
   HZJM2xr4AAuN2aTh25gxc8tTPZnsJDvqbZuhQVqZUmVc3haSYgysvqWXV
   Y0ZcRKIoj0UdPvcr84jkEXbkouvk8gWrIMTHw7q5UiUmWGYZsyAHKStC7
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH 1/3] package: Split out package_debug_vars from
 split_and_strip_files
Date: Tue, 8 Feb 2022 16:53:49 +0100
Message-ID: <20220208155351.11582-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:53:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161519

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The split_and_strip_files() function is big and hard to follow. This
takes a small step to improve that by splitting out the part that sets
up the variables used to implement the various debug splitting methods
specified by PACKAGE_DEBUG_SPLIT_STYLE.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 985dfacd09..31e89ff37d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1069,17 +1069,7 @@ python fixup_perms () {
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
@@ -1117,6 +1107,23 @@ python split_and_strip_files () {
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

