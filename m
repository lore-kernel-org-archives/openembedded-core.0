Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVAEq-0001n3-MM
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 00:03:58 +0100
Received: from mail60-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 22:56:27 +0000
Received: from mail60-va3 (localhost [127.0.0.1])	by mail60-va3-R.bigfish.com
	(Postfix) with ESMTP id 11B4854032F	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:56:27 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zz168aJzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail60-va3 (localhost.localdomain [127.0.0.1]) by mail60-va3
	(MessageSwitch) id 1322520986900625_14869;
	Mon, 28 Nov 2011 22:56:26 +0000 (UTC)
Received: from VA3EHSMHS013.bigfish.com (unknown [10.7.14.235])	by
	mail60-va3.bigfish.com (Postfix) with ESMTP id D36E82C0047	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:56:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS013.bigfish.com
	(10.7.99.23) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 22:56:26 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Mon, 28 Nov 2011 16:57:12 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pASMvBIX021747	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 16:57:11 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2011 16:57:11 -0600
Message-ID: <1322521031-26849-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] eglibc-initial: Fix kernel headers symlink being wrong
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
X-List-Received-Date: Mon, 28 Nov 2011 23:04:02 -0000
Content-Type: text/plain

symlinks to the kernel headers were pointing at the wrong
location when being used from cache. Just copy the kernel
headers instead

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Do we need something to depend on the kernel version too since we
are copying instead of symlinking? Something like:

do_install[vardeps] += "virtual/kernel:do_populate_sysroot"

 meta/recipes-core/eglibc/eglibc-common.inc  |    2 +-
 meta/recipes-core/eglibc/eglibc-initial.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
index 4fa6488..6a93968 100644
--- a/meta/recipes-core/eglibc/eglibc-common.inc
+++ b/meta/recipes-core/eglibc/eglibc-common.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC)
 HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2.1"
-INC_PR = "r11"
+INC_PR = "r12"
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 448f73a..f154d64 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -48,7 +48,7 @@ do_install () {
 
 	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
 	for t in linux asm asm-generic; do
-		ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
+		cp -ar ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
 	done
 }
 
-- 
1.7.6.1




