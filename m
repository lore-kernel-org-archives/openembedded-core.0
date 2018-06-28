Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8D5746E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:41:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5S7f1Mt011271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 00:41:01 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 28 Jun 2018 00:41:00 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 15:39:49 +0800
Message-ID: <1530171589-21641-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
References: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 4/4] gnu-efi: update to 3.0.8
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
X-List-Received-Date: Thu, 28 Jun 2018 07:41:00 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../gnu-efi/lib-Makefile-fix-parallel-issue.patch        | 14 +++++++-------
 .../gnu-efi/gnu-efi/parallel-make-archives.patch         | 16 +++++++++-------
 .../gnu-efi/{gnu-efi_3.0.6.bb => gnu-efi_3.0.8.bb}       |  4 ++--
 3 files changed, 18 insertions(+), 16 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.6.bb => gnu-efi_3.0.8.bb} (95%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
index 1b2ae1e..dc00b8f 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
@@ -1,7 +1,7 @@
-From 0daa354a16aa3cade56ed423d0f8a04cf1c22f9d Mon Sep 17 00:00:00 2001
+From 3ec8c2a70304eabd5760937a4ec3fbc4068a77ed Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 23 Apr 2015 01:49:31 -0700
-Subject: [PATCH] lib/Makefile: fix parallel issue
+Subject: [PATCH 2/3] lib/Makefile: fix parallel issue
 
 Fixed:
 Assembler messages:
@@ -17,22 +17,22 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- lib/Makefile |    2 ++
+ lib/Makefile | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/lib/Makefile b/lib/Makefile
-index dc4b94a..f64d1ed 100644
+index 048751a..ed39bbb 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -73,6 +73,8 @@ all: libsubdirs libefi.a
+@@ -74,6 +74,8 @@ all: libsubdirs libefi.a
  libsubdirs:
  	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
  
 +$(OBJS): libsubdirs
 +
  libefi.a: $(OBJS)
- 	$(AR) rv $@ $(OBJS)
+ 	$(AR) $(ARFLAGS) $@ $(OBJS)
  
 -- 
-1.7.9.5
+2.7.4
 
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
index 0110260..a9806cf 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -1,4 +1,4 @@
-From 16865de66db33ca70872199e70d93efccecc8575 Mon Sep 17 00:00:00 2001
+From 48b2cdbcd761105e8ebad412fcbf23db1ac4ef7c Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Sun, 9 Mar 2014 15:22:15 +0200
 Subject: [PATCH 1/3] Fix parallel make failure for archives
@@ -17,13 +17,15 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 [Rebased for 3.0.6]
 Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
+[Rebased for 3.0.8]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  gnuefi/Makefile | 3 ++-
  lib/Makefile    | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/gnuefi/Makefile b/gnuefi/Makefile
-index 2a61699..148106e 100644
+index 2a61699..89b560a 100644
 --- a/gnuefi/Makefile
 +++ b/gnuefi/Makefile
 @@ -54,7 +54,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
@@ -32,23 +34,23 @@ index 2a61699..148106e 100644
  
 -libgnuefi.a: $(patsubst %,libgnuefi.a(%),$(OBJS))
 +libgnuefi.a: $(OBJS)
-+	$(AR) rv $@ $(OBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS)
  
  clean:
  	rm -f $(TARGETS) *~ *.o $(OBJS)
 diff --git a/lib/Makefile b/lib/Makefile
-index b8d1ce7..6ef8107 100644
+index 0e6410d..048751a 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
 @@ -75,7 +75,7 @@ libsubdirs:
  	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
  
  libefi.a: $(OBJS)
--	$(AR) rv -U $@ $^
-+	$(AR) rv $@ $(OBJS)
+-	$(AR) $(ARFLAGS) $@ $^
++	$(AR) $(ARFLAGS) $@ $(OBJS)
  
  clean:
  	rm -f libefi.a *~ $(OBJS) */*.o
 -- 
-2.9.4
+2.7.4
 
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.6.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.8.bb
similarity index 95%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.6.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.8.bb
index 2a60717..dba4733 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.6.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.8.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://gcc46-compatibility.patch \
            "
 
-SRC_URI[md5sum] = "46f633758a8a37db9fd6909fe270c26b"
-SRC_URI[sha256sum] = "21515902d80fbea23328a61d70d3d51a47204abd1507ebfa27550a7b9bf22c91"
+SRC_URI[md5sum] = "ae32011cfe6b1c40c0f244b9a49ba181"
+SRC_URI[sha256sum] = "76006d8ea8d67bcf72f35d09d43e9ef6a69400d6d5d4bf64baf1ab7434e2b722"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.7.4


