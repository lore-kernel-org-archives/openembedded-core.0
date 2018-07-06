Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D36CC78A2C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:44:44 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w669iiYL018983
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2018 02:44:44 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Fri, 06 Jul 2018 02:44:44 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 02:44:44 -0700
Message-Id: <20180706094444.11006-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] scripts/runqemu: fix qemumips qemumips64 memory detection kernel panic
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
X-List-Received-Date: Fri, 06 Jul 2018 09:44:44 -0000

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

OE uses qemumips to simulate a Malta board by default.

As upstream qemu introduced:
https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b

The Malta board can support up to 2GiB of RAM which should
be able to boot a Linux kernel built with CONFIG_HIGHMEM
enabled and passing "-m 2048" to QEMU and appending the
following kernel parameters:
...
mem=256M@0x0 mem=256M@0x90000000 mem=1536M@0x20000000
...

But the following commit in kernel broke above mem=X@Y setting
which added the memory as reserved memory area.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
...
commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date:   Wed Nov 23 14:43:49 2016 +0100

    MIPS: fix mem=X@Y commandline processing
...

So remove `mem=*' to disable user-defined physical RAM map
which let kernel itself caculates memory ranges.

Author: Hongxu Jia <hongxu.jia@windriver.com>
[ Merge the two fixes for qemumips32 and qemumips64 into one patch,
  and add cases for possible mipsel mips64el ]
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 597e7e9a799..a0c556b8728 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -669,7 +669,7 @@ class BaseConfig(object):
             self.set('QB_MEM', '-m 512')
 
         mach = self.get('MACHINE')
-        if mach != 'qemumips':
+        if mach != 'qemumips' and mach != 'qemumips64' and mach != 'qemumipsel' and mach != 'qemumips64el':
             self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
 
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
-- 
2.11.0


