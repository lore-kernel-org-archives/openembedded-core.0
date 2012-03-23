Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAupz-0005QM-CL
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 04:06:47 +0100
Received: by pbcum15 with SMTP id um15so1938885pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 19:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JLMLWKGnrcYriw9SjNEpOFyPBo5lktuoKPaaJwFAgnc=;
	b=QvBcLG5cPhdqj39x8leVett9s9gQD3Cj9+3wkBF5ncdKI9lZQUkPcAzLPWeLrnARls
	l91TFssZbDKDU1DHe3vxVJNn0rlCiW/nBKDi+u7dyK6RaJ9+ipQJjPuOywxQMpcBY5OG
	ImL20pyNCAIvs5hyheuD0cRgnCH9/aCHoIfqB2ASo1kI4yt3ueYRDRm9GKHUJK8tD+/5
	8oUUH8pF0f5by9WlPEEiIoIMhF5KEbC4onmw/2kzkGvpihzbQ9XhPgE4Kp9/yIH5GPEp
	ni+1sDVILDq3Gq1/LzZv7PyobwSJBYS51BkqkCP4KvRukwfGhc6olT7dc40pG89n2oP6
	mL0g==
Received: by 10.68.193.231 with SMTP id hr7mr4492992pbc.44.1332471470554;
	Thu, 22 Mar 2012 19:57:50 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id l8sm4831403pbd.62.2012.03.22.19.57.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 19:57:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 19:56:57 -0700
Message-Id: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/2] eglibc-2.15: Update SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 03:06:47 -0000

Get new patches and remove the one that got merged upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ++++++++++++++++++++
 .../eglibc-2.15/armv4-eabi-compile-fix.patch       |   25 -----
 .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 ++++
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    5 +-
 4 files changed, 131 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch b/meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch
