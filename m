Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1StPhS-0002n9-1a
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 22:57:55 +0200
Received: by pbbrq2 with SMTP id rq2so10218719pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ht2VDPICSIeHjk/7mqgkcKfTzTZfkbsWZRcPxTVDtJI=;
	b=tGK7GO8wSTU+eRRNLEoudnreTyha70vrPUssT+3jOh8m2TMElTg54dq2kUUa6EWcmE
	1dkgbtkeN1z8BTJVk3oLARDuBYG9o524UuQy3nkRRFVHO91XWbkCsmPjAC+6alKLRmOe
	8Icipi4/zZuye2WVT+VRKqvgM2jZPjJkEi5yODRASLatubWHP8wErApROeg8LrGt02FB
	7rsFMnqfHF24sMnBy4907xYTvp+kPaId4tpFDo5JMeYNrDn9xXS7csq++VT/xTEa4RyC
	f7NQDe8ieG0+3Bqz05qbcOJ9gh44pTkFuMG7XyYKPcnsIaqJiNZlI3zNM4nSk9dpXtRK
	OYiw==
Received: by 10.68.212.70 with SMTP id ni6mr38613976pbc.22.1343076385573;
	Mon, 23 Jul 2012 13:46:25 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ka5sm10615666pbb.37.2012.07.23.13.46.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 13:46:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 13:45:30 -0700
Message-Id: <1343076331-26329-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH V3] kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
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
X-List-Received-Date: Mon, 23 Jul 2012 20:57:55 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

The intent of the uImage code in this class includes the following

1) be able to specify custom load addresses without needing to patch the kernel
2) add better information to the uImage description field

The current state is a NOP anyway, the kernel will always build a uImage when you tell it to 'make uImage'.

weakly Set KEEPUIMAGE to 'yes' in default-distrovars.inc which preserve the
current OE-Core behavior. Machines which are being ported from oe.dev and need to
regenerate uImage can set this to be empty

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass                     |    2 +-
 meta/conf/distro/include/default-distrovars.inc |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ce4d7de..ab984e3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -507,7 +507,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test ! -e arch/${ARCH}/boot/uImage ; then
+		if test "x${KEEPUIMAGE}" != "xyes" ; then
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
 				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f770919..ef8232d 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -2,6 +2,7 @@ QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
+KEEPUIMAGE ??= "yes"
 
 PCMCIA_MANAGER ?= "pcmciautils"
 
-- 
1.7.9.5



