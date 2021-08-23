Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.23018.1629721418935023032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=iuap8X6m;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zJ-0003gI-GC; Mon, 23 Aug 2021 14:23:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CovFDOw4DakRCslpCqqxduDNcf3Gz+Mn77YChgQrFWM=; b=iuap8X6m0zXV+WpujZ/otkILEm
	XWxG06OhjTPd7pSyYNtA3uooqx0lT9Z/KoBUr5hpXYJgR3oQ5V/L7xxk7oEk1SaYIYd1rqEbluOJ0
	gCISkfvC1cS8NwBmLOTD4hGjeyLqvfWMIPAChOd4aYxExV0M/ZFkotSbWMqAKgz8CzJkxujfbzzQw
	9yhwLDwBAvD7wy0YLrqRqvV4ag+8n/TqCMdsCv90T95jDQrEafIo4V3yZCzT38HTVDGbtOZhNWLAY
	OZCfVIi1jz/uYtxNR+dhMG+Eygfkd3XQhdlWKHmLx0ep0rhmDol+5FgHuVnpPzc9wseqI+nU81m0a
	+p5OX6Jw==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zF-0005eF-Iz; Mon, 23 Aug 2021 14:23:35 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH 3/6] kernel-module-split.bbclass: Allow opt-out of split kernel modules
Date: Mon, 23 Aug 2021 14:23:20 +0200
Message-Id: <20210823122323.97400-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823122323.97400-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 85009d953b1791c297252820971497a4
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823122335Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

For some use cases, a monolithic kernel-modules package containing
all modules built from the kernel sources may be preferred.
For one, download time is shorter and installation time is faster.

Set KERNEL_SPLIT_MODULES="0" for this.

The default is one subpackage per module.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

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
-- 
2.31.1

