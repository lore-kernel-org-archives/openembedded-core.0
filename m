Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S9nvq-0000mI-K4
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 02:32:14 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M150008WQEGW362@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 19:23:10 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F15C52016F; Mon,
	19 Mar 2012 20:23:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2012 20:22:54 -0400
Message-id: <1332202974-27977-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Tue, 20 Mar 2012 01:32:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Replace dependency on eglibc with virtual/libc
Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index 6425027..3755c79 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Real-Time preemption testcases"
 HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
 SECTION = "tests"
-DEPENDS = "linux-libc-headers eglibc"
+DEPENDS = "linux-libc-headers virtual/libc"
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
@@ -11,13 +11,13 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
 
 # git -> 0.83 needs a PE bump
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
 
 S = "${WORKDIR}/git"
 
-CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli ${LDFLAGS}"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 # calling 'uname -m' is broken on crossbuilds
 EXTRA_OEMAKE = "NUMA=0"
-- 
1.7.8.5



