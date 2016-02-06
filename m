Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id D2F8E77087
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:10 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yy13so4044194pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=WmmDV9+1dY/LsNtpihjB1GmMNC015AWZw7tJg3jaM4Y=;
	b=PCS/nTdalZz5G1HIeeagVbYfNu19Tia3djR44m1+kvYUccM0R942PoUnnRYHXsPz+d
	PaMF4CVOlhWZmALKKIrBYAkXU8rd8EsR6yEAtNNRvI8ESyjoXPhOTcf5yYYHe9SGwbFB
	P7Gfx4liyBZXiaOnZXgqb1tgMiWP+nubBadSKiiAbKhTD2Jfa5o6vfF9h9yZf2M2CCl1
	I4Algy9bOztS98L67mrv34SF9xJ4b98BIGL9yz9MRDVgnQDFQv0zHC6vMMwCQhraiOE+
	cidUw61GIJqz6GrX7xUZstqovhkvd11dojibOCFrHT+VZ6WULav5kjR/xIhZTLA2oMzV
	uBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WmmDV9+1dY/LsNtpihjB1GmMNC015AWZw7tJg3jaM4Y=;
	b=cNua+qnOFUph/fEGOOwMbFK4o6Q0ryx4YNTJ2YJM2CeUTf+7/l47cUrJSfXiAB8htA
	boWZYKeedp0/nIEepW5OpWzSDfaUDxSz3CyQ4GlJgjYq8iw45NWDRmkMasKjgbRY77Ij
	kern+I+5t2aU7rKdCOkwuRvTcpvcGVehmUzXmHYFEi/odYFANR/qfQcBmw0JZHnsiv6A
	zKRYqDKsO1D4SHKNNmgGHkKfpEQNRecgt9y2jtRkOJ7tK+tvl2iIVERN4h98ysifY6n0
	jVPi3eLcdRPljN5RHzh+WIqSr4mRM4KHJLUq3G4nYTfa7ml0Lgiw1j+wmCth67L8AdXl
	EwrQ==
X-Gm-Message-State: AG10YOSGNnk+AyFNgufrRYN3eUud1b2fQJCunJmkI/fZBWIIAMS8bN/n1DOH7HMmaEcRLg==
X-Received: by 10.66.164.196 with SMTP id ys4mr30756307pab.119.1454800511824; 
	Sat, 06 Feb 2016 15:15:11 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:42 -0800
Message-Id: <b375d4c7f508e324f8efa501c7537495b20bf1cf.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 01/21] glibc: CVE-2015-8777
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:11 -0000

From: Armin Kuster <akuster@mvista.com>

The process_envvars function in elf/rtld.c in the GNU C Library (aka glibc or
libc6) before 2.23 allows local users to bypass a pointer-guarding protection
mechanism via a zero value of the LD_POINTER_GUARD environment variable.

