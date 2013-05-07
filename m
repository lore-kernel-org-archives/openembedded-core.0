Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj1-0007ka-NA
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgdC005214; Tue, 7 May 2013 13:58:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QXaaxaUJKDug; Tue,  7 May 2013 13:58:44 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwdIk005191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:40 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRH-0005cE-Ds; Tue, 07 May 2013 13:56:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:56:01 +0100
Message-Id: <1367931368-21504-9-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/15] sanity.bbclass: Use open(), not file()
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
X-List-Received-Date: Tue, 07 May 2013 13:15:51 -0000

file() syntax is removed in python 3, use open() instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d4a8f5e..63ea079 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -232,7 +232,7 @@ def check_create_long_filename(filepath, pathname):
     try:
         if not os.path.exists(filepath):
             bb.utils.mkdirhier(filepath)
-        f = file(testfile, "w")
+        f = open(testfile, "w")
         f.close()
         os.remove(testfile)
     except IOError as e:
@@ -339,7 +339,7 @@ def check_gcc_march(sanity_data):
     if sanity_data.getVar("BUILD_CFLAGS",True).find("-march") < 0:
 
         # Construct a test file
-        f = file("gcc_test.c", "w")
+        f = open("gcc_test.c", "w")
         f.write("int main (){ __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4; return 0;}\n")
         f.close()
         import commands
@@ -562,7 +562,7 @@ def check_sanity(sanity_data):
     last_sstate_dir = ""
     sanityverfile = 'conf/sanity_info'
     if os.path.exists(sanityverfile):
-        f = file(sanityverfile, 'r')
+        f = open(sanityverfile, 'r')
         for line in f:
             if line.startswith('SANITY_VERSION'):
                 last_sanity_version = int(line.split()[1])
@@ -585,7 +585,7 @@ def check_sanity(sanity_data):
         if last_sstate_dir != sstate_dir:
             messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
     if os.path.exists("conf") and not messages:
-        f = file(sanityverfile, 'w')
+        f = open(sanityverfile, 'w')
         f.write("SANITY_VERSION %s\n" % sanity_version) 
         f.write("TMPDIR %s\n" % tmpdir) 
         f.write("SSTATE_DIR %s\n" % sstate_dir) 
@@ -595,13 +595,13 @@ def check_sanity(sanity_data):
     #
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
     if os.path.exists(checkfile):
-        f = file(checkfile, "r")
+        f = open(checkfile, "r")
         saved_tmpdir = f.read().strip()
         if (saved_tmpdir != tmpdir):
             messages = messages + "Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir
     else:
         bb.utils.mkdirhier(tmpdir)
-        f = file(checkfile, "w")
+        f = open(checkfile, "w")
         f.write(tmpdir)
     f.close()
 
@@ -611,17 +611,17 @@ def check_sanity(sanity_data):
     current_abi = sanity_data.getVar('OELAYOUT_ABI', True)
     abifile = sanity_data.getVar('SANITY_ABIFILE', True)
     if os.path.exists(abifile):
-        f = file(abifile, "r")
+        f = open(abifile, "r")
         abi = f.read().strip()
         if not abi.isdigit():
-            f = file(abifile, "w")
+            f = open(abifile, "w")
             f.write(current_abi)
         elif abi == "2" and current_abi == "3":
             bb.note("Converting staging from layout version 2 to layout version 3")
             subprocess.call(sanity_data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"), shell=True)
             subprocess.call(sanity_data.expand("ln -s sysroots ${TMPDIR}/staging"), shell=True)
             subprocess.call(sanity_data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"), shell=True)
-            f = file(abifile, "w")
+            f = open(abifile, "w")
             f.write(current_abi)
         elif abi == "3" and current_abi == "4":
             bb.note("Converting staging layout from version 3 to layout version 4")
@@ -629,14 +629,14 @@ def check_sanity(sanity_data):
                 subprocess.call(sanity_data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=True)
                 subprocess.call(sanity_data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), shell=True)
 
-            f = file(abifile, "w")
+            f = open(abifile, "w")
             f.write(current_abi)
         elif abi == "4":
             messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
         elif abi == "5" and current_abi == "6":
             bb.note("Converting staging layout from version 5 to layout version 6")
             subprocess.call(sanity_data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"), shell=True)
-            f = file(abifile, "w")
+            f = open(abifile, "w")
             f.write(current_abi)
         elif abi == "7" and current_abi == "8":
             messages = messages + "Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n"
@@ -646,7 +646,7 @@ def check_sanity(sanity_data):
             # Code to convert from one ABI to another could go here if possible.
             messages = messages + "Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi)
     else:
-        f = file(abifile, "w")
+        f = open(abifile, "w")
         f.write(current_abi)
     f.close()
 
-- 
1.7.10.4



