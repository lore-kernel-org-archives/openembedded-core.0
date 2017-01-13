Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8742665C90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 17:23:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x1so1180151lff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 09:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BMxQ/c6mwR1eeeSunPztLDHcBoDpEegz+RW2FVXRBG8=;
	b=P16AgaDOO7QGMBAZnVAw1TZugWgfmtkRRsCSnfspM3wz0Daau2W7l1Zziaz7aFl7YY
	0l1SXZd9vxIsPOsFCpKaBHIEgBexObeiX7J3ps+MKeOCoPXGsFLIZUUIlD7iDlTAk3LJ
	AQzkM3AWCLKRSFMUnDXdzqskGpNOWjZ9cXo5x4rzZZaCoDIkCBZEqJttb+80gaXbkKFT
	WObi4aGWKtmZkDj2VHXXZiwXiBRiq1pX704Wvhi+qEixZBNjZcZ3W0OjXpOzt4/HG94v
	D5IvjEvxjYY9cXlvuPZWRgPXBkOnalWO4uVJRFEqjLASShWLiMf71O84ljnwjX2ETqZg
	4JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BMxQ/c6mwR1eeeSunPztLDHcBoDpEegz+RW2FVXRBG8=;
	b=JeKLMpvk4MtFLhd6Z0yzVho7N8vPIv0TlAERx5Zh1Ib13V9IS+YYJwdXn1l5DTSBZB
	yTgksHTgmaw484mgLVw02hPar8nPjPuwCKNQHTpWbpWvApzp9HCbAHCuyBAXPQDP+cFb
	J89YgTC9LHf3+mU7t9goyJNKZGGuCC8aj9lQ0Ot7iIwgMEGBkJfWyH6rMb1Eso5sOIFg
	8s98xTnY6xRlTx4ycDcM8r1ey9REpxJeKaT8bqyZrWtUvpaaRGRFmCn0OyM7Phofn95d
	g74WgT38+X/RMqmf5Icsrtk9RUfGyksc8MidyWcPqVx7quw31iRpB4NaoLiSX9t3RVOa
	huiw==
X-Gm-Message-State: AIkVDXIID/msk3UXGjOzgcAbvlrZsmlTTje6Rkz8QmJwJ8K9cpR+ekhNBUrcESAIKpNr+w==
X-Received: by 10.46.71.140 with SMTP id u134mr7434492lja.16.1484328180528;
	Fri, 13 Jan 2017 09:23:00 -0800 (PST)
Received: from thinny.lan (81-230-13-64-no94.tbcn.telia.com. [81.230.13.64])
	by smtp.gmail.com with ESMTPSA id
	a71sm4216399lfe.36.2017.01.13.09.22.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 09:22:59 -0800 (PST)
From: ola.redell@gmail.com
X-Google-Original-From: ola.redell@retotech.se
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 18:22:23 +0100
Message-Id: <1484328143-2775-1-git-send-email-ola.redell@retotech.se>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v4] kernel-module-split: Append KERNEL_VERSION string to kernel module name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2017 17:23:01 -0000

From: Ola Redell <ola.redell@retotech.se>

The KERNEL_VERSION string is added to kernel module package names in order
to make the kernel modules for different kernel versions distinct packages
instead of different versions of the same package. With this change, when
a new kernel is installed together with its kernel modules (e.g. by upgrade
of the packages kernel and kernel-modules) using some package manager such
as apt-get or rpm, the kernel modules for the older kernel will not be
removed. This enables a fall back to the older kernel if the new one fails.

Also, for backwards compatibility and to enable kernel version agnostic
dependencies to kernel modules, create a virtual package with the old
(shorter) kernel module package name using RPROVIDES.

Signed-off-by: Ola Redell <ola.redell@retotech.se>
---
 meta/classes/kernel-module-split.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index efe1b42..742320c 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -31,6 +31,7 @@ PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
 
 KERNEL_MODULE_PACKAGE_PREFIX ?= ""
+KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
 python split_kernel_module_packages () {
     import re
@@ -119,10 +120,16 @@ python split_kernel_module_packages () {
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
+        # Provide virtual package without postfix
+        providevirt = d.getVar('KERNEL_MODULE_PROVIDE_VIRTUAL', True)
+        if providevirt == "1":
+           postfix = format.split('%s')[1]
+           d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
+
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
-    module_pattern = module_pattern_prefix + 'kernel-module-%s'
+    module_pattern = module_pattern_prefix + 'kernel-module-%s-' + d.getVar("KERNEL_VERSION", True)
 
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
-- 
1.9.1


