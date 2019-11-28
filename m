Return-Path: <peter@berginkonsult.se>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Nov 2019 06:30:59 UTC
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
	(mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
	by mail.openembedded.org (Postfix) with ESMTP id 3A10F7FA16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 06:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=message-id:date:subject:cc:to:from:from;
	bh=ya0imk0VCF/btldg7fvV7jSJ1pR32c6+xhzwyIVc0pk=;
	b=ilPFJMMnuJZEVnoRiEoNYkbOgidtVMf5pteV+E4zxsNtjSLR+0PTlkgs8iIXbs0ateTxYmfUvgnj/
	0GicyJkw/4fqciH80f6GT1tsNG+eVd8M3v0paCyvSu6m0PWQrShFyiVtYSZppDhhIoBR13jQlNIObR
	a0bdSwQ8M8NWCEqntz/yqesyuUGi5aLQgkJhuXqsYHnJihitV/40/GINOtHZcXN7FlbV1yVeGIjhgQ
	0T13FC1uTMYBlq0BEkHwz5NV7P3q2UR/wygMW3pLC1KlIPpUyM5iQIF1UP3HKNTUnGoiZZwD60gh43
	nGAobelxE+RlrTccswBj4/LTGBMPTow==
X-HalOne-Cookie: 12d80446961dfce1222cb1774e02bca3585aee90
X-HalOne-ID: 63956519-11a6-11ea-aee4-d0431ea8a283
Received: from localhost.localdomain (unknown [83.250.5.252])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 63956519-11a6-11ea-aee4-d0431ea8a283;
	Thu, 28 Nov 2019 06:14:56 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2019 07:14:24 +0100
Message-Id: <1574921664-22600-1-git-send-email-peter@berginkonsult.se>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-devsrc: fix error with old (<4.2) x86 kernels
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
X-List-Received-Date: Thu, 28 Nov 2019 06:30:59 -0000

When using kernel-devsrc for older kernels do_install fails with:

| cp: failed to get attributes of 'arch/x86/entry': No such file or directory

In the Linux kernel commit 1f57d5d85
"x86/asm/entry: Move the arch/x86/syscalls/ definitions to arch/x86/entry/syscalls/"
moved some files copied in the kernel-devsrc recipe. Commit 1f57d5d85 was added in
v4.2.

To be able to use kernel-devsrc for kernels older than v4.2 this commit make use of find
for the files that shall be copied.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b68d945..b6f2dbc 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -185,14 +185,14 @@ do_install() {
 	cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
 
 	# required for generate missing syscalls prepare phase
-	cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build
+	cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
 
 	if [ "${ARCH}" = "x86" ]; then
 	    # files for 'make prepare' to succeed with kernel-devel
-	    cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build/
-	    cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh $kerneldir/build/
-	    cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh $kerneldir/build/
-	    cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl $kerneldir/build/
+	    cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/
+	    cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/
+	    cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/
+	    cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
-- 
2.7.4


