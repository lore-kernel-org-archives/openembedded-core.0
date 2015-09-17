Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BD4F077003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:38:01 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nH12h3ZT4z3hkK2;
	Thu, 17 Sep 2015 16:31:55 +0200 (CEST)
X-Auth-Info: lu7nuZpLLVx/o155SkzU8+JOwUJvLIHiNP17ItvNVz4=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nH12g4WSKzvdWt;
	Thu, 17 Sep 2015 16:31:55 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:31:52 +0200
Message-Id: <1442500317-9064-4-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442500317-9064-1-git-send-email-marex@denx.de>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 3/8] linux-yocto: depend on libgcc for nios2
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
X-List-Received-Date: Thu, 17 Sep 2015 14:38:02 -0000

Make nios2 kernel depend on libgcc.

In arch/nios2/Makefile, it adds LIBGCC to libs-y:

LIBGCC          := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
libs-y          += $(LIBGCC)

In file Makefile in top directory, libs-y is assigned to to var
KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link vmlinux.o,
and when execute function vmlinux_link() in link-vmlinux.sh,
KBUILD_VMLINUX_MAIN is passed to ${LD}.

If build without libgcc, the value of LIBGCC is just libgcc.a without
parent directory. linux-yocto fails to build:

|   LD      vmlinux.o
| nios2-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory

Add libgcc to nios2 kernel dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 3b41a61..81ffa24 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -11,6 +11,10 @@ DEPENDS_append_aarch64 = " libgcc"
 KERNEL_CC_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
 
+DEPENDS_append_nios2 = " libgcc"
+KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
+KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.1.4


