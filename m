Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.834.1589820551161780943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RNp66XMR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id n18so5222440pfa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Pq91ERj7nVuwhKYzDeJ3eAw/KCuv7ZxXSzj/lwItPPI=;
        b=RNp66XMRan6vpgBMphdArztft1aBxSSQt+AnQzJC9yXPT3uKnIXKJR8w5Z2VqFYvEP
         7QHs8nW5qvoEP2X9dhPPruT/g0iU9FxhAqSnOYCv36BMkgq51M1qaP4j6kDlXKjiYirG
         Qe5DFZQcSa6hou96xN/efVSD+0w+W5E4mt+gawBZ+FXWuLmw+OlFu8hyUnFCMtY0sEWy
         m2D5yGASN7Oy0xkqrDFQvQO+DCtUhXfXkurEcifvykMkQAO3Iw75sCotTMhRUJ70t0Dy
         tqDdh9AEPrfJkZNRkUkCX+Vs2JuFNuyDD0GyzLanBd2R4jFMLH7rysZkAfrg0IrLB6sE
         zbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Pq91ERj7nVuwhKYzDeJ3eAw/KCuv7ZxXSzj/lwItPPI=;
        b=rKXCrBMWLRtaTt5kwTcl2FBF5sHrDMdcpFnk00oUoEedTQmAc63Q1VUlqKJWNKegoV
         JoimgzCAj4wtdiN4UALwk6cp1asWxOEBywpm2W4wkZ+Xqv0Lp1kMdeA6soV0vS3/6r9i
         hda1asQuRQMlGnoUhg1RG4HZNPrnD34kA9Qax5YzSFn4lyGnz6gdyms601x6z6sqE2tA
         LizaFRDCzLSSO0wifhJ9CfKo3mR4uTt8MdSc9cRprBl4zdvN/yjH6TzbjliCsjO/ilm4
         sBzdHz4qImVYMREA1hJNyjSLgGmEEO4iTCECnpt2/Wft6cNyutohEAtsK8LF/rV1uUPl
         QJHA==
X-Gm-Message-State: AOAM532M19RVNtJ7m/uIo1r0xyHoaG1Ew/ZvzpgLc6WwVHIIXuNisnIf
	LIc0nxsyXjuMyJlSKNilUp3h6ov2830atA==
X-Google-Smtp-Source: ABdhPJwf0Fekg48T7bzaCRFBlM4TGtTrXhf0AAJ9vHmTWwtQswtkbyFxWM29Oue6hV8ug+fXNXCS9g==
X-Received: by 2002:a63:da4c:: with SMTP id l12mr15670870pgj.3.1589820550146;
        Mon, 18 May 2020 09:49:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/19] libnewt: Backport patch to fix reproducibility
Date: Mon, 18 May 2020 06:48:23 -1000
Message-Id: <b8f5114aabf6bbbc4adf5802a6707efaf18ba2ee.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Backports a patch from upstream to fix a reproducibility problem where
paths would be encoded in the binary.

Drops an obsolete patch that conflicted with the backport

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

