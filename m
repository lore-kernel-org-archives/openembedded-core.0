Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Soe6B-00037c-8n
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:19:46 +0200
Received: by yenl13 with SMTP id l13so216884yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1DtbNF2UIf/6bDIelk8KeeFuRsc1kkd117Z+IPBuLkA=;
	b=hZbpzRfq7uy0mB9ow/3prN6600BdLSyKDZA4p+s4aCv6RkcUHD9QBVZzcrwQJ7eACN
	ubaAuuvOh06JmWQ/HAdO2sgnKXvfE3lhpNEkFnoJaRBTdjdh95KkwLxqQqcFndRuws0h
	5sX1qTOGTXkLv9iHBMSaxOCnk1tjyMcH1KltvnWdCJH9nrUGv+YDfxyGo3aFaN39xH5g
	cI7KHs/rJpi6nGpGBd6rS5ctnFTOFhJ+dHZdQVz/4YYFq/I0ZwfUDat4vjP2s5XQJ0O3
	wF1MC29wdNRrN/7moEV+rhj06kPL4RRWEQG5gaPe7TCWI06ai6EzfiQqVOTzxqyVb+So
	UBSw==
Received: by 10.66.76.130 with SMTP id k2mr5002097paw.19.1341940111712;
	Tue, 10 Jul 2012 10:08:31 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pz9sm8640859pbb.61.2012.07.10.10.08.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 10:08:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 10:07:50 -0700
Message-Id: <1341940070-27715-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Tue, 10 Jul 2012 17:19:46 -0000

We shave too much from kernel sources for making it work
for on device external kernel module development that cross
development of external modules wont work from same tree
anymore. This patch makes a copy of tree which will eventually
be staged for building external modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 81c334b..b2b6fcd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -80,6 +80,7 @@ KERNEL_ALT_IMAGETYPE ??= ""
 # Define where the kernel headers are installed on the target as well as where
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
+UNPRUNED_KERNEL_SRC_PATH = "/usr/src/kernel-unpruned"
 
 KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
@@ -135,7 +136,9 @@ kernel_do_install() {
 	# kernel source tree.
 	#
 	kerneldir=${D}${KERNEL_SRC_PATH}
+	unrprunedkerneldir=${D}${UNPRUNED_KERNEL_SRC_PATH}
 	install -d $kerneldir
+	install -d $unrprunedkerneldir
 
 	#
 	# Store the kernel version in sysroots for module-base.bbclass
@@ -176,7 +179,6 @@ kernel_do_install() {
 	# and include files.
 	#
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
-	make -C $kerneldir _mrproper_scripts
 	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
@@ -186,6 +188,9 @@ kernel_do_install() {
 	if [ ${ARCH} = "powerpc" ]; then
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
+	# make a copy of unpruned kernel tree
+	cp -fR $kerneldir/* $unrprunedkerneldir
+	make -C $kerneldir _mrproper_scripts
 
 	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
@@ -197,8 +202,14 @@ kernel_do_install() {
 	done
 }
 
+PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
+
+kernel_package_preprocess () {
+	rm -rf ${PKGD}/${UNPRUNED_KERNEL_SRC_PATH}
+}
+
 sysroot_stage_all_append() {
-	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
+	sysroot_stage_dir ${D}${UNPRUNED_KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
 }
 
 kernel_do_configure() {
-- 
1.7.5.4



