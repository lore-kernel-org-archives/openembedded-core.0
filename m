Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8367117C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:53 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so2082060wes.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=awVWt/f2da2TdHQVIB4h6wOrHXir5/vItodmCjt3ur4=;
	b=J9ibJaiCjRqaCu4HHeWvB3jZULWvS3cV5jP2APdaj6//oOlP5awsrEjEkA+s1d9eNl
	UviQUxwFKKnWIAIkhoro91onIWGutniiH60ejcd10Vccgr0IAvQEXYpcFBeXzC2Rqpyx
	QMrc7FYMNHNFDDg7kZlnFKe9b8OkoaSIT/f/X67i++iAdPx8cq+Q4A8vqs7awP+Ze4GF
	ltQVcJITZGGy2wNqNrv/GmYlS1Zbe+2r4C8LpbPfn0uQazqcLliWyCvf42KPLAHcuaJx
	gEqmZe/ovitjsSzPyrsXwh/WRU7MTThLBr1ejbutuCbOFC7ZuBDI0IBHv/2oEvEUF1nn
	Af0Q==
X-Gm-Message-State: ALoCoQnkyNDsJMOEqFG+1FKJeSHLE5k66XdNLzInGsE9x1zLhwI0/Gz6Txn99YxKmpqwfqzxFxZs
X-Received: by 10.181.8.69 with SMTP id di5mr22737233wid.6.1410177534046;
	Mon, 08 Sep 2014 04:58:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:19 +0100
Message-Id: <0a45d3b6d56193e0380f89b57238e4954be6696c.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 01/27] package_manager: RpmPkgsList: determine rpm version
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:57 -0000
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


