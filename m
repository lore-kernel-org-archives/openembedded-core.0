Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7D2D71422
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:51:23 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so11383142wgg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 02:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=awVWt/f2da2TdHQVIB4h6wOrHXir5/vItodmCjt3ur4=;
	b=IS0XWLSbjUYYAxFcqGMne/ilR4OT2tL7HqfaAnyccZGsDGnKgiZpWGilajKqYqcMcx
	cddtBRZ+MH2u7z3MFZqikyONTNWCrc4EgfSfZSz3ViLQpcmvipAUDYcbHI6gMQ6GJn/F
	wdNkUuG29FkfRCuvfFbHMaH8Osp81kff4jRgKFYs5jiu7QdFz6VeB9Rc1fTHpcmy62n2
	tEqpUH7cCFs3+owh9DiDoXcah3TuUGkGPYldLTGqPJOC3dZ446hcdyq5btJLP0Qcyi0S
	wB39+nnxDHnsDqyVfnl+nRsVNwiK0FcJ6rUkc/xVnAE0nHdI+iYjjr5ijAuUxGdfn8g9
	18UA==
X-Gm-Message-State: ALoCoQmtgoLUNzrf38TQDZz5LL03RHp4km6PBdO0XPe8NA9V0rXY2EwHQJnbzQB5rBtUxLByFX6g
X-Received: by 10.180.186.10 with SMTP id fg10mr2351672wic.20.1409910683023;
	Fri, 05 Sep 2014 02:51:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mv14sm1392296wic.20.2014.09.05.02.51.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Sep 2014 02:51:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Sep 2014 10:51:17 +0100
Message-Id: <1409910677-4479-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] package_manager: RpmPkgsList: determine rpm version
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
X-List-Received-Date: Fri, 05 Sep 2014 09:51:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kévin THIERRY <kevin.thierry@open.eurogiciel.org>

Do not set the rpm_version to 5 if it is not provided, instead
determine the real rpm version.

(From OE-Core rev: 48beaee2e5b2b4ae35c596c19f8a38e0ff4427e9)

Signed-off-by: Kévin THIERRY <kevin.thierry@open.eurogiciel.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py |   23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 86cef02..a1ac6eb 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -210,7 +210,7 @@ class PkgsList(object):
 
 
 class RpmPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, arch_var=None, os_var=None, rpm_version=5):
+    def __init__(self, d, rootfs_dir, arch_var=None, os_var=None):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)
 
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
@@ -219,7 +219,14 @@ class RpmPkgsList(PkgsList):
         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
 
-        self.rpm_version = rpm_version
+        # Determine rpm version
+        cmd = "%s --version" % self.rpm_cmd
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Getting rpm version failed. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+        self.rpm_version = int(output.split()[-1].split('.')[0])
 
     '''
     Translate the RPM/Smart format names to the OE multilib format names
@@ -564,17 +571,9 @@ class RpmPM(PackageManager):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        # Determine rpm version
-        cmd = "%s --version" % self.rpm_cmd
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Getting rpm version failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
-        self.rpm_version = int(output.split()[-1].split('.')[0])
-
         self.indexer = RpmIndexer(self.d, self.deploy_dir)
-        self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var, self.rpm_version)
+        self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var)
+        self.rpm_version = self.pkgs_list.rpm_version
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
-- 
1.7.10.4


