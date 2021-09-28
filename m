X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH 1/2] kernel.bbclass: Add runtime dependency to subpackages on main package
Date: Tue, 28 Sep 2021 16:10:47 +0200
Message-Id: <20210928141048.576425-2-zboszor@pr.hu>
In-Reply-To: <20210928141048.576425-1-zboszor@pr.hu>
References: <20210928141048.576425-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Although this creates a circular dependency between the main
kernel package and its subpackages, it helps dnf to automatically
remove all kernel packages of the same version.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d13c38fb02..deccc0e58c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -105,6 +105,14 @@ python __anonymous () {
             d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= ${EXTENDPKGV})' % kname)
             d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
             d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            # Reverse RDEPENDS on main kernel package so dnf upgrades can honor installonly_limit
+            # and remove all subpackages of old versions automatically
+            d.appendVar('RDEPENDS:%s-base' % kname, ' %s (= ${EXTENDPKGV})' % kname)
+            d.appendVar('RDEPENDS:%s-image' % kname, ' %s (= ${EXTENDPKGV})' % kname)
+            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s (= ${EXTENDPKGV})' % kname)
+            d.appendVar('RDEPENDS:%s-modules' % kname, ' %s (= ${EXTENDPKGV})' % kname)
+            if d.getVar('KERNEL_IMAGETYPE') == 'vmlinux':
+                d.appendVar('RDEPENDS:%s-vmlinux' % kname,   ' %s (= ${EXTENDPKGV})' % kname)
 
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
-- 
2.31.1

