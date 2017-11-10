Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1703D71B2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMhNw001306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:44 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:01 +0800
Message-ID: <b3d9c35be67ef4987d6b366a23e818d7ad76fc91.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/23] staging.bbclass: make subprocess.check_output() capture stderr
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:43 -0000
Content-Type: text/plain

This is very useful for debugging. The similar to testsdk.bbclass.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/staging.bbclass | 6 +++---
 meta/classes/testsdk.bbclass | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index c479bd9..1b9e84d 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -171,7 +171,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.debug(2, cmd)
-    subprocess.check_output(cmd, shell=True)
+    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 
 def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
@@ -228,7 +228,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
     for p in postinsts:
-        subprocess.check_output(p, shell=True)
+        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
 
 #
 # Manifests here are complicated. The main sysroot area has the unpacked sstate
@@ -576,7 +576,7 @@ python extend_recipe_sysroot() {
             staging_processfixme(fixme[f], multilibs[f].getVar("RECIPE_SYSROOT"), recipesysroot, recipesysrootnative, d)
 
     for p in postinsts:
-        subprocess.check_output(p, shell=True)
+        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
 
     for dep in manifests:
         c = setscenedeps[dep][0]
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 6b51a33..9fe8c34 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -159,7 +159,8 @@ def testsdkext_main(d):
             f.write('INHERIT += "own-mirrors"')
 
         # We need to do this in case we have a minimal SDK
-        subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % sdk_env, cwd=sdk_dir, shell=True)
+        subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
+                sdk_env, cwd=sdk_dir, shell=True, stderr=subprocess.STDOUT)
 
         tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
             sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
-- 
2.7.4


