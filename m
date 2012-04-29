Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SOR7x-0003F5-Se for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 12:13:13 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VgPbW3bJ8z3hhYL
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 12:03:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VgPbW4LTkz4KKK2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 12:03:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024) with ESMTP id UyLgPV-DvVG7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 12:03:34 +0200 (CEST)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 12:03:34 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 6050F1A272F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 12:03:34 +0200 (CEST)
Received: by gemini.denx.de (Postfix, from userid 500)
	id 419AC204A61; Sun, 29 Apr 2012 12:03:34 +0200 (CEST)
From: Wolfgang Denk <wd@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2012 12:03:27 +0200
Message-Id: <1335693807-17609-1-git-send-email-wd@denx.de>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC] [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Sun, 29 Apr 2012 10:13:13 -0000

With recent kernel versions, some ARM configurations need may fail to
build with errors like this:

	multiple load addresses: 0x80008000 0x80008000
	This is incompatible with uImages
	Specify LOADADDR on the commandline to build an uImage

Add KERNEL_EXTRA_ARGS parameter so affected boards can add for example

	KERNEL_EXTRA_ARGS = "LOADADDR=0x80008000"

to their configuration.  We make this general enough so other needed
command line options can be passed as well when compiling the kernel.

Signed-off-by: Wolfgang Denk <wd@denx.de>
---
 meta/classes/kernel.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 139bad9..7a554f0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -71,6 +71,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 UBOOT_ENTRYPOINT ?= "20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
+# Some Linux kenrel configurations need additional parameters on the command line
+KERNEL_EXTRA_ARGS ?= ""
+
 # For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
 # We don't want to override kernel Makefile variables from the environment
 EXTRA_OEMAKE = ""
@@ -82,7 +85,7 @@ KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.g
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
 		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
 	fi
-- 
1.7.7.6



