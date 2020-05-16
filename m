Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.7493.1589644731957725786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tBXOV6Uc;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id v63so2523706pfb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sQTFstY4Txt1x7gHRlY81clnCyaVo1X4nRbj+RPNUIM=;
        b=tBXOV6UcLzw0hlTL3OEDptPnwggo3eg4pnOzZ5exSM2CmGu5T9dNVcjAzYR30TMns2
         3l03kYYkpMuObEiI6ShSsYiTTzeX3zaF/r14/zeA4cxN77f6u/24ApiahWHbHUY4bDA+
         F+PFak3aV6YkOQOch24pPDG7ZlpS3MQsnBYXanFbODlU2S3gr3BuDNlK2dh8RiNjxFFC
         kH3H3JodFNiNF5IOLdridHjiTJ3e/9SSURks64jr700ksiiubxzhWvN9go+VEqtJNJ9j
         Cz7mJ4gxyZqlXa6U3ZQ7vIHvVAmYjOzJXxjX3IYIaVfKM72Aas/dHM8L1aDXzreIFzyo
         lfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sQTFstY4Txt1x7gHRlY81clnCyaVo1X4nRbj+RPNUIM=;
        b=VXC9Ceh/3J4ioL1XhTIN6EMvZGMr1IxbgX2uLtdrU2i5tCAUYsgKj8y0V0kfwCWeI7
         e96xjB0pGFH6EneSke+SnENWJhYvrutxSI8L2gsb0HhHzK0VzcV57PN3NXT1vcwARF/T
         Sqx9vrSPkEb9exmRswUTV4NjdLD4ewlYwPgLe2c7cdtNGTUTBvCA8fJ+8s6jA55vtVxg
         V2pTQ/CBlM/CHXNGkGDUL8MDf4iO/xPWtKvFNMVjtOYjP3Xlf+FjDPCcSSQUY+P4SoZ9
         P3onNDoDplGLt4X9/KWZwaqK+0nQaDA7plpgHAOCbp/LCo51TGwjr1eBBcMpfwrtdh2Z
         rbvw==
X-Gm-Message-State: AOAM531TF6QRjnUQ9Nm0TNeO0vRAfwmS1fDDL8fe/2GJAV/QLLxlzeBW
	bgY/huzXbgHHoWqJAvoQK+AFSN+QHss=
X-Google-Smtp-Source: ABdhPJy/tuZ89YIVzFxnb/N+N9fglGybuYwxD2O1ATHh3M9AJ4jQPDe/xLpZf4+ok3KbiC32clXT+w==
X-Received: by 2002:a63:3101:: with SMTP id x1mr7615492pgx.392.1589644730946;
        Sat, 16 May 2020 08:58:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id jz3sm4202003pjb.40.2020.05.16.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:58:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] syslinux: Fix build with gcc10
