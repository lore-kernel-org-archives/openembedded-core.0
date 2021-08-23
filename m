Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.23023.1629721422704500856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=VWRjrbDZ;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zN-0003i6-8m; Mon, 23 Aug 2021 14:23:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5lx+SRCv+mVCpqRea/UKOJWW3J9FU4IJ/UyZRzV73lY=; b=VWRjrbDZElxhlfCUCfUdSAbf+a
	ajq90IRRYvnIw6sz15/LUcYnzpqWmk/n3uLdNs/ItE2VI7bC3wTROfsE3DNE1MagqS3m28gnTPZ4M
	ZmNm3Ldqb3wy8pA4UlXUmnvoOaYNWlasUUivwoSjweDmzbqd/6ySJveJkI7V+qZoo/7tDfxnPtfLi
	zsSKwAYhCCia481UqQ12GVqPWdAxVHli7TIJ9Q6wWunzzgfmmfhBukD/gO5OOBzNiDHVB5NbYQ3/C
	PIBZOon8EGm/PGvMQw7PcPJa/NSSvvGBzrh6+Jklia1vQGBKK1zKM6Tz8vyFiSZuXvZWXw8Zh9a/l
	fMqsT0Zg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zJ-0005eF-BR; Mon, 23 Aug 2021 14:23:39 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH 5/6] kernel.bbclass: Use full versions for inter-package dependencies
Date: Mon, 23 Aug 2021 14:23:22 +0200
Message-Id: <20210823122323.97400-6-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823122323.97400-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: e8ddfec10bb526beb59d4c4bb5d0161a
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823122339Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Some Yocto users do use package repositories and sometimes the PR
value is forgotten. Use full versions for inter-package dependencies
for the kernel subpackages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/kernel.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6dc5387a9b..9ec7daa17a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -91,17 +91,18 @@ python __anonymous () {
     kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
+    fullver = d.getVar('EXTENDPKGV')
     for type in types.split():
         if bb.data.inherits_class('nopackages', d):
             continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s' % (kname, typelower))
+        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= %s)' % (kname, typelower, fullver))
         splitmods = d.getVar("KERNEL_SPLIT_MODULES")
         if splitmods != '1':
-            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules' % kname)
-            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= %s)' % (kname, fullver))
+            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= %s)' % (kname, fullver))
             d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
             d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
 
@@ -628,12 +629,12 @@ FILES:${KERNEL_PACKAGE_NAME}-image = ""
 FILES:${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
-RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
+RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
 PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
-- 
2.31.1