(From OE-Core rev: 22570ba08d7c6157aec58764c73b1134405b0252)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch | 122 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb             |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
new file mode 100644
index 0000000..9b9ab3b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
@@ -0,0 +1,122 @@
+From a014cecd82b71b70a6a843e250e06b541ad524f7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 15 Oct 2015 09:23:07 +0200
+Subject: [PATCH] Always enable pointer guard [BZ #18928]
+
+Honoring the LD_POINTER_GUARD environment variable in AT_SECURE mode
+has security implications.  This commit enables pointer guard
+unconditionally, and the environment variable is now ignored.
+
+        [BZ #18928]
+        * sysdeps/generic/ldsodefs.h (struct rtld_global_ro): Remove
+        _dl_pointer_guard member.
+        * elf/rtld.c (_rtld_global_ro): Remove _dl_pointer_guard
+        initializer.
+        (security_init): Always set up pointer guard.
+        (process_envvars): Do not process LD_POINTER_GUARD.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8777
+[Yocto # 8980]
+
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=a014cecd82b71b70a6a843e250e06b541ad524f7
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog                  | 10 ++++++++++
+ NEWS                       | 13 ++++++++-----
+ elf/rtld.c                 | 15 ++++-----------
+ sysdeps/generic/ldsodefs.h |  3 ---
+ 4 files changed, 22 insertions(+), 19 deletions(-)
+
+Index: git/elf/rtld.c
+===================================================================
+--- git.orig/elf/rtld.c
++++ git/elf/rtld.c
+@@ -163,7 +163,6 @@ struct rtld_global_ro _rtld_global_ro at
+     ._dl_hwcap_mask = HWCAP_IMPORTANT,
+     ._dl_lazy = 1,
+     ._dl_fpu_control = _FPU_DEFAULT,
+-    ._dl_pointer_guard = 1,
+     ._dl_pagesize = EXEC_PAGESIZE,
+     ._dl_inhibit_cache = 0,
+ 
+@@ -710,15 +709,12 @@ security_init (void)
+ #endif
+ 
+   /* Set up the pointer guard as well, if necessary.  */
+-  if (GLRO(dl_pointer_guard))
+-    {
+-      uintptr_t pointer_chk_guard = _dl_setup_pointer_guard (_dl_random,
+-							     stack_chk_guard);
++  uintptr_t pointer_chk_guard
++    = _dl_setup_pointer_guard (_dl_random, stack_chk_guard);
+ #ifdef THREAD_SET_POINTER_GUARD
+-      THREAD_SET_POINTER_GUARD (pointer_chk_guard);
++  THREAD_SET_POINTER_GUARD (pointer_chk_guard);
+ #endif
+-      __pointer_chk_guard_local = pointer_chk_guard;
+-    }
++  __pointer_chk_guard_local = pointer_chk_guard;
+ 
+   /* We do not need the _dl_random value anymore.  The less
+      information we leave behind, the better, so clear the
+@@ -2478,9 +2474,6 @@ process_envvars (enum mode *modep)
+ 	      GLRO(dl_use_load_bias) = envline[14] == '1' ? -1 : 0;
+ 	      break;
+ 	    }
+-
+-	  if (memcmp (envline, "POINTER_GUARD", 13) == 0)
+-	    GLRO(dl_pointer_guard) = envline[14] != '0';
+ 	  break;
+ 
+ 	case 14:
+Index: git/sysdeps/generic/ldsodefs.h
+===================================================================
+--- git.orig/sysdeps/generic/ldsodefs.h
++++ git/sysdeps/generic/ldsodefs.h
+@@ -590,9 +590,6 @@ struct rtld_global_ro
+   /* List of auditing interfaces.  */
+   struct audit_ifaces *_dl_audit;
+   unsigned int _dl_naudit;
+-
+-  /* 0 if internal pointer values should not be guarded, 1 if they should.  */
+-  EXTERN int _dl_pointer_guard;
+ };
+ # define __rtld_global_attribute__
+ # if IS_IN (rtld)
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,13 @@
++2015-10-15  Florian Weimer  <fweimer@redhat.com>
++
++   [BZ #18928]
++   * sysdeps/generic/ldsodefs.h (struct rtld_global_ro): Remove
++   _dl_pointer_guard member.
++   * elf/rtld.c (_rtld_global_ro): Remove _dl_pointer_guard
++   initializer.
++   (security_init): Always set up pointer guard.
++   (process_envvars): Do not process LD_POINTER_GUARD.
++
+ 2015-02-06  Carlos O'Donell  <carlos@systemhalted.org>
+ 
+ 	* version.h (RELEASE): Set to "stable".
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -19,7 +19,10 @@ Version 2.21
+   17722, 17723, 17724, 17725, 17732, 17733, 17744, 17745, 17746, 17747,
+   17748, 17775, 17777, 17780, 17781, 17782, 17791, 17793, 17796, 17797,
+   17801, 17803, 17806, 17834, 17844, 17848, 17868, 17869, 17870, 17885,
+-  17892.
++  17892, 18928.
++
++* The LD_POINTER_GUARD environment variable can no longer be used to
++  disable the pointer guard feature.  It is always enabled.
+ 
+ * CVE-2015-1472 Under certain conditions wscanf can allocate too little
+   memory for the to-be-scanned arguments and overflow the allocated
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 3bba734..efbcc9c 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -48,6 +48,7 @@ EGLIBCPATCHES = "\
 #
 CVEPATCHES = "\
         file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
+        file://CVE-2015-8777.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-- 
2.3.5


