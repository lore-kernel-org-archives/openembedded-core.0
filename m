Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B2F83731D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537844"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:46 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:29 +0100
Message-Id: <06d1491b094009da2fa3c138e7c3094141636b61.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/6] qemuboot: write the full kernel filename, not the link name
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:46 -0000

KERNEL_IMAGETYPE gives the filename of a symlink to the kernel,
which may not be available i.e. if the user downloads some build
artefacts to run on a local machine. It's also possible that the
link will point to a newer kernel than was intended for use with
the rootfs in the qemuboot.conf.

It's much more reliable to read the name of the file
KERNEL_IMAGETYPE is linking to and assign the full filename to
QB_DEFAULT_KERNEL.

[YOCTO #10285]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/qemuboot.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 8500c73..0892db3 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -63,6 +63,14 @@ python write_qemuboot_conf() {
     cf.add_section('config_bsp')
     for k in build_vars + qb_vars:
         cf.set('config_bsp', k, '%s' % d.getVar(k, True))
+
+    # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
+    # to the kernel file, which hinders relocatability of the qb conf.
+    # Read the link and replace it with the full filename of the target.
+    kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('QB_DEFAULT_KERNEL', True))
+    kernel = os.readlink(kernel_link)
+    cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
+
     with open(qemuboot, 'w') as f:
         cf.write(f)
 
-- 
2.7.4


