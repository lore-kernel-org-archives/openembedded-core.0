Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsMiV-0004Lc-6w
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:34:39 +0200
Received: by pbbrq2 with SMTP id rq2so6171110pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=g23AN4XKipFc1abqhnN8ZudfLNsVSJ6wVlJTIAWATi0=;
	b=Zg3juhBKmIukOtcbAvxh8kTJA3wPJdklkKrk91lTRmP/w79BN7/lfAJCLIkAyc0VV6
	o5w/vUXWD+DlKtUiEpU7fFWoGfD0BtWiilqbeXCckuZXCC2Z4cF1Q8r3Grdj5eHk92Mf
	xqwp/xIIhmu8SuNs2HeVqCsPOFRhQRo0tU3lDO4wtldhKL7wFctv+7T3DB+ZOzAvzPET
	sXiyZJIP+FAAfS0VBHJcbqHRDxZUG1IftUo2AEGiIjBZspE4vm7lpTLOy4OCGGenjb1W
	nSnjIiyTebNLfxp6bbaRw62MbeTrknEQSc/kkFvH04wOENmLoo0FfmjGr2NSutdMe22d
	lV0Q==
Received: by 10.68.132.103 with SMTP id ot7mr17420870pbb.79.1342826594850;
	Fri, 20 Jul 2012 16:23:14 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hz10sm4822794pbc.32.2012.07.20.16.23.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:23:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:22:23 -0700
Message-Id: <1342826543-23508-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
References: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH V2 2/2] kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
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
X-List-Received-Date: Fri, 20 Jul 2012 23:34:39 -0000

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

xx

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
index f770919..b72221f 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -2,6 +2,7 @@ QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
+KEEPUIMAGE ?? = "yes"
 
 PCMCIA_MANAGER ?= "pcmciautils"
 
-- 
1.7.9.5



