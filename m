Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Feb 2020 19:32:07 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id B43FA6111B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1659; q=dns/txt; s=iport;
	t=1581708729; x=1582918329;
	h=from:to:cc:subject:date:message-id;
	bh=FE++HigccWeGBw4lZT1gEZjvK909XJWMLRq9SjBuL4Q=;
	b=BPFTXReDnR36uYQuVHzafp4eD2uoIHU4wxbcGGZiCrleLxCH7vCZo4Hc
	6aINXZSuToX127A+beZYweee6qvTsATx697r7V7SiqKEb5eGB+RKen6Ru
	GAL/G8I1cH1t74XlIvySzVQd67S0xEhIXwAvzrDDlH+cpol4lu2L8u1qM 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C6AAAz80Ze/xbLJq1mHAEBAQEBBwE?=
	=?us-ascii?q?BEQEEBAEBgWoEAQELAYMUdRIqjRejWAkBAQEOHxAEAQGEQIInNwYOAgMNAQE?=
	=?us-ascii?q?FAQEBAgEFBG2FNwyGZoFRgyYBgnutR4InhUqDRIE+FIEkAYdFhHiBQT+BEYE?=
	=?us-ascii?q?YgjmFGIUhBJZjmReCRIdNjngMHINDlmJyAao+gWgjgVgzGggbFYMnCUcYDZB?=
	=?us-ascii?q?rhGOHFz8DMJBYAQE?=
X-IronPort-AV: E=Sophos;i="5.70,441,1574121600"; d="scan'208";a="23336402"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	14 Feb 2020 19:24:58 +0000
Received: from localhost ([10.63.15.147])
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id 01EJOvbV022085;
	Fri, 14 Feb 2020 19:24:58 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 21:24:56 +0200
Message-Id: <20200214192456.2944-1-rbilovol@cisco.com>
X-Mailer: git-send-email 2.17.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.147, [10.63.15.147]
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] kernel-devsrc: support 4.4+ ARM/ARM64 kernels
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
X-List-Received-Date: Fri, 14 Feb 2020 19:32:08 -0000

Linux Kernel 4.4 is an LTS kernel so people may still
build it with OE.

Thus make copying of some files optional:
 - arm64 module.lds file first appeared with kernel v4.6 commit
   fd045f6cd98e arm64: add support for module PLTs"
 - arm32 *.tbl files first appeared in kernel v4.10 in
   commit 96a8fae0fe09 "ARM: convert to generated
   system call tables"

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 2fa4be67cc..2ac679e204 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -147,7 +147,7 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
 
-            cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/
+            cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	if [ "${ARCH}" = "powerpc" ]; then
@@ -187,7 +187,7 @@ do_install() {
 
 	# required for generate missing syscalls prepare phase
 	cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
-	cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build
+	cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build 2>/dev/null || :
 
 	if [ "${ARCH}" = "x86" ]; then
 	    # files for 'make prepare' to succeed with kernel-devel
-- 
2.17.1


