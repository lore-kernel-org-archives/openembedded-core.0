Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 55E626010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:25:52 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAIAPr56031601 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 04:25:53 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015111804255296-105942 ;
	Wed, 18 Nov 2015 04:25:52 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 12:25:50 +0200
Message-Id: <e54ec1320521a08198512388736dbf21e832fe94.1447842013.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c9daa8b45c30f25d7b50c6a7df028de706809c21.1447773614.git.adrian.ratiu@ni.com>
References: <c9daa8b45c30f25d7b50c6a7df028de706809c21.1447773614.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/18/2015 04:25:53 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/18/2015 04:25:53 AM,
	Serialize complete at 11/18/2015 04:25:53 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-18_06:, , signatures=0
Subject: [oe][PATCH v2 1/2] package_ipk: support signing of ipk packages
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
X-List-Received-Date: Wed, 18 Nov 2015 10:25:53 -0000

Minimum required opkg version: 3.0 (already in master/jethro).

Add a new bbclass for creating signatures for ipk files.
The signing process is very similar to the existing rpm signing,
but different in some important ways:
    - Signatures are stored outside the ipk files, opkg connects
to a feed server and downloads them as separate files which are
used to verify ipk's. These files go everywhere alongside the ipk.
    - Signatures can be of two types: binary (.sig) and ascii-armored
(.asc). By default OE and opkg use binary, can be configured by using
IPK_SIGNATURE_TYPE (in OE) and "option signature_type gpg-asc" in
opkg.
    - The public key is stored on device and the keyring managed
by the opkg-keyrings package. See its recipe for more details.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/package_ipk.bbclass |  6 ++++
 meta/classes/sign_ipk.bbclass    | 73 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/classes/sign_ipk.bbclass

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4dd7a7e..c491b67 100644
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
index 0000000..a4f1f3a
--- /dev/null
+++ b/meta/classes/sign_ipk.bbclass
@@ -0,0 +1,73 @@
+# Class for generating signed IPK packages.
+#
+# Configuration variables used by this class:
+# IPK_GPG_PASSPHRASE_FILE
+#           Path to a file containing the passphrase of the signing key.
+# IPK_GPG_NAME
+#           Name of the key to sign with.
+# IPK_SIGNATURE_TYPE
+#           Optional type of signature to accompany IPK files, can be:
+#                     1. Ascii armored (ASC)
+#                     2. Binary (BIN), default
+# GPG_BIN
+#           Optional variable for specifying the gpg binary/wrapper to use for
+#           signing.
+#
+
+inherit sanity
+
+IPK_SIGN_PACKAGES = '1'
+
+def ipksign_wrapper(d, ipk_file, passphrase, gpg_name=None, sigtype="BIN"):
+    import subprocess
+    from subprocess import Popen
+
+    keypipe = os.pipe()
+    os.write(keypipe[1], passphrase + '\n')
+
+    # use gpg from host PATH if user did not define a specific binary
+    cmd = [d.getVar('GPG_BIN', True) or bb.utils.which(os.getenv('PATH'), "gpg")]
+
+    if gpg_name:
+        cmd += ["-q", "--batch", "--yes", "-b", "-u", gpg_name]
+    else:
+        raise_sanity_error("You need to define IPK_GPG_NAME in bitbake config", d)
+
+    # transmit using pipes for security
+    cmd += ["--passphrase-fd",  str(keypipe[0])]
+
+    # ascii armored or binary signatures
+    if sigtype.lower() == "ASC".lower():
+        cmd += ["-a"]
+    elif sigtype.lower() != "BIN".lower():
+        raise_sanity_error("Invalid IPK_SIGNATURE_TYPE in bitbake config", d)
+
+    cmd += [ipk_file]
+
+    p = Popen(cmd, stdin=subprocess.PIPE)
+    p.wait()
+
+    os.close(keypipe[1])
+    os.close(keypipe[0])
+
+    return p.returncode
+
+
+python sign_ipk () {
+    ipk_gpg_pass_file = (d.getVar("IPK_GPG_PASSPHRASE_FILE", True) or "")
+    if ipk_gpg_pass_file:
+        with open(ipk_gpg_pass_file) as fobj:
+            ipk_gpg_passphrase = fobj.readlines()[0].rstrip('\n')
+    else:
+        raise_sanity_error("You need to define IPK_GPG_PASSPHRASE_FILE in the config", d)
+
+    ipk_gpg_name = (d.getVar("IPK_GPG_NAME", True) or "")
+
+    ipk_file = d.getVar('IPK_TO_SIGN')
+    bb.debug(1, 'IPK_TO_SIGN: %s' % ipk_file)
+
+    sigtype = (d.getVar("IPK_SIGNATURE_TYPE", True) or "")
+
+    if ipksign_wrapper(d, ipk_file, ipk_gpg_passphrase, ipk_gpg_name, sigtype) != 0:
+        raise bb.build.FuncFailed("IPK signing failed")
+}
-- 
2.1.4


