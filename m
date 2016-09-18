Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83C3E731BC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:39:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8I7dXHZ029970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:39:33 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:39:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 00:39:24 -0700
Message-ID: <1cbc3eb903bbb456ab5484b753a3688dc0e8dcb5.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474183984.git.liezhi.yang@windriver.com>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/8] qemuboot: write the full kernel filename, not the link name
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
X-List-Received-Date: Sun, 18 Sep 2016 07:39:33 -0000
Content-Type: text/plain

From: Joshua Lock <joshua.g.lock@intel.com>

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
2.9.0


