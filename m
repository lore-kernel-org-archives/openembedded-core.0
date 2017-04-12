Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7768577D43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:54:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 12 Apr 2017 13:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="845097148"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2017 13:54:07 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 86B776A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:53:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 23:41:00 +0300
Message-Id: <8993f2b4fdf35ae16ef96551440c7e54f76136b9.1492029084.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1492029084.git.ed.bartosh@linux.intel.com>
References: <cover.1492029084.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/5] qemuboot: write native sysroot of qemu-helper into qemuboot.conf
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
X-List-Received-Date: Wed, 12 Apr 2017 20:54:06 -0000

Native sysroot of qemu-helper contains all required tools
(qemu-system and tunctl atm) for runqemu to work. It's not
removed by rm_dir and should always exist. It makes sense
to write it into qemuboot.conf to make runqemu to use it
as a default directory for native tools.

This should also speed up runqemu as it doesn't need to run
to run 'bitbake qemu-helper -e' to get its native sysroot.

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/qemuboot.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 2870388..cc5314e 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -87,7 +87,14 @@ python do_write_qemuboot_conf() {
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
     for k in qemuboot_vars(d):
-        cf.set('config_bsp', k, '%s' % d.getVar(k))
+        # qemu-helper-native sysroot is not removed by rm_work and
+        # contains all tools required by runqemu
+        if k == 'STAGING_BINDIR_NATIVE':
+            val = os.path.join(d.getVar('BASE_WORKDIR'), d.getVar('BUILD_SYS'),
+                               'qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/')
+        else:
+            val = d.getVar(k)
+        cf.set('config_bsp', k, '%s' % val)
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
     # to the kernel file, which hinders relocatability of the qb conf.
-- 
2.1.4


