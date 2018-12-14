Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE2671A74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:10:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a18so6539691wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6/8QEqjJLeYVExbk3COeanRoaCBhQbT5LdzVNxLSb1w=;
	b=dt+HIIvHhwXE7eoSUYrShtTR9QG6pFmqnE4ljFWBSfVA78M1Xd9R+r3BCAlx6yqJCF
	501Emky7afO/Tnn1NvXHO14UElLJ3+v5uCPSy7HD+c5ZdgsC0g+GYLxDLvCxHLGNlGzG
	AMemOC/zxIt0oumAYFzjAq4TGEBDOVXyxB9ihn2sdPMnPRqbiW4w0rla1RRpJW8gxK6s
	GJbVqHWcHkdBCOn0RM3rtPUmqgmCSw7sMhhN7h7VFlGsErLqC+kLyv9AxDBaUs1KZrqu
	3XkJKh8OGjFc3WTE5Cz++FABDB/5m/t8+DmGeUYVFbWEuPDI2xHKL3gUTTXb/bFu2HXV
	1RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6/8QEqjJLeYVExbk3COeanRoaCBhQbT5LdzVNxLSb1w=;
	b=grxhlHVchrzTnjWUFouRqZfKDuRliQCNB5A0mIINK+MTQvRs3WAbN8tTFyVM6a4XED
	b9lQlljaoJBnyfVT8q9DUkomYoMm0ZGQa7XBFsDZyf+RQeBFJRIy6AmArhIQgifUiJeI
	57ngbPOsWpVudQsbaGvDAk0a4OSHkA0ypxX8aQKEHNN3oXmX6g9sN6gvPESkunh8Hxsm
	RV/jsQKCSknlGcrAlu25ysxcWdeZCL2jOmjXVBnWjlCS9eK2kk8A+RedG27xDJDsBCSv
	U0KGI8e9TzBpMgDaGpDGSEdmT4IJjVnWVUE/y+86Kc4x6K65uyPgVgVyk92DWyt4Nmyn
	4L4A==
X-Gm-Message-State: AA+aEWbLELXEXjlL2pLNy7+kvqnUeLM8nHYgUd5vkqfuBTC1lW8dD/Yv
	dMyQdRsnHwXFCePNzZkxgp5xxqPGbAQ=
X-Google-Smtp-Source: AFSGD/VMUgW3IilwVmURCKks5+MU/SfiyTHmNGaJSqF6/e4p1/SiXSJGvG911OYiy/jivw0yrpnhaQ==
X-Received: by 2002:a1c:8089:: with SMTP id b131mr3988902wmd.141.1544807453491;
	Fri, 14 Dec 2018 09:10:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n127sm6134398wmd.20.2018.12.14.09.10.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:10:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:10:51 +0000
Message-Id: <20181214171051.2030-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package_manager: don't search for binaries in $PATH explicitly
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
X-List-Received-Date: Fri, 14 Dec 2018 17:10:53 -0000

There's no point in looking for a command on $PATH using bb.utils.which() but
then passing it to subprocess.check*() which will search $PATH.

By just using the command directly, the code is visibly neater.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 43 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f08190efc0d..f0d98dd0ffc 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -155,8 +155,7 @@ class RpmIndexer(Indexer):
         else:
             signer = None
 
-        createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
-        create_index("%s --update -q %s" % (createrepo_c, deploy_dir))
+        create_index("createrepo_c --update -q %s" % (deploy_dir))
 
         # Sign repomd
         if signer:
@@ -316,11 +315,11 @@ class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
         super(OpkgPkgsList, self).__init__(d, rootfs_dir)
 
-        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
+        self.opkg_cmd = "opkg -f %s -o %s " % (config_file, rootfs_dir)
+        self.opkg_cmd += self.d.getVar("OPKG_ARGS")
 
     def list_pkgs(self, format=None):
