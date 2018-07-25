Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58727789CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:24:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6P8ON1s008165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:24:24 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 01:24:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2018 16:34:34 +0800
Message-ID: <6c7e807f1f1369aa865201b4678a1764ab6c1ef1.1532507399.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532507399.git.liezhi.yang@windriver.com>
References: <cover.1532507399.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] runqemu: default qemumips memory to 256M
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
X-List-Received-Date: Wed, 25 Jul 2018 08:24:23 -0000
Content-Type: text/plain

The qemumips or qemumips64 can't be boot with 512M.

*Fixed when no QB_MEM is set:
 - runqemu qemumips nographic core-image-minimal
[    0.000000] Call Trace:
[    0.000000] [<8011c010>] clear_page+0x0/0x128
[    0.000000] [<8022b818>] get_page_from_freelist+0xa1c/0xb48
[    0.000000] [<8022c00c>] __alloc_pages_nodemask+0xd8/0xf0c
[    0.000000] [<8022ce58>] __get_free_pages+0x18/0x60
[    0.000000] [<80118674>] setup_zero_pages+0x1c/0x98
[    0.000000] [<80bd23e4>] mem_init+0x44/0x54
[    0.000000] [<80bca964>] start_kernel+0x20c/0x4bc
[    0.000000] [<80920090>] kernel_entry+0x0/0x40
[    0.000000] Code: 00000000  00000000  00000000 <34860f80> cc9e0000  cc9e0010  cc9e0020  cc9e0030  cc9e0040
[    0.000000]
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task!

[YOCTO #11521]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 73d7d58..7a13e5d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -665,8 +665,13 @@ class BaseConfig(object):
         if s:
             self.set('QB_MEM', '-m %s' % s.group(1))
         elif not self.get('QB_MEM'):
-            logger.info('QB_MEM is not set, use 512M by default')
-            self.set('QB_MEM', '-m 512')
+            mach = self.get('MACHINE')
+            if mach.startswith('qemumips'):
+                logger.info('QB_MEM is not set, use 256M by default')
+                self.set('QB_MEM', '-m 256')
+            else:
+                logger.info('QB_MEM is not set, use 512M by default')
+                self.set('QB_MEM', '-m 512')
 
         mach = self.get('MACHINE')
         if not mach.startswith('qemumips'):
-- 
2.7.4


