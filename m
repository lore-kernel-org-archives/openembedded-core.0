Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8695976E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:07 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so51225677qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=g7wT100weorw8nPpu68qxM2eKXkeJ8wWUHIyZRahSK4=;
	b=dniad536h2rVKc8AiJXVV7frmWVaINvqqlZ/KiA577F1CPFTh7EWQietgMZ9WxEOQS
	hiZ/XpmKXBPza/4SUQ9KyA01aAa6jX9kJvhVIcDdu55M+jNBJjBGeZfmh6DVp2lKS7o9
	M/MMT0DaMTFlJrDtMFL/C8Jq4KxxlUCiQRnbXphJLtSiYp8g4eDy0R5NSPdKSmQxJ7KO
	SBz5R+6bRi5G18fLmBm5gAnHPqtHtd6ca/EijFhhwaeAbh4qHiJGuIia6yq8UPdtzoyr
	ibQ7pMWfr5aQx7YCtErGPiq5LcYdSMWGmrmYvVSK6wHyHiCNQ4O92XyJ7nn0cFAjX6BM
	EgVA==
X-Received: by 10.55.192.75 with SMTP id o72mr38592725qki.88.1441753688175;
	Tue, 08 Sep 2015 16:08:08 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:50 +0000
Message-Id: <613b55a1a3b527cfc1f476eeeef9c7550bbea44e.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 10/16] kexec-tools: Pass -r directly to linker
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:08 -0000

-r is understood by gcc but not by clang, anyway its a linker option so
pass it straight to linker by using -Wl explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-purgatory-Pass-r-directly-to-linker.patch | 32 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch
new file mode 100644
index 0000000..bfd077d
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch
@@ -0,0 +1,32 @@
+From a1135b3170963ba956f2364c1283864c35541295 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Sep 2015 07:59:45 +0000
+Subject: [PATCH] purgatory: Pass -r directly to linker
+
+This helps compiling with clang since -r is not a known option for clang
+where as gcc knows how to deal with it and passes it down to linker
+unfiltered
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ purgatory/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/purgatory/Makefile b/purgatory/Makefile
+index 2b5c061..b251353 100644
+--- a/purgatory/Makefile
++++ b/purgatory/Makefile
+@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+ 			-I$(shell $(CC) -print-file-name=include)
+ $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
+ 			-Wl,--no-undefined -nostartfiles -nostdlib \
+-			-nodefaultlibs -e purgatory_start -r \
++			-nodefaultlibs -e purgatory_start -Wl,-r \
+ 			-Wl,-Map=$(PURGATORY_MAP)
+ 
+ $(PURGATORY): $(PURGATORY_OBJS)
+-- 
+2.5.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
index dd7bba7..ffdb983 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-aarch64.patch \
             file://kexec-x32.patch \
             file://0002-powerpc-change-the-memory-size-limit.patch \
+            file://0001-purgatory-Pass-r-directly-to-linker.patch \
          "
 
 SRC_URI[md5sum] = "6cb4d22bcec71b6e070aa8e9d990a5e6"
-- 
2.5.1