-        cmd = "opkg %s status" % (self.opkg_args)
+        cmd = "%s status" % (self.opkg_cmd)
 
         # opkg returns success even when it printed some
         # "Collected errors:" report to stderr. Mixing stderr into
@@ -870,12 +869,12 @@ class RpmPM(PackageManager):
             args = ["rpm", "-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
 
             try:
-                bb.note("Running %s" % ' '.join([cmd] + args + pkgs))
-                output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
+                bb.note("Running %s" % ' '.join(args + pkgs))
+                output = subprocess.check_output(args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
                 bb.note(output)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not invoke rpm. Command "
-                         "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
+                         "'%s' returned %d:\n%s" % (' '.join(args + pkgs), e.returncode, e.output.decode("utf-8")))
 
     def upgrade(self):
         self._prepare_pkg_transaction()
@@ -1132,8 +1131,8 @@ class OpkgPM(OpkgDpkgPM):
 
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
-        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/'), target_rootfs)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
+        self.opkg_cmd = "opkg --volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/'), target_rootfs)
+        self.opkg_cmd += self.d.getVar("OPKG_ARGS")
 
         if prepare_index:
             create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
@@ -1292,7 +1291,7 @@ class OpkgPM(OpkgDpkgPM):
     def update(self):
         self.deploy_dir_lock()
 
-        cmd = "opkg %s update" % (self.opkg_args)
+        cmd = "%s update" % (self.opkg_cmd)
 
         try:
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
@@ -1307,7 +1306,7 @@ class OpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
-        cmd = "opkg %s" % (self.opkg_args)
+        cmd = self.opkg_cmd
         for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
             cmd += " --add-exclude %s" % exclude
         cmd += " install "
@@ -1342,11 +1341,11 @@ class OpkgPM(OpkgDpkgPM):
             return
 
         if with_dependencies:
-            cmd = "opkg %s --force-remove --force-removal-of-dependent-packages remove %s" % \
-                (self.opkg_args, ' '.join(pkgs))
+            cmd = "%s --force-remove --force-removal-of-dependent-packages remove %s" % \
+                (self.opkg_cmd, ' '.join(pkgs))
         else:
-            cmd = "opkg %s --force-depends remove %s" % \
-                (self.opkg_args, ' '.join(pkgs))
+            cmd = "%s --force-depends remove %s" % \
+                (self.opkg_cmd, ' '.join(pkgs))
 
         try:
             bb.note(cmd)
@@ -1390,7 +1389,7 @@ class OpkgPM(OpkgDpkgPM):
         if os.path.exists(status_file):
             return
 
-        cmd = "opkg %s info " % (self.opkg_args)
+        cmd = "%s info " % (self.opkg_cmd)
 
         with open(status_file, "w+") as status:
             for pkg in bad_recommendations.split():
@@ -1432,10 +1431,10 @@ class OpkgPM(OpkgDpkgPM):
         temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
         bb.utils.mkdirhier(temp_opkg_dir)
 
-        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
+        opkg_args = "opkg -f %s -o %s " % (self.config_file, temp_rootfs)
         opkg_args += self.d.getVar("OPKG_ARGS")
-
-        cmd = "opkg %s update" % (opkg_args)
+        
+        cmd = "%s update" % (opkg_args)
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -1443,7 +1442,7 @@ class OpkgPM(OpkgDpkgPM):
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         # Dummy installation
-        cmd = "opkg %s --noaction install %s " % (opkg_args, ' '.join(pkgs))
+        cmd = "%s --noaction install %s " % (opkg_args, ' '.join(pkgs))
         try:
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -1477,7 +1476,7 @@ class OpkgPM(OpkgDpkgPM):
         """
         Returns a dictionary with the package info.
         """
-        cmd = "opkg %s info %s" % (self.opkg_args, pkg)
+        cmd = "%s info %s" % (self.opkg_cmd, pkg)
         pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
 
         pkg_arch = pkg_info[pkg]["arch"]
-- 
2.11.0


