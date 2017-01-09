Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A092C7198F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 09:55:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id k62so8528646lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=f6Nm9QcNQhgQui/v33jLzfon3/rN7dHm2Lngicfh834=;
	b=hSP4LatyxeO1bbGqcddUErLIyn0d4nQ0m1zB4NM5vD84poqcZCQ7FR+1qBu9XOKBR6
	qBA3WjRUXQ0LSLg5PrtSfACsGW98Yei8o4pPZoMkMjvtm9OXcxhEo6Xw+eVXG+9fSa9G
	fzWazNV9sjgHIkPx8KHCo7BB8xD8BkfOOG2uBHo8lrIuEj69aElHroMfWHs7/3MAh2+7
	nl4GtVvXwMvkn5z7BYpsNXRGU1XejlSp0IcUJcCl10z4aU7A468FnKquGif740iXq093
	HHsa15BeL62Gs6ND8S0AIRMuQjQp92Ps8m3jg4H/TXxjJWPA7+HuUjKwEbylp2osGjTY
	zFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f6Nm9QcNQhgQui/v33jLzfon3/rN7dHm2Lngicfh834=;
	b=rTaVJ2KGeXmogIeQpH6jD6EpfcWftiLCee+Bv3bHGBbV48DRRRDN32vcytLdeHpup2
	0Zd65NIgJL+JNYEKy1/DzfnmmTBxFus/bOz4l7MuAWKYWNfzN0nQZ768zDqnSeUdR+y6
	FXs9mH4dcutc38V1iUBKQgLyJ4wJ4Zy6gtH0GOAZOMknpKUXH1AGWVMtXl0v4VWoIyxZ
	Wp7jE05wtfusD+y6JDjWH3oHFcVQJYJfeNjnZLH/oA64NhDXPnOhtmW2cH4soL98N9Nx
	R+Osfijx2DUuhpvFqrGS5ks+q7qHFyRJmSbqdE4RISRuQ5LuETvLKgxVUoE+OQD3ypOV
	zYHg==
X-Gm-Message-State: AIkVDXJcNqFrmUr1MbNbvAFnDQuxq3/OV41IKMgoTbxHmEF70fooRLWclI6zinFSVICVog==
X-Received: by 10.25.79.30 with SMTP id d30mr19774388lfb.38.1483955699829;
	Mon, 09 Jan 2017 01:54:59 -0800 (PST)
Received: from thinny.lan (81-230-13-64-no94.tbcn.telia.com. [81.230.13.64])
	by smtp.gmail.com with ESMTPSA id
	204sm21647874ljj.33.2017.01.09.01.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 01:54:59 -0800 (PST)
From: ola.redell@gmail.com
X-Google-Original-From: ola.redell@retotech.se
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 10:54:40 +0100
Message-Id: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] kernel-module-split: Append KERNEL_VERSION string to kernel module name
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
X-List-Received-Date: Mon, 09 Jan 2017 09:55:02 -0000

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


