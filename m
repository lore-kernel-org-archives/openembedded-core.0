Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RT9Q1-0006s0-Mk
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 10:47:06 +0100
Received: from mail53-ch1-R.bigfish.com (10.43.68.254) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.22; Wed, 23 Nov 2011 09:39:47 +0000
Received: from mail53-ch1 (localhost [127.0.0.1])	by mail53-ch1-R.bigfish.com
	(Postfix) with ESMTP id 4992AC060B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:39:50 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VS-2(zzdf9Mzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1]) by mail53-ch1
	(MessageSwitch) id 1322041190126542_17865;
	Wed, 23 Nov 2011 09:39:50 +0000 (UTC)
Received: from CH1EHSMHS034.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail53-ch1.bigfish.com (Postfix) with ESMTP id
	19FF0200042 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:39:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS034.bigfish.com
	(10.43.70.34) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 23 Nov 2011 09:39:47 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 23 Nov 2011 03:40:27 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAN9eQx5012325	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 03:40:26 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 03:40:26 -0600
Message-ID: <1322041226-10075-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2011 09:47:06 -0000
Content-Type: text/plain

Without some sort of dependency on the HOST arch this "fake"
target package will be reused on a 32bit system even if it was
built on a 64bit system.

This new dependecy should prevent that from occuring.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Comments? I still this this is VERY BAD since it will trigger
all TARGET cache to be rebuilt just because we changed ARCH.
However, it should generate working sstate-cache. Might
address this issue:

| checking for /home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/ -m32 -mhard-float  -mcpu=e500mc -isystem/home/liut/poky/build_p4080ds_release/tmp/sysroots/p4080ds/usr/include -B/home/liut/poky/build_p4080ds_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/bin/ -B/home/liut/poky/build_p4080ds_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/lib/ -isystem /home/liut/poky/build_p4080ds_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/include -isystem /home/liut/poky/build_p4080ds_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/sys-include --sysroot=/home/liut/poky/build_p4080ds_release/tmp/sysroots/p4080ds-tcbootstrap   option to accept ISO C89... none needed
| checking how to run the C preprocessor... /home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/ -E
| configure: error: in `/home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/powerpc-fsl-linux/libgcc':
| configure: error: C preprocessor "/home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/ -E" fails sanity check
| See `config.log' for more details.
| make[1]: *** [configure-target-libgcc] Error 1
| make[1]: Leaving directory `/home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function 'do_compile' failed (see /home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/temp/log.do_compile.27393 for further information)

 meta/recipes-devtools/gcc/gcc-4.6.inc   |    2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc |   11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index f7bcf30..ee42fa7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r10"
+PR = "r11"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 5a796bc..9f6d6ad 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -10,3 +10,14 @@ do_compile () {
 	oe_runmake all-host all-target-libgcc
 }
 
+# gcc-cross is special since it builds a HOST binary on
+# as a TARGET recipe. This is a hack to pull in the
+# BUILD_ARCH to the recipe so the sstate-cache is
+# different if the HOST ARCH has changed. By expanding
+# right now we assure it's going to be in the sig
+BUILD_ARCH_EXPANDED := "${BUILD_ARCH}"
+
+# we also add this to the PV so its clear in filenames
+# that this is arch specific even though it's labeled as
+# a target package
+PV .= "+${BUILD_ARCH_EXPANDED}"
-- 
1.7.6.1




