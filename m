Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B947B7902D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:32:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o18-v6so13060324wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=3rb3HtztT8TkRG9KY4BTgfew8xIjhaVvs5bZhjP2Vc0=;
	b=aG2oRjsCNvrMTUrp+DtLWgnLNPMpVRPVCToLhaB/an6EJPhb0JTW/zvjFHuHyK0oaQ
	YGJHMZvTWZc1QvKCU4OMFt9nI29glFNfSCrGlzjeoaomQ+8ZKjuuPszcskuA/bwIDPXq
	HWZRKviTUw0YgDc/46+DbeNd8W1ScuJmfzH5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3rb3HtztT8TkRG9KY4BTgfew8xIjhaVvs5bZhjP2Vc0=;
	b=RS5LzmW6BLB+3u/yimORa7IQLoSMwB6kZGT03TU3sFXJuYT0ct6GLPAEUnFJhj2kOX
	z7MOG8PFq/fpZYtGbiKAe2OfjgwCgzbQyacaP2jSiYsGP1m0AXqr7qFsDSWPL00ViDwZ
	+zqJ3RF1hipE4FrhHMQc7Xg5ljXLJFpyaZTTzN+nB/t8e7IBJXlc3pMBEIhHP1jOMV41
	1P+TQX9Qj3hkd1gIPX7U5LCSF2+q3ZsGoGCLt96xmpA7KytvnRL6bB77+iZ9zuI9DcHb
	apt6kytRca2mJBENk8zaIPJ8v1i8gSxGOUSPEBBdoxWpZh3aCTD2N/7Om4fwpSAZh9h6
	2eIw==
X-Gm-Message-State: AOUpUlFHxRbav348q5f0k/6gxu72ZfuFJO0raiEO25Jq6ZwbvIsgb6Av
	MX+csyAqMKvtMRislsRubvXh/p/ILqA=
X-Google-Smtp-Source: AA+uWPzUO5VS3HXGgNtSjNyloS9o7C/A4M9GA02JeFOMj3v+MLq6utrWtJJmIscs6X+jGqhmO8b41A==
X-Received: by 2002:a1c:af53:: with SMTP id
	y80-v6mr11049248wme.55.1534267923022; 
	Tue, 14 Aug 2018 10:32:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm14519462wmt.30.2018.08.14.10.32.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 10:32:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:31:56 +0100
Message-Id: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] package_manager: Remove rpm specific pieces of create_packages_dir()
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
X-List-Received-Date: Tue, 14 Aug 2018 17:32:03 -0000

This function is generic, tweak the variable names and move out the rpm specific
directory name to make it truly generic and reusable for deb/ipk.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6011e873503..f1dbe48a720 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -621,7 +621,7 @@ class PackageManager(object, metaclass=ABCMeta):
             return res
         return _append(uris, base_paths)
 
-def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependencies):
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies):
     """
     Go through our do_package_write_X dependencies and hardlink the packages we depend
     upon into the repo directory. This prevents us seeing other packages that may
@@ -636,15 +636,13 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
     seendirs = set()
     multilibs = {}
    
-    rpm_subrepo_dir = oe.path.join(rpm_repo_dir, "rpm")
-
-    bb.utils.remove(rpm_subrepo_dir, recurse=True)
-    bb.utils.mkdirhier(rpm_subrepo_dir)
+    bb.utils.remove(subrepo_dir, recurse=True)
+    bb.utils.mkdirhier(subrepo_dir)
 
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
     if nodeps or not filterbydependencies:
-        oe.path.symlink(deploydir, rpm_subrepo_dir, True)
+        oe.path.symlink(deploydir, subrepo_dir, True)
         return
 
     start = None
@@ -655,24 +653,24 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
             break
     if start is None:
         bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
-    rpmdeps = set()
+    pkgdeps = set()
     start = [start]
     seen = set(start)
-    # Support direct dependencies (do_rootfs -> rpms)
-    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs -> rpms)
+    # Support direct dependencies (do_rootfs -> do_package_write_X)
+    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs -> do_package_write_X)
     while start:
         next = []
         for dep2 in start:
             for dep in taskdepdata[dep2][3]:
                 if taskdepdata[dep][0] != pn:
                     if "do_" + taskname in dep:
-                        rpmdeps.add(dep)
+                        pkgdeps.add(dep)
                 elif dep not in seen:
                     next.append(dep)
                     seen.add(dep)
         start = next
 
-    for dep in rpmdeps:
+    for dep in pkgdeps:
         c = taskdepdata[dep][0]
         manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
         if not manifest:
@@ -683,7 +681,7 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
             for l in f:
                 l = l.strip()
                 dest = l.replace(deploydir, "")
-                dest = rpm_subrepo_dir + dest
+                dest = subrepo_dir + dest
                 if l.endswith("/"):
                     if dest not in seendirs:
                         bb.utils.mkdirhier(dest)
@@ -725,7 +723,7 @@ class RpmPM(PackageManager):
             self.primary_arch = self.d.getVar('MACHINE_ARCH')
 
         self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
-        create_packages_dir(self.d, self.rpm_repo_dir, d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
+        create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
 
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
-- 
2.17.1


