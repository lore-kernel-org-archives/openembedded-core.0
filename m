Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.10572.1592494981782133894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OogmUvn1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id d4so4894139otk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bwRsT38e5lG8B/KIMybepQBOddxOzaFAZU4QwlVxFLE=;
        b=OogmUvn1DyEdZpQrtLCAfhxqBlgPo1tLsgAPVloKtMsfCH9HmJq2gzhOORfZrM0eid
         FmxCZbMAKUPH0jQPgj0gPQ2axyqkXr50S4MIcc/YqM3wcexjctHXl54Hd0Lt8mfW3EYA
         UI+i8s4FREQUnfXw7wFW8429RaoS8C0wvmlL08xMlEEnr3AmEp5X+/0eGxJKpf7kA9II
         f5VoyXOtN2vczlydl3BUIxUzx2+y+GBwRmpjNBetSYTF7H4Z8ckSgGk0DObENW9TQOON
         5ca501fBivWhd7sfwE5qK8PavbwKrt+Vf6GL4KCO9Ewt6CHTWuzq9rFSLK96/zGz6Xzx
         9GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bwRsT38e5lG8B/KIMybepQBOddxOzaFAZU4QwlVxFLE=;
        b=WTlqRdqtEoPqoISUBhoo1Oc4ywGVAuPchtOF5bbEHrsXr7o+GfsK6FunTo5mguzV3X
         Uc71l9EUzDXoXMl41iOaf23X0mrrDUOOv05VOM91j1DCCPE6SYQD6eLtUT3j40gBRT3d
         I4e8RhXUiwfZam3h6iLKlpvo0seLrpmmKJRLjcb5vxvXoDrFttaBtraEk+ZJxGBqu7mJ
         tUupru8NTNEI/2VxXoEvwwbLPtuUm9pHuGvdQ//OJDtoufzwZgbCkMhMl/OYLcKOEQMK
         GIYKICr7Jb10FJ697DCA/yJRz9Z7FJxCvbf/XzrzxpilIWDQGsKnTCDgkxaiA5gNYGfq
         WPWQ==
X-Gm-Message-State: AOAM532MkoVZ2dCZHKwvJkeea0/Te8PRSjYMgNTj3jsOmKNkUpQKMISe
	Kj2JYWVV1rjQvtdMTy0zqC5AYHOgF/I+0g==
X-Google-Smtp-Source: ABdhPJwArUiWeR0LpsgbPfTEBdsMknk0vJnHh+ve8d5O6tcRyCF2n3YE+BRIA/g7VVdQ6HR7BGVLbw==
X-Received: by 2002:a9d:5c04:: with SMTP id o4mr3879945otk.21.1592494980566;
        Thu, 18 Jun 2020 08:43:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:43:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/21] syslinux: Fix build with gcc10
Date: Thu, 18 Jun 2020 05:40:47 -1000
Message-Id: <7457e6e2a2b0d00875c15112b6528c9ad97830d5.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Bring in a patch from fedora to fix -fno-common issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f635bd89d53cc8c110b18aa593babc55eeffc511)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

