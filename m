Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.1036.1589221697733308460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 11:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tpX8Y7ZX;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id x15so4526102pfa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+XJXewsbvE6dWoU+GFMRGA1fgzo0Y0hiGncSaujm9o=;
        b=tpX8Y7ZX18mKI+H6jj/jmpsh+MX3tIHrI8NNcHMxjMiXCa7YnHhiZdp4jxrq/d1ioh
         eTgGG2SRv1AfkDh0UCo3q/483LtI82w+9q9ibewpDQkZSQQ/zW8+5L0yFzBIUBrHbXzT
         ErWailYASAxxwH7pggXT3mpS+ZMWX5Atl0mhBs3iKImnM1jGp0Imp+0f0hsuuOhTQGrM
         vNkvBgLwIsgCh4wGf0LPToNCxd8zIJIEMzob8lT5LA+F/fSp1biVXNCcYoinpWmpZVA1
         ZxdcBouUeZbnzMDWJH4byHE25dnmuWgXKtcfJ9/7OftgO+G4GCjRQaNarcWrjB2ygcsE
         o+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+XJXewsbvE6dWoU+GFMRGA1fgzo0Y0hiGncSaujm9o=;
        b=IQgqCIpuSfh0chPnWxvGC16Ic+Rugz9nQWRol2VOef5VcCyHzMMImNDdIN2MpZMUhO
         ju9atLo/+7wDEF7FBWhQ25GIWBp3HDJYEfQAHyFD80ONamsv7p+RUfwClzf8425txG7n
         O1kVxIn19J/6Y8oOGsVQYtOLUiHT5N/5GT56FwMiDlCS7Isf/t7CCQRY49TV3HysRzxY
         K9rzJNcEZlG1UjuDB0dxP8bAP9Myc+HiBA7EXL5M3/SkovIoLEDfadRHBvrp0V3Bw52X
         5AVB86k8F4JQqFAizwDsQ0LZikFDVl8UBoyhTmMxh5fGmkpvnf48iuuBKtPNDnk6secj
         NgTA==
X-Gm-Message-State: AGi0PuaFezL7BzIuJLRGyo15N109/hWe71PS8ellzezBhtQajNcaSuII
	204rFRlnn61auL4UQzfffWxvDFTytHg=
X-Google-Smtp-Source: APiQypJeSwu2T98NSb5DVkPUo086smmfOenQwbWi0+cRqKUK+FUu0QKr5iE0195YVNbHtLHC/Mxfqw==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr14445872pgj.2.1589221696817;
        Mon, 11 May 2020 11:28:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id f30sm11044062pje.29.2020.05.11.11.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:28:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Date: Mon, 11 May 2020 11:28:12 -0700
Message-Id: <20200511182812.441561-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511182812.441561-1-raj.khem@gmail.com>
References: <20200511182812.441561-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was added recently, but it seems be chewing more than what it
should and causes non glibc packages also depend on it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.1.inc        |  1 +
 ...se-__getauxval-instead-of-getauxval-.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
index 4f383900cf..7d0f17cc10 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
            file://0037-libstdc-v3-Include-system_error-for-std-errc.patch \
+           file://0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch \
 "
 SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
 
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch b/meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch
new file mode 100644
index 0000000000..fc9228277a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch
@@ -0,0 +1,47 @@
+From 2101fb718935c7cf1cc2ad201bdeb1e635b54b0a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 May 2020 11:03:41 -0700
+Subject: [PATCH] Revert "[AArch64] Use __getauxval instead of getauxval in LSE
+ detection code in libgcc"
+
+This reverts commit 5a57016dd2758cc63a544f191f77635342397a72.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgcc/config/aarch64/lse-init.c | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/libgcc/config/aarch64/lse-init.c b/libgcc/config/aarch64/lse-init.c
+index 00e9ab8cd1c..74acef25cce 100644
+--- a/libgcc/config/aarch64/lse-init.c
++++ b/libgcc/config/aarch64/lse-init.c
+@@ -29,20 +29,19 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ _Bool __aarch64_have_lse_atomics
+   __attribute__((visibility("hidden"), nocommon));
+ 
+-/* Gate availability of __getauxval on glibc.  All AArch64-supporting glibc
+-   versions support it.  */
+-#ifdef __gnu_linux__
++/* Disable initialization of __aarch64_have_lse_atomics during bootstrap.  */
++#if !defined(inhibit_libc) && defined(HAVE_SYS_AUXV_H)
++# include <sys/auxv.h>
+ 
+-# define AT_HWCAP	16
+-# define HWCAP_ATOMICS	(1 << 8)
+-
+-unsigned long int __getauxval (unsigned long int);
++/* Disable initialization if the system headers are too old.  */
++# if defined(AT_HWCAP) && defined(HWCAP_ATOMICS)
+ 
+ static void __attribute__((constructor))
+ init_have_lse_atomics (void)
+ {
+-  unsigned long hwcap = __getauxval (AT_HWCAP);
++  unsigned long hwcap = getauxval (AT_HWCAP);
+   __aarch64_have_lse_atomics = (hwcap & HWCAP_ATOMICS) != 0;
+ }
+ 
+-#endif /* __gnu_linux__  */
++# endif /* HWCAP */
++#endif /* inhibit_libc */
-- 
2.26.2

