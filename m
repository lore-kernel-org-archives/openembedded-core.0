Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.32780.1607943178055624897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: o2f36hrs7IEGjtFju27grPL1f3/7gcoguZMM5736iLY5SeqNzur4Sjorg8k0qgHnQk1rFCOpom
 34QBusKrzJoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="171177870"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="171177870"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 02:52:58 -0800
IronPort-SDR: eBi3j0YpGqB5y8MRgjAzEoCS2gsWevY8H03wuhPniZZPi6KY4b4EhnMFfHV7mTix2IUYOp1Nov
 IvJuxuRJV+sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="411138076"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2020 02:52:57 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 3/3] binutils: fix CVE-2020-16592/16598
Date: Mon, 14 Dec 2020 18:52:54 +0800
Message-Id: <20201214105254.57230-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201214105254.57230-1-chee.yang.lee@intel.com>
References: <20201214105254.57230-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix CVE-2020-16592 & CVE-2020-16598

removed changes to Changelog in patch file

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../binutils/binutils-2.34.inc                |  2 +
 .../binutils/binutils/CVE-2020-16592.patch    | 61 +++++++++++++++++++
 .../binutils/binutils/CVE-2020-16598.patch    | 32 ++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16592.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16598.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index b5f5a1c69a..f557fe970c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -44,5 +44,7 @@ SRC_URI = "\
      file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
      file://0001-gas-improve-reproducibility-for-stabs-debugging-data.patch \
+     file://CVE-2020-16592.patch \
+     file://CVE-2020-16598.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-16592.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-16592.patch
new file mode 100644
index 0000000000..f5f9ccdd53
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-16592.patch
@@ -0,0 +1,61 @@
+From 7ecb51549ab1ec22aba5aaf34b70323cf0b8509a Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 15 Apr 2020 18:58:11 +0930
+Subject: [PATCH] PR25823, Use after free in bfd_hash_lookup
+
+	PR 25823
+	* peXXigen.c (_bfd_XXi_swap_sym_in <C_SECTION>): Don't use a
+	pointer into strings that may be freed for section name, always
+	allocate a new string.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=7ecb51549ab1ec22aba5aaf34b70323cf0b8509a]
+CVE: CVE-2020-16592
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ bfd/peXXigen.c | 20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+ 
+diff --git a/bfd/peXXigen.c b/bfd/peXXigen.c
+index b9eeb775d9b..8aa5914acd9 100644
+--- a/bfd/peXXigen.c
++++ b/bfd/peXXigen.c
+@@ -177,25 +177,25 @@ _bfd_XXi_swap_sym_in (bfd * abfd, void * ext1, void * in1)
+ 	  int unused_section_number = 0;
+ 	  asection *sec;
+ 	  flagword flags;
++	  size_t name_len;
++	  char *sec_name;
+ 
+ 	  for (sec = abfd->sections; sec; sec = sec->next)
+ 	    if (unused_section_number <= sec->target_index)
+ 	      unused_section_number = sec->target_index + 1;
+ 
+-	  if (name == namebuf)
++	  name_len = strlen (name) + 1;
++	  sec_name = bfd_alloc (abfd, name_len);
++	  if (sec_name == NULL)
+ 	    {
+-	      name = (const char *) bfd_alloc (abfd, strlen (namebuf) + 1);
+-	      if (name == NULL)
+-		{
+-		  _bfd_error_handler (_("%pB: out of memory creating name for empty section"),
+-				      abfd);
+-		  return;
+-		}
+-	      strcpy ((char *) name, namebuf);
++	      _bfd_error_handler (_("%pB: out of memory creating name "
++				    "for empty section"), abfd);
++	      return;
+ 	    }
++	  memcpy (sec_name, name, name_len);
+ 
+ 	  flags = SEC_HAS_CONTENTS | SEC_ALLOC | SEC_DATA | SEC_LOAD;
+-	  sec = bfd_make_section_anyway_with_flags (abfd, name, flags);
++	  sec = bfd_make_section_anyway_with_flags (abfd, sec_name, flags);
+ 	  if (sec == NULL)
+ 	    {
+ 	      _bfd_error_handler (_("%pB: unable to create fake empty section"),
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-16598.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-16598.patch
new file mode 100644
index 0000000000..52bd925c97
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-16598.patch
@@ -0,0 +1,32 @@
+From ca3f923f82a079dcf441419f4a50a50f8b4b33c2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 17 Apr 2020 10:38:16 +0930
+Subject: [PATCH] PR25840, Null pointer dereference in objdump
+
+	PR 25840
+	* debug.c (debug_class_type_samep): Don't segfault on NULL type.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ca3f923f82a079dcf441419f4a50a50f8b4b33c2]
+CVE: CVE-2020-16598
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ binutils/debug.c   | 2 ++
+ 1 files changed, 2 insertions(+)
+
+diff --git a/binutils/debug.c b/binutils/debug.c
+index 022fa4edffb..5470e155edc 100644
+--- a/binutils/debug.c
++++ b/binutils/debug.c
+@@ -3277,6 +3277,8 @@ debug_class_type_samep (struct debug_handle *info, struct debug_type_s *t1,
+              names, since that sometimes fails in the presence of
+              typedefs and we really don't care.  */
+ 	  if (strcmp (f1->name, f2->name) != 0
++	      || f1->type == NULL
++	      || f2->type == NULL
+ 	      || ! debug_type_samep (info,
+ 				     debug_get_real_type ((void *) info,
+ 							  f1->type, NULL),
+-- 
+2.27.0
+
-- 
2.17.1

