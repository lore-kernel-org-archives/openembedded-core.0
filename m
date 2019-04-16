Return-Path: <oobitots@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id B5E5E7D686
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2657; q=dns/txt; s=iport;
	t=1555429019; x=1556638619;
	h=from:to:cc:subject:date:message-id;
	bh=b+zHWSs9oDVB3ML40U2vlopYRJJz0GdrtkKl7j5AXks=;
	b=U3Zd5Ez2wEa/CjDmOZpgV312l9uChNRWCimXndQD2iSWTqEGzggquMn3
	Tg/Ij9fV6oJ4aCqe/ckCTcvk36PnjVQ5gZ7U1eti6PuRW9bKZubQRO05n
	IAxNnXJYxUciT2oamCMNHxxaWOZmIed9LUSLOeKBztx5CoM1I6d1ZmZM8 w=;
X-IronPort-AV: E=Sophos;i="5.60,358,1549929600"; d="scan'208";a="263650564"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	16 Apr 2019 15:29:52 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id x3GFTp8A000510; 
	Tue, 16 Apr 2019 15:29:52 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id B1C9CC44; Tue, 16 Apr 2019 08:29:51 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 15:29:35 +0000
Message-Id: <20190416152935.25062-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.18.1
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
Subject: [PATCH] kexec-tools: Fix compilation with clang
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
X-List-Received-Date: Tue, 16 Apr 2019 15:36:57 -0000

clang assembler do not understand some directives e.g.

../kexec-tools-2.0.17/purgatory/arch/i386/entry32-16.S:23:2: error: unknown directive
.arch i386
^ ../kexec-tools-2.0.17/purgatory/arch/i386/entry32-16.S:115:11: error: unknown token in expression
ljmp %cs:*(realdest - entry16)
^

Force external assembler for purgatory and tests.

Upstream-Status: Pending
Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 ..._64-Makefile-fix-assemble-with-clang.patch | 23 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.19.bb               |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch
new file mode 100644
index 0000000000..13f247982a
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch
@@ -0,0 +1,23 @@
+--- a/purgatory/Makefile	2019-03-05 07:47:03.190429822 -0800
++++ b/purgatory/Makefile	2019-03-05 07:42:52.167623612 -0800
+@@ -31,6 +31,9 @@ include $(srcdir)/purgatory/arch/x86_64/
+ 
+ PURGATORY_SRCS+=$($(ARCH)_PURGATORY_SRCS)
+ 
++PURGATORY_EXTRA_CFLAGS += -no-integrated-as
++$(ARCH)_PURGATORY_EXTRA_CFLAGS += -no-integrated-as
++
+ PURGATORY_OBJS = $(call objify, $(PURGATORY_SRCS)) purgatory/sha256.o
+ PURGATORY_DEPS = $(call depify, $(PURGATORY_OBJS))
+ 
+--- a/kexec_test/Makefile	2019-03-05 07:45:14.757353575 -0800
++++ b/kexec_test/Makefile	2019-03-05 07:45:57.567173264 -0800
+@@ -17,6 +17,8 @@ endif
+ 
+ ifeq ($(BUILD_KEXEC_TEST),yes)
+ 
++CPPFLAGS += -no-integrated-as
++
+ KEXEC_TEST_OBJS = $(call objify, $(KEXEC_TEST_SRCS))
+ KEXEC_TEST_DEPS = $(call depify, $(KEXEC_TEST_OBJS))
+ 
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
index f65cd9f106..c229097d5b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
@@ -20,6 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-Disable-PIE-during-link.patch \
            "
 
+SRC_URI_append_toolchain-clang = " file://0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch"
+
 SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
 SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
 
-- 
2.19.1


