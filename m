Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss6Oc-0007BE-TB
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 08:09:03 +0200
Received: by yenl13 with SMTP id l13so3383446yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GwgWbfJCdVjLcPT5p6VJcl+dXCWbPTAiU8oZs2K8kq4=;
	b=Cbhk1RCzeCi/nviLFw0DjKzakqIMGwvNkeNpKXVtfVmfwgZvqcalFpDZGZa38wX+pQ
	jWOPO1qNr/TqkQqO2Zu2DiRrIk6qfYsAyjePK9165Zcn20h6m0ceCQVULaM5FUufPLnv
	LcQCIVqoep+vsq6a/5EWv0W2v30cHXjgI037ED8zm/8eobk1LRcWJ+Et6Aaq8EXWlhwe
	AIO198vBsBrmvRuanjto76YGZXTbXk9qhqANd8JG4crJQQvmqYrjQKlvfDW8a2tVIAH0
	LYcEvpiDTBGEs6niSG4aF/LqEsXcdlCd0jh97UnmuAIBDV+lOET0KOs7GEy3UdYVRJ66
	UJVA==
Received: by 10.66.81.202 with SMTP id c10mr1965490pay.20.1342763859391;
	Thu, 19 Jul 2012 22:57:39 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tj4sm3281116pbc.33.2012.07.19.22.57.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 22:57:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:56:43 -0700
Message-Id: <1342763803-32218-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] kernel bbclass: recreate uImage unless KEEPUIMAGE is set
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
X-List-Received-Date: Fri, 20 Jul 2012 06:09:03 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

The intent of the uImage code in this class includes the following

1) be able to specify custom load addresses without needing to patch the kernel
2) add better information to the uImage description field

The current state is a NOP anyway, the kernel will always build a uImage when you tell it to 'make uImage'.

weakly Set KEEPUIMAGE in default-distrovars.inc which preserve the
current OE-Core behavior. Machines which are being ported from oe.dev and need to
regenerate uImage can set this to be empty

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass                     |    2 +-
 meta/conf/distro/include/default-distrovars.inc |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ce4d7de..efe4a9f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -507,7 +507,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test ! -e arch/${ARCH}/boot/uImage ; then
+		if test "x${KEEPUIMAGE}" = "x" ; then
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
 				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f770919..7448415 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -2,6 +2,7 @@ QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
+KEEPUIMAGE ?? = "1"
 
 PCMCIA_MANAGER ?= "pcmciautils"
 
-- 
1.7.9.5



