Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC1F770A1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3209XME009226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Apr 2016 17:09:33 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:23 -0400
Message-ID: <83e2b54f3a1805a92a50b30c8e38af0ba5322576.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] Revert "linux-yocto: Work around PAT issue on qemux86"
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:33 -0000
Content-Type: text/plain

This reverts commit 94abdb2eea610b174064978d2fb8354a6231fc0c.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-yocto/0001-Fix-qemux86-pat-issue.patch   | 100 ---------------------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   2 -
 2 files changed, 102 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch b/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch
deleted file mode 100644
index 367d9b4ace1b..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 9bfb2c711f66fc8eb6482f5ca6ea33c2ec1d792f Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sat, 13 Feb 2016 17:36:23 +0000
-Subject: [PATCH] Fix qemux86 pat issue
-
-on qemux86, X doesn't start and there is
-a backtrace in the logs:
-
-x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
-------------[ cut here ]------------
-WARNING: CPU: 0 PID: 705 at /media/build1/poky/build/tmp/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:985 untrack_pfn+0xaf/0xc0()
-Modules linked in: uvesafb
-CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1
-Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
- 00000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f6c
- 00000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b6355000
- 00000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14ddd0
-Call Trace:
- [<c1397ab2>] dump_stack+0x4b/0x79
- [<c1051477>] warn_slowpath_common+0x87/0xc0
- [<c104b98f>] ? untrack_pfn+0xaf/0xc0
- [<c104b98f>] ? untrack_pfn+0xaf/0xc0
- [<c1051552>] warn_slowpath_null+0x22/0x30
- [<c104b98f>] untrack_pfn+0xaf/0xc0
- [<c104d54c>] ? kmap_atomic_prot+0x3c/0xf0
- [<c114e17f>] unmap_single_vma+0x4ef/0x500
- [<c114f007>] unmap_vmas+0x37/0x50
- [<c1154f8f>] exit_mmap+0x5f/0xf0
- [<c104eedd>] mmput+0x2d/0xb0
- [<c105009c>] copy_process+0xd2c/0x13c0
- [<c1050892>] _do_fork+0x82/0x340
- [<c105f2d1>] ? SyS_rt_sigaction+0x51/0xa0
- [<c1050c3c>] SyS_clone+0x2c/0x30
- [<c1001a03>] do_syscall_32_irqs_on+0x53/0xb0
- [<c189a94a>] entry_INT80_32+0x2a/0x2a
----[ end trace be3e0a61097feddc ]---
-x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
-
-The entry in question is setup by uvesafb which in its
-uvesafb_ioremap() function calls ioremap_wc().
-
-It appears that Xorg mmaps this from userspace, then later does a
-fork() to execute a utility. At this point, when creating the vmas for
-the new process, the pat code says "eeek!" as the protection mode for
-the new vmas don't match the old one, returns -EINVAL, the process dies
-and X goes with it.
-
-There are a few hammers we can hit this with, we can boot with "nopat"
-option which makes the problem go away, or turn off CONFIG_X86_PAT. No
-surprises there. Changing uvesafb to use mtrr=0 doesn't help since the
-ioremap_wc call still happens.
-
-The real issue is the "expected mapping type uncached-minus for got
-write-combining" message, it all goes wrong from there.
-
-Upon looking at the code and scratching my head for a long while, I
-notice that there are two ways of representing the protection mode
-data, "enum page_cache_mode" and "pgprot_t & _PAGE_CACHE_MASK".
-
-The exact meaning of pgprot_t depends on which CPU you're running,
-older CPUs have errata meaning only a small number of bits can be used.
-The exact mapping table is determined by __cachemode2pte_tbl and is
-updated at boot by calls from update_cache_mode_entry().
-
-The result of this if you map enum -> pgprot_t, then try to do pgprot_t
--> enum, you can get different values since its not a 1:1 mapping.
-
-This means the comparison in reserve_pfn_range() where it does "pcm !=
-want_pcm" isn't correct and can trigger even in cases where there isn't
-a problem.
-
-This can be "fixed" by doing cachemode2protval(pcm) !=
-cachemode2protval(want_pcm) and checking whether the protection bits
-match, rather than the enum values, since in reality this is what we
-really care about. With that change, X boots up just fine.
-
-We don't see this on qemux86-64 since that has more PAT bits working
-and hence the values map correctly.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- arch/x86/mm/pat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/x86/mm/pat.c b/arch/x86/mm/pat.c
-index 031782e..11064fb 100644
---- a/arch/x86/mm/pat.c
-+++ b/arch/x86/mm/pat.c
-@@ -833,7 +833,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
- 	if (ret)
- 		return ret;
- 
--	if (pcm != want_pcm) {
-+	if (cachemode2protval(pcm) != cachemode2protval(want_pcm)) {
- 		if (strict_prot ||
- 		    !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
- 			free_memtype(paddr, paddr + size);
--- 
-2.5.0
-
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 49038caf943e..5280777f80c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -40,5 +40,3 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-
-SRC_URI_append = " file://0001-Fix-qemux86-pat-issue.patch"
-- 
2.5.0


