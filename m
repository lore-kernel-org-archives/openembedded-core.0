Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id CFBAB771A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:02:14 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1292Ftk010442 for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 03:02:15 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020203021569-543160 ;
	Tue, 2 Feb 2016 03:02:15 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 2 Feb 2016 11:01:56 +0200
Message-Id: <1454403716-29758-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 03:02:16 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 03:02:16 AM,
	Serialize complete at 02/02/2016 03:02:16 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_07:, , signatures=0
Subject: [PATCH 1/1] Revert "kernel/kernel-arch: Explicitly mapping between i386/x86_64 and x86 for kernel ARCH"
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
X-List-Received-Date: Tue, 02 Feb 2016 09:02:18 -0000

This reverts commit 8d310b24927d0f348fb431895f0583733db2aad0.

That commit completely breaks KBUILD_DEFCONFIG because it relies on
$ARCH to match between the target OE arch and the kernel subdirectory
containing the defconfigs. In the kernel all defconfigs for everything
x86-based (including x86_64) is stored in dir arch/x86/configs/

kernel-yocto.bbclass correctly searches for all the defconfigs inside
${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}

Commit 8d310b249 makes it search in wrong places and _only_ if you
define TARGET_ARCH = "athlon" will it search x86 which is nonsensical.

The commit further adds an if clause to hack the mungled kernel arches
back to their original values (ugh) in do_shared_workdir which is run
after do compile, but of course the build breaks before that in
do_kernel_metadata because of the KBUILD_DEFCONFIG mentioned above (so
that hack is useless).

Please fix that corner case bug in another way which does not completely
screw up the kernel arch mapping & defconfig logic. If 64bit configs are
generated in the kernel for 32bit machines because the host is asked,
then it it a bug in the kernel, it is of no use to hack around it in OE.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/kernel-arch.bbclass |  4 +---
 meta/classes/kernel.bbclass      | 15 +++------------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index d8b180e..3ed5986 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -21,9 +21,7 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs', True).split()
 
-    if   re.match('i.86$', a):                  return 'i386'
-    elif re.match('x86.64$', a):                return 'x86_64'
-    elif re.match('athlon$', a):                return 'x86'
+    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f37affc..c3eab50 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -317,18 +317,9 @@ do_shared_workdir () {
 		cp -fR include/generated/* $kerneldir/include/generated/
 	fi
 
-	# When ARCH is set to i386 or x86_64, we need to map ARCH to the real name of src
-	# dir (x86) under arch/ of kenrel tree, so that we can find correct source to copy.
-
-	if [ "${ARCH}" = "i386" ] || [ "${ARCH}" = "x86_64" ]; then
-		KERNEL_SRCARCH=x86
-	else
-		KERNEL_SRCARCH=${ARCH}
-	fi
-
-	if [ -d arch/${KERNEL_SRCARCH}/include/generated ]; then
-		mkdir -p $kerneldir/arch/${KERNEL_SRCARCH}/include/generated/
-		cp -fR arch/${KERNEL_SRCARCH}/include/generated/* $kerneldir/arch/${KERNEL_SRCARCH}/include/generated/
+	if [ -d arch/${ARCH}/include/generated ]; then
+		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
+		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
 }
 
-- 
2.7.0


