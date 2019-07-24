Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id F341560053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:56:13 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id az7so21531733plb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 22:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/vC0x1DcjVx0TMXP+pD45RleHGSgywjRJsAfUWROLB8=;
	b=o5HqJ196t1XcbsdXunJZQzd1/aPrU1nmg0ImT54nByAhevASSOVm+aRMKkzbUi8DnJ
	m+3VCNRGG3Tkeeue6C4FGDxXrtuP61DkTSZYZ2vHXmS7SMysx5o7ky1SeuqNiHknnxlp
	p3grhkVe4I0hijTNEC84ki0W2HoXgjaoEul10AFzTivWb5xUBe14GmGAXjZnQfa0fL89
	J39C8ZP0obwT3yXA118WWgO6P7YjAZiy0WTtokoU2rkKbQ1C4nEJxyPE9C21HuNHdLHW
	ntsA6WgjbPoBdKDbXe/A9vHRT2OBo3irTx/0kiw+LRL8YN+oXih1nlEvwnN3kuoUvlnm
	EJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/vC0x1DcjVx0TMXP+pD45RleHGSgywjRJsAfUWROLB8=;
	b=hyqkXAjkJI/gbCUcXtDsdj9IivrGA7iA0hJNzmfmFxVp/A3iT2hsLsNINp6b3kpOyF
	1Y+CvpaE9msK8uFS4GFbQMTFBio7/uQxW9cxhULGI5MmnIlNolycfthl1ZZZ11zQbRgv
	FRSynj/ww5RzwjwIbLc5N52JpG7jDHcaON9Bn0t8hwKlfnpJTnmmd91v1qQJHJSDQOgz
	yrlrgJeC9Odkfefc2x1+9XR6g+6i8Td4XlUlyLFvFVbDahXJEt7npZ9tzxMpkW/+Oopp
	4AMVkWKqYqRt9cJdEdZ+5Jdl1bNOLEOvdLstpIeILKfsVf48JKqrti3p4TWbVfo1lTuc
	K0zA==
X-Gm-Message-State: APjAAAVijzgegGat/uzfgLTd4pmj1wSHd7DWeJgcTFFDJkX6QB9TOyxy
	EO1FbAtQYNHZuLrWEbnloEEPpsrD2SU=
X-Google-Smtp-Source: APXvYqzzSRLOOmRyEjt+GMN85toRDS3hMWjLOYLhwepr4fKuOreY4lL6JIPDGX7ll2EVJKbYfmiRIw==
X-Received: by 2002:a17:902:2aa9:: with SMTP id
	j38mr80333823plb.206.1563947774498; 
	Tue, 23 Jul 2019 22:56:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c69sm55859486pje.6.2019.07.23.22.56.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 22:56:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2019 22:56:07 -0700
Message-Id: <20190724055607.30927-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] linux-libc-header: Fix ptrace.h and prctl.h conflict on aarch64
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
X-List-Received-Date: Wed, 24 Jul 2019 05:56:14 -0000
Content-Transfer-Encoding: 8bit

This is a backport from 5.2 release upstream, it fixes long standing
build failure on musl/aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 +++++++++++++++++++
 .../linux-libc-headers_5.0.bb                 |  1 +
 ...ttribute-alias-with-Wattribute-alias.patch | 43 +++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-Replace-Wattribute-alias-with-Wattribute-alias.patch

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
diff --git a/meta/recipes-kernel/linux/files/0001-Replace-Wattribute-alias-with-Wattribute-alias.patch b/meta/recipes-kernel/linux/files/0001-Replace-Wattribute-alias-with-Wattribute-alias.patch
new file mode 100644
index 0000000000..b41b277bb4
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-Replace-Wattribute-alias-with-Wattribute-alias.patch
@@ -0,0 +1,43 @@
+From 229c673813b7dff90f82f1062724319dfeb6861a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Dec 2018 15:57:35 -0800
+Subject: [PATCH] Replace "-Wattribute-alias" with "-Wattribute-alias="
+
+makes gcc9 happy but makes gcc8 sad :(
+I guess I cant end world hunger
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/linux/compat.h   | 2 +-
+ include/linux/syscalls.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/linux/compat.h b/include/linux/compat.h
+index de0c13bdcd2c..95d1192da1f5 100644
+--- a/include/linux/compat.h
++++ b/include/linux/compat.h
+@@ -73,7 +73,7 @@
+ #ifndef COMPAT_SYSCALL_DEFINEx
+ #define COMPAT_SYSCALL_DEFINEx(x, name, ...)					\
+ 	__diag_push();								\
+-	__diag_ignore(GCC, 8, "-Wattribute-alias",				\
++	__diag_ignore(GCC, 8, "-Wattribute-alias=",				\
+ 		      "Type aliasing is used to sanitize syscall arguments");\
+ 	asmlinkage long compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
+ 	asmlinkage long compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
+diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
+index 2ff814c92f7f..58f761d2c9e9 100644
+--- a/include/linux/syscalls.h
++++ b/include/linux/syscalls.h
+@@ -234,7 +234,7 @@ static inline int is_syscall_trace_event(struct trace_event_call *tp_event)
+ #ifndef __SYSCALL_DEFINEx
+ #define __SYSCALL_DEFINEx(x, name, ...)					\
+ 	__diag_push();							\
+-	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
++	__diag_ignore(GCC, 8, "-Wattribute-alias=",			\
+ 		      "Type aliasing is used to sanitize syscall arguments");\
+ 	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
+ 		__attribute__((alias(__stringify(__se_sys##name))));	\
+-- 
+2.20.1
+
-- 
2.22.0