Date: Sat, 16 May 2020 08:58:43 -0700
Message-Id: <20200516155843.1811017-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516155843.1811017-1-raj.khem@gmail.com>
References: <20200516155843.1811017-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring in a patch from fedora to fix -fno-common issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...multiple-definition-of-symbol-errors.patch | 97 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch b/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
new file mode 100644
index 0000000000..44cb153276
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
@@ -0,0 +1,97 @@
+From 951928f2cad5682c2844e6bd0f7201236c5d9b66 Mon Sep 17 00:00:00 2001
+From: Merlin Mathesius <mmathesi@redhat.com>
+Date: Wed, 13 May 2020 08:02:27 -0500
+Subject: [PATCH] Workaround multiple definition of symbol errors
+
+Lifted from Fedora https://src.fedoraproject.org/rpms/syslinux/blob/master/f/0005-Workaround-multiple-definition-of-symbol-errors.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ com32/cmenu/Makefile           | 2 +-
+ com32/elflink/ldlinux/Makefile | 2 +-
+ com32/gpllib/Makefile          | 2 +-
+ com32/hdt/Makefile             | 2 +-
+ core/Makefile                  | 2 +-
+ dos/Makefile                   | 2 +-
+ efi/Makefile                   | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+--- a/com32/cmenu/Makefile
++++ b/com32/cmenu/Makefile
+@@ -49,7 +49,7 @@ makeoutputdirs:
+ 	@mkdir -p $(OBJ)/libmenu
+ 
+ libmenu/libmenu.elf: $(LIBMENU)
+-	$(LD) -shared $(LDFLAGS) -soname $(patsubst %.elf,%.c32,$(@F)) \
++	$(LD) -shared $(LDFLAGS) -z muldefs -soname $(patsubst %.elf,%.c32,$(@F)) \
+ 		-o $@ $^
+ 
+ tidy dist:
+--- a/com32/elflink/ldlinux/Makefile
++++ b/com32/elflink/ldlinux/Makefile
+@@ -33,7 +33,7 @@ endif
+ all: $(BTARGET) ldlinux_lnx.a
+ 
+ ldlinux.elf : $(OBJS)
+-	$(LD) $(LDFLAGS) -soname $(SONAME) -o $@ $^ $(LIBS)
++	$(LD) $(LDFLAGS) -z muldefs -soname $(SONAME) -o $@ $^ $(LIBS)
+ 
+ LNXCFLAGS += -D__export='__attribute__((visibility("default")))'
+ LNXLIBOBJS = get_key.lo
+--- a/com32/gpllib/Makefile
++++ b/com32/gpllib/Makefile
+@@ -24,7 +24,7 @@ makeoutputdirs:
+ 		$(addprefix $(OBJ),$(sort $(dir $(LIBOBJS)))),$(b))
+ 
+ libgpl.elf : $(LIBOBJS)
+-	$(LD) -shared $(LDFLAGS) -soname $(patsubst %.elf,%.c32,$(@F)) -o $@ $^
++	$(LD) -shared $(LDFLAGS) -z muldefs -soname $(patsubst %.elf,%.c32,$(@F)) -o $@ $^
+ 
+ tidy dist clean:
+ 	find . \( -name \*.o -o -name .\*.d -o -name \*.tmp \) -print0 | \
+--- a/com32/hdt/Makefile
++++ b/com32/hdt/Makefile
+@@ -52,7 +52,7 @@ QEMU			?= qemu-kvm
+ all: $(MODULES) $(TESTFILES)
+ 
+ hdt.elf : $(OBJS) $(LIBS) $(C_LIBS)
+-	$(LD) $(LDFLAGS) -o $@ $^
++	$(LD) $(LDFLAGS) -z muldefs -o $@ $^
+ 
+ memtest:
+ 	-[ ! -f $(FLOPPY_DIR)/$(MEMTEST) ] && $(WGET) $(MEMTEST_URL) -O $(FLOPPY_DIR)/$(MEMTEST)
+--- a/core/Makefile
++++ b/core/Makefile
+@@ -156,7 +156,7 @@ LDSCRIPT = $(SRC)/$(ARCH)/syslinux.ld
+ NASM_ELF = elf
+ 
+ %.elf: %.o $(LIBDEP) $(LDSCRIPT) $(AUXLIBS)
+-	$(LD) $(LDFLAGS) -pie -Bsymbolic \
++	$(LD) $(LDFLAGS) -z muldefs -pie -Bsymbolic \
+ 		-T $(LDSCRIPT) \
+ 		--unresolved-symbols=report-all \
+ 		-E --hash-style=gnu -M -o $@ $< \
+--- a/dos/Makefile
++++ b/dos/Makefile
+@@ -19,7 +19,7 @@ include $(MAKEDIR)/embedded.mk
+ CFLAGS	+= -D__MSDOS__ -mregparm=3 -DREGPARM=3
+ # CFLAGS  += -DDEBUG
+ 
+-LDFLAGS	 = -T $(SRC)/dosexe.ld
++LDFLAGS	 = -T $(SRC)/dosexe.ld -z muldefs
+ OPTFLAGS = -g
+ INCLUDES = -include code16.h -nostdinc -iwithprefix include \
+ 	   -I$(SRC) -I$(SRC)/.. -I$(SRC)/../libfat \
+--- a/efi/Makefile
++++ b/efi/Makefile
+@@ -71,7 +71,7 @@ $(OBJS): | $(OBJ)/$(ARCH)
+ BTARGET  = syslinux.efi
+ 
+ syslinux.so: $(OBJS) $(CORE_OBJS) $(LIB_OBJS)
+-	$(LD) $(LDFLAGS) --strip-debug -o $@ $^ -lgnuefi -lefi
++	$(LD) $(LDFLAGS) -z muldefs --strip-debug -o $@ $^ -lgnuefi -lefi
+ 
+ # We need to rename the .hash section because the EFI firmware
+ # linker really doesn't like it.
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index e9dbefb930..3e7eef3a75 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch \
            file://0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch \
            file://0009-linux-syslinux-implement-install_bootblock.patch \
+           file://0010-Workaround-multiple-definition-of-symbol-errors.patch \
            file://0001-install-don-t-install-obsolete-file-com32.ld.patch \
            "
 
-- 
2.26.2

