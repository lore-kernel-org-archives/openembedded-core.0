Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.5526.1588769824596012224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 05:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WWMMPZ3T;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id j8so1934532iog.13
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=aJ1D+/AU99X2/aDK8+e/xo0l15tn38UmnzmKkdPcejo=;
        b=WWMMPZ3Tij8OfJtklc9YRVMJ4aEKAmMBFieKrC5Mq/EOMa4OX2lsd7mCvrJBLwURNO
         sAYQhvHkcNSV1WgoKzcGQpaehLBAmYanFJAKRvkyjehX6XK0eOOrFBEPO+rf3v62TsKp
         WazShVHhlHgc5R0C5t2z7ViqpUUxkmS8WqiG7JOvZpsn++RS8tpn71Q72nop8Q3j8HiB
         w5kEwA5kw0YWzUEwE9ORFUUQlPAXQHlXqqbGW+tmCMflZOe1y7SpY+yXEGJA3CeZjkHT
         DDILcFLY3q/moBNG3D4z9llzA0SWSJnfHBuOk2XvbXrfr38MH6ozGZUxR1OfTyIhv9OZ
         VQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aJ1D+/AU99X2/aDK8+e/xo0l15tn38UmnzmKkdPcejo=;
        b=WwY5Uub5a4JFkb6sLUJ0kfcjixJHlgMkeW70mW0UFhyiiX/3K25QUn+pTDmY1OKTaA
         lud93CivYoBy7Ue2ngFhoAr2ur+/z3dHaRAswGuvfiY2V2JqUesNdtjPYKx+Se5gxUx5
         cQvxNzP65SA5JrglT68BmRtVLBQ61dixQoMkhZUmoWh305CSI//O9s/8jX6CPfhlwu4k
         k/K8yPuiIhN3ZVfB6qjLEZWR59zfzB0OQAkTXcR84EHFppBUjiq7HGnP15EVPl3qHc4p
         GX+ORkYXT/5zoN3rSloIuV9vrcY+uUetVFEAS2c+z9+givxzJ9PaEGkOU9TtU30vCzFl
         NL7A==
X-Gm-Message-State: AGi0PuaRuVS/tPQlCC/hXnPkh0VpVACegxYV+8UZs3EupCkfhWN4E/fd
	RW1tUMnE024wARCNoQPOIOaBeGwK
X-Google-Smtp-Source: APiQypLJ2VDAcaq+534Zj2MyqxTenTNZPwcHwtbrG/7EQqPA65uYo+5MPfujGu3diNkLSiywjI9MCQ==
X-Received: by 2002:a05:6638:258:: with SMTP id w24mr134904jaq.53.1588769823488;
        Wed, 06 May 2020 05:57:03 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:9443:9da0:9552:f43])
        by smtp.gmail.com with ESMTPSA id u203sm1020775iod.54.2020.05.06.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:57:02 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] libnewt: Backport patch to fix reproducibility
Date: Wed,  6 May 2020 07:56:57 -0500
Message-Id: <20200506125657.3371-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Backports a patch from upstream to fix a reproducibility problem where
paths would be encoded in the binary.

Drops an obsolete patch that conflicted with the backport

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...-t-ignore-CFLAGS-when-building-snack.patch | 29 +++++++++++++
 .../newt/files/pie-flags.patch                | 41 -------------------
 meta/recipes-extended/newt/libnewt_0.52.21.bb |  4 +-
 3 files changed, 31 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
 delete mode 100644 meta/recipes-extended/newt/files/pie-flags.patch

diff --git a/meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch b/meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
new file mode 100644
index 0000000000..ca235d5108
--- /dev/null
+++ b/meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
@@ -0,0 +1,29 @@
+From f60dc1063607ca1f201ba4cbda467d8af3f78f64 Mon Sep 17 00:00:00 2001
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Tue, 1 Oct 2019 16:37:55 +0200
+Subject: [PATCH] don't ignore CFLAGS when building snack
+
+In addition to the flags returned by python-config --cflags, use the
+user-specified CFLAGS when building the snack object.
+
+Upstream-Status: Backport from master
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index be5f87b..6facd5e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -96,8 +96,8 @@ _snack.$(SOEXT):   snack.c $(LIBNEWTSH)
+ 		PIFLAGS=`$$pyconfig --includes`; \
+ 		PLDFLAGS=`$$pyconfig --ldflags`; \
+ 		PLFLAGS=`$$pyconfig --libs`; \
+-		echo $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
+-		$(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
++		echo $(CC) $(SHCFLAGS) $(CFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
++		$(CC) $(SHCFLAGS) $(CFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
+ 		echo $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
+ 		$(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
+ 	done || :
diff --git a/meta/recipes-extended/newt/files/pie-flags.patch b/meta/recipes-extended/newt/files/pie-flags.patch
deleted file mode 100644
index 92f5b2503b..0000000000
--- a/meta/recipes-extended/newt/files/pie-flags.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-specify -fPIC after CFLAGS so it can override the CFLAGS containing -pie and -fpie this makes sure the objects that go into shared objects are compiled with -fPIC and not with -fpie. We can not use -fpie on objects which will go into .so files Fixes errors like
-
-| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: shared/newt.o: relocation R_X86_64_PC32 against undefined symbol `SLtt_Screen_Rows@@SLANG2' can not be used when making a shared object; recompile with -fPIC
-| /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: final link failed: Bad value
-| collect2: error: ld returned 1 exit status
-| make: *** [libnewt.so.0.52.18] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- Makefile.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index be5f87b..88ee0b7 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -96,8 +96,8 @@ _snack.$(SOEXT):   snack.c $(LIBNEWTSH)
- 		PIFLAGS=`$$pyconfig --includes`; \
- 		PLDFLAGS=`$$pyconfig --ldflags`; \
- 		PLFLAGS=`$$pyconfig --libs`; \
--		echo $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
--		$(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
-+		echo $(CC) $(CPPFLAGS) $(SHCFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
-+		$(CC) $(CPPFLAGS) $(SHCFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snack.o snack.c; \
- 		echo $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
- 		$(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
- 	done || :
-@@ -133,7 +133,7 @@ $(LIBNEWTSH): $(SHAREDOBJS)
- 
- $(SHAREDDIR)/%.o : %.c
- 	@mkdir -p $(SHAREDDIR)
--	$(CC) $(SHCFLAGS) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
-+	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(SHCFLAGS) -o $@ $<
- 
- install: $(LIBNEWT) install-sh whiptail
- 	[ -d $(instroot)/$(bindir) ] || install -m 755 -d $(instroot)/$(bindir)
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/newt/libnewt_0.52.21.bb b/meta/recipes-extended/newt/libnewt_0.52.21.bb
index 09b61be61d..88b4cf4a03 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.21.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.21.bb
@@ -20,9 +20,9 @@ DEPENDS = "slang popt python3"
 SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
-           file://pie-flags.patch \
            file://0001-detect-gold-as-GNU-linker-too.patch \
-"
+           file://0002-don-t-ignore-CFLAGS-when-building-snack.patch \
+           "
 
 SRC_URI[md5sum] = "a0a5fd6b53bb167a65e15996b249ebb5"
 SRC_URI[sha256sum] = "265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31"
-- 
2.17.1

