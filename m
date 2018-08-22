Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 09EE474573
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:40:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41wTFh6Hcgz1qxQh;
	Wed, 22 Aug 2018 15:40:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41wTFh5wYRz1tLNZ;
	Wed, 22 Aug 2018 15:40:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id McBHNQ7Zs8Hu; Wed, 22 Aug 2018 15:40:39 +0200 (CEST)
X-Auth-Info: Wn8DsgkrX6TJgZpYb+TvQ2kg+p+K5PjCEI+PMzSr8pE=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
	[85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 22 Aug 2018 15:40:39 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 15:40:22 +0200
Message-Id: <20180822134022.1067-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH] kernel: yocto: Add dependency on do_prepare_recipe_sysroot
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
X-List-Received-Date: Wed, 22 Aug 2018 13:40:41 -0000

Without this patch it happens that do_populate_recipe_sysroot is called
just before do_compile (on multi core build machines).
This is way too late as the .config generated in do_kernel_configme()
is already broken.

The problem is that do_kernel_configme() calls native's merge_config.sh
script which may call bison and arm-linux-*-gcc to compile kconfig
infrastructure to create base .config
(scripts/kconfig/conf  --allnoconfig Kconfig.)

It turns out that we only got above binaries after do_prepare_recipe_sysroot()
is called.
If those binaries are not available, the merge_config.sh do not generate
base .config and without any error produces malfunctioned .config.
The build process continues and as a result broken kernel is compiled.

To reproduce:

bitbake -c cleansstate virtual/kernel
bitbake -c kernel_metadata -v virtual/kernel
bitbake -c do_kernel_configme -v virtual/kernel
(one shall see broken .config in ${B}/.config)
bitbake -c do_populate_sysroot -v virtual/kernel
bitbake -c do_compile -v virtual/kernel

(Poky) SHA1: bb91b2ae3ee5cf108aa2f9b78abb14d5aa00831d

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 4ac3a39e47..19a3f2bc46 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -276,6 +276,7 @@ do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[dirs] += "${S} ${B}"
+do_kernel_configme[depends] += "virtual/kernel:do_prepare_recipe_sysroot"
 do_kernel_configme() {
 	set +e
 
-- 
2.11.0


