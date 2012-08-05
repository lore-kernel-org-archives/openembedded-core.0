Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71G-0005Ex-VW
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:47 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so974714wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=PYmA/f30WOfkAHrtn9hegMuejWqt4SK0dXQtlN5jf2E=;
	b=RDhm9joSR+4ek1EkYt+CSFie1qGr9KYWpgVqVDFNiufWsn0smUAgWrobWxDYFdLS++
	VYko/pwo8gatcW1Dj1lW3Pd9Mm0GDoXVqqWRqAQbZZF6FvkME9oif/yAp+cg4a2YXgrC
	C5+KKCcG/5oHRoK1k3zZ1/tvYsjRX5hnI2GcnZs8EqrFKlS4M8SHJZgZkrslhSjTyWHp
	9l+R09RW2GRR4rWFzy1FGDz0UCV6pShQDySevebAh7+3zXz8ZAh4bQZNKCGCbBln9y4G
	549me0c0WXPkT4iRVFiuFj0Idhbb+z5ZypQbz1IqutXu6IH+oOyaKwhg51QWETbjMjuh
	LWJQ==
Received: by 10.180.84.1 with SMTP id u1mr12365518wiy.15.1344196205602;
	Sun, 05 Aug 2012 12:50:05 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:04 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:44 +0200
Message-Id: <1344196136-7643-17-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmwCTfPvZC4luOYnOhAOWKrfFvCc4q7QE/V55vSshBvbyKj0VzzFZwihj5jnlTPs4zZWB9R
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:51 -0000

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



