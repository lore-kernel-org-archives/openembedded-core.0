Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 744F47316B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:04:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 Feb 2016 01:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="905859872"
Received: from kgbrenna-mobl2.ger.corp.intel.com (HELO [10.252.31.197])
	([10.252.31.197])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2016 01:04:24 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.150701
Date: Thu, 18 Feb 2016 11:04:22 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <288A0A62-7C71-4386-A4EA-FC03B4D6A05B@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 1/3] gpg_sign: add local ipk package signing
	functionality
References: <cover.1455721437.git.adrian.ratiu@ni.com>
	<4f6d1557ea54d7fb7453684b79bf458547f3035f.1455721437.git.adrian.ratiu@ni.com>
In-Reply-To: <4f6d1557ea54d7fb7453684b79bf458547f3035f.1455721437.git.adrian.ratiu@ni.com>
Mime-version: 1.0
Subject: Re: [PATCH v5 1/3] gpg_sign: add local ipk package signing functionality
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
X-List-Received-Date: Thu, 18 Feb 2016 09:04:27 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi,



On 17/02/16 17:41, "Ioan-Adrian Ratiu" <openembedded-core-bounces@lists.openembedded.org on behalf of adrian.ratiu@ni.com> wrote:

>Implement local ipk signing logic inside the gpg backend and add a new
>bbclass which configures signing similar to how rpm does it.
>
>The ipk signing process is a bit different from rpm:
>    - Signatures are stored outside ipk files; opkg connects to a feed
>server and downloads them to verify a package.
>    - Signatures are of two types (both supported by opkg): binary or
>ascii armoured. By default we sign using ascii armoured.
>    - Public keys are stored on targets to verify ipks using the
>opkg-keyrings recipe.
>
>Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>---
> meta/classes/package_ipk.bbclass |  6 +++++
> meta/classes/sign_ipk.bbclass    | 55 ++++++++++++++++++++++++++++++++++++++++
> meta/lib/oe/gpg_sign.py          | 39 ++++++++++++++++++++++++++++
> 3 files changed, 100 insertions(+)
> create mode 100644 meta/classes/sign_ipk.bbclass
>
>diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
>index 51bee28..4f5bbd0 100644
>--- a/meta/classes/package_ipk.bbclass
>+++ b/meta/classes/package_ipk.bbclass
>@@ -246,6 +246,12 @@ python do_package_ipk () {
>             bb.utils.unlockfile(lf)
>             raise bb.build.FuncFailed("opkg-build execution failed")
> 
>+        if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
>+            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
>+            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname, ipkver, d.getVar('PACKAGE_ARCH', True))
>+            d.setVar('IPK_TO_SIGN', ipk_to_sign)
>+            bb.build.exec_func("sign_ipk", d)
>+
>         cleanupcontrol(root)
>         bb.utils.unlockfile(lf)
> 
>diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclass
>new file mode 100644
>index 0000000..cb22bb4
>--- /dev/null
>+++ b/meta/classes/sign_ipk.bbclass
>@@ -0,0 +1,55 @@
>+# Class for generating signed IPK packages.
>+#
>+# Configuration variables used by this class:
>+# IPK_GPG_PASSPHRASE_FILE
>+#           Path to a file containing the passphrase of the signing key.
>+# IPK_GPG_NAME
>+#           Name of the key to sign with.
>+# IPK_GPG_BACKEND
>+#           Optional variable for specifying the backend to use for signing.
>+#           Currently the only available option is 'local', i.e. local signing
>+#           on the build host.
>+# IPK_GPG_SIGNATURE_TYPE
>+#           Optional variable for specifying the type of gpg signatures, can be:
>+#                     1. Ascii armored (ASC), default if not set
>+#                     2. Binary (BIN)
>+# GPG_BIN
>+#           Optional variable for specifying the gpg binary/wrapper to use for
>+#           signing.
>+# GPG_PATH
>+#           Optional variable for specifying the gnupg "home" directory:
>+#
>+
>+inherit sanity
>+
>+IPK_SIGN_PACKAGES = '1'
>+IPK_GPG_BACKEND ?= 'local'
>+IPK_GPG_SIGNATURE_TYPE ?= 'ASC'
>+
>+python () {
>+    # Check configuration
>+    for var in ('IPK_GPG_NAME', 'IPK_GPG_PASSPHRASE_FILE'):
>+        if not d.getVar(var, True):
>+            raise_sanity_error("You need to define %s in the config" % var, d)
>+
>+    sigtype = d.getVar("IPK_GPG_SIGNATURE_TYPE", True)
>+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
>+        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
>+}
>+
>+python sign_ipk () {
>+    from oe.gpg_sign import get_signer
>+
>+    ipk_file = d.getVar('IPK_TO_SIGN')
>+    bb.debug(1, 'Signing ipk: %s' % ipk_file)
>+
>+    signer = get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
>+
>+    sig_type = d.getVar('IPK_GPG_SIGNATURE_TYPE', True)
>+    is_ascii_sig = (sig_type.upper() != "BIN")
>+
>+    signer.sign_ipk(ipk_file,
>+                    d.getVar('IPK_GPG_NAME', True),
>+                    d.getVar('IPK_GPG_PASSPHRASE_FILE', True),
>+                    is_ascii_sig)
>+}

