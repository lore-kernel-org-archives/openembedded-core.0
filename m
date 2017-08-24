Return-Path: <lans.zhang2008@gmail.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E14A78208
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 03:24:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7O3OSZf006737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Aug 2017 20:24:28 -0700
Received: from liara.liara.com (147.11.224.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 20:24:28 -0700
From: Jia Zhang <lans.zhang2008@gmail.com>
To: <liezhi.yang@windriver.com>
Date: Thu, 24 Aug 2017 11:24:28 +0800
Message-ID: <20170824032428.8388-1-lans.zhang2008@gmail.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] gpg_sign: depress the owership warnings on homedir
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
X-List-Received-Date: Thu, 24 Aug 2017 03:24:28 -0000
Content-Type: text/plain

A gpg command, e.g, called by get_gpg_version(), may trigger such a warning:
gpg: WARNING: unsafe ownership on homedir '/home/user/.gnupg'

This sort of warning is harmless so it can be depressed through specifying
--no-permission-warning.

Signed-off-by: Jia Zhang <lans.zhang2008@gmail.com>
---
 meta/lib/oe/gpg_sign.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 008478dfeb..9cc88f020c 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -15,7 +15,7 @@ class LocalSigner(object):
 
     def export_pubkey(self, output_file, keyid, armor=True):
         """Export GPG public key to a file"""
-        cmd = '%s --batch --yes --export -o %s ' % \
+        cmd = '%s --no-permission-warning --batch --yes --export -o %s ' % \
                 (self.gpg_bin, output_file)
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
@@ -31,7 +31,7 @@ class LocalSigner(object):
         """Sign RPM files"""
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
-        gpg_args = '--batch --passphrase=%s' % passphrase
+        gpg_args = '--no-permission-warning --batch --passphrase=%s' % passphrase
         if self.gpg_version > (2,1,):
             gpg_args += ' --pinentry-mode=loopback'
         cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
@@ -58,8 +58,8 @@ class LocalSigner(object):
         if passphrase_file and passphrase:
             raise Exception("You should use either passphrase_file of passphrase, not both")
 
-        cmd = [self.gpg_bin, '--detach-sign', '--batch', '--no-tty', '--yes',
-               '--passphrase-fd', '0', '-u', keyid]
+        cmd = [self.gpg_bin, '--detach-sign', '--no-permission-warning', '--batch',
+               '--no-tty', '--yes', '--passphrase-fd', '0', '-u', keyid]
 
         if self.gpg_path:
             cmd += ['--homedir', self.gpg_path]
@@ -98,7 +98,7 @@ class LocalSigner(object):
         """Return the gpg version as a tuple of ints"""
         import subprocess
         try:
-            ver_str = subprocess.check_output((self.gpg_bin, "--version")).split()[2].decode("utf-8")
+            ver_str = subprocess.check_output((self.gpg_bin, "--version", "--no-permission-warning")).split()[2].decode("utf-8")
             return tuple([int(i) for i in ver_str.split('.')])
         except subprocess.CalledProcessError as e:
             raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
@@ -106,7 +106,7 @@ class LocalSigner(object):
 
     def verify(self, sig_file):
         """Verify signature"""
-        cmd = self.gpg_bin + " --verify "
+        cmd = self.gpg_bin + " --verify --no-permission-warning "
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
         cmd += sig_file
-- 
2.14.1


