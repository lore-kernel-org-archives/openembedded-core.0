Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6108077EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:21:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I3LcLL000021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:21:38 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 20:21:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 20:21:33 -0700
Message-ID: <0fbbade27abfef2bdd4cca957827475f6fa258f6.1500348040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500348040.git.liezhi.yang@windriver.com>
References: <cover.1500348040.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] runqemu: check tar.bz2 and .tar.gz
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
X-List-Received-Date: Tue, 18 Jul 2017 03:21:37 -0000
Content-Type: text/plain

Handle them as nfs, so that cmd like the following can be boot:
$ runqemu tmp/deploy/images/qemux86/core-image-minimal-qemux86.tar.bz2

[YOCTO #11286]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 781814ae651..bdb559f82ff 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -218,7 +218,8 @@ class BaseConfig(object):
         self.lock_descriptor = ''
         self.bitbake_e = ''
         self.snapshot = False
-        self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs')
+        self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
+                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
         self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'vmdk', 'qcow2', 'vdi', 'iso')
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
         # Use different mac section for tap and slirp to avoid
@@ -277,6 +278,8 @@ class BaseConfig(object):
         if not self.fstype or self.fstype == fst:
             if fst == 'ramfs':
                 fst = 'cpio.gz'
+            if fst in ('tar.bz2', 'tar.gz'):
+                fst = 'nfs'
             self.fstype = fst
         else:
             raise RunQemuError("Conflicting: FSTYPE %s and %s" % (self.fstype, fst))
-- 
2.11.0


