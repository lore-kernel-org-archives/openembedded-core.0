Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 847CB78897
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 06:56:55 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w646usiV028709
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2018 23:56:55 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Tue, 03 Jul 2018 23:56:54 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 23:56:53 -0700
Message-Id: <20180704065654.21039-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] scripts/runqemu: qemumips support up to 2GiB RAM
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
X-List-Received-Date: Wed, 04 Jul 2018 06:56:55 -0000

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

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index de42d0f323..597e7e9a79 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -668,7 +668,10 @@ class BaseConfig(object):
             logger.info('QB_MEM is not set, use 512M by default')
             self.set('QB_MEM', '-m 512')
 
-        self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
+        mach = self.get('MACHINE')
+        if mach != 'qemumips':
+            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
+
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
 
     def check_tcpserial(self):
-- 
2.11.0


