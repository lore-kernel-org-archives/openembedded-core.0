Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54EEC793E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:45:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7UDjq83015496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 06:45:52 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 06:45:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 09:45:41 -0400
Message-ID: <a6f4eaf26e9eab569625d51a0bf46adb3b664729.1535636375.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535636375.git.bruce.ashfield@windriver.com>
References: <cover.1535636375.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] kernel-devsrc: fix arm/arm64 target module build
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
X-List-Received-Date: Thu, 30 Aug 2018 13:45:52 -0000
Content-Type: text/plain

module.lds is required for arch/arm* to build modules out of tree, but
isn't required for scripts/prepare, so it was missed in the initial
devsrc rework:

root@qemuarm64:/tmp# make -C /usr/src/kernel M=/tmp modules
make: Entering directory '/lib/modules/4.18.3-yocto-standard/build'
  CC [M]  /tmp/hellomod.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /tmp/hellomod.mod.o
  LD [M]  /tmp/hellomod.ko
make: Leaving directory '/lib/modules/4.18.3-yocto-standard/build'
root@qemuarm64:/tmp# insmod hellomod.ko
[  675.743628] hellomod: loading out-of-tree module taints kernel.
[  675.794959] Hello world!

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b3f529237a90..463305e89aa8 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -146,6 +146,8 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+
+            cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/
 	fi
 
 	# include the machine specific headers for ARM variants, if available.
@@ -156,6 +158,8 @@ do_install() {
 	    cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
 	    cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
 	    cp -a --parents arch/arm/tools/syscall* $kerneldir/build/
+
+            cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/
 	fi
 
 	if [ -d arch/${ARCH}/include ]; then
-- 
2.5.0


