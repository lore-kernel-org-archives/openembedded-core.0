Return-Path: <takondra@cisco.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 02:27:50 UTC
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id 64EC8610F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 02:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4582; q=dns/txt; s=iport;
	t=1580783272; x=1581992872;
	h=from:to:cc:subject:date:message-id;
	bh=MojADktelgscstc0EDBXKkIwZIA+vjr85ExTUxDI7LY=;
	b=in+wjlG6jRGU60bYGP0Qn9LAL/Eep7gWYhAM4vIM/oGsSDSV7A1V+Kbq
	a8OPMJ9ak/82uibBqYt4PwC+en9gfYG+XKdzaTWt66XcJAjjaskC6NGID
	cqMe/3EmRAVHfZB2x94fmbEPEyNNIDtE1FUPdHjhl3rqRBM5ICthJZ0bv o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AXAAAu1Dhe/4oNJK1lGgEBAQEBAQE?=
	=?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqAgEBAQELAYIobFQBMiqWNohukUkJAQEBDAE?=
	=?us-ascii?q?BJQoBAYRAgjYkNwYOAgMNAQEEAQEBAgEFBG2FNwyFZgEtUiwDAQIeYCGDJgG?=
	=?us-ascii?q?CViUPq3KBdDOENQGBFINMgTgGFIEkAYdBhF4agUE/gRCCX3OCZAKCC4VIBK9?=
	=?us-ascii?q?igkWHRo5uDBubBwGLAIxIkjMCBAsCFYFoI4FYcBWDJ1AYDY4pARaDUIpTQQM?=
	=?us-ascii?q?wC45+AQE?=
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; d="scan'208";a="443133506"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	04 Feb 2020 02:20:18 +0000
Received: from sjc-ads-7132.cisco.com (sjc-ads-7132.cisco.com [10.30.217.207])
	(authenticated bits=0)
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 0142K6jt022846
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 4 Feb 2020 02:20:18 GMT
From: Taras Kondratiuk <takondra@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 02:20:06 +0000
Message-Id: <20200204022006.714-1-takondra@cisco.com>
X-Mailer: git-send-email 2.18.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.30.217.207, sjc-ads-7132.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] gcc-9.2: fix bug #91102 'aarch64 ICE on Linux kernel with -Os'
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
X-List-Received-Date: Tue, 04 Feb 2020 02:27:50 -0000

Linux kernel compilation for aarch64 triggers ICE if
CONFIG_CC_OPTIMIZE_FOR_SIZE=y.

The rootcause is GCC bug #91102 'aarch64 ICE on Linux kernel with -Os'.
Apply the fix to 9.2.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/recipes-devtools/gcc/gcc-9.2.inc         |  1 +
 ...02-aarch64-ICE-on-Linux-kernel-with-.patch | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
index 926df11c2782..2bae85afe3a3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
 	   file://CVE-2019-15847_1.patch \
 	   file://CVE-2019-15847_2.patch \
 	   file://CVE-2019-15847_3.patch \
+           file://re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
new file mode 100644
index 000000000000..c37e0bb9dd9b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
@@ -0,0 +1,95 @@
+From efb0ee06f5c0186c2d1442ecd4dbbd55dbd97b44 Mon Sep 17 00:00:00 2001
+From: Vladimir Makarov <vmakarov@redhat.com>
+Date: Wed, 10 Jul 2019 16:07:10 +0000
+Subject: [PATCH] re PR target/91102 (aarch64 ICE on Linux kernel with -Os
+ starting with r270266)
+
+2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
+
+	PR target/91102
+	* lra-constraints.c (process_alt_operands): Don't match user
+	defined regs only if they are early clobbers.
+
+2019-07-10  Vladimir Makarov  <vmakarov@redhat.com>
+
+	PR target/91102
+	* gcc.target/aarch64/pr91102.c: New test.
+
+From-SVN: r273357
+Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/613caed2feb9cfc8158308670b59df3d031ec629]
+[takondra: dropped conflicting ChangeLog changes]
+Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
+---
+ gcc/lra-constraints.c                      | 17 ++++++++++----
+ gcc/testsuite/gcc.target/aarch64/pr91102.c | 26 ++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 4 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/pr91102.c
+
+diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
+index cf33da8013e4..6382dbf852b6 100644
+--- a/gcc/lra-constraints.c
++++ b/gcc/lra-constraints.c
+@@ -2172,8 +2172,9 @@ process_alt_operands (int only_alternative)
+ 		    else
+ 		      {
+ 			/* Operands don't match.  If the operands are
+-			   different user defined explicit hard registers,
+-			   then we cannot make them match.  */
++			   different user defined explicit hard
++			   registers, then we cannot make them match
++			   when one is early clobber operand.  */
+ 			if ((REG_P (*curr_id->operand_loc[nop])
+ 			     || SUBREG_P (*curr_id->operand_loc[nop]))
+ 			    && (REG_P (*curr_id->operand_loc[m])
+@@ -2192,9 +2193,17 @@ process_alt_operands (int only_alternative)
+ 				&& REG_P (m_reg)
+ 				&& HARD_REGISTER_P (m_reg)
+ 				&& REG_USERVAR_P (m_reg))
+-			      break;
++			      {
++				int i;
++				
++				for (i = 0; i < early_clobbered_regs_num; i++)
++				  if (m == early_clobbered_nops[i])
++				    break;
++				if (i < early_clobbered_regs_num
++				    || early_clobber_p)
++				  break;
++			      }
+ 			  }
+-
+ 			/* Both operands must allow a reload register,
+ 			   otherwise we cannot make them match.  */
+ 			if (curr_alt[m] == NO_REGS)
+diff --git a/gcc/testsuite/gcc.target/aarch64/pr91102.c b/gcc/testsuite/gcc.target/aarch64/pr91102.c
+new file mode 100644
+index 000000000000..70b99045a48e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/aarch64/pr91102.c
+@@ -0,0 +1,26 @@
++/* PR target/91102 */
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++
++int
++foo (long d, long l)
++{
++  register long e asm ("x1") = d;
++  register long f asm("x2") = l;
++  asm ("" : : "r" (e), "r" (f));
++  return 3;
++}
++
++struct T { int i; int j; };
++union S { long h; struct T t; };
++
++void
++bar (union S b)
++{
++  while (1)
++    {
++      union S c = b;
++      c.t.j++;
++      b.h = foo (b.h, c.h);
++    }
++}
-- 
2.18.1


