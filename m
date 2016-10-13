Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B64EE71AA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 09:45:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9D9jdit013867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 02:45:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Oct 2016 02:45:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2016 02:45:38 -0700
Message-ID: <5efcefb8fb966ad7c7a21a6c217db43199dd7b46.1476351914.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476351914.git.liezhi.yang@windriver.com>
References: <cover.1476351914.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: fix for "Argument list too long"
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
X-List-Received-Date: Thu, 13 Oct 2016 09:45:41 -0000
Content-Type: text/plain

Fixed when len(TMPDIR) = 410:
$ bitbake core-image-sato-sdk
[snip]
Subprocess output:
/bin/sh: /bin/cp: Argument list too long

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Function failed: do_rootfs
[snip]

This is because "copyhardlinktree(deploy_arch_dir, arch_channel)" does:
"cp -afl deploy_arch_dir/* arch_channel", while the deploy_arch_dir/* is
expanded to "deploy_arch_dir/pkg1 deploy_arch_dir/pkg2
deploy_arch_dir/pkg3 ..." which causes the "Argument list too long",
change cwd to deploy_arch_dir can avoid the error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3cee973..e0e203b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1024,7 +1024,11 @@ class RpmPM(PackageManager):
 
             lockfilename = self.d.getVar('DEPLOY_DIR_RPM', True) + "/rpm.lock"
             lf = bb.utils.lockfile(lockfilename, False)
-            oe.path.copyhardlinktree(deploy_arch_dir, arch_channel)
+            # chdir() to deploy_arch_dir to avoid "Argument list too long" error
+            oldcwd = os.getcwd()
+            os.chdir(deploy_arch_dir)
+            oe.path.copyhardlinktree('.', arch_channel)
+            os.chdir(oldcwd)
             bb.utils.unlockfile(lf)
 
             if not arch in ch_already_added:
-- 
2.9.0


