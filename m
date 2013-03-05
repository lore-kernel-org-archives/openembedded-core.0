Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UCiDO-0005Hg-PP
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 04:06:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r252oP5i007245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Mar 2013 18:50:25 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 4 Mar 2013 18:50:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2013 10:50:15 +0800
Message-ID: <4a98459d738716c4a6ff236452687352c0913458.1362398320.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362398320.git.hongxu.jia@windriver.com>
References: <cover.1362398320.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] sanity.bbclass:check if necessary to add march to BUILD_CFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 03:06:57 -0000
Content-Type: text/plain

1, There are a set of GCC built-in functions for atomic memory access. The
definition given in the Intel documentation allows only for the use of the
types int, long, long long as well as their unsigned counterparts. GCC will
allow any integral scalar or pointer type that is 1, 2, 4, 8 or 16 bytes in
length, suffix `_n' where n is the size of the data type.Such as:
__sync_fetch_and_add_n
__sync_fetch_and_sub_n
__sync_fetch_and_or_n
__sync_fetch_and_and_n
__sync_fetch_and_xor_n
__sync_fetch_and_nand_n
The above builtins are intended to be compatible with those described in the
Intel Itanium Processor-specific Application Binary Interface, section 7.4.

2, The glib-2.0-native and qemu-native invoke the above builtin function with
suffix `_4', and glib-2.0-native uses __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 to
test the existance.

3, Not all above builtin functions are supported by all target processors.Such
as i386 does not support the functions with suffix `_4', but i486 or later
support.

4, Prior to GCC 4.5, on the Intel's processor, the default arch is i386 unless
GCC is built with the --with-arch switch. Since GCC 4.5 the default arch is
implied by the target.

5, If your host GCC is older than 4.5 and it is built without the --with-arch
switch, when you use the GCC to compile target, you should specify -march to
tell GCC what the target's arch is, otherwise i386 is used as default.

Above all, when use older GCC to compile glib-2.0-native or glib-2.0-native,
and the GCC incorrectly uses i386 as default, the above builtin function
with suffix `_4' is not referenced. We should have a check in sanity.bbclass
to tell the user if necessary to add march to BUILD_CFLAGS in this situation.

http://gcc.gnu.org/onlinedocs/gcc-4.7.2/gcc/_005f_005fsync-Builtins.html#_005f_005fsync-Builtins
http://gcc.gnu.org/ml/gcc-help/2009-06/msg00037.html
http://gcc.gnu.org/gcc-4.5/changes.html
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47460
http://llvm.org/bugs/show_bug.cgi?id=11174
http://download.intel.com/design/itanium/downloads/245370.pdf

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sanity.bbclass |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 06e95e3..8cdb06e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -309,6 +309,31 @@ def check_sanity_validmachine(sanity_data):
 
     return messages
 
+# Checks if necessary to add option march to host gcc
+def check_gcc_march(sanity_data):
+    result = False
+
+    # Check if -march not in BUILD_CFLAGS
+    if sanity_data.getVar("BUILD_CFLAGS",True).find("-march") < 0:
+
+        # Construct a test file
+        f = file("gcc_test.c", "w")
+        f.write("int main (){ __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4; return 0;}\n")
+        f.close()
+        import commands
+
+        # Check if GCC could work without march
+        status,result = commands.getstatusoutput("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test")
+        if status != 0:
+            # Check if GCC could work with march
+            status,result = commands.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
+            if status == 0:
+                result =  True
+
+        os.remove("gcc_test.c")
+        os.remove("gcc_test")
+
+    return result
 
 def check_sanity(sanity_data):
     import subprocess
@@ -416,6 +441,10 @@ def check_sanity(sanity_data):
         if not check_app_exists("qemu-arm", sanity_data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
+    if check_gcc_march(sanity_data):
+        messages = messages + "Your gcc version is older than 4.5, please add the following param to local.conf\n \
+        BUILD_CFLAGS_append = \" -march=native\"\n"
+
     paths = sanity_data.getVar('PATH', True).split(":")
     if "." in paths or "" in paths:
         messages = messages + "PATH contains '.' or '' (empty element), which will break the build, please remove this.\n"
-- 
1.7.10.4



