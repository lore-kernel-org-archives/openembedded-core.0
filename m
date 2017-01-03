Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDD9606CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 14:22:10 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id y21so42561167lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=f6Nm9QcNQhgQui/v33jLzfon3/rN7dHm2Lngicfh834=;
	b=l7QYBa9g+YH6B8zJwq+PFG/kS2LKjefSUuXyFkk7aANZPuqiqr+eY/IZyNW4HLFyqs
	VkLTgjQgep6uZW9JaQnekIJePVM6qkbkK7oeqG3ryh3aBTRv6F1JYlsg15KLHbW+gO58
	eBWT8AYUaXAzhuVVwrylREEFzRL3Mpl9rLTV+iJmFdxlbbk2VWDXa1387BEpMLYnjHXx
	Qa+Ujq1QgRL6oXjqhQPFfeZyQvI/aEP107uKvUKNXB+eBD/xLcgyaqnS2SHQqCTePG+I
	xsIoHXhD51GMqX20EM+L6aO+c3Z8nT1mT+P445VyeyI0IGqh5ivN6/5D7K7Z2ndHINkb
	MUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f6Nm9QcNQhgQui/v33jLzfon3/rN7dHm2Lngicfh834=;
	b=LIHZemrWZUKPAy/NDrCC9YmOG6A2gGjexCIlxeNTHMsfxT6IMmgYWNZA6IcP+REy/k
	dP5/2eAq8Nqw5jysIn9zsfkI8OtELA2FS2S8txLEi+caA3sm+vFgJL8SYpQaTr4JBSKA
	/ItbZylHO8yCFk3MIA/r7LpgRJDtUwEF/vza+Usl2GTeytxLyM1C5LnAP/eoBNyEzi8c
	LNgCdcEr9ZopCXCOdxhxSXaeI0R7EwAE4sCHHHeer3E9bhcanAWgVbkjy29yvlf7GvxA
	U3hTR8uItQZlbooNkwMJukXHP+FP9wT2m91EoZvkZbu6Dse7NArCcx45wF4b3SYbmzmG
	0GKQ==
X-Gm-Message-State: AIkVDXL3cXnJ8fRmFGlfXQxf8ZgpHtR8p9VyPn8vtX5YknyOSdSmMZjxAd+0+WiO4iQOwA==
X-Received: by 10.25.72.209 with SMTP id v200mr20210132lfa.74.1483453330317;
	Tue, 03 Jan 2017 06:22:10 -0800 (PST)
Received: from thinny.lan (81-230-13-64-no94.tbcn.telia.com. [81.230.13.64])
	by smtp.gmail.com with ESMTPSA id
	c78sm16760963lfc.39.2017.01.03.06.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jan 2017 06:22:09 -0800 (PST)
From: ola.redell@gmail.com
X-Google-Original-From: ola.redell@retotech.se
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 15:21:27 +0100
Message-Id: <1483453287-32323-1-git-send-email-ola.redell@retotech.se>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] Append KERNEL_VERSION string to kernel module package names
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
X-List-Received-Date: Tue, 03 Jan 2017 14:22:13 -0000

From: Ola Redell <ola.redell@retotech.se>

The KERNEL_VERSION string is added to kernel module package names in order to
make the kernel modules for different kernel versions distinct packages instead
of different versions of the same package. With this change, when a new kernel
is installed together with its kernel modules (e.g. by upgrade of the packages
kernel and kernel-modules) using some package manager such as apt-get or rpm,
the kernel modules for the older kernel will not be removed. This enables a
fall back to the older kernel if the new one fails.

Signed-off-by: Ola Redell <ola.redell@retotech.se>
---
 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index efe1b42..13cff51 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -122,7 +122,7 @@ python split_kernel_module_packages () {
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
-    module_pattern = module_pattern_prefix + 'kernel-module-%s'
+    module_pattern = module_pattern_prefix + 'kernel-module-%s-' + d.getVar("KERNEL_VERSION", True)
 
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
-- 
1.9.1


