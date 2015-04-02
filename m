Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 49998736BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 08:55:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t328tHkr005234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Apr 2015 01:55:17 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 2 Apr 2015 01:55:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Apr 2015 01:55:16 -0700
Message-ID: <0e922394f91912d83311f95515b26b62856507a2.1427964751.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1427964751.git.liezhi.yang@windriver.com>
References: <cover.1427964751.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub-efi: add PACKAGECONFIG for grub-mount and device-mapper
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
X-List-Received-Date: Thu, 02 Apr 2015 08:55:17 -0000
Content-Type: text/plain

We had PACKAGECONFIGs for grub_2.00 and grub_git, we also need them for
grub-efi, otherwise there might be failures as:
grub-2.00/util/grub-mount.c:37:23: fatal error: fuse/fuse.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc    |    4 ++++
 meta/recipes-bsp/grub/grub_2.00.bb |    4 ----
 meta/recipes-bsp/grub/grub_git.bb  |    4 ----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3946957..4d9e3c7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -35,6 +35,10 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
 inherit autotools gettext texinfo
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
+PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
+
 # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
 # conflicted, remove it since no one uses it.
 SYSROOT_PREPROCESS_FUNCS_class-target += "remove_sysroot_mkconfig_lib"
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index a11e960..88a709e 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -6,10 +6,6 @@ PR = "r1"
 FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
 
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
-PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
-
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3ab675b..c2760c9 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -20,10 +20,6 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
 
 inherit autotools gettext texinfo
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
-PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
-
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
 
-- 
1.7.9.5


