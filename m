Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Stgqx-00064d-MW
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:16:51 +0200
Received: by pbbrq2 with SMTP id rq2so11491861pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ht2VDPICSIeHjk/7mqgkcKfTzTZfkbsWZRcPxTVDtJI=;
	b=zNDqzzPrF5A3RgUUiM40bPEltvQDYcik25EGBj7h++8HW9nPev/p/gcqN1zxoSxF5i
	5nfFOlO0Y/Cnpm4oA+GFgAXDdX2fDyvG133ULUMqv9wQTAQI/6t4q9RIh7gT1+kUqnEu
	JdEu9pr85wMlqnf9VkSpDeH048Ud6qlkA6UH9ZSuyePJ8a8pEjNM6T7eINmnpXAOe3Hw
	u4bIjeYiUuS8HDOEHuIDQdz9hnQzpcvhH6QpHv6byMBurDkKWty4n777aXCG8qGHejq4
	LP/4OpBuDMB91BwiFgNWHtI33DvxdSs0P5LErfcZSYTwG63Rlyu69Uym+LZdzSocv6lY
	3lFg==
Received: by 10.68.222.40 with SMTP id qj8mr45058024pbc.139.1343142322396;
	Tue, 24 Jul 2012 08:05:22 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sh3sm12332139pbc.16.2012.07.24.08.05.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 08:05:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:04:21 -0700
Message-Id: <608758162d0318af7db6c02562b97bc2b8b42e07.1343142062.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
References: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
In-Reply-To: <cover.1343142062.git.raj.khem@gmail.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
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
X-List-Received-Date: Tue, 24 Jul 2012 15:16:51 -0000

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