To me, it would be seem more straightforward to not circulate ipk_to_sign through 'd'. Just define a regular python function like
def sign_ipk(d, ipk_to_sign):
    ...

And then in package_ipk.bbclass just do "sign_ipk(d, ipk_to_sign)" instead of bb.build.exec_func("sign_ipk", d)"




>diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>index ada1b2f..138499b 100644
>--- a/meta/lib/oe/gpg_sign.py
>+++ b/meta/lib/oe/gpg_sign.py
>@@ -1,5 +1,6 @@
> """Helper module for GPG signing"""
> import os
>+import sys
> 
> import bb
> import oe.utils
>@@ -50,6 +51,44 @@ class LocalSigner(object):
>             bb.error('rpmsign failed: %s' % proc.before.strip())
>             raise bb.build.FuncFailed("Failed to sign RPM packages")
> 
>+    def sign_ipk(self, ipkfile, keyid, passphrase_file, armor=True):
>+        """Sign IPK files"""
>+        import subprocess
>+        from subprocess import Popen
>+
>+        cmd = [self.gpg_bin, "-q", "--batch", "--yes", "-b", "-u", keyid]
>+        if self.gpg_path:
>+            cmd += ["--homedir", self.gpg_path]
>+        if armor:
>+            cmd += ["--armor"]
>+
>+        try:
>+            keypipe = os.pipe()
>+
>+            # Need to add '\n' in case the passfile does not have it
>+            with open(passphrase_file) as fobj:
>+                os.write(keypipe[1], fobj.readline() + '\n')
>+
>+            cmd += ["--passphrase-fd",  str(keypipe[0])]
>+            cmd += [ipkfile]
>+
>+            gpg_proc = Popen(cmd, stdin=subprocess.PIPE)
>+            gpg_proc.wait()
>+
>+            os.close(keypipe[1]);
>+            os.close(keypipe[0]);
>+
>+        except IOError as e:
>+            bb.error("IO error ({0}): {1}".format(e.errno, e.strerror))
>+            raise bb.build.FuncFailed("Failed to sign IPK packages")
>+        except OSError as e:
>+            bb.error("OS error ({0}): {1}".format(e.errno, e.strerror))
>+            raise bb.build.FuncFailed("Failed to sign IPK packages")
>+        except:
>+            bb.error("Unexpected error: {1}".format(sys.exc_info()[0]))
>+            raise bb.build.FuncFailed("Failed to sign IPK packages")
>+
>+
>     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
>         """Create a detached signature of a file"""
>         import subprocess

Couldn't you just use detach_sign() instead of introducing sign_ipk(). To me the functionality seems identical.


Thanks,
  Markus



