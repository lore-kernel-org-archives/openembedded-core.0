Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.24954.1629730049276779150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 07:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=VNrouo7f;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIBEV-0004r3-RG; Mon, 23 Aug 2021 16:47:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cNlLBvv270c2NuMRA9ZfGS2Be0ZHbCUoNbdQmbomqDk=; b=VNrouo7fKWSL3RY9HZSz95dXRn
	y3GmQr3i32K/l+v3XL5Dt2lgTpHixw3rzQsh3/CUAN62ARO70sZ0/WwYTmZoJuzYhFvuTUDZ62frZ
	XpN6CchES280RNMNsGEcqaENLJwmfglhdQvy2ew3wgzBmuBPMLnBgeRCOqrdx293M4FohVxaRgNfO
	qla9i5liuHaE0YUZWCBEHNGhL4sceIvkqKeuZN+n+ufQm7/4L6o/ETtlrHWw6rIYIJyjzdyrIhRM/
	/0N7y+EMcnj9iD8rc2e4imvFAH00M1eURwr1CiKyR0LfkKh4LkaG3W5/aEUMrvDMtJRYtd8G24yyR
	IiXTZwAA==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIBER-0003gu-SR; Mon, 23 Aug 2021 16:47:25 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH v2 3/4] kernel.bbclass: Use full versions for inter-package dependencies
Date: Mon, 23 Aug 2021 16:47:11 +0200
Message-Id: <20210823144712.101597-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823144712.101597-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
 <20210823144712.101597-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 2da2f9fc373ce6b0f4ec2747a0f9b020
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823144725Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

If the kernel configuration enables module signing but no key
is provided, then the kernel generates one during the kernel build.

The current runtime-dependency references (with only package names
without full versions) allow mixed package installations from different
rebuilds of the same kernel version.

This does create an issue if the kernel configuration enables module
signing but no key is provided, in which case the kernel generates
the signing key during the kernel build.

Tighten RDEPENDS with the full package version, i.e. use (= ${EXTENDPKGV})
markers for inter-package dependencies.

The kernel will pull in the kernel-modules subpackage of the same
exact version automatically if KERNEL_SPLIT_MODULES="0" is set.
Otherwise the situation is the same as with the old default with
one subpackage per kernel module where they have to be upgraded
manually.

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

