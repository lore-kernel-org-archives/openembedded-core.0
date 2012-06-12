Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SeYzr-0003pH-Tz
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 23:51:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5CLetKd002605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:40:55 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 12 Jun 2012 14:40:54 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 16:42:31 -0500
Message-ID: <1339537351-2918-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] lsof: Fix cross 32 -> 64bit ranlib host contamination problem
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
X-List-Received-Date: Tue, 12 Jun 2012 21:51:32 -0000
Content-Type: text/plain

When building on a 32bit host OS and building 64 bit binaries,
the cross ar and ranlib must be called, or you get an error
as follows:

   x86_64-wrs-linux-gcc    -m64 --sysroot=/opt/build/tmp/sysroots/qemux86-64 -o lsof dfile.o dmnt.o dnode.o dproc.o dsock.o dstore.o arg.o main.o misc.o node.o print.o proc.o store.o usage.o util.o -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -L./lib -llsof
   ./lib/liblsof.a: could not read symbols: Archive has no index; run ranlib to add one
   collect2: error: ld returned 1 exit status

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-extended/lsof/lsof_4.85.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.85.bb b/meta/recipes-extended/lsof/lsof_4.85.bb
index 8f25e24..5823725 100644
--- a/meta/recipes-extended/lsof/lsof_4.85.bb
+++ b/meta/recipes-extended/lsof/lsof_4.85.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
@@ -29,6 +29,8 @@ LSOF_OS_libc-glibc = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
+	export LSOF_AR="${AR} cr"
+	export LSOF_RANLIB="${RANLIB}"
 	yes | ./Configure ${LSOF_OS}
 }
 
-- 
1.7.1



