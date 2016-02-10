Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5D5731EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:16:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2016 06:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,426,1449561600"; d="scan'208";a="650101626"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2016 06:16:05 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 16:15:59 +0200
Message-Id: <1455113759-3692-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/5] sstate.bbclass: use oe.gpg_sign for gpg signing
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
X-List-Received-Date: Wed, 10 Feb 2016 14:16:08 -0000

[YOCTO #9006]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sstate.bbclass | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 024b801..19fac32 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -268,23 +268,10 @@ def sstate_install(ss, d):
 sstate_install[vardepsexclude] += "SSTATE_DUPWHITELIST STATE_MANMACH SSTATE_MANFILEPREFIX"
 sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
-def sstate_build_gpg_command(d, *args, **kwargs):
-    # Returns a list for subprocess.call() unless passed flatten=True when this
-    # returns a flattened string.
-    l = [d.getVar("GPG_BIN", True) or "gpg"]
-    if d.getVar("GPG_PATH", True):
-        l += ["--homedir", d.getVar("GPG_PATH", True)]
-    l += args
-
-    if kwargs.get("flatten", False):
-        import pipes
-        return " ".join(map(pipes.quote, l))
-    else:
-        return l
-
 def sstate_installpkg(ss, d):
     import oe.path
     import subprocess
+    from oe.gpg_sign import get_signer
 
     def prepdir(dir):
         # remove dir if it exists, ensure any parent directories do exist
@@ -310,7 +297,8 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_PKG', sstatepkg)
 
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
-        if subprocess.call(sstate_build_gpg_command(d, "--verify", sstatepkg + ".sig", sstatepkg)) != 0:
+        signer = get_signer(d, 'local')
+        if not signer.verify(sstatepkg + '.sig'):
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
@@ -585,7 +573,8 @@ def sstate_package(ss, d):
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
 
-    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package'] + \
+    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + \
+             ['sstate_create_package', 'sstate_sign_package'] + \
              (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
         # All hooks should run in SSTATE_BUILDDIR.
         bb.build.exec_func(f, d, (sstatebuild,))
@@ -689,15 +678,22 @@ sstate_create_package () {
 	chmod 0664 $TFILE
 	mv -f $TFILE ${SSTATE_PKG}
 
-	if [ -n "${SSTATE_SIG_KEY}" ]; then
-		rm -f ${SSTATE_PKG}.sig
-		echo ${SSTATE_SIG_PASSPHRASE} | ${@sstate_build_gpg_command(d, "--batch", "--passphrase-fd", "0", "--detach-sign", "--local-user", "${SSTATE_SIG_KEY}", "--output", "${SSTATE_PKG}.sig", "${SSTATE_PKG}", flatten=True)}
-	fi
-
 	cd ${WORKDIR}
 	rm -rf ${SSTATE_BUILDDIR}
 }
 
+python sstate_sign_package () {
+    from oe.gpg_sign import get_signer
+
+    if d.getVar('SSTATE_SIG_KEY', True):
+        signer = get_signer(d, 'local')
+        sstate_pkg = d.getVar('SSTATE_PKG', True)
+        if os.path.exists(sstate_pkg + '.sig'):
+            os.unlink(sstate_pkg + '.sig')
+        signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY'), None,
+                           d.getVar('SSTATE_SIG_PASSPHRASE'), armor=False)
+}
+
 #
 # Shell function to decompress and prepare a package for installation
 # Will be run from within SSTATE_INSTDIR.
-- 
2.6.2


