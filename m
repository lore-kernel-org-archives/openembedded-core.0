Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (unknown [209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2F36FC56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:25 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so12307372pab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TmFomTcCTbJP39fuQbuz2lUUCKN34F9l+QeApEKsXSA=;
	b=NDqR2viR2+e7zVfwNDkgq22ENoK8i7DnJEZBAJziDZcjZGj8qab24UXXOJGmusXCRS
	Tpm7dmKW4lKAFa4nq60+zX/olPbsEpazezRKBbOPs369TIuYWK0e0yyEic/qgBFNOsUg
	CiF+UfPlb4mr7jxFaUiAzFQ3MNbyd3YxphA6RTaT9U7Pc+lD8HEXS6ChNZUys/x+l+tg
	rbPzt8Z7UrrwDaO3cGw3Y178mef3bcoybjAPs1qH4WiXD9PkcGYy9QYOxKfi0x0r1S7a
	q2nO3mbYXLEnVXXH0YRpvMiTPEcGpM84fqAarPXc3/DW9Ks0p5z5QjUTk3HB9OMtYfSN
	RfAg==
X-Received: by 10.66.232.166 with SMTP id tp6mr5899990pac.127.1401346707002;
	Wed, 28 May 2014 23:58:27 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:01 -0700
Message-Id: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] siteinfo, insane: Recognize musl specific triplets
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
X-List-Received-Date: Thu, 29 May 2014 06:58:26 -0000

We will use '-musl' to identify musl based systems
this patch lays the foundation for recognising those
and map them to internal variable representations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass   | 21 +++++++++++++++++
 meta/classes/siteinfo.bbclass | 13 +++++++++++
 meta/site/common-musl         | 52 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 meta/site/common-musl

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ce3364..c8fa711 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -98,6 +98,20 @@ def package_qa_get_machine_dict():
                         "sh4":        (42,       0,    0,          True,          32),
 
                       },
+            "linux-musl" : { 
+                        "arm" :       (  40,    97,    0,          True,          32),
+                        "armeb":      (  40,    97,    0,          False,         32),
+                        "powerpc":    (  20,     0,    0,          False,         32),
+                        "i386":       (   3,     0,    0,          True,          32),
+                        "i486":       (   3,     0,    0,          True,          32),
+                        "i586":       (   3,     0,    0,          True,          32),
+                        "i686":       (   3,     0,    0,          True,          32),
+                        "x86_64":     (  62,     0,    0,          True,          64),
+                        "mips":       (   8,     0,    0,          False,         32),
+                        "mipsel":     (   8,     0,    0,          True,          32),
+                        "mips64":     (   8,     0,    0,          False,         64),
+                        "mips64el":   (   8,     0,    0,          True,          64),
+                      },
             "uclinux-uclibc" : {
                         "bfin":       ( 106,     0,    0,          True,         32),
                       }, 
@@ -105,6 +119,10 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
                       },
+            "linux-musleabi" : {
+                        "arm" :       (40,     0,    0,          True,          32),
+                        "armeb" :     (40,     0,    0,          False,         32),
+                      },
             "linux-uclibceabi" : {
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
@@ -112,6 +130,9 @@ def package_qa_get_machine_dict():
             "linux-gnuspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
+            "linux-muslspe" : {
+                        "powerpc":    (20,     0,    0,          False,         32),
+                      },
             "linux-uclibcspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 9ae2561..e90632a 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -58,6 +58,9 @@ def siteinfo_data(d):
         "linux-uclibc": "common-linux common-uclibc",
         "linux-uclibceabi": "common-linux common-uclibc",
         "linux-uclibcspe": "common-linux common-uclibc",
+        "linux-musl": "common-linux common-musl",
+        "linux-musleabi": "common-linux common-musl",
+        "linux-muslspe": "common-linux common-musl",
         "uclinux-uclibc": "common-uclibc",
         "cygwin": "common-cygwin",
         "mingw32": "common-mingw",
@@ -66,21 +69,31 @@ def siteinfo_data(d):
         "aarch64-linux-gnu": "aarch64-linux",
         "aarch64_be-linux-gnu": "aarch64_be-linux",
         "arm-linux-gnueabi": "arm-linux",
+        "arm-linux-musleabi": "arm-linux",
         "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
+        "armeb-linux-musleabi": "armeb-linux",
+        "mips-linux-musl": "mips-linux",
+        "mipsel-linux-musl": "mipsel-linux",
+        "mips64-linux-musl": "mips-linux",
+        "mips64el-linux-musl": "mipsel-linux",
         "mips64-linux-gnun32": "mips-linux bit-32",
         "mips64el-linux-gnun32": "mipsel-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
+        "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
         "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
         "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
+        "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
         "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
+        "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux": "powerpc-linux",
         "x86_64-cygwin": "bit-64",
         "x86_64-darwin": "bit-64",
         "x86_64-darwin9": "bit-64",
         "x86_64-linux": "bit-64",
+        "x86_64-linux-musl": "x86_64-linux bit-64",
         "x86_64-linux-uclibc": "bit-64",
         "x86_64-linux-gnu": "bit-64 x86_64-linux",
         "x86_64-linux-gnux32": "bit-32 ix86-common x32-linux",
diff --git a/meta/site/common-musl b/meta/site/common-musl
new file mode 100644
index 0000000..26fc103
--- /dev/null
+++ b/meta/site/common-musl
@@ -0,0 +1,52 @@
+# general
+ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
+ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
+ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# glib
+glib_cv_strlcpy=${glib_cv_strlcpy=no}
+ac_cv_func_printf_unix98=${ac_cv_func_printf_unix98=yes}
+ac_cv_func_snprintf_c99=${ac_cv_func_snprintf_c99=yes}
+ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
+glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
+
+#dbus-glib
+ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
+
+# bash
+bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
+bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
+
+# coreutils
+fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
+gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
+gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
+ac_cv_func_posix_spawn=${ac_cv_func_posix_spawn=yes}
+ac_cv_func_posix_spawn_works=${ac_cv_func_posix_spawn_works=yes}
+
+# va_copy and _va_copy
+ac_cv_va_copy=${ac_cv_va_copy=yes}
+ac_cv___va_copy=${ac_cv___va_copy=yes}
+ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
+ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
+
+# posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# Xorg
+xorg_cv_malloc0_returns_null=${xorg_cv_malloc0_returns_null=yes}
-- 
1.9.3


