Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwEHA-0002fD-Nc
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 17:22:24 +0200
Received: by yenl13 with SMTP id l13so5534637yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eTMSlIyNxJUecMsZzgLZYFaJtEgNiPSQnECplTbx0gs=;
	b=CPkI4ETCFPnw+8+4SdufON/AYtocNFSEKds9l+l66UiN1x7K9AkFWuKMZ886ywvvQg
	kz6gUF2POHP05azuVc5qv6EoJ/2QMTTFrnZBg4rJ2REeYqOm2UQ2KGG3FhxysmmoSHs/
	LQ1hx6T7xyYVMBWK+tL0NJkPUjalX70ZWDtlqmcriR0rWFEgAuSvBV0UVEitHzX0yDYl
	1xAwvLzCCgZpr1oOhgQO2BUGggxkeS82sPqiSwVsCuWKcfXGwU8znYPslfrfKIox1Nx/
	M0Cu0qsfnzU0uXbkUHpJlf6JE2OM1dUFCQgUfs1lg5xgmOEW1zpUDDM9bP0SnRDZ2O1t
	+fuA==
Received: by 10.66.84.130 with SMTP id z2mr32939660pay.77.1343747446756;
	Tue, 31 Jul 2012 08:10:46 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hf4sm455832pbc.4.2012.07.31.08.10.44
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 08:10:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 08:10:40 -0700
Message-Id: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] kernel.bbclass: Preserve generated headers
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
X-List-Received-Date: Tue, 31 Jul 2012 15:22:24 -0000

asm/unistd.h includes asm/unistd_64.h on x86_64
and asm/unistd_32.h on i386 but these files are
generated files in 3.4 and when we do 'make clean' they get
deleted and it shows up as an error when building
external modules. May be its a 3.4 kernel bug may be not
but make clean should have left the tree in
a shape to build modules but it does not.

Probably we should run make modules_prepare after having
run make clean.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b19ed4c..4ac3d48 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -197,6 +197,8 @@ kernel_do_install() {
 	if [ -f include/generated/bounds.h ]; then
 		cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
 	fi
+	mkdir -p $kerneldir/arch/${ARCH}/include/generated/
+	cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 
 	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
-- 
1.7.5.4



