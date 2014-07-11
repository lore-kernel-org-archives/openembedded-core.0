Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 25AC0702C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 13:57:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2014 06:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,643,1400050800"; d="scan'208";a="542029200"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2014 06:57:56 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 3ABA36A4007;
	Fri, 11 Jul 2014 06:57:23 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jul 2014 19:02:46 +0300
Message-Id: <1405094566-16474-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] scripts/test-remote-image: add --skip-download option
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
X-List-Received-Date: Fri, 11 Jul 2014 13:57:58 -0000

Adding the possibility to skip the download phase completely.
This is useful for repeating runs with the same image types and similar configurations.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 scripts/test-remote-image | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 7d02a84..8120a62 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -78,6 +78,7 @@ def get_args_parser():
     parser.add_argument('--required-packages', required=False, action="store", nargs='*', dest="required_packages", default=None, help='Required packages for the tests. They will be built before the testing begins.')
     parser.add_argument('--targetprofile', required=False, action="store", nargs=1, dest="targetprofile", default='AutoTargetProfile', help='The target profile to be used.')
     parser.add_argument('--repoprofile', required=False, action="store", nargs=1, dest="repoprofile", default='PublicAB', help='The repo profile to be used.')
+    parser.add_argument('--skip-download', required=False, action="store_true", dest="skip_download", default=False, help='Skip downloading the images completely. This needs the correct files to be present in the directory specified by the target profile.')
     return parser
 
 class BaseTargetProfile(object):
@@ -248,13 +249,14 @@ class PublicAB(BaseRepoProfile):
 
 class HwAuto():
 
-    def __init__(self, image_types, repolink, required_packages, targetprofile, repoprofile):
+    def __init__(self, image_types, repolink, required_packages, targetprofile, repoprofile, skip_download):
         log.info('Initializing..')
         self.image_types = image_types
         self.repolink = repolink
         self.required_packages = required_packages
         self.targetprofile = targetprofile
         self.repoprofile = repoprofile
+        self.skip_download = skip_download
         self.repo = self.get_repo_profile(self.repolink)
 
     # Get the repository profile; for now we only look inside this module.
@@ -304,15 +306,18 @@ class HwAuto():
         # For each image type, download the needed files and run the tests.
         noissuesfound = True
         for image_type in self.image_types:
-            target = self.get_target_profile(image_type)
-            files_dict = target.get_files_dict()
-            log.info("Downloading files for %s" % image_type)
-            for f in files_dict:
-                if self.repo.check_old_file(files_dict[f]):
-                    filepath = os.path.join(self.repo.localdir, files_dict[f])
-                    if os.path.exists(filepath):
-                        os.remove(filepath)
-                    self.repo.fetch(files_dict[f])
+            if self.skip_download:
+                log.info("Skipping downloading the images..")
+            else:
+                target = self.get_target_profile(image_type)
+                files_dict = target.get_files_dict()
+                log.info("Downloading files for %s" % image_type)
+                for f in files_dict:
+                    if self.repo.check_old_file(files_dict[f]):
+                        filepath = os.path.join(self.repo.localdir, files_dict[f])
+                        if os.path.exists(filepath):
+                            os.remove(filepath)
+                        self.repo.fetch(files_dict[f])
 
             result = self.runTestimageBuild(image_type)
             if result.status != 0:
@@ -331,7 +336,7 @@ def main():
     parser = get_args_parser()
     args = parser.parse_args()
 
-    hwauto = HwAuto(image_types=args.image_types, repolink=args.repo_link, required_packages=args.required_packages, targetprofile=args.targetprofile, repoprofile=args.repoprofile)
+    hwauto = HwAuto(image_types=args.image_types, repolink=args.repo_link, required_packages=args.required_packages, targetprofile=args.targetprofile, repoprofile=args.repoprofile, skip_download=args.skip_download)
 
     hwauto.run()
 
-- 
1.8.3.2


