Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: igyVjSRKa3FOfkCIv+AypT9uuK9Dzjad/CyWwjfwM27bjEuJIwdjDV79lGvRTul07dHdO/7Gdd
 bWGd5BBSr4AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920732"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920732"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:25 -0800
IronPort-SDR: LSWek2MjUSWSmC2hyDmjg12rHw3DLh/goaGXDV9U5cgaideXm5OccjFkWidsEfxdT4lomK+7gr
 sAzXKW8li/vA==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475218"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/21] kernel: Set proper LD in KERNEL_KCONFIG_COMMAND
Date: Mon, 23 Nov 2020 23:06:45 +0800
Message-Id: <263e0c7a301fc11d3cf4ced4ffb911ebf6cb2f14.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wonmin Jung <wonmin82@gmail.com>

With 'ld-is-gold' and linux kernel 5.4 or later, menuconfig
task for kernel recipes will fail with:

$ bitbake -c menuconfig virtual/kernel
...
scripts/kconfig/mconf  Kconfig
scripts/Kconfig.include:43:  gold linker 'x86_64-poky-linux-ld' not supported
/OE/build/tmp/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:29:
 recipe for target 'menuconfig' failed
make[2]: *** [menuconfig] Error 1
/OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:606:
 recipe for target 'menuconfig' failed
make[1]: *** [menuconfig] Error 2
/OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:185:
 recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2
Command failed.

This is because that the KERNEL_LD variable already set in
kernel-arch.bbclass isn't used by do_menuconfig function of
cml1.bbclass.

To fix this issue specify LD variable while calling the kernel
menuconfig command through KERNEL_KCONFIG_COMMAND.

Signed-off-by: Wonmin Jung <wonmin82@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1faf66ce0b1f8f5165277161e07e25e672370c3f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6fffcac07f..1a444efabf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -590,7 +590,7 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+KCONFIG_CONFIG_COMMAND_append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
 EXPORT_FUNCTIONS do_compile do_install do_configure
 
-- 
2.28.0

