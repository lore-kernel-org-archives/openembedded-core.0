Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFF673169
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:22:43 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u19EMiL3020917 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 08:22:44 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020908224414-790917 ;
	Tue, 9 Feb 2016 08:22:44 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 9 Feb 2016 16:22:27 +0200
Message-Id: <7e1091f120d92bef7752d113f96d92ccef53186c.1455027565.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455027565.git.adrian.ratiu@ni.com>
References: <cover.1455027565.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/09/2016 08:22:44 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/09/2016 08:22:44 AM,
	Serialize complete at 02/09/2016 08:22:44 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-09_09:, , signatures=0
Subject: [PATCH v4 2/3] gpg_sign: add local ipk package signing functionality
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
X-List-Received-Date: Tue, 09 Feb 2016 14:22:43 -0000

Implement local ipk signing logic inside the gpg backend and add a new
bbclass which configures signing similar to how rpm does it.

The ipk signing process is a bit different from rpm:
    - Signatures are stored outside ipk files; opkg connects to a feed
server and downloads them to verify a package.
    - Signatures are of two types (both supported by opkg): binary or
ascii armoured. By default we sign using ascii armoured.
    - Public keys are stored on targets to verify ipks using the
opkg-keyrings recipe.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/package_ipk.bbclass |  6 +++++
 meta/classes/sign_ipk.bbclass    | 53 ++++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/gpg_sign.py          | 38 ++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta/classes/sign_ipk.bbclass

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 51bee28..4f5bbd0 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -246,6 +246,12 @@ python do_package_ipk () {
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("opkg-build execution failed")
 
+        if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
+            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH', True))
+            d.setVar('IPK_TO_SIGN', ipk_to_sign)
+            bb.build.exec_func("sign_ipk", d)
+
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
new file mode 100644
index 0000000..d301413
--- /dev/null
+++ b/meta/classes/sign_ipk.bbclass
@@ -0,0 +1,53 @@
+# Class for generating signed IPK packages.
+#
+# Configuration variables used by this class:
+# IPK_GPG_PASSPHRASE_FILE
+#           Path to a file containing the passphrase of the signing key.
+# IPK_GPG_NAME
+#           Name of the key to sign with.
+# IPK_GPG_BACKEND
+#           Optional variable for specifying the backend to use for signing.
+#           Currently the only available option is 'local', i.e. local signing
+#           on the build host.
+# IPK_GPG_SIGNATURE_TYPE
+#           Optional variable for specifying the type of gpg signatures, can be:
+#                     1. Ascii armored (ASC), default if not set
+#                     2. Binary (BIN)
+# GPG_BIN
+#           Optional variable for specifying the gpg binary/wrapper to use for
+#           signing.
+# GPG_PATH
+#           Optional variable for specifying the gnupg "home" directory:
+#
+
+inherit sanity
+
+IPK_SIGN_PACKAGES = '1'
+IPK_GPG_BACKEND ?= 'local'
+IPK_GPG_SIGNATURE_TYPE ?= 'ASC'
+
+python () {
+    # Check configuration
+    for var in ('IPK_GPG_NAME', 'IPK_GPG_PASSPHRASE_FILE'):
+        if not d.getVar(var, True):
+            raise_sanity_error("You need to define %s in the config" % var, d)
+
+    sigtype = d.getVar("IPK_GPG_SIGNATURE_TYPE", True)
+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
+        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
+}
+
+python sign_ipk () {
+    from oe.gpg_sign import get_signer
+
+    ipk_file = d.getVar('IPK_TO_SIGN')
+    bb.debug(1, 'Signing ipk: %s' % ipk_file)
+
+    signer = get_signer(d,
+                        d.getVar('IPK_GPG_BACKEND', True),
+                        d.getVar('IPK_GPG_NAME', True),
+                        d.getVar('IPK_GPG_PASSPHRASE_FILE', True),
+                        d.getVar('IPK_GPG_SIGNATURE_TYPE', True))
+
+    signer.sign_ipk(ipk_file)
+}
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index d971d32..ff40cdd 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -1,5 +1,6 @@
 """Helper module for GPG signing"""
 import os
+import sys
 
 import bb
 import oe.utils
@@ -55,6 +56,43 @@ class LocalSigner(object):
             bb.error('rpmsign failed: %s' % proc.before.strip())
             raise bb.build.FuncFailed("Failed to sign RPM packages")
 
+    def sign_ipk(self, ipkfile):
+        """Sign IPK files"""
+        import subprocess
+        from subprocess import Popen
+
+        cmd = [self.gpg_bin, "-q", "--batch", "--yes", "-b", "-u", self.keyid]
+        if self.gpg_path:
+            cmd += ["--homedir", self.gpg_path]
+        if self.gpg_sig_type == "ASC":
+            cmd += ["-a"]
+
+        try:
+            keypipe = os.pipe()
+
+            # Need to add '\n' in case the passfile does not have it
+            with open(self.passphrase_file) as fobj:
+                os.write(keypipe[1], fobj.readline() + '\n')
+
+            cmd += ["--passphrase-fd",  str(keypipe[0])]
+            cmd += [ipkfile]
+
+            gpg_proc = Popen(cmd, stdin=subprocess.PIPE)
+            gpg_proc.wait()
+
+            os.close(keypipe[1]);
+            os.close(keypipe[0]);
+
+        except IOError as e:
+            bb.error("IO error ({0}): {1}".format(e.errno, e.strerror))
+            raise bb.build.FuncFailed("Failed to sign IPK packages")
+        except OSError as e:
+            bb.error("OS error ({0}): {1}".format(e.errno, e.strerror))
+            raise bb.build.FuncFailed("Failed to sign IPK packages")
+        except:
+            bb.error("Unexpected error: {1}".format(sys.exc_info()[0]))
+            raise bb.build.FuncFailed("Failed to sign IPK packages")
+
     def detach_sign(self, input_file):
         """Create a detached signature of a file"""
         cmd = "%s --detach-sign --armor --batch --no-tty --yes " \
-- 
2.7.0


