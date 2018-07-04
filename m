Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05F5278A0E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 06:56:56 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w646uubh028713
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2018 23:56:56 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Tue, 03 Jul 2018 23:56:56 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 23:56:54 -0700
Message-Id: <20180704065654.21039-2-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180704065654.21039-1-zhe.he@windriver.com>
References: <20180704065654.21039-1-zhe.he@windriver.com>
Subject: [PATCH 2/2] scripts/runqemu: fix qemumips64 with 512M RAM caused kernel panic
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
X-List-Received-Date: Wed, 04 Jul 2018 06:56:56 -0000

$ runqemu qemumips64 core-image-minimal nographic qemuparams="-m 512"
...
[    0.000000] Call Trace:
[    0.000000] [<ffffffff801268c0>] clear_page+0x0/0x128
[    0.000000] [<ffffffff80238158>] get_page_from_freelist+0xab8/0xc00
[    0.000000] [<ffffffff80238964>] __alloc_pages_nodemask+0xdc/0xf68
[    0.000000] [<ffffffff80239808>] __get_free_pages+0x18/0x70
[    0.000000] [<ffffffff80122a4c>] setup_zero_pages+0x1c/0xb8
[    0.000000] [<ffffffff80c7c998>] mem_init+0x54/0xa0
[    0.000000] [<ffffffff80c74904>] start_kernel+0x204/0x4d8
[    0.000000] [<ffffffff8091dfb0>] kernel_entry+0x0/0x40
[    0.000000] Code: 02002025  1000f8d9  8e634d7c <34860f80> cc9e0000
cc9e0020  cc9e0040  cc9e0060  cc9e0080
[    0.000000]
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task!
...

Remove `mem=*' to disable user-defined physical RAM map which
let kernel itself caculates memory ranges.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 597e7e9a79..78f5c8b778 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -669,7 +669,7 @@ class BaseConfig(object):
             self.set('QB_MEM', '-m 512')
 
         mach = self.get('MACHINE')
-        if mach != 'qemumips':
+        if mach != 'qemumips' and mach != 'qemumips64':
             self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
 
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
-- 
2.11.0


