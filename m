Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C068D77ACD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 17:17:17 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Sep 2017 10:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,421,1500966000"; d="scan'208";a="151486630"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga005.jf.intel.com with ESMTP; 20 Sep 2017 10:17:18 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:17:13 -0700
Message-Id: <fc8637cdd9e374834b6f1b0846761d43eb2f15f3.1505927561.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505927561.git.alejandro.hernandez@linux.intel.com>
References: <cover.1505927561.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/5] core-image-tiny-initramfs: Enable running poky-tiny on qemux86-64
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
X-List-Received-Date: Wed, 20 Sep 2017 17:17:17 -0000

Building poky-tiny for x86-64 seems fine, but when executing qemu
it complains during boot time about not being able to execute init:

[    5.409730] Failed to execute /init (error -8)

And then it drops to a login prompt (which it should't do on tiny)

This is supposed to be complaining about init's format, it only happens
on x86-64 architectures so perhaps is a 32/64 bit issue, but since
core-image-tiny-initramfs does not actually provide a traditional init,
the script is simply meant to drop to shell, we can workaround the issue
by specifying the kernel to run the init script via busybox's sh,
dropping to shell correctly on x86-64 leaving x86 unaffected.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index a8893d1e53e..16995e6580a 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -39,3 +39,5 @@ python tinyinitrd () {
 }
 
 IMAGE_PREPROCESS_COMMAND += "tinyinitrd;"
+
+QB_KERNEL_CMDLINE_APPEND += "debugshell=3 init=/bin/busybox sh init"
-- 
2.12.3


