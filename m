Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB897782F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:15 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id b12so7593611plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=clc2SfUPlq2VMCZxNx82fezM9QdOd6XKQwfiF5kT2EU=;
	b=i+zHEXf3atxQrUT+x59ete5zZk+mUMHKQoiVqZGwGQW4yXxfdqAs+M3zip3Atfipm3
	Mbe3fD3irY7xeFkssiGEwSdlL9cvAbo7LB03Is7Bsf1gH5aPHdsKH2KNQKbM6N4TH5QG
	nGF1Hg2s6S/znmRFv2NRQIIPTGXhynQypCWDTrmC5eSQCQUKKc32rZu1pbMm1ugHjRXg
	hkoWTx783phplVSg/ZEKqK2r5t1cLadmc9PjFqomuI1C4C0tW2ITnRFq+OD5JJf3daSc
	65xwRHTKWA73jzn4wd5PpUH/pQEiyvCPZ54xkMPQfxRMuXnWDysdSuKtW1rtRi3vw4A6
	dcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=clc2SfUPlq2VMCZxNx82fezM9QdOd6XKQwfiF5kT2EU=;
	b=YGfWgjVtkw9OErYdunlWChu6rfzAJ89E7oY+Hobfbk656EbJBCfS+NUq2GeyzK3c0D
	3SZ8AGjE1H9cINRAHglDRjBA3lAxPXZRSdgOH9PTwmt4Vs7QF7SyVXAIGbpxSgWQccOO
	gfljTiQKYoRpwS9e1VYfSvWh3U0sgVYezx3l+LhY8K4blZo/DUQIptFs7fguM8L4GHTc
	Ie/68Ho90wBTW7Xw4JBnxZ/0Ugqj8lYwKyrvu9VRNsWoW3FJz8d9Roq/nkS2bPGUIjPE
	pDfAcgktBax4unmFC6kNy7mucg/rHGGJpa2xd0tVWbstdgZzlmkL5QKj4i3dUViRixam
	kcCg==
X-Gm-Message-State: AJaThX73QRDA3zUyr3K4I2TxEEeKlKAluK+YAn8fb9zLBRo720TFAVmo
	aJKm25OlWc6XwsgsvGiyfaA=
X-Google-Smtp-Source: AGs4zMbOi5vZpl/j+TR0Vtig3YvAUAl/r7hPOQeDYaCZiBy4UUxWBby6EzNLBYoUUpYTbTlAt2Nxbg==
X-Received: by 10.159.214.147 with SMTP id n19mr34884717plp.1.1511750117295;
	Sun, 26 Nov 2017 18:35:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:50 -0800