new file mode 100644
index 0000000..b899562
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch
@@ -0,0 +1,108 @@
+Its controlled by __OPTION_EGLIBC_RTLD_DEBUG
+so we should use GLRO_dl_debug_mask
+
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: libc/elf/dl-open.c
+===================================================================
+--- libc.orig/elf/dl-open.c	2012-03-09 08:54:34.691443995 -0800
++++ libc/elf/dl-open.c	2012-03-09 08:55:31.275446730 -0800
+@@ -154,7 +154,7 @@
+ 	  ns->_ns_main_searchlist->r_list[new_nlist++] = map;
+ 
+ 	  /* We modify the global scope.  Report this.  */
+-	  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++	  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+ 	    _dl_debug_printf ("\nadd %s [%lu] to global scope\n",
+ 			      map->l_name, map->l_ns);
+ 	}
+@@ -294,7 +294,7 @@
+   _dl_debug_state ();
+ 
+   /* Print scope information.  */
+-  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+     _dl_show_scope (new, 0);
+ 
+   /* Only do lazy relocation if `LD_BIND_NOW' is not set.  */
+@@ -438,7 +438,7 @@
+ 	}
+ 
+       /* Print scope information.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+ 	_dl_show_scope (imap, from_scope);
+     }
+ 
+Index: libc/ports/sysdeps/mips/dl-lookup.c
+===================================================================
+--- libc.orig/ports/sysdeps/mips/dl-lookup.c	2012-03-09 08:54:34.707443996 -0800
++++ libc/ports/sysdeps/mips/dl-lookup.c	2012-03-09 09:02:36.903467324 -0800
+@@ -111,7 +111,7 @@
+ 	continue;
+ 
+       /* Print some debugging info if wanted.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SYMBOLS, 0))
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SYMBOLS, 0))
+ 	_dl_debug_printf ("symbol=%s;  lookup in file=%s [%lu]\n",
+ 			  undef_name,
+ 			  map->l_name[0] ? map->l_name : rtld_progname,
+@@ -432,7 +432,7 @@
+ 		     hash table.  */
+ 		  if (__builtin_expect (tab->size, 0))
+ 		    {
+-		      assert (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK);
++		      assert (GLRO_dl_debug_mask & DL_DEBUG_PRELINK);
+ 		      __rtld_lock_unlock_recursive (tab->lock);
+ 		      goto success;
+ 		    }
+@@ -681,7 +681,7 @@
+ 	}
+ 
+       /* Display information if we are debugging.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_FILES, 0))
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_FILES, 0))
+ 	_dl_debug_printf ("\
+ \nfile=%s [%lu];  needed by %s [%lu] (relocation dependency)\n\n",
+ 			  map->l_name[0] ? map->l_name : rtld_progname,
+@@ -860,7 +860,7 @@
+   if (__builtin_expect (current_value.m->l_used == 0, 0))
+     current_value.m->l_used = 1;
+ 
+-  if (__builtin_expect (GLRO(dl_debug_mask)
++  if (__builtin_expect (GLRO_dl_debug_mask
+ 			& (DL_DEBUG_BINDINGS|DL_DEBUG_PRELINK), 0))
+     _dl_debug_bindings (undef_name, undef_map, ref,
+ 			&current_value, version, type_class, protected);
+@@ -925,7 +925,7 @@
+ {
+   const char *reference_name = undef_map->l_name;
+ 
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_BINDINGS)
++  if (GLRO_dl_debug_mask & DL_DEBUG_BINDINGS)
+     {
+       _dl_debug_printf ("binding file %s [%lu] to %s [%lu]: %s symbol `%s'",
+ 			(reference_name[0]
+@@ -941,7 +941,7 @@
+ 	_dl_debug_printf_c ("\n");
+     }
+ #ifdef SHARED
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
++  if (GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
+     {
+       int conflict = 0;
+       struct sym_val val = { NULL, NULL };
+Index: libc/elf/rtld.c
+===================================================================
+--- libc.orig/elf/rtld.c	2012-03-09 09:01:35.159464344 -0800
++++ libc/elf/rtld.c	2012-03-09 09:01:56.247465364 -0800
+@@ -2198,7 +2198,7 @@
+   GLRO(dl_init_all_dirs) = GL(dl_all_dirs);
+ 
+   /* Print scope information.  */
+-  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+     {
+       _dl_debug_printf ("\nInitial object scopes\n");
+ 
diff --git a/meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.patch b/meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.patch
deleted file mode 100644
index c2407ee..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Source: http://sourceware.org/bugzilla/show_bug.cgi?id=12097
-Upstream-Status: Submitted
-
-The patch should be merged into glibc-ports
-
--Khem
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-@@ -16,6 +16,8 @@
-    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-    02111-1307 USA.  */
- 
-+#if defined(__thumb__)
-+
- #include <sysdep.h>
- 
- /* Out-of-line syscall stub.  We expect the system call number in ip
-@@ -41,3 +43,5 @@ ENTRY (__libc_do_syscall)
- 	pop	{r7, pc}
- 	.fnend
- END (__libc_do_syscall)
-+
-+#endif /* __thumb__ */
diff --git a/meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys.patch b/meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys.patch
new file mode 100644
index 0000000..be29856
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys.patch
@@ -0,0 +1,20 @@
+This is needed since initgroups belongs to NET group
+so when NET is disabled in eglibc build then it reports
+as undefined symbol
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libc/nss/getent.c
+===================================================================
+--- libc.orig/nss/getent.c	2012-03-09 09:41:57.099581559 -0800
++++ libc/nss/getent.c	2012-03-09 09:42:13.095582334 -0800
+@@ -898,7 +898,7 @@
+ D(group)
+ D(gshadow)
+ DN(hosts)
+-D(initgroups)
++DN(initgroups)
+ DN(netgroup)
+ DN(networks)
+ D(passwd)
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 3820f5a..5b727c6 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "16540"
+SRCREV = "17386"
 
 DEPENDS += "gperf-native"
 PR = "r1"
@@ -12,7 +12,6 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
            file://stack-protector-test.patch \
-           file://armv4-eabi-compile-fix.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://ppc-sqrt.patch \
@@ -22,6 +21,8 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://use-sysroot-cxx-headers.patch \
            file://x86_fenv.patch \
            file://ppc-sqrt_finite.patch \
+           file://GLRO_dl_debug_mask.patch \
+           file://initgroups_keys.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.5.4



