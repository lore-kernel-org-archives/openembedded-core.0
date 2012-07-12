Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SpDpd-0003ws-6E
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 09:29:01 +0200
Received: from mail248-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jul 2012 06:17:32 +0000
Received: from mail248-va3 (localhost [127.0.0.1])	by
	mail248-va3-R.bigfish.com (Postfix) with ESMTP id 541EDD00332	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 06:17:32 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail248-va3 (localhost.localdomain [127.0.0.1]) by mail248-va3
	(MessageSwitch) id 1342073850160134_19918;
	Thu, 12 Jul 2012 06:17:30 +0000 (UTC)
Received: from VA3EHSMHS002.bigfish.com (unknown [10.7.14.242])	by
	mail248-va3.bigfish.com (Postfix) with ESMTP id 258EF600049	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 06:17:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS002.bigfish.com
	(10.7.99.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jul 2012 06:17:30 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 12 Jul 2012 01:17:29 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6C6HTZw002056; Wed, 11 Jul 2012 23:17:29 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2012 01:17:26 -0500
Message-ID: <1342073846-23047-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [PATCH] lsof: define linux C library type when using eglibc
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
X-List-Received-Date: Thu, 12 Jul 2012 07:29:01 -0000
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
index 5823725..d28d2cb 100644
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
+                LINUX_CLIB=${EGLIBCVERSION/\./}
+                LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
+                export LINUX_CLIB
+        fi
 	yes | ./Configure ${LSOF_OS}
 }
 
-- 
1.7.3.4




