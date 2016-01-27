Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B60BD77117
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 09:35:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0R9ZSDl002560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 01:35:28 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 01:35:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 01:35:21 -0800
Message-ID: <75cae9ea3daad04e282b37f1c4c678ae311be36d.1453877220.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453877220.git.liezhi.yang@windriver.com>
References: <cover.1453877220.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] glibc: CVE-2015-8777.patch
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
X-List-Received-Date: Wed, 27 Jan 2016 09:35:31 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

The process_envvars function in elf/rtld.c in the GNU C Library (aka glibc or
libc6) before 2.23 allows local users to bypass a pointer-guarding protection
mechanism via a zero value of the LD_POINTER_GUARD environment variable.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch |  123 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb             |    1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
new file mode 100644
index 0000000..eeab72d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
@@ -0,0 +1,123 @@
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
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,14 @@
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
++
+ 2015-08-10  Maxim Ostapenko  <m.ostapenko@partner.samsung.com>
+ 
+ 	[BZ #18778]
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -34,7 +34,10 @@ Version 2.22
+   18533, 18534, 18536, 18539, 18540, 18542, 18544, 18545, 18546, 18547,
+   18549, 18553, 18557, 18558, 18569, 18583, 18585, 18586, 18592, 18593,
+   18594, 18602, 18612, 18613, 18619, 18633, 18635, 18641, 18643, 18648,
+-  18657, 18676, 18694, 18696.
++  18657, 18676, 18694, 18696, 18928.
++
++* The LD_POINTER_GUARD environment variable can no longer be used to
++  disable the pointer guard feature.  It is always enabled.
+ 
+ * Cache information can be queried via sysconf() function on s390 e.g. with
+   _SC_LEVEL1_ICACHE_SIZE as argument.
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
+@@ -600,9 +600,6 @@ struct rtld_global_ro
+   /* List of auditing interfaces.  */
+   struct audit_ifaces *_dl_audit;
+   unsigned int _dl_naudit;
+-
+-  /* 0 if internal pointer values should not be guarded, 1 if they should.  */
+-  EXTERN int _dl_pointer_guard;
+ };
+ # define __rtld_global_attribute__
+ # if IS_IN (rtld)
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index c1f6b4e..8348313 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://nscd-no-bash.patch \
            file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
            file://0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch \
+           file://CVE-2015-8777.patch \
 "
 
 SRC_URI += "\
-- 
1.7.9.5


