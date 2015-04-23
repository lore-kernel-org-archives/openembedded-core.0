Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B76006AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:15:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3N9FLKr011862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 02:15:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 02:15:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Apr 2015 02:15:19 -0700
Message-ID: <76f379df4b937b4f711bc736915093b9d8e391d7.1429780485.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429780485.git.liezhi.yang@windriver.com>
References: <cover.1429780485.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gnu-efi: fix parallel issue
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
X-List-Received-Date: Thu, 23 Apr 2015 09:15:20 -0000
Content-Type: text/plain

Fixed:
Assembler messages:
Fatal error: can't create runtime/rtlock.o: No such file or directory
Assembler messages:
Fatal error: can't create runtime/rtdata.o: No such file or directory
Assembler messages:
Fatal error: can't create runtime/vm.o: No such file or directory
Assembler messages:
Fatal error: can't create runtime/efirtlib.o: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-efi/lib-Makefile-fix-parallel-issue.patch  |   38 ++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb          |    1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
new file mode 100644
index 0000000..1b2ae1e
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch
@@ -0,0 +1,38 @@
+From 0daa354a16aa3cade56ed423d0f8a04cf1c22f9d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 23 Apr 2015 01:49:31 -0700
+Subject: [PATCH] lib/Makefile: fix parallel issue
+
+Fixed:
+Assembler messages:
+Fatal error: can't create runtime/rtlock.o: No such file or directory
+Assembler messages:
+Fatal error: can't create runtime/rtdata.o: No such file or directory
+Assembler messages:
+Fatal error: can't create runtime/vm.o: No such file or directory
+Assembler messages:
+Fatal error: can't create runtime/efirtlib.o: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/Makefile |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index dc4b94a..f64d1ed 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -73,6 +73,8 @@ all: libsubdirs libefi.a
+ libsubdirs:
+ 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
+ 
++$(OBJS): libsubdirs
++
+ libefi.a: $(OBJS)
+ 	$(AR) rv $@ $(OBJS)
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
index 2b4f3f3..27cc6c1 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=9;md5=2240d
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
+           file://lib-Makefile-fix-parallel-issue.patch \
           "
 SRC_URI[md5sum] = "a9db2cabc01a2674715bd6aea2911f01"
 SRC_URI[sha256sum] = "194b580ecdb1fad0e41914845ba064c279afb687855960b58693459e5537b4d7"
-- 
1.7.9.5


