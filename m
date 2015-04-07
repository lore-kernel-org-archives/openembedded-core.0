Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6706B72A49
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 14:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37Enkh6017478; Tue, 7 Apr 2015 15:49:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sdt8W6HFeKol; Tue,  7 Apr 2015 15:49:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37EnWTX017456
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Apr 2015 15:49:44 +0100
Message-ID: <1428418172.14020.465.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Apr 2015 15:49:32 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] u-boot: Avoid issues with binutils-2.25
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
X-List-Received-Date: Tue, 07 Apr 2015 14:49:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add a patch based on one from Zhenhua Luo <zhenhua.luo@freescale.com>
in the meta-fsl-ppc layer to avoid build failures for u-boot with the
mpc8315e-rdb machine with binutils 2.25.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch b/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
new file mode 100644
index 0000000..5e9d569
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
@@ -0,0 +1,188 @@
+From 9ba002f1b1afc7af84a352f4ecab32a30d7ba353 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Mon, 9 Feb 2015 18:33:56 +0800
+Subject: [PATCH] powerpc/cpu/*/u-boot*.lds: remove _GLOBAL_OFFSET_TABLE_
+ definition
+
+In binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbols defined by PROVIDE in
+u-boot.lds overrides the linker built-in symbols
+(https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=b893397a4b1316610f49819344817715e4305de9),
+so the linker is treating _GLOBAL_OFFSET_TABLE_ as a definition into the .reloc section.
+
+To align with the change of binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbol
+should not be defined in sections, and the symbols in linker generated .got
+section should be used(https://sourceware.org/ml/binutils/2008-09/msg00122.html).
+
+Fixed the following build errors with binutils-2.25:
+| powerpc-poky-linux-gnuspe-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined in linker created .got
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+Index: git/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
++++ git/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
+@@ -44,7 +44,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
++++ git/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
+@@ -22,7 +22,6 @@ SECTIONS
+ 		_GOT2_TABLE_ = .;
+ 		KEEP(*(.got2))
+ 		KEEP(*(.got))
+-		PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+ 		_FIXUP_TABLE_ = .;
+ 		KEEP(*(.fixup))
+ 	}
+Index: git/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
++++ git/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
+@@ -29,7 +29,6 @@ SECTIONS
+ 		_GOT2_TABLE_ = .;
+ 		KEEP(*(.got2))
+ 		KEEP(*(.got))
+-		PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+ 		_FIXUP_TABLE_ = .;
+ 		KEEP(*(.fixup))
+ 	}
+Index: git/arch/powerpc/cpu/mpc85xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc85xx/u-boot.lds
++++ git/arch/powerpc/cpu/mpc85xx/u-boot.lds
+@@ -50,7 +50,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc8260/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc8260/u-boot.lds
++++ git/arch/powerpc/cpu/mpc8260/u-boot.lds
+@@ -27,7 +27,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/74xx_7xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/74xx_7xx/u-boot.lds
++++ git/arch/powerpc/cpu/74xx_7xx/u-boot.lds
+@@ -30,7 +30,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc512x/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc512x/u-boot.lds
++++ git/arch/powerpc/cpu/mpc512x/u-boot.lds
+@@ -24,7 +24,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+     *(.fixup)
+Index: git/arch/powerpc/cpu/mpc5xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc5xx/u-boot.lds
++++ git/arch/powerpc/cpu/mpc5xx/u-boot.lds
+@@ -33,7 +33,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc5xxx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc5xxx/u-boot.lds
++++ git/arch/powerpc/cpu/mpc5xxx/u-boot.lds
+@@ -28,7 +28,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
++++ git/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
+@@ -24,7 +24,6 @@ SECTIONS
+ 		_GOT2_TABLE_ = .;
+ 		KEEP(*(.got2))
+ 		KEEP(*(.got))
+-		PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+ 	}
+ 	__got2_entries = ((_GLOBAL_OFFSET_TABLE_ - _GOT2_TABLE_) >> 2) - 1;
+ 
+Index: git/arch/powerpc/cpu/mpc83xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc83xx/u-boot.lds
++++ git/arch/powerpc/cpu/mpc83xx/u-boot.lds
+@@ -26,7 +26,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc86xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc86xx/u-boot.lds
++++ git/arch/powerpc/cpu/mpc86xx/u-boot.lds
+@@ -32,7 +32,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/mpc8xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/mpc8xx/u-boot.lds
++++ git/arch/powerpc/cpu/mpc8xx/u-boot.lds
+@@ -34,7 +34,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
+Index: git/arch/powerpc/cpu/ppc4xx/u-boot.lds
+===================================================================
+--- git.orig/arch/powerpc/cpu/ppc4xx/u-boot.lds
++++ git/arch/powerpc/cpu/ppc4xx/u-boot.lds
+@@ -46,7 +46,6 @@ SECTIONS
+     _GOT2_TABLE_ = .;
+     KEEP(*(.got2))
+     KEEP(*(.got))
+-    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
+     _FIXUP_TABLE_ = .;
+     KEEP(*(.fixup))
+   }
diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
index 6feac31..70a1e54 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
@@ -2,6 +2,8 @@ require u-boot.inc
 
 DEPENDS += "dtc-native"
 
+SRC_URI += "file://0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch"
+
 # This revision corresponds to the tag "v2015.01"
 # We use the revision in order to avoid having to fetch it from the repo during parse
 SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"



