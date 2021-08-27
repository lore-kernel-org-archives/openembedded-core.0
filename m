Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web08.5092.1630049845229405343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 00:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=Ihi7ZHz2;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJWQV-0008Ai-LN; Fri, 27 Aug 2021 09:37:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Eo0v800YYi/tLOqvdDwnKo93QVh9UXHEnJUGn7rvQNc=; b=Ihi7ZHz2D3OX9eijJNHvKyrwdS
	BX6+VDIh5rszknJuQVsNS0Vg4qkTs2C6o1/m4hswON3/lJk2H281mDez9khykOmapfRHxe7A9U442
	Lt604moKzp/rCsIPFqmOQq/KMsjAhD/SY/eA+cZdnvd/AdL0VIUm8cnY0Um6LuHu1nNmYksRfqC79
	3R1CCn+LmJ9XVyx3eF9LmZpQAUvK2hZ/hLLd9Rt5Mk/rMxx21dnWBdDmVj8z2EzBdtB7F78sd1lNS
	/u7rlsRzyNrnUUVXtCAc1cQdyJ0EMBhdw6TxXFrerAej+R7j2mjARf01Aw0jiTAPX74YjJqcvRNRp
	BsncXUjg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJWQR-0007Ok-Kr; Fri, 27 Aug 2021 09:37:21 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH v4 2/4] Allow opt-out of split kernel modules
Date: Fri, 27 Aug 2021 09:37:10 +0200
Message-Id: <20210827073712.2766816-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827073712.2766816-1-zboszor@pr.hu>
References: <20210823145450.103319-1-zboszor@pr.hu>
 <20210827073712.2766816-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Scan-Signature: b899a7fb3baab380f674538c2418a553
X-Spam-Tracer: backend.mail.pr.hu -0.8 20210827073721Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

For some use cases, a monolithic kernel-modules package containing
all modules built from the kernel sources may be preferred.
For one, download time is shorter and installation time is faster.

Set KERNEL_SPLIT_MODULES="0" for this in. The default is one subpackage
per module.

Also, adapt kernel.bbclass to KERNEL_SPLIT_MODULES != "1" case
Extra RDEPENDS and other inter-package references are needed in
this case.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
 meta/classes/kernel.bbclass              |  7 +++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 6c1de4c992..a29c294810 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -28,6 +28,7 @@ do_install:append() {
 	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
 }
 
+KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS:prepend = "split_kernel_module_packages "
 
 KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
@@ -156,18 +157,26 @@ python split_kernel_module_packages () {
     kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
     kernel_version = d.getVar("KERNEL_VERSION")
 
+    metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
+    splitmods = d.getVar('KERNEL_SPLIT_MODULES')
+    postinst = d.getVar('pkg_postinst:modules')
+    postrm = d.getVar('pkg_postrm:modules')
+
+    if splitmods != '1':
+        etcdir = d.getVar('sysconfdir')
+        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
+        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
+        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
+        return
+
     module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
     module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
 
-    postinst = d.getVar('pkg_postinst:modules')
-    postrm = d.getVar('pkg_postrm:modules')
-
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
-        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 027e66eec7..6dc5387a9b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -98,6 +98,13 @@ python __anonymous () {
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
         d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s' % (kname, typelower))
+        splitmods = d.getVar("KERNEL_SPLIT_MODULES")
+        if splitmods != '1':
+            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules' % kname)
+            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+            d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
+
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
         d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
-- 
2.31.1

