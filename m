Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TQzbRSuH1kLPJG5hbA5Aj5gusa12NeDTBGpx3KZ+OrrDUFqowli8BGLlpdlYWeyL8j+rhlngdk
 FtKTajJy5Ogg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818146"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818146"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:29 -0700
IronPort-SDR: DhkOMRva+Qm4icF+JDImUZYGaUVBsOJMD8GlT0cobRkGJq5j8JJBAJ3gcBvJrePgqe5LMkjBYd
 hnoDLN9eh40Q==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067381"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 25/64] systemd: Fix build on mips/musl
Date: Mon, 26 Apr 2021 08:52:56 +0800
Message-Id: <84f452be1f6a4d1de276553815899c79a1f2cf63.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4a0d8799af0a3d1b685dd7200b545fdb2c79d64)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch | 36 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.4.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
new file mode 100644
index 0000000000..bbee6e6b28
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -0,0 +1,36 @@
+From 7b32582c066549fea0f7180a6c575e7fa37a867f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Apr 2021 23:44:53 -0700
+Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
+
+musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
+unlike glibc where these are provided by libc headers, therefore define
+them here in case they are undefined
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/missing_syscall.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 0594a1b930..495d161334 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -15,6 +15,12 @@
+ #include <asm/sgidefs.h>
+ #endif
+ 
++#ifndef _MIPS_SIM_ABI32
++#define _MIPS_SIM_ABI32		1
++#define _MIPS_SIM_NABI32	2
++#define _MIPS_SIM_ABI64		3
++#endif
++
+ #if defined(__x86_64__) && defined(__ILP32__)
+ #  define systemd_SC_arch_bias(x) ((x) | /* __X32_SYSCALL_BIT */ 0x40000000)
+ #elif defined(__ia64__)
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/systemd/systemd_247.4.bb b/meta/recipes-core/systemd/systemd_247.4.bb
index cd67e65abe..32afa159ec 100644
--- a/meta/recipes-core/systemd/systemd_247.4.bb
+++ b/meta/recipes-core/systemd/systemd_247.4.bb
@@ -55,6 +55,7 @@ SRC_URI_MUSL = "\
                file://0022-do-not-disable-buffer-in-writing-files.patch \
                file://0025-Handle-__cpu_mask-usage.patch \
                file://0026-Handle-missing-gshadow.patch \
+               file://0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.30.2

