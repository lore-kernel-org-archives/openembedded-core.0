Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78D1E77E95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:28:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8B9S9mr014640
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 02:28:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 11 Sep 2017 02:28:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 02:28:06 -0700
Message-ID: <2feb5110b30e3b9c7c2f18248018880cf67f82e5.1505122056.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1505122056.git.liezhi.yang@windriver.com>
References: <cover.1505122056.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] runqemu: default qemumips memory to 256M
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
X-List-Received-Date: Mon, 11 Sep 2017 09:28:08 -0000
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
index df76270..ce8cccc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -639,8 +639,13 @@ class BaseConfig(object):
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
 
         self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
-- 
2.10.2


