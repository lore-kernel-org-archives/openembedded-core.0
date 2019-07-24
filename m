Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C50B67F06E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:56:24 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c14so21553301plo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OpwkLFlWENJprBx2bTEQsFO7yPpUqzbYn9jHi+ysb4o=;
	b=OMTUkcNa6/wWswiS3UcF6xGuiy+3P14P71/714jUhukiBsesZFQE85xCPsRdADgVc1
	MprzAQX4OKLqg68HFQc2xo0LZjp9XCv2pPwnMxCcq5fByWY16I1TNyJKFsf685f4UFD/
	znQ1XcBrodylKWVBGYRctA2tzOhNHBcpcWHXFmhNwxlafTg3gqh4nAFQ7gXsPGxw3eZs
	ThRRAKaW+nG5QZL8xCqW2YPJt409G54egRNS4OKPJxZwYVQy5jdalVLMSicEFGZVnUnZ
	XvnWv3/nuvj1Z1LOxpwA73Vl/aS6BsT2sBdIqQC2gU1NtUQ0is+fFZbitw3COWkN6Xc1
	+31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OpwkLFlWENJprBx2bTEQsFO7yPpUqzbYn9jHi+ysb4o=;
	b=C3bySQgcY/gSADW3zG1bqetvoeZ2Ovc58/sojCKMozzPyGfIU4sB9g1kaAsH6HRHGu
	fy8QY85UtB0LTAK/AoDdR9Pg5s9xUvgmTuV104+QYP5MG/Q85miKuyg34GxZweSMEGla
	nZISX19qu/LR/tK5cs583QQpm0F0VoGoaNeRTqtBEcyp/5Ju4OGdwIjghnkYHxl8Yrss
	+owc65NBR/8MG0xmUJzVXffHuE3Vy/3nubxBa8c0BSZo5bJXgUot7t3qy0OVTHF2BKyP
	FNdP3KfvSjshg9EWbD0Ql+7nyMrHahIpc0QV5h4FG4nVPym90i28yBtN+tDHl7qN7PJb
	dZxA==
X-Gm-Message-State: APjAAAWG6e7ZKffe9MIem5WAVBCNnvMnqYf06GqH/bD5m5zD2ZwuOMwL
	VV5h9nkOT5QlOHJ4wxfkMhA2cJGGrz0=
X-Google-Smtp-Source: APXvYqz9LZ4XW9tpq0KGYncuqr+cckaf5GVa1wiFCKQWJKKNPVldtxondRcddj2TImqPV2/M/Opezg==
X-Received: by 2002:a17:902:100a:: with SMTP id
	b10mr43982368pla.338.1563951385389; 
	Tue, 23 Jul 2019 23:56:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	x22sm49791645pff.5.2019.07.23.23.56.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 23:56:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2019 23:56:15 -0700
Message-Id: <20190724065615.13704-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V2] linux-libc-header: Fix ptrace.h and prctl.h conflict on aarch64
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
X-List-Received-Date: Wed, 24 Jul 2019 06:56:24 -0000
Content-Transfer-Encoding: 8bit

This is a backport from 5.2 release upstream, it fixes long standing
build failure on musl/aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop unused patch

 ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 +++++++++++++++++++
 .../linux-libc-headers_5.0.bb                 |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
new file mode 100644
index 0000000000..5ea46e9590
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
@@ -0,0 +1,62 @@
+From 35341ca0614ab13e1ef34ad4f29a39e15ef31fa8 Mon Sep 17 00:00:00 2001
+From: Anisse Astier <aastier@freebox.fr>
+Date: Mon, 17 Jun 2019 15:22:22 +0200
+Subject: [PATCH] arm64/sve: <uapi/asm/ptrace.h> should not depend on
+ <uapi/linux/prctl.h>
+
+Pulling linux/prctl.h into asm/ptrace.h in the arm64 UAPI headers causes
+userspace build issues for any program (e.g. strace and qemu) that
+includes both <sys/prctl.h> and <linux/ptrace.h> when using musl libc:
+
+  | error: redefinition of 'struct prctl_mm_map'
+  |  struct prctl_mm_map {
+
+See https://github.com/foundriesio/meta-lmp/commit/6d4a106e191b5d79c41b9ac78fd321316d3013c0
+for a public example of people working around this issue.
+
+Although it's a bit grotty, fix this breakage by duplicating the prctl
+constant definitions. Since these are part of the kernel ABI, they
+cannot be changed in future and so it's not the end of the world to have
+them open-coded.
+
+Fixes: 43d4da2c45b2 ("arm64/sve: ptrace and ELF coredump support")
+
+Upstream-Status: Backport [https://github.com/torvalds/linux/commit/35341ca0614ab13e1ef34ad4f29a39e15ef31fa8]
+Cc: stable@vger.kernel.org
+Acked-by: Dave Martin <Dave.Martin@arm.com>
+Signed-off-by: Anisse Astier <aastier@freebox.fr>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+---
+ arch/arm64/include/uapi/asm/ptrace.h | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
+index 97c53203150b..e932284993d4 100644
+--- a/arch/arm64/include/uapi/asm/ptrace.h
++++ b/arch/arm64/include/uapi/asm/ptrace.h
+@@ -65,8 +65,6 @@
+ 
+ #ifndef __ASSEMBLY__
+ 
+-#include <linux/prctl.h>
+-
+ /*
+  * User structures for general purpose, floating point and debug registers.
+  */
+@@ -113,10 +111,10 @@ struct user_sve_header {
+ 
+ /*
+  * Common SVE_PT_* flags:
+- * These must be kept in sync with prctl interface in <linux/ptrace.h>
++ * These must be kept in sync with prctl interface in <linux/prctl.h>
+  */
+-#define SVE_PT_VL_INHERIT		(PR_SVE_VL_INHERIT >> 16)
+-#define SVE_PT_VL_ONEXEC		(PR_SVE_SET_VL_ONEXEC >> 16)
++#define SVE_PT_VL_INHERIT		((1 << 17) /* PR_SVE_VL_INHERIT */ >> 16)
++#define SVE_PT_VL_ONEXEC		((1 << 18) /* PR_SVE_SET_VL_ONEXEC */ >> 16)
+ 
+ 
+ /*
+-- 
+2.22.0
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
index e76120c5b8..473688d95f 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
@@ -12,6 +12,7 @@ SRC_URI_append_libc-musl = "\
 SRC_URI_append = "\
     file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
+    file://0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch \
 "
 
 SRC_URI[md5sum] = "7381ce8aac80a01448e065ce795c19c0"
-- 
2.22.0


