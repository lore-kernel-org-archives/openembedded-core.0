Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9M3q-0003pB-M9
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 21:14:22 +0200
Received: from mail67-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 19:08:54 +0000
Received: from mail67-am1 (localhost.localdomain [127.0.0.1])	by
	mail67-am1-R.bigfish.com (Postfix) with ESMTP id CE64B19505C2	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 19:08:54 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail67-am1 (localhost.localdomain [127.0.0.1]) by mail67-am1
	(MessageSwitch) id 1317323288278889_15523;
	Thu, 29 Sep 2011 19:08:08 +0000 (UTC)
Received: from AM1EHSMHS001.bigfish.com (unknown [10.3.201.254])	by
	mail67-am1.bigfish.com (Postfix) with ESMTP id 350231800046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 19:08:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS001.bigfish.com
	(10.3.207.101) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 19:08:05 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Thu, 29 Sep 2011 14:08:05 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8TJ84Z5015762	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 14:08:04 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 14:08:04 -0500
Message-ID: <1317323284-32534-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 07/16] Fix lttng-ust for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 19:14:22 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/lttng/fix-powerpc64.patch |   17 +++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_0.15.bb   |    3 ++-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch

diff --git a/meta/recipes-kernel/lttng/fix-powerpc64.patch b/meta/recipes-kernel/lttng/fix-powerpc64.patch
new file mode 100644
index 0000000..3c3484c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/fix-powerpc64.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Submitted
+
+Add bit to detect if we are running on powerpc64 and treat it the
+same as ppc64
+
+Index: ust-0.15/configure.ac
+===================================================================
+--- ust-0.15.orig/configure.ac
++++ ust-0.15/configure.ac
+@@ -111,6 +111,7 @@ changequote([,])dnl
+ 	x86_64) LIBFORMAT="elf64-x86-64" ;;
+ 	powerpc) LIBFORMAT="elf32-powerpc" ;;
+ 	ppc64) LIBFORMAT="elf64-powerpc" ;;
++	powerpc64) LIBFORMAT="elf64-powerpc" ;;
+ 	s390) LIBFORMAT="elf32-s390" ;;
+ 	s390x) LIBFORMAT="elf64-s390" ;;
+         armv5) LIBFORMAT="elf32-littlearm"; NO_UNALIGNED_ACCESS=1 ;;
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
index 915e619..9dd4658 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
 
 DEPENDS = "liburcu"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
+SRC_URI_append_powerpc64 = " file://fix-powerpc64.patch"
 
 SRC_URI[md5sum] = "86c71486a70695dc0b2171ad16fc82b3" 
 SRC_URI[sha256sum] = "7ff7ecdc051c0649d5fd21b5ceff4895ca95dc34f14cdc04e50de13cfd1903c5"
-- 
1.7.6.1




