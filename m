Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1C1677129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 11:57:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 04:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,688,1437462000"; d="scan'208";a="812530226"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2015 04:57:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 14:57:33 +0300
Message-Id: <1444996657-4301-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/5] sign_rpm.bbclass: make RPM_GPG_NAME a mandatory setting
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
X-List-Received-Date: Fri, 16 Oct 2015 11:57:41 -0000

Simplifies the configuration. Makes way for the removal of
RPM_GPG_PUBKEY setting and possible future implementation of a separate
signing server support. Also, moves the configuration sanity checking
into a separate function.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 39f877a..4da1763 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -4,8 +4,7 @@
 # RPM_GPG_PASSPHRASE_FILE
 #           Path to a file containing the passphrase of the signing key.
 # RPM_GPG_NAME
-#           Name of the key to sign with. Alternatively you can define
-#           %_gpg_name macro in your ~/.oerpmmacros file.
+#           Name of the key to sign with. May be key id or key name.
 # RPM_GPG_PUBKEY
 #           Path to a file containing the public key (in "armor" format)
 #           corresponding the signing key.
@@ -20,9 +19,11 @@ inherit sanity
 RPM_SIGN_PACKAGES='1'
 
 
-_check_gpg_name () {
-    macrodef=`rpm -E '%_gpg_name'`
-    [ "$macrodef" == "%_gpg_name" ] && return 1 || return 0
+python () {
+    # Check configuration
+    for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE_FILE'):
+        if not d.getVar(var, True):
+            raise_sanity_error("You need to define %s in the config" % var, d)
 }
 
 
@@ -31,16 +32,7 @@ def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
 
     # Find the correct rpm binary
     rpm_bin_path = d.getVar('STAGING_BINDIR_NATIVE', True) + '/rpm'
-    cmd = rpm_bin_path + " --addsign "
-    if gpg_name:
-        cmd += "--define '%%_gpg_name %s' " % gpg_name
-    else:
-        try:
-            bb.build.exec_func('_check_gpg_name', d)
-        except bb.build.FuncFailed:
-            raise_sanity_error("You need to define RPM_GPG_NAME in bitbake "
-                               "config or the %_gpg_name RPM macro defined "
-                               "(e.g. in  ~/.oerpmmacros", d)
+    cmd = rpm_bin_path + " --addsign --define '_gpg_name %s' " % gpg_name
     if d.getVar('GPG_BIN', True):
         cmd += "--define '%%__gpg %s' " % d.getVar('GPG_BIN', True)
     if d.getVar('GPG_PATH', True):
@@ -66,12 +58,8 @@ def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
 python sign_rpm () {
     import glob
 
-    rpm_gpg_pass_file = (d.getVar("RPM_GPG_PASSPHRASE_FILE", True) or "")
-    if rpm_gpg_pass_file:
-        with open(rpm_gpg_pass_file) as fobj:
-            rpm_gpg_passphrase = fobj.readlines()[0].rstrip('\n')
-    else:
-        raise_sanity_error("You need to define RPM_GPG_PASSPHRASE_FILE in the config", d)
+    with open(d.getVar("RPM_GPG_PASSPHRASE_FILE", True)) as fobj:
+        rpm_gpg_passphrase = fobj.readlines()[0].rstrip('\n')
 
     rpm_gpg_name = (d.getVar("RPM_GPG_NAME", True) or "")
 
-- 
2.1.4


