Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E30A6079F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:27:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w22KRDhC019602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2018 12:27:13 -0800
Received: from localhost.localdomain (172.25.59.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 2 Mar 2018 12:26:44 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Mar 2018 14:27:10 -0600
Message-ID: <1520022430-7908-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: Use deltask instead of noexec for package_write_rpm
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
X-List-Received-Date: Fri, 02 Mar 2018 20:27:14 -0000
Content-Type: text/plain

If you install an image into another image (this is the case for
custom initrd for example), it will fail with a non obvious python
backtrace.  This patch modifies the package_manager.py print which
package causes the failure for the future, if it is missing a
manifest.

The error you get looks like this:

oe-core/meta/lib/oe/package_manager.py', lineno: 534, function: create_packages_dir
     0530:
     0531:    for dep in rpmdeps:
     0532:        c = taskdepdata[dep][0]
     0533:        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
 *** 0534:        if not os.path.exists(manifest):
     0535:            continue
     0536:        with open(manifest, "r") as f:
     0537:            for l in f:
     0538:                l = l.strip()
File: '/usr/lib/python3.5/genericpath.py', lineno: 19, function: exists
     0015:# This is false for dangling symbolic links on systems that support them.
     0016:def exists(path):
     0017:    """Test whether a path exists.  Returns False for broken symbolic links"""
     0018:    try:
 *** 0019:        os.stat(path)
     0020:    except OSError:
     0021:        return False
     0022:    return True
     0023:
Exception: TypeError: stat: can't specify None for path argument

The root cause of the problem was determined to be the noexec clause
in the image.bbclass.  When the package_write_rpm task runs it expects
that a manifest will be generated.  Not running the task eliminates
the problem.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/image.bbclass     | 2 +-
 meta/lib/oe/package_manager.py | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 23ed53d..ad44f11 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -629,7 +629,7 @@ deltask do_package_qa
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
+deltask do_package_write_rpm
 
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 287ca9a..980649f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -531,6 +531,8 @@ def create_packages_dir(d, rpm_repo_dir, deploydir, taskname, filterbydependenci
     for dep in rpmdeps:
         c = taskdepdata[dep][0]
         manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
+        if not manifest:
+            bb.fatal("No manifest generated from: %s in %s" % (c, taskdepdata[dep][2]))
         if not os.path.exists(manifest):
             continue
         with open(manifest, "r") as f:
-- 
2.7.4


