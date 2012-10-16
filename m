Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOFvI-0002HD-SY
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 00:47:40 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so411181wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 15:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=s9gAb5xrF/7aBoda3quIzBvgirBvsUBa8ITn3aKwfDc=;
	b=aOEpgpOYUBvD2zHBGh64Ctu0EOFYLdw3OeuyrSzEzS0NtkKmnRm5A4Zcj5BGSldCaL
	vnohfV3zzfFM9+LQHiJanbKQK+Q7H/Iae7KJsC+FSuWf3Rs2ht7CyDIiLx5JUmnlxaR1
	qevkiz35R+q9Gg60z9nVMmbqORAslUS7/FrhnT824v5R9/FWHVYhuQiiLlzH1gDFBhcq
	ZZlQUo3VLW+kgvNO9tCS9qQ4IPhalRPA+mGA7Ok2tzVP21o7Fg/mRWUtPZ5HPpkYJz/i
	J2fdkDXvuZxrGgpTLqepe7V46UqfoBuDaCZk8UlK/lIzEqPieXoAhSOw/O7r8i3TBHPt
	D1ng==
Received: by 10.216.137.94 with SMTP id x72mr9622686wei.187.1350426863735;
	Tue, 16 Oct 2012 15:34:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg4sm24120361wib.6.2012.10.16.15.34.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 15:34:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 00:34:28 +0200
Message-Id: <1350426868-27433-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.3
In-Reply-To: <20121016223224.GA3405@jama.jama.net>
References: <20121016223224.GA3405@jama.jama.net>
Subject: [PATCH] kernel.bbclass: add kernel-modules to PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2012 22:47:40 -0000

* kernel-modules is always added to PACKAGES later in python code and
  needed to be defined as PACKAGES_DYNAMIC
* add it to PACKAGES directly and set
  ALLOW_EMPTY_kernel-modules
  FILES_kernel-modules
  DESCRIPTION_kernel-modules
  outside populate_packages_prepend like for other packages and set only
  RDEPENDS_kernel-modules from python code

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7b03e29..f54b024 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -259,11 +259,12 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
+FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
@@ -274,6 +275,8 @@ RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
+ALLOW_EMPTY_kernel-modules = "1"
+DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
 pkg_postinst_kernel-image () {
 if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
@@ -457,8 +460,6 @@ python populate_packages_prepend () {
 
     import re
     metapkg = "kernel-modules"
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    d.setVar('FILES_' + metapkg, "")
     blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
     for l in module_deps.values():
         for i in l:
@@ -470,9 +471,6 @@ python populate_packages_prepend () {
         if not pkg in blacklist and not pkg in metapkg_rdepends:
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-    d.setVar('DESCRIPTION_' + metapkg, 'Kernel modules meta package')
-    packages.append(metapkg)
-    d.setVar('PACKAGES', ' '.join(packages))
 }
 
 # Support checking the kernel size since some kernels need to reside in partitions
-- 
1.7.12.3