Message-Id: <1511750112-2263-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 04/26] binutls: Secuirty fix CVE-2017-8394
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:16 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-8394.patch          | 118 +++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8394.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 53299fa..8334a4c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -46,6 +46,7 @@ SRC_URI = "\
      file://CVE-2017-7223.patch \
      file://CVE-2017-7614.patch \
      file://CVE-2017-8393.patch \
+     file://CVE-2017-8394.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-8394.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-8394.patch
new file mode 100644
index 0000000..e6c6b17
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-8394.patch
@@ -0,0 +1,118 @@
+From 7eacd66b086cabb1daab20890d5481894d4f56b2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 23 Apr 2017 15:21:11 +0930
+Subject: [PATCH] PR 21414, null pointer deref of _bfd_elf_large_com_section
+ sym
+
+	PR 21414
+	* section.c (GLOBAL_SYM_INIT): Make available in bfd.h.
+	* elf.c (lcomm_sym): New.
+	(_bfd_elf_large_com_section): Use lcomm_sym section symbol.
+	* bfd-in2.h: Regenerate.
+
+Upstream-Status: Backport
+CVE: CVE-2017-8394
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  8 ++++++++
+ bfd/bfd-in2.h | 12 ++++++++++++
+ bfd/elf.c     |  6 ++++--
+ bfd/section.c | 24 ++++++++++++------------
+ 4 files changed, 36 insertions(+), 14 deletions(-)
+
+Index: git/bfd/bfd-in2.h
+===================================================================
+--- git.orig/bfd/bfd-in2.h
++++ git/bfd/bfd-in2.h
+@@ -1838,6 +1838,18 @@ extern asection _bfd_std_section[4];
+      { NULL }, { NULL }                                                \
+     }
+ 
++/* We use a macro to initialize the static asymbol structures because
++   traditional C does not permit us to initialize a union member while
++   gcc warns if we don't initialize it.
++   the_bfd, name, value, attr, section [, udata]  */
++#ifdef __STDC__
++#define GLOBAL_SYM_INIT(NAME, SECTION) \
++  { 0, NAME, 0, BSF_SECTION_SYM, SECTION, { 0 }}
++#else
++#define GLOBAL_SYM_INIT(NAME, SECTION) \
++  { 0, NAME, 0, BSF_SECTION_SYM, SECTION }
++#endif
++
+ void bfd_section_list_clear (bfd *);
+ 
+ asection *bfd_get_section_by_name (bfd *abfd, const char *name);
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -11164,9 +11164,11 @@ _bfd_elf_get_synthetic_symtab (bfd *abfd
+ 
+ /* It is only used by x86-64 so far.
+    ??? This repeats *COM* id of zero.  sec->id is supposed to be unique,
+-   but current usage would allow all of _bfd_std_section to be zero.  t*/
++   but current usage would allow all of _bfd_std_section to be zero.  */
++static const asymbol lcomm_sym
++  = GLOBAL_SYM_INIT ("LARGE_COMMON", &_bfd_elf_large_com_section);
+ asection _bfd_elf_large_com_section
+-  = BFD_FAKE_SECTION (_bfd_elf_large_com_section, NULL,
++  = BFD_FAKE_SECTION (_bfd_elf_large_com_section, &lcomm_sym,
+ 		      "LARGE_COMMON", 0, SEC_IS_COMMON);
+ 
+ void
+Index: git/bfd/section.c
+===================================================================
+--- git.orig/bfd/section.c
++++ git/bfd/section.c
+@@ -738,20 +738,20 @@ CODE_FRAGMENT
+ .     { NULL }, { NULL }						\
+ .    }
+ .
++.{* We use a macro to initialize the static asymbol structures because
++.   traditional C does not permit us to initialize a union member while
++.   gcc warns if we don't initialize it.
++.   the_bfd, name, value, attr, section [, udata]  *}
++.#ifdef __STDC__
++.#define GLOBAL_SYM_INIT(NAME, SECTION) \
++.  { 0, NAME, 0, BSF_SECTION_SYM, SECTION, { 0 }}
++.#else
++.#define GLOBAL_SYM_INIT(NAME, SECTION) \
++.  { 0, NAME, 0, BSF_SECTION_SYM, SECTION }
++.#endif
++.
+ */
+ 
+-/* We use a macro to initialize the static asymbol structures because
+-   traditional C does not permit us to initialize a union member while
+-   gcc warns if we don't initialize it.  */
+- /* the_bfd, name, value, attr, section [, udata] */
+-#ifdef __STDC__
+-#define GLOBAL_SYM_INIT(NAME, SECTION) \
+-  { 0, NAME, 0, BSF_SECTION_SYM, SECTION, { 0 }}
+-#else
+-#define GLOBAL_SYM_INIT(NAME, SECTION) \
+-  { 0, NAME, 0, BSF_SECTION_SYM, SECTION }
+-#endif
+-
+ /* These symbols are global, not specific to any BFD.  Therefore, anything
+    that tries to change them is broken, and should be repaired.  */
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,4 +1,12 @@
++
+ 2017-04-23  Alan Modra  <amodra@gmail.com>
++       PR 21414
++       * section.c (GLOBAL_SYM_INIT): Make available in bfd.h.
++       * elf.c (lcomm_sym): New.
++       (_bfd_elf_large_com_section): Use lcomm_sym section symbol.
++       * bfd-in2.h: Regenerate.
++
+++2017-04-23  Alan Modra  <amodra@gmail.com>
+  
+        PR 21412
+        * elf-bfd.h (struct elf_backend_data <get_reloc_section>): Change
-- 
2.7.4


