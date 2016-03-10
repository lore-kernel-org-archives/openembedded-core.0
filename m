Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA597316D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:03:20 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2AA3Krc021063; Thu, 10 Mar 2016 04:03:20 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031004032034-1226945 ;
	Thu, 10 Mar 2016 04:03:20 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:02:55 +0200
Message-Id: <9e70ccc11c1c106a1012587b6225fe02ba21e0ce.1457603028.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <cover.1457603028.git.adrian.ratiu@ni.com>
References: <cover.1457603028.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/10/2016 04:03:20 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/10/2016 04:03:20 AM,
	Serialize complete at 03/10/2016 04:03:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-10_07:, , signatures=0
Subject: [PATCH v8 1/6] gpg_sign: add local ipk package signing functionality
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
X-List-Received-Date: Thu, 10 Mar 2016 10:03:21 -0000

Implement ipk signing inside the sign_ipk bbclass using the gpg_sign
module and configure signing similar to how rpm does it. sign_ipk uses
gpg_sign's detach_sign because its functionality is identical to package
feed signing.

IPK signing process is a bit different from rpm:
    - Signatures are stored outside ipk files; opkg connects to a feed
server and downloads them to verify a package.
    - Signatures are of two types (both supported by opkg): binary or
ascii armoured. By default we sign using ascii armoured.
    - Public keys are stored on targets to verify ipks using the
opkg-keyrings recipe.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/package_ipk.bbclass |  5 ++++
 meta/classes/sign_ipk.bbclass    | 52 ++++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/gpg_sign.py          | 38 +++++++++++++++++++----------
 3 files changed, 83 insertions(+), 12 deletions(-)
 create mode 100644 meta/classes/sign_ipk.bbclass

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 51bee28..f1ad1d5 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -246,6 +246,11 @@ python do_package_ipk () {
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("opkg-build execution failed")
 
+        if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
+            ipkver = "%s-%s" % (d.getVar('PKGV', True), d.getVar('PKGR', True))
+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH', True))
+            sign_ipk(d, ipk_to_sign)
+
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
new file mode 100644
index 0000000..a481f6d
--- /dev/null
+++ b/meta/classes/sign_ipk.bbclass
@@ -0,0 +1,52 @@
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
+def sign_ipk(d, ipk_to_sign):
+    from oe.gpg_sign import get_signer
+
+    bb.debug(1, 'Signing ipk: %s' % ipk_to_sign)
+
+    signer = get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
+    sig_type = d.getVar('IPK_GPG_SIGNATURE_TYPE', True)
+    is_ascii_sig = (sig_type.upper() != "BIN")
+
+    signer.detach_sign(ipk_to_sign,
+                       d.getVar('IPK_GPG_NAME', True),
+                       d.getVar('IPK_GPG_PASSPHRASE_FILE', True),
+                       armor=is_ascii_sig)
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ada1b2f..059381d 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -50,6 +50,7 @@ class LocalSigner(object):
             bb.error('rpmsign failed: %s' % proc.before.strip())
             raise bb.build.FuncFailed("Failed to sign RPM packages")
 
+
     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
         """Create a detached signature of a file"""
         import subprocess
@@ -58,22 +59,35 @@ class LocalSigner(object):
             raise Exception("You should use either passphrase_file of passphrase, not both")
 
         cmd = [self.gpg_bin, '--detach-sign', '--batch', '--no-tty', '--yes',
-               '-u', keyid]
-        if passphrase_file:
-            cmd += ['--passphrase-file', passphrase_file]
-        else:
-            cmd += ['--passphrase-fd', '0']
+               '--passphrase-fd', '0', '-u', keyid]
+
         if self.gpg_path:
             cmd += ['--homedir', self.gpg_path]
         if armor:
             cmd += ['--armor']
-        cmd.append(input_file)
-        job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
-                               stderr=subprocess.PIPE)
-        _, stderr = job.communicate(passphrase)
-        if job.returncode:
-            raise bb.build.FuncFailed("Failed to create signature for '%s': %s" %
-                                      (input_file, stderr))
+
+        cmd += [input_file]
+
+        try:
+            if passphrase_file:
+                with open(passphrase_file) as fobj:
+                    passphrase = fobj.readline();
+
+            job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
+            (_, stderr) = job.communicate(passphrase)
+
+            if job.returncode:
+                raise bb.build.FuncFailed("GPG exited with code %d: %s" %
+                                          (job.returncode, stderr))
+
+        except IOError as e:
+            bb.error("IO error (%s): %s" % (e.errno, e.strerror))
+            raise Exception("Failed to sign '%s'" % input_file)
+
+        except OSError as e:
+            bb.error("OS error (%s): %s" % (e.errno, e.strerror))
+            raise Exception("Failed to sign '%s" % input_file)
+
 
     def verify(self, sig_file):
         """Verify signature"""
-- 
2.7.2


