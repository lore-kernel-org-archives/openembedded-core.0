Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0BE6AF6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 19:56:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6FJuwiL024721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 12:56:58 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 12:56:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 15:10:26 -0500
Message-ID: <1373919029-19108-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1373919029-19108-1-git-send-email-mark.hatle@windriver.com>
References: <1373919029-19108-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/4] sanity.bbclass: Update gcc sanity check
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
X-List-Received-Date: Mon, 15 Jul 2013 19:56:58 -0000
Content-Type: text/plain

The gcc sanity check should be checking for the atomic function directly
instead of using the gcc macro.  Older versions of gcc do not have the macro
defined, but do support the atomic operations.  (glib-2.0 checks for both
the macro and the function, as long as one is available it will successfully
compile.)

Update the check to try both -mcpu=native and -mcpu=BUILD_ARCH.  Tell the user
which version worked properly.

[YOCTO #4845]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/sanity.bbclass | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b190eb2..a505a5d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -280,31 +280,42 @@ def check_sanity_validmachine(sanity_data):
 
 # Checks if necessary to add option march to host gcc
 def check_gcc_march(sanity_data):
-    result = False
+    result = True
+    message = ""
 
     # Check if -march not in BUILD_CFLAGS
     if sanity_data.getVar("BUILD_CFLAGS",True).find("-march") < 0:
+        result = False
 
         # Construct a test file
         f = open("gcc_test.c", "w")
-        f.write("int main (){ __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4; return 0;}\n")
+        f.write("int main (){ volatile int atomic = 2; __sync_bool_compare_and_swap (&atomic, 2, 3); return 0; }\n")
         f.close()
 
         # Check if GCC could work without march
-        status,result = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test")
-        if status != 0:
-            # Check if GCC could work with march
-            status,result = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
-            if status != 0: 
-                result = True
-            else:
-                result = False
+        if not result:
+            status,res = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test")
+            if status == 0:
+                result = True;
+
+        if not result:
+            status,res = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
+            if status == 0:
+                message = "BUILD_CFLAGS_append = \" -march=native\""
+                result = True;
+
+        if not result:
+            build_arch = sanity_data.getVar('BUILD_ARCH', True)
+            status,res = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=%s gcc_test.c -o gcc_test" % build_arch)
+            if status == 0:
+                message = "BUILD_CFLAGS_append = \" -march=%s\"" % build_arch
+                result = True;
 
         os.remove("gcc_test.c")
         if os.path.exists("gcc_test"):
             os.remove("gcc_test")
 
-    return result
+    return (result, message)
 
 # Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
 # Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
@@ -506,9 +517,14 @@ def check_sanity_version_change(status, d):
         if not check_app_exists("qemu-arm", d):
             status.addresult("qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH")
 
-    if check_gcc_march(d):
+    (result, message) = check_gcc_march(d)
+    if result and message:
         status.addresult("Your gcc version is older than 4.5, please add the following param to local.conf\n \
-        BUILD_CFLAGS_append = \" -march=native\"\n")
+        %s\n" % message)
+    if not result:
+        status.addresult("Your gcc version is older then 4.5 or is not working properly.  Please verify you can build")
+        status.addresult(" and link something that uses atomic operations, such as: \n")
+        status.addresult("        __sync_bool_compare_and_swap (&atomic, 2, 3);\n")
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     tmpdir = d.getVar('TMPDIR', True)
-- 
1.8.3


