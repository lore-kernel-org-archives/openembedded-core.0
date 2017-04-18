Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 42CF571C42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 15:22:40 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r190so84813wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=llN0r2HK/P7RWQoV/PnOju1EhY55lO5n/Joosk+PKg4=;
	b=pNMSlJEo4kBxwiuIajjdMkFEPa/e3l7b1yej/3z5e9Pf7XbvsnDxm5Fv8PGh3yfW57
	32ODzFQzNRbTD43Zpeq5DDHU9f6kyoFFiE2F1zEDgTJfny6YpaqRaucKrrE8ERfqbtlx
	pShOEiKTdo/i0csiIWHuet2k+tflFXl5sC+1eSmFdX1vFYe8zkFaC/NuI5JXN9Y7372z
	z1yfxYsAsKDc0K3Hf7zSc/q7sSFCJ1HRUOdb6EvdCDqz1yYRh2C6Z63KO9Bq8Ldxfb7z
	Mqb732Xo7HScOLtmTpMLaQPxO85cd9N/qhNFaac1uDebA1LQoeAFgghVpR+Sk6Ddyp8L
	c8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=llN0r2HK/P7RWQoV/PnOju1EhY55lO5n/Joosk+PKg4=;
	b=BOnJmlkp8hGndjBAxsTxNdnDU/51qGKN6byRS56u/B6xAFzpsufh33DnVcBiY+9CfI
	n4uXxjlEuR8W5aaFV86yKutqYmwk7tl4TGS/b7wegIhJZQYvW50oqq/TBhZCmwk9a2PZ
	A5u0Den3cWIl5sj48RvSYmW1pZw2X8N3RY68I4vYVXFvRPho+Qf3+ozMQHD6krEmWYM7
	FBvnrVxaCC57cn7H6UMCgukK3HOvW1HpziA1hMAn6HLT0iZaAFZ/jjdAo1q2uIvBTtrn
	8H3UAUV/Nb53xrgSpe/i6Hw3XnypEmB3iQN1+aqWatTShtu3GB1BC8E1WiWUW92Cg4Q8
	oRbg==
X-Gm-Message-State: AN3rC/78H+R7HzKSYEfeooxRj+SD7IWhQwStEKOiiBwgZbNN9fgwVxiV
	pKArWDQsbHiOuofdk2s=
X-Received: by 10.28.238.9 with SMTP id m9mr2651710wmh.72.1492528961532;
	Tue, 18 Apr 2017 08:22:41 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v14sm15352320wmv.24.2017.04.18.08.22.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 08:22:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 16:22:39 +0100
Message-Id: <1492528959-5665-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] package_manager: don't race on a file when installing complementary packages
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
X-List-Received-Date: Tue, 18 Apr 2017 15:22:42 -0000

PackageManager.install_complementary() uses WORKDIR/installed_pkgs.txt as a
temporary file but if two tasks are executing for the same recipe which uses
this file (e.g. bitbake my-image my-image:do_populate_sdk) then it's possible
for the file to be overwritten or deleted.

Instead of using a static filename, use tempfile to generate a unique name and
ensure it is cleaned up when finished.

Also move the glob generation/expansion earlier in the function as if there are
no globs to install, we don't need to generate a package list.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 47 ++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 60d6e52..f7190cf 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -377,15 +377,6 @@ class PackageManager(object, metaclass=ABCMeta):
     installation
     """
     def install_complementary(self, globs=None):
-        # we need to write the list of installed packages to a file because the
-        # oe-pkgdata-util reads it from a file
-        installed_pkgs_file = os.path.join(self.d.getVar('WORKDIR'),
-                                           "installed_pkgs.txt")
-        with open(installed_pkgs_file, "w+") as installed_pkgs:
-            pkgs = self.list_installed()
-            output = oe.utils.format_pkg_list(pkgs, "arch")
-            installed_pkgs.write(output)
-
         if globs is None:
             globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')
             split_linguas = set()
@@ -402,22 +393,28 @@ class PackageManager(object, metaclass=ABCMeta):
         if globs is None:
             return
 
-        cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
-               "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs_file,
-               globs]
-        exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
-        if exclude:
-            cmd.extend(['--exclude=' + '|'.join(exclude.split())])
-        try:
-            bb.note("Installing complementary packages ...")
-            bb.note('Running %s' % cmd)
-            complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Could not compute complementary packages list. Command "
-                     "'%s' returned %d:\n%s" %
-                     (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-        self.install(complementary_pkgs.split(), attempt_only=True)
-        os.remove(installed_pkgs_file)
+        # we need to write the list of installed packages to a file because the
+        # oe-pkgdata-util reads it from a file
+        with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
+            pkgs = self.list_installed()
+            output = oe.utils.format_pkg_list(pkgs, "arch")
+            installed_pkgs.write(output)
+
+            cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
+                   "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
+                   globs]
+            exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
+            if exclude:
+                cmd.extend(['--exclude=' + '|'.join(exclude.split())])
+            try:
+                bb.note("Installing complementary packages ...")
+                bb.note('Running %s' % cmd)
+                complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Could not compute complementary packages list. Command "
+                         "'%s' returned %d:\n%s" %
+                         (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+            self.install(complementary_pkgs.split(), attempt_only=True)
 
     def deploy_dir_lock(self):
         if self.deploy_dir is None:
-- 
2.8.1


