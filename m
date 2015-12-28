Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70565731B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7FFic025249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:15 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:47 -0800
Message-ID: <73919830f88f2d28da973e72fbdfaab591a5af69.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 39/40] glibc: Fix ld.so / prelink interface for ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:14 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

A bug in glibc 2.22's ld.so interface for the prelink support causes
the displayed values to be incorrect.  The included path fixes this
issue.

   Clear ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA for prelink

   prelink runs ld.so with the environment variable LD_TRACE_PRELINKING
   set to dump the relocation type class from _dl_debug_bindings.  prelink
   has the following relocation type classes:

   where ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA has a conflict with
   RTYPE_CLASS_TLS.

   Since prelink doesn't use ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA, we
   should clear the ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA bit when the
   DL_DEBUG_PRELINK bit is set.

 (From OE-Core master rev: 12c86bdcc60c54e587a896b0dceb8bb6cc9ff7e3)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch |   84 ++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |    1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch

diff --git a/meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch b/meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
new file mode 100644
index 0000000..3455df1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
@@ -0,0 +1,84 @@
+From cadaf1336332ca7bcdfe4a400776e5782a20e26d Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Wed, 28 Oct 2015 07:49:44 -0700
+Subject: [PATCH] Keep only ELF_RTYPE_CLASS_{PLT|COPY} bits for prelink
+
+prelink runs ld.so with the environment variable LD_TRACE_PRELINKING
+set to dump the relocation type class from _dl_debug_bindings.  prelink
+has the following relocation type classes:
+
+ #define RTYPE_CLASS_VALID       8
+ #define RTYPE_CLASS_PLT         (8|1)
+ #define RTYPE_CLASS_COPY        (8|2)
+ #define RTYPE_CLASS_TLS         (8|4)
+
+where ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA has a conflict with
+RTYPE_CLASS_TLS.
+
+Since prelink only uses ELF_RTYPE_CLASS_PLT and ELF_RTYPE_CLASS_COPY
+bits, we should clear the other bits when the DL_DEBUG_PRELINK bit is
+set.
+
+	[BZ #19178]
+	* elf/dl-lookup.c (RTYPE_CLASS_VALID): New.
+	(RTYPE_CLASS_PLT): Likewise.
+	(RTYPE_CLASS_COPY): Likewise.
+	(RTYPE_CLASS_TLS): Likewise.
+	(_dl_debug_bindings): Use RTYPE_CLASS_TLS and RTYPE_CLASS_VALID
+	to set relocation type class for DL_DEBUG_PRELINK.  Keep only
+	ELF_RTYPE_CLASS_PLT and ELF_RTYPE_CLASS_COPY bits for
+	DL_DEBUG_PRELINK.
+
+Upstream-Status: submitted (https://sourceware.org/bugzilla/show_bug.cgi?id=19178)
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ elf/dl-lookup.c | 21 +++++++++++++++++++--
+ 1 file changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/elf/dl-lookup.c b/elf/dl-lookup.c
+index 581fb20..6ae6cc3 100644
+--- a/elf/dl-lookup.c
++++ b/elf/dl-lookup.c
+@@ -1016,6 +1016,18 @@ _dl_debug_bindings (const char *undef_name, struct link_map *undef_map,
+ #ifdef SHARED
+   if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
+     {
++/* ELF_RTYPE_CLASS_XXX must match RTYPE_CLASS_XXX used by prelink with
++   LD_TRACE_PRELINKING.  */
++#define RTYPE_CLASS_VALID	8
++#define RTYPE_CLASS_PLT		(8|1)
++#define RTYPE_CLASS_COPY	(8|2)
++#define RTYPE_CLASS_TLS		(8|4)
++#if ELF_RTYPE_CLASS_PLT != 0 && ELF_RTYPE_CLASS_PLT != 1
++# error ELF_RTYPE_CLASS_PLT must be 0 or 1!
++#endif
++#if ELF_RTYPE_CLASS_COPY != 0 && ELF_RTYPE_CLASS_COPY != 2
++# error ELF_RTYPE_CLASS_COPY must be 0 or 2!
++#endif
+       int conflict = 0;
+       struct sym_val val = { NULL, NULL };
+ 
+@@ -1071,12 +1083,17 @@ _dl_debug_bindings (const char *undef_name, struct link_map *undef_map,
+ 
+       if (value->s)
+ 	{
++	  /* Keep only ELF_RTYPE_CLASS_PLT and ELF_RTYPE_CLASS_COPY
++	     bits since since prelink only uses them.  */
++	  type_class &= ELF_RTYPE_CLASS_PLT | ELF_RTYPE_CLASS_COPY;
+ 	  if (__glibc_unlikely (ELFW(ST_TYPE) (value->s->st_info)
+ 				== STT_TLS))
+-	    type_class = 4;
++	    /* Clear the RTYPE_CLASS_VALID bit in RTYPE_CLASS_TLS.  */
++	    type_class = RTYPE_CLASS_TLS & ~RTYPE_CLASS_VALID;
+ 	  else if (__glibc_unlikely (ELFW(ST_TYPE) (value->s->st_info)
+ 				     == STT_GNU_IFUNC))
+-	    type_class |= 8;
++	    /* Set the RTYPE_CLASS_VALID bit.  */
++	    type_class |= RTYPE_CLASS_VALID;
+ 	}
+ 
+       if (conflict
+-- 
+1.9.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 71ff824..c1f6b4e 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
            file://nscd-no-bash.patch \
            file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
+           file://0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch \
 "
 
 SRC_URI += "\
-- 
1.7.9.5


