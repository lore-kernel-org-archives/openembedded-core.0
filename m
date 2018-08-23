Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF797950F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:56:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7N7un1P000602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:56:50 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 00:56:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:07:24 +0800
Message-ID: <b297f5062ff4e7f17b0152fd6e736cae35861b28.1535011588.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011588.git.liezhi.yang@windriver.com>
References: <cover.1535011588.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] lib/oe/gpg_sign.py: Clean up getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 07:56:49 -0000
Content-Type: text/plain

Replace usage of oe.utils.getstatusoutput() with direct subprocess calls.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/gpg_sign.py | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index b172729..ccd5aee 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -3,6 +3,8 @@ import os
 
 import bb
 import oe.utils
+import subprocess
+import shlex
 
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
@@ -23,10 +25,7 @@ class LocalSigner(object):
         if armor:
             cmd += "--armor "
         cmd += keyid
-        status, output = oe.utils.getstatusoutput(cmd)
-        if status:
-            raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
-                                      (keyid, output))
+        subprocess.check_output(shlex.split(cmd), stderr=subprocess.STDOUT)
 
     def sign_rpms(self, files, keyid, passphrase, digest, sign_chunk, fsk=None, fsk_password=None):
         """Sign RPM files"""
@@ -48,13 +47,10 @@ class LocalSigner(object):
 
         # Sign in chunks
         for i in range(0, len(files), sign_chunk):
-            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+sign_chunk]))
-            if status:
-                raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
+            subprocess.check_output(shlex.split(cmd + ' '.join(files[i:i+sign_chunk])), stderr=subprocess.STDOUT)
 
     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
         """Create a detached signature of a file"""
-        import subprocess
 
         if passphrase_file and passphrase:
             raise Exception("You should use either passphrase_file of passphrase, not both")
@@ -100,7 +96,6 @@ class LocalSigner(object):
 
     def get_gpg_version(self):
         """Return the gpg version as a tuple of ints"""
-        import subprocess
         try:
             ver_str = subprocess.check_output((self.gpg_bin, "--version", "--no-permission-warning")).split()[2].decode("utf-8")
             return tuple([int(i) for i in ver_str.split("-")[0].split('.')])
@@ -114,7 +109,7 @@ class LocalSigner(object):
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
         cmd += sig_file
-        status, _ = oe.utils.getstatusoutput(cmd)
+        status = subprocess.call(shlex.split(cmd))
         ret = False if status else True
         return ret
 
-- 
2.7.4


