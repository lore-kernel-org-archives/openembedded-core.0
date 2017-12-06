Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D191D71AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 02:46:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB62kkFM027537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Dec 2017 18:46:46 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Dec 2017 18:46:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 5 Dec 2017 21:46:43 -0500
Message-ID: <1512528404-110242-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
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
X-List-Received-Date: Wed, 06 Dec 2017 02:46:45 -0000
Content-Type: text/plain

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
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f2b4b3c..0ae2f85 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -658,7 +658,10 @@ class BaseConfig(object):
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
2.8.1


