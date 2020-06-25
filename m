Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.7635.1593080531229462406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WsVKvhuw;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3601; q=dns/txt; s=axis-central1;
  t=1593080531; x=1624616531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EwaAooZfpc/Pt5Yz/jAg6Pno0sDHmLTn1sPFTjCx2RY=;
  b=WsVKvhuw0XsfjEumCX0o71w5pH7ZdJHv2NQjNfhgLEmzKEfJ+BYEnGk3
   7OcN2MnrqtrOrFb/K9IIGVcRQy3V/AFDoZD4BPdJCpMAF8DBIzv+ZfMAk
   Vm6mBLoIqmq1VV+oIS3KXHHVKK/ytCbVs7qbjaG1i7ZhkZ3jJuzWYRo76
   sr9pWtAcG7T2X64fXcp/VPw7v9lXL+Jii1Wa7XB1arg88b8sHgodLZbVX
   jzfNIv8j660aoG6j7iBOZwl5WBVlcLVi9DnPadWzkiT+mRszpHlaBISjK
   655/rnL3n0XCut07xRaUuEIeI1dXM2YrG/CXFQM6CUKqcMfruS3ntBnz2
   w==;
IronPort-SDR: 1z3rPMDuBeKHcCKeClRgWIruAglU/F1F4uotG8Spd0ssohRTKr3jOLRVj9H8IDIPzbrvHWOrZv
 8AH2kXZkMgv5nsT8Lnj0vUbFTKwhV8jkJAiHZuuY3c0zkOeMbgiCSjzze3tz8rThltRP5qTWbT
 gM2VQ8A2mg4LFmOlz/9MMsF7JVJ4owKggSLso0tSmrEdxnanp/DI5Hwg4CzfagRetq/HyaGi0c
 uFZ26CwEYRv3RAwUuenFdXvMOqRvAkdfkNzpno8AHzRCvcnsXfI/71mHKGEIximhV6BoPfTWlz
 hFc=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185335"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 19/26] package_manager.py: Move RpmIndexer
Date: Thu, 25 Jun 2020 12:21:38 +0200
Message-ID: <20200625102145.7139-20-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the code that is only used by rpm package manager live in that
package manager owned directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 36 -------------------
 .../package_managers/rpm/package_manager.py   | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 542f4ed3c4..b4d1a20bd6 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -150,42 +150,6 @@ class Indexer(object, metaclass=ABCMeta):
         pass
 
 
-class RpmIndexer(Indexer):
-    def write_index(self):
-        self.do_write_index(self.deploy_dir)
-
-    def do_write_index(self, deploy_dir):
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
-        else:
-            signer = None
-
-        createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
-        result = create_index("%s --update -q %s" % (createrepo_c, deploy_dir))
-        if result:
-            bb.fatal(result)
-
-        # Sign repomd
-        if signer:
-            sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
-            is_ascii_sig = (sig_type.upper() != "BIN")
-            signer.detach_sign(os.path.join(deploy_dir, 'repodata', 'repomd.xml'),
-                               self.d.getVar('PACKAGE_FEED_GPG_NAME'),
-                               self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
-                               armor=is_ascii_sig)
-
-class RpmSubdirIndexer(RpmIndexer):
-    def write_index(self):
-        bb.note("Generating package index for %s" %(self.deploy_dir))
-        self.do_write_index(self.deploy_dir)
-        for entry in os.walk(self.deploy_dir):
-            if os.path.samefile(self.deploy_dir, entry[0]):
-                for dir in entry[1]:
-                    if dir != 'repodata':
-                        dir_path = oe.path.join(self.deploy_dir, dir)
-                        bb.note("Generating package index for %s" %(dir_path))
-                        self.do_write_index(dir_path)
-
 class OpkgIndexer(Indexer):
     def write_index(self):
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
index 306c3336ca..025e8cdfd2 100644
--- a/meta/lib/oe/package_managers/rpm/package_manager.py
+++ b/meta/lib/oe/package_managers/rpm/package_manager.py
@@ -360,4 +360,40 @@ class PkgPM(PackageManager):
 
         return tmp_dir
 
+class RpmIndexer(Indexer):
+    def write_index(self):
+        self.do_write_index(self.deploy_dir)
+
+    def do_write_index(self, deploy_dir):
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
+        else:
+            signer = None
+
+        createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
+        result = create_index("%s --update -q %s" % (createrepo_c, deploy_dir))
+        if result:
+            bb.fatal(result)
+
+        # Sign repomd
+        if signer:
+            sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
+            is_ascii_sig = (sig_type.upper() != "BIN")
+            signer.detach_sign(os.path.join(deploy_dir, 'repodata', 'repomd.xml'),
+                               self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                               self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
+                               armor=is_ascii_sig)
+
+class RpmSubdirIndexer(RpmIndexer):
+    def write_index(self):
+        bb.note("Generating package index for %s" %(self.deploy_dir))
+        self.do_write_index(self.deploy_dir)
+        for entry in os.walk(self.deploy_dir):
+            if os.path.samefile(self.deploy_dir, entry[0]):
+                for dir in entry[1]:
+                    if dir != 'repodata':
+                        dir_path = oe.path.join(self.deploy_dir, dir)
+                        bb.note("Generating package index for %s" %(dir_path))
+                        self.do_write_index(dir_path)
+
 
-- 
2.20.1

