Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id AB9A4783FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 20:00:22 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8BK0NHx015823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:00:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1505160023;
	bh=DRkosg3TPCzoz/DWIL9lBhDlBFvrJOzB7XGGHUOvLpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=a5JHTXebBA3OoUFX6Gg2GXAaUBrcxGUa6qViUi3ubZjNQuyulYzK7oEPFytkLODKr
	7kWO4nyzAl4NSI0gHGS8blzz54tGYFqLRxnTHwi09zv+bz2MaM9WPX7VXbsm8GAoQp
	OWhjSW2thntA60jrDuC+J71eDMLzFZsoTSq6wOzo=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8BK0G7M002705 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 11 Sep 2017 22:00:17 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 5124A5E659B;
	Mon, 11 Sep 2017 21:55:13 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8BK0DL2002702
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 11 Sep 2017 22:00:13 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1drUsP-0004Mm-9w; Mon, 11 Sep 2017 22:00:13 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Sep 2017 22:00:03 +0200
Message-Id: <20170911200003.16530-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
References: <20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.76
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Mon, 11 Sep 2017 20:00:24 -0000

The --extra-space and --overhead option did not had an effect to squashfs
partitions.  Although squashfs is read-only, it can be useful to allocate
more space for the on-disk partition to avoid repartitioning of the whole
disk when a new (and larger) squashfs image is written on later updates.

Patch calls get_rootfs_size() *after* creating the image and truncates
it then.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 scripts/lib/wic/partition.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9..bf9bbc3 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -195,6 +195,17 @@ class Partition():
                            "larger (%d kB) than its allowed size %d kB" %
                            (self.mountpoint, self.size, self.fixed_size))
 
+    def _extend_rootfs_image(self, rootfs):
+        """Enlarges the rootfs so that it fulfills size/overhead-factor
+        constraints"""
+
+        sz = (os.stat(rootfs).st_size + 1023) // 1024
+        pad_sz = self.get_rootfs_size(sz)
+
+        if pad_sz > sz:
+            with open(rootfs, 'a') as f:
+                os.ftruncate(f.fileno(), pad_sz * 1024)
+
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
                        native_sysroot):
         """
@@ -338,6 +349,8 @@ class Partition():
                        (rootfs_dir, rootfs, extraopts)
         exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
 
+        self._extend_rootfs_image(rootfs)
+
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):
         """
-- 
2.9.5


