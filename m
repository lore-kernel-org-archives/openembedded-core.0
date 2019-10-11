Return-Path: <lkml@jv-coder.de>
X-Greylist: delayed 549 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Oct 2019 06:13:40 UTC
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
	by mail.openembedded.org (Postfix) with ESMTP id DDB1D7F560
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 06:13:40 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 502029F973;
	Fri, 11 Oct 2019 06:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1570773871; bh=LuVd4f5QPAMN4rBQszpI6oY4ZEPsivCmyfSff39FgJo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Vet+MBJXvKMptD15bMflwZhO5FRgd2kbb+Gq7AV6A7VzikpuEM+c9dTxb0cUIEN6P
	ub/S9UcxhSPI2BsQYKy+1EiNTR6AAzFsKD0n1nyLCO7zjI+08+nWBEfbPvYaBw8aUB
	9W/OVzS80543JC+nP/fxGeMGOegjJqNyARubvoCY=
From: Joerg Vehlow <lkml@jv-coder.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 08:03:57 +0200
Message-Id: <20191011060357.24099-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.jv-coder.de
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Subject: [PATCH] runqemu: Remove disabling of high resolution timer
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
X-List-Received-Date: Fri, 11 Oct 2019 06:13:41 -0000
Content-Transfer-Encoding: 8bit

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The option 'highres=off' sneaked itself into the runqemu script for all
configurations, where the root filesystem type is not 'cpio' or 'cpio.gz'.
See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13590

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1a5aca98ac..3b4ca323db 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1197,12 +1197,12 @@ class BaseConfig(object):
 
                 # All branches above set vm_drive.
                 self.rootfs_options = '%s -no-reboot' % vm_drive
-            self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
+            self.kernel_cmdline = 'root=%s rw' % (self.get('QB_KERNEL_ROOT'))
 
         if self.fstype == 'nfs':
             self.rootfs_options = ''
             k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, os.path.abspath(self.rootfs), self.unfs_opts)
-            self.kernel_cmdline = 'root=%s rw highres=off' % k_root
+            self.kernel_cmdline = 'root=%s rw' % k_root
 
         if self.fstype == 'none':
             self.rootfs_options = ''
-- 
2.20.1


