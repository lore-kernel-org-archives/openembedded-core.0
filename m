Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C790CC48BEA
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.462.1660894081385256460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NqlmtZBn;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so2069883wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zbo7eHHMZPZ1XpWHnScWMWi3UDZW9BJYVAlhKmUzm9I=;
        b=NqlmtZBnZEbKim29kVeseh9iUQkTiwzUQrc9sQU3fpZGsWjzOYtf1Zt3B0ENodxfoN
         1aJ8rEUvCdc8twHtx6l/8ZEMKDFGK0wfQ5yXUTG9P0qOBADO9uHppOZuNZ9fjqZJ6nVo
         HTaBkfvup35kUne/UOiPAvuZ5FpH2fR7cL13OJBSYdtS+QNg+RDRpGQnkTC/nwDrGc3v
         Yz++Zntx/KUw+5tocWMnam6GuB1NEBJiGLt1I45pJbsT7tMIPBS3AiMxvKQhnk317CAg
         ywVJy110cI+RfqRM421sXURYC331kaCAwxlKtU3DVSIdArb6kKnnTUd8pvr5RGeBG6Er
         EyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zbo7eHHMZPZ1XpWHnScWMWi3UDZW9BJYVAlhKmUzm9I=;
        b=OUN7oP/t/yBfq+P2DUDiPou8HaIZXqxTChWqiJrlpq9ciJfRcew8LQeOBofXNwwUr2
         JnX6pt+fkRvuNtegeBOCl6IsKx6QB3P4OR6h+r4+P8Uvo/smHHMT7t3/r9YH2fLMggU2
         OYrWLXtmjzwLf+OJ9+C3A2PXwmH6v7ckHWic5zq2ivF9I1vXm7y0WOZ1iJ91bLETNSVH
         XLy0VUSE4Ryu1jgMAl3SdadG+Jjb9OikFfaZXIHNMKEH9j6H4/2AdCl24ZO+Y6TNL4le
         Sk0HAALIA0p5UAJDvMDwlcT7wt2eEibzg5d2dnWgPH1tKgMoSn3+8Ldq0Q8jJjV8EIYh
         35ow==
X-Gm-Message-State: ACgBeo2MPrAS/WddW3qyRjvclYqV3c1Ta8oQnaWBK9NOYHXI1Ojd87N0
	VEBBf2gNC9AlHw2o0JRQ1/gJkR1/C3k=
X-Google-Smtp-Source: 
 AA6agR4uHrEfU2H06Mqzbor7mikwEUxiM/7ViRkMiiSY1FK/kTa88kI2n0wCB0Yeo1dBzUQARP+f+w==
X-Received: by 2002:a05:600c:358e:b0:3a5:f19d:28db with SMTP id
 p14-20020a05600c358e00b003a5f19d28dbmr7405314wmq.76.1660894079840;
        Fri, 19 Aug 2022 00:27:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/42] gnu-efi: upgrade 3.0.14 -> 3.0.15
Date: Fri, 19 Aug 2022 09:27:01 +0200
Message-Id: <20220819072727.2236928-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169587

Drop lib-Makefile-fix-parallel-issue.patch
as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lib-Makefile-fix-parallel-issue.patch     | 38 -------------------
 .../gnu-efi/parallel-make-archives.patch      | 17 +++++----
 .../{gnu-efi_3.0.14.bb => gnu-efi_3.0.15.bb}  |  3 +-
 3 files changed, 10 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.14.bb => gnu-efi_3.0.15.bb} (94%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
deleted file mode 100644
index dc00b8fa4d..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3ec8c2a70304eabd5760937a4ec3fbc4068a77ed Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 23 Apr 2015 01:49:31 -0700
-Subject: [PATCH 2/3] lib/Makefile: fix parallel issue
-
-Fixed:
-Assembler messages:
-Fatal error: can't create runtime/rtlock.o: No such file or directory
-Assembler messages:
-Fatal error: can't create runtime/rtdata.o: No such file or directory
-Assembler messages:
-Fatal error: can't create runtime/vm.o: No such file or directory
-Assembler messages:
-Fatal error: can't create runtime/efirtlib.o: No such file or directory
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- lib/Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index 048751a..ed39bbb 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -74,6 +74,8 @@ all: libsubdirs libefi.a
- libsubdirs:
- 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
- 
-+$(OBJS): libsubdirs
-+
- libefi.a: $(OBJS)
- 	$(AR) $(ARFLAGS) $@ $(OBJS)
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
index 8a0138bbe5..63d9b6fc31 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -1,7 +1,7 @@
-From 48b2cdbcd761105e8ebad412fcbf23db1ac4ef7c Mon Sep 17 00:00:00 2001
+From f56ddb00a656af2e84f839738fad19909ac65047 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Sun, 9 Mar 2014 15:22:15 +0200
-Subject: [PATCH 1/3] Fix parallel make failure for archives
+Subject: [PATCH] Fix parallel make failure for archives
 
 Upstream-Status: Pending
 
@@ -20,12 +20,16 @@ Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
 [Rebased for 3.0.8]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
+---
+ lib/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/lib/Makefile b/lib/Makefile
-index 0e6410d..048751a 100644
+index 1fc6a47..54b0ca7 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -75,7 +75,7 @@ libsubdirs:
- 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
+@@ -77,7 +77,7 @@ libsubdirs:
+ $(OBJS): libsubdirs
  
  libefi.a: $(OBJS)
 -	$(AR) $(ARFLAGS) $@ $^
@@ -33,6 +37,3 @@ index 0e6410d..048751a 100644
  
  clean:
  	rm -f libefi.a *~ $(OBJS) */*.o
--- 
-2.7.4
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb
similarity index 94%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb
index 36d10354ed..5ae6f391ae 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb
@@ -14,11 +14,10 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
-           file://lib-Makefile-fix-parallel-issue.patch \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[sha256sum] = "b73b643a0d5697d1f396d7431448e886dd805668789578e3e1a28277c9528435"
+SRC_URI[sha256sum] = "931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
-- 
2.30.2


