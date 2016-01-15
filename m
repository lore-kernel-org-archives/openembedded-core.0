Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C034731F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FCtZa6020701 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:55:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fm17h2aLUeON
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:55:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FCtU06020698
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:55:31 GMT
Message-ID: <1452862530.28375.152.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 12:55:30 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] insane: Start to clean up do_configure_qa code
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
X-List-Received-Date: Fri, 15 Jan 2016 12:55:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This cleans up the do_configure_qa code so that the exit status from
package_qa_handle_error is handled correctly.

It also converts package_qa_check_license to use our standard QA check
configuration interface through package_qa_handle_error rather than
a mix of return values, bb.fatal and bb.build.FuncFailed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 16f5a47..cb65813 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -38,6 +38,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
+            license-checksum \
             "
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
@@ -637,6 +638,7 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
             if target.startswith(tmpdir):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
                 messages["symlink-to-sysroot"] = "Symlink %s in %s points to TMPDIR" % (trimmed, name)
+
 def package_qa_check_license(workdir, d):
     """
     Check for changes in the license files 
@@ -649,11 +651,11 @@ def package_qa_check_license(workdir, d):
     pn = d.getVar('PN', True)
 
     if lic == "CLOSED":
-        return True
+        return
 
     if not lic_files:
-        bb.error(pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)")
-        return False
+        package_qa_handle_error("license-checksum", pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)", d)
+        return
 
     srcdir = d.getVar('S', True)
 
@@ -661,10 +663,12 @@ def package_qa_check_license(workdir, d):
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
+            package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
+            continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
+            package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
+            continue
 
         recipemd5 = parm.get('md5', '')
         beginline, endline = 0, 0
@@ -699,8 +703,8 @@ def package_qa_check_license(workdir, d):
             bb.note (pn + ": md5 checksum matched for ", url)
         else:
             if recipemd5:
-                bb.error(pn + ": md5 data is not matching for ", url)
-                bb.error(pn + ": The new md5 checksum is ", md5chksum)
+                msg = pn + ": The LIC_FILES_CHKSUM does not match for " + url
+                msg = msg + "\n" + pn + ": The new md5 checksum is " + md5chksum
                 if beginline:
                     if endline:
                         srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
@@ -710,13 +714,12 @@ def package_qa_check_license(workdir, d):
                     srcfiledesc = "%s (ending on line %d)" % (srclicfile, endline)
                 else:
                     srcfiledesc = srclicfile
-                bb.error(pn + ": Check if the license information has changed in %s to verify that the LICENSE value \"%s\" remains valid" % (srcfiledesc, lic))
-            else:
-                bb.error(pn + ": md5 checksum is not specified for ", url)
-                bb.error(pn + ": The md5 checksum is ", md5chksum)
-            sane = False
+                msg = msg + "\n" + pn + ": Check if the license information has changed in %s to verify that the LICENSE value \"%s\" remains valid" % (srcfiledesc, lic)
 
-    return sane
+            else:
+                msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
+                msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
+            package_qa_handle_error("license-checksum", msg, d)
 
 def package_qa_check_staged(path,d):
     """
@@ -1166,8 +1169,7 @@ Missing inherit gettext?""" % (gt, config))
     # Check license variables
     ###########################################################################
 
-    if not package_qa_check_license(workdir, d):
-        bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
+    package_qa_check_license(workdir, d)
 
     ###########################################################################
     # Check unrecognised configure options (with a white list)
@@ -1199,6 +1201,10 @@ Missing inherit gettext?""" % (gt, config))
                 pn = d.getVar('PN', True)
                 error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
                 package_qa_handle_error("invalid-packageconfig", error_msg, d)
+
+    qa_sane = d.getVar("QA_SANE", True)
+    if not qa_sane:
+        bb.fatal("Fatal QA errors found, failing task.")
 }
 
 python do_qa_unpack() {



