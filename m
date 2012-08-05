Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lz-00084s-SO
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:56 +0200
Received: by wgbdr1 with SMTP id dr1so1751997wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=PYmA/f30WOfkAHrtn9hegMuejWqt4SK0dXQtlN5jf2E=;
	b=XnSYIpxMh0wjDNLXCTNCWDDFdXtGPRZizivBagde5elFYNqpXM8oqQ5ZSByLfxFfOv
	j1PO4i8/csAJQU56z486VzdLQANETvq33tBhEfRUbDNaWegchAW2hpZmTTOceraPRZdQ
	qufD0Ib3be6bCNz5DpCqtNUokwClLqpcm/3B/dnxISMZoN97KcWfZ/u3GMSkykDp82DU
	iIXjI8RlnZ47J5ZxipP+NTxybMRNVvQicSfkGNK4LHK+I7cEVMNy4fuN/UpUovXdRmWJ
	lDjVi71wRM0rE94uggObaN/i2sNhetgmXdRK3yCnIl1rVD3rOagfQwYrlGfMaNI7F9Vp
	MkLw==
Received: by 10.180.105.163 with SMTP id gn3mr11550885wib.2.1344182112575;
	Sun, 05 Aug 2012 08:55:12 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:11 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:03 +0200
Message-Id: <1344182057-15981-17-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmWdoYXY/1p7ezbOFbCz8mrVEMhx2WFCi8GX1+T7OqD18JG9gkGvz//Jn1vApOkyXLmb4Ht
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/30] kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:57 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/classes/kernel.bbclass |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1d8dff9..b434093 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -109,10 +109,10 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
-		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
-		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
-		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
-		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${base_libdir}/modules/${KERNEL_VERSION}/modules.order"
+		rm -f "${D}${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
+		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/source"
 	else
 		bbnote "no modules to install"
 	fi
@@ -127,8 +127,8 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}/etc/modules-load.d
-	install -d ${D}/etc/modprobe.d
+	install -d ${D}${sysconfdir}/modules-load.d
+	install -d ${D}${sysconfdir}/modprobe.d
 
 	#
 	# Support for external module building - create a minimal copy of the
-- 
1.7.7.6



