Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SpYcY-0006u6-7p
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 07:40:54 +0200
Received: from mail55-co1-R.bigfish.com (10.243.78.227) by
	CO1EHSOBE013.bigfish.com (10.243.66.76) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 05:14:33 +0000
Received: from mail55-co1 (localhost [127.0.0.1])	by mail55-co1-R.bigfish.com
	(Postfix) with ESMTP id 9356B7C0423	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 05:14:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail55-co1 (localhost.localdomain [127.0.0.1]) by mail55-co1
	(MessageSwitch) id 1342156472471270_15227;
	Fri, 13 Jul 2012 05:14:32 +0000 (UTC)
Received: from CO1EHSMHS026.bigfish.com (unknown [10.243.78.252])	by
	mail55-co1.bigfish.com (Postfix) with ESMTP id 717951C0048	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 05:14:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS026.bigfish.com
	(10.243.66.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 05:14:32 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 13 Jul 2012 00:14:31 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6D5EUlI013740; Thu, 12 Jul 2012 22:14:30 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2012 00:14:25 -0500
Message-ID: <1342156465-15052-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [PATCH v2] lsof: define linux C library type when using eglibc
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
X-List-Received-Date: Fri, 13 Jul 2012 05:40:54 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

lsof tries to compile a temp c source file and execute the binary to
determine linux C library type (file Configure, line 2689-2717).
It is inpracticable for cross-compilation and may have build issue on
some distros since it depends on host settings.

Fix below error when building for 64bit target on 64bit host:
[...]
| dsock.c:481:44: error: 'TCP_LISTEN' undeclared (first use in this function)
| dsock.c:482:45: error: 'TCP_CLOSING' undeclared (first use in this function)
[...]
| make: *** [dsock.o] Error 1

The actual issue exists in do_configure:
[...]
Testing C library type with cc ... done
Cannot determine C library type; assuming it is not glibc.

Which is in turn caused by missing 'gnu/stubs-32.h" when compiling
the temp c source file on host:
[...]
fatal error: gnu/stubs-32.h: No such file or directory compilation terminated.

file gnu/stubs-32.h is provided by 32bit glibc.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-extended/lsof/lsof_4.85.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.85.bb b/meta/recipes-extended/lsof/lsof_4.85.bb
index 5823725..de7ff68 100644
--- a/meta/recipes-extended/lsof/lsof_4.85.bb
+++ b/meta/recipes-extended/lsof/lsof_4.85.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
@@ -31,6 +31,11 @@ export LSOF_INCLUDE = "${STAGING_INCDIR}"
 do_configure () {
 	export LSOF_AR="${AR} cr"
 	export LSOF_RANLIB="${RANLIB}"
+        if [ "x${EGLIBCVERSION}" != "x" ];then
+                LINUX_CLIB=`echo ${EGLIBCVERSION} |sed -e 's,\.,,g'`
+                LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
+                export LINUX_CLIB
+        fi
 	yes | ./Configure ${LSOF_OS}
 }
 
-- 
1.7.3.4




