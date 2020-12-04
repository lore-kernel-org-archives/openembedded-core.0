Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.20359.1607112470277853125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gaSAfIGK;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id bo9so10380111ejb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w2RwRmBKPt7p2erKxNDWh/q801ThrjMN4Dz5m/g8/C0=;
        b=gaSAfIGKoV/o3gkFhclTbPGwJID/1Hf5HXxecNOB0D10bjgq+l1/mYkUuL0To44VqB
         UdpMaPDxrSVoBC+24ksftTKusikXxJK4b+WXLLIZ38/f7MBJvetDprr6Sju7xqsSDHhY
         OYmqgp+tyMEkR40nTTwneOc78xkEuXGDtcLHRosEno4WjZPWdPs/H8xLdy1fTvNyqFXi
         0umf0Rg8mtVdJ+TzVHAHAAymJzpQXO+DHvrE25X4DSKWUMQ7muXZKX2YYMpUsR17DP6q
         UeWqTX3yu1238DaylKp7RqREX6YSFoEQ9gzzXJE4X77ygbPXV8g/spsLDlNF4sGeAGzm
         r7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w2RwRmBKPt7p2erKxNDWh/q801ThrjMN4Dz5m/g8/C0=;
        b=genAE3rqQ8zpWZoc5UPmyR9X7njG+Mn7hXy4+jPo3ZGJy4ASr8DEoisAC619jtBEmD
         DaDG/5t2diwfdmnR0+tjRIANXeZut1YHZlTG56P/ElazaxwkLAzSr7Akhpud8RsbNGl4
         t3tjWMd6YX2FptMU64K0SBg2prPDSsylT8nQP2E4cm6oOtyL2hsQ/B7IxmwMbh/mtVHC
         HnlA2Zk/OLlllSee2D9sKaq1kow6hLddfcTuAUJfcTgnXeqypcPm3NI6iF+UIAjp7HuP
         siz5CdHvKxV0PHjiNwns6YBrziOkpg6G6wgIy1UNGNANeU8y9hO/koB0yAcu1D88b1Yt
         96Aw==
X-Gm-Message-State: AOAM530qqyg4ScNW3niq6F1HSmHqyZ2ohEP0mKggeSo/lKYi3/5bCqNP
	rMSoOGWhEtSB85RpLuyrtZEykJcVpGXdqg==
X-Google-Smtp-Source: ABdhPJzH3YNVdvRZKzGuVTpOY03OyYp9X+9p48qaijyRB47Oeb7K4qlmfwwf6hWHOaDpUIcr629qvw==
X-Received: by 2002:a17:906:c096:: with SMTP id f22mr8489861ejz.488.1607112468593;
        Fri, 04 Dec 2020 12:07:48 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/23] libcap: update 2.44 -> 2.45
Date: Fri,  4 Dec 2020 21:07:17 +0100
Message-Id: <20201204200737.7072-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch | 36 +++++++++++++------
 ...-tests-do-not-run-target-executables.patch | 16 ++++-----
 .../libcap/{libcap_2.44.bb => libcap_2.45.bb} |  2 +-
 3 files changed, 34 insertions(+), 20 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.44.bb => libcap_2.45.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index d9fd48a9db..3c737b884e 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -1,4 +1,4 @@
-From 03e925f0d68bc51e1acf1ac2014a9c2452c664bf Mon Sep 17 00:00:00 2001
+From c22c6c16362c7dbc8d6faea06edee5e07759c5fa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -9,23 +9,37 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
+ progs/Makefile | 2 +-
  tests/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/progs/Makefile b/progs/Makefile
+index 1d7fc7a..37db8f7 100644
+--- a/progs/Makefile
++++ b/progs/Makefile
+@@ -42,7 +42,7 @@ endif
+ test: $(PROGS)
+ 
+ tcapsh-static: capsh.c $(DEPS)
+-	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS) --static
++	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
+ 
+ sudotest: test tcapsh-static
+ 	sudo $(LDPATH) ./quicktest.sh
 diff --git a/tests/Makefile b/tests/Makefile
-index d569650..f5ca377 100644
+index 3431df9..727fb86 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -11,7 +11,7 @@ ifeq ($(DYNAMIC),yes)
- LDPATH = LD_LIBRARY_PATH=../libcap
- DEPSBUILD = all
+@@ -22,7 +22,7 @@ ifeq ($(PTHREADS),yes)
+ DEPS += ../libcap/libpsx.so
+ endif
  else
 -LDFLAGS += --static
-+LDFLAGS += 
- DEPSBUILD = libcap.a libpsx.a
- endif
- 
-@@ -51,7 +51,7 @@ libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
++LDFLAGS +=
+ DEPS=../libcap/libcap.a ../progs/tcapsh-static
+ ifeq ($(PTHREADS),yes)
+ DEPS +=  ../libcap/libpsx.a
+@@ -106,7 +106,7 @@ noexploit: exploit.o $(DEPS)
  
  # This one runs in a chroot with no shared library files.
  noop: noop.c
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index bfce8e0547..69287152eb 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From 7744c1f678f5226a151bc6b2a254a56835229d91 Mon Sep 17 00:00:00 2001
+From 652071e430d5eea758965176b7648e79ad404daa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -11,20 +11,20 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index 8956d5d..d569650 100644
+index fc39fee..3431df9 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -27,13 +27,11 @@ sudotest: test run_libcap_launch_test run_libcap_launch_test
- install: all
+@@ -59,13 +59,11 @@ endif
  
+ # unprivileged
  run_psx_test: psx_test
--	$(LDPATH) ./psx_test
+-	./psx_test
  
  psx_test: psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LDFLAGS)
  
  run_libcap_psx_test: libcap_psx_test
--	$(LDPATH) ./libcap_psx_test
+-	./libcap_psx_test
  
  libcap_psx_test: libcap_psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
diff --git a/meta/recipes-support/libcap/libcap_2.44.bb b/meta/recipes-support/libcap/libcap_2.45.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.44.bb
rename to meta/recipes-support/libcap/libcap_2.45.bb
index 79875522d6..067ba32d99 100644
--- a/meta/recipes-support/libcap/libcap_2.44.bb
+++ b/meta/recipes-support/libcap/libcap_2.45.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "92188359cd5be86e8e5bd3f6483ac6ce582264f912398937ef763def2205c8e1"
+SRC_URI[sha256sum] = "d66639f765c0e10557666b00f519caf0bd07a95f867dddaee131cd284fac3286"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.29.2

