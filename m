Return-Path: <lans.zhang2008@gmail.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5603E77E88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:43:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6B4hC83004462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:43:13 -0700 (PDT)
Received: from pek-jzhang0-d2.wrs.com (128.224.162.208) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 10 Jul 2017 21:43:12 -0700
From: Jia Zhang <lans.zhang2008@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2017 12:43:03 +0800
Message-ID: <1499748183-17886-2-git-send-email-lans.zhang2008@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1499748183-17886-1-git-send-email-lans.zhang2008@gmail.com>
References: <1499748183-17886-1-git-send-email-lans.zhang2008@gmail.com>
MIME-Version: 1.0
Cc: Lans Zhang <jia.zhang@windriver.com>
Subject: [PATCH 2/2] sign_rpm: support signing files in RPM payload
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
X-List-Received-Date: Tue, 11 Jul 2017 04:43:12 -0000
Content-Type: text/plain

From: Lans Zhang <jia.zhang@windriver.com>

Currently, RPM4 supports to sign the files in RPM payload with plugin
mechanism. We introduce more definitions to make the file signing
available for the users:

- RPM_FILE_CHECKSUM_DIGEST
  Global switch to enable file signing.
- RPM_FSK_PATH
  The file signing key.
- RPM_FSK_PASSWORD
  The password of file signing key.
- RPM_FILE_CHECKSUM_DIGEST
  The file checksum digest.

Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
---
 meta/classes/sign_rpm.bbclass | 20 +++++++++++++++++++-
 meta/lib/oe/gpg_sign.py       |  7 ++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index bc2e947..c49406c 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -9,6 +9,13 @@
 #           Optional variable for specifying the backend to use for signing.
 #           Currently the only available option is 'local', i.e. local signing
 #           on the build host.
+# RPM_FILE_CHECKSUM_DIGEST
+#           Optional variable for specifying the algorithm for generating file
+#           checksum digest.
+# RPM_FSK_PATH
+#           Optional variable for the file signing key.
+# RPM_FSK_PASSWORD
+#           Optional variable for the file signing key password.
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -18,7 +25,10 @@
 inherit sanity
 
 RPM_SIGN_PACKAGES='1'
+RPM_SIGN_FILES ?= '0'
 RPM_GPG_BACKEND ?= 'local'
+# SHA-256 is used by default
+RPM_FILE_CHECKSUM_DIGEST ?= '8'
 
 
 python () {
@@ -28,6 +38,11 @@ python () {
     for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE'):
         if not d.getVar(var):
             raise_sanity_error("You need to define %s in the config" % var, d)
+
+    if d.getVar('RPM_SIGN_FILES') == '1':
+        for var in ('RPM_FSK_PATH', 'RPM_FSK_PASSWORD'):
+            if not d.getVar(var):
+                raise_sanity_error("You need to define %s in the config" % var, d)
 }
 
 python sign_rpm () {
@@ -39,7 +54,10 @@ python sign_rpm () {
 
     signer.sign_rpms(rpms,
                      d.getVar('RPM_GPG_NAME'),
-                     d.getVar('RPM_GPG_PASSPHRASE'))
+                     d.getVar('RPM_GPG_PASSPHRASE'),
+                     d.getVar('RPM_FILE_CHECKSUM_DIGEST'),
+                     d.getVar('RPM_FSK_PATH'),
+                     d.getVar('RPM_FSK_PASSWORD'))
 }
 
 do_package_index[depends] += "signing-keys:do_deploy"
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index c53df54..f4d8b10 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -27,7 +27,7 @@ class LocalSigner(object):
             raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
                                       (keyid, output))
 
-    def sign_rpms(self, files, keyid, passphrase):
+    def sign_rpms(self, files, keyid, passphrase, digest, fsk=None, fsk_password=None):
         """Sign RPM files"""
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
@@ -35,10 +35,15 @@ class LocalSigner(object):
         if self.gpg_version > (2,1,):
             gpg_args += ' --pinentry-mode=loopback'
         cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
+        cmd += "--define '_binary_filedigest_algorithm %s' " % digest
         if self.gpg_bin:
             cmd += "--define '__gpg %s' " % self.gpg_bin
         if self.gpg_path:
             cmd += "--define '_gpg_path %s' " % self.gpg_path
+        if fsk:
+            cmd += "--signfiles --fskpath %s " % fsk
+            if fsk_password:
+                cmd += "--define '_file_signing_key_password %s' " % fsk_password
 
         # Sign in chunks of 100 packages
         for i in range(0, len(files), 100):
-- 
2.7.5


