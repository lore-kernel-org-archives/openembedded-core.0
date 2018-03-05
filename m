Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F062E789EE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:58:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w25DwVTx020932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Mar 2018 05:58:31 -0800 (PST)
Received: from localhost.localdomain (172.25.59.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 5 Mar 2018 05:57:58 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2018 07:58:26 -0600
Message-ID: <1520258306-4263-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] package_manager.py: Print offending package instead of non-sense trace
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
X-List-Received-Date: Mon, 05 Mar 2018 13:58:30 -0000
Content-Type: text/plain

If you have a package that does not generate a manifest due to using a
noexec rule, the package name should be printed so the problem can be
tracked down.  With out the patch you get an error that makes it look
more like the package_manager is broken as shown below.

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

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

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


