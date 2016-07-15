Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC4C973169
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 18:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,365,1464678000"; d="scan'208";a="995612654"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 18:49:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:49:34 -0700
Message-Id: <a7c21fb8ecdaff7ce347db81d777478d7f39234c.1468546499.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: [krogoth][PATCH 3/8] elfutils: Fix build for gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport patch from upstream.

[YOCTO #9897] (Fedora-24)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...missing-brackets-around-if-statement-body.patch | 419 +++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.164.bb   |   1 +
 2 files changed, 420 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/libebl-Fix-missing-brackets-around-if-statement-body.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/libebl-Fix-missing-brackets-around-if-statement-body.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/libebl-Fix-missing-brackets-around-if-statement-body.patch
new file mode 100644
index 0000000..8399133
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/libebl-Fix-missing-brackets-around-if-statement-body.patch
@@ -0,0 +1,419 @@
+The upstream patch libebl/Changelog does not apply cleanly.
+Modify the patch to skip that change only.
+
+Upstream-Status: Backport
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+
+From c5da7c9e08c2bdb6dba8e115dcc09ed51a07f0e4 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mjw@redhat.com>
+Date: Sat, 9 Jan 2016 22:09:48 +0100
+Subject: libebl: Fix missing brackets around if statement body.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC6 [will have] a nice new warning that showed a real bug:
+
+elfutils/libebl/eblobjnote.c: In function ‘ebl_object_note’:
+elfutils/libebl/eblobjnote.c:135:5: error: statement is indented as if it were guarded by... [-Werror=misleading-indentation]
+     switch (type)
+     ^~~~~~
+
+elfutils/libebl/eblobjnote.c:45:3: note: ...this ‘if’ clause, but it is not
+   if (! ebl->object_note (name, type, descsz, desc))
+   ^~
+
+And indeed, it should have been under the if, but wasn't because of missing
+brackets. Added brackets (and reindent).
+
+Signed-off-by: Mark Wielaard <mjw@redhat.com>
+---
+ libebl/eblobjnote.c | 362 ++++++++++++++++++++++++++--------------------------
+ 2 files changed, 187 insertions(+), 180 deletions(-)
+
+diff --git a/libebl/eblobjnote.c b/libebl/eblobjnote.c
+index fa1eb93..f80a1a5 100644
+--- a/libebl/eblobjnote.c
++++ b/libebl/eblobjnote.c
+@@ -1,5 +1,5 @@
+ /* Print contents of object file note.
+-   Copyright (C) 2002, 2007, 2009, 2011, 2015 Red Hat, Inc.
++   Copyright (C) 2002, 2007, 2009, 2011, 2015, 2016 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
+ 
+@@ -43,189 +43,191 @@ ebl_object_note (Ebl *ebl, const char *name, uint32_t type,
+ 		 uint32_t descsz, const char *desc)
+ {
+   if (! ebl->object_note (name, type, descsz, desc))
+-    /* The machine specific function did not know this type.  */
++    {
++      /* The machine specific function did not know this type.  */
+ 
+-    if (strcmp ("stapsdt", name) == 0)
+-      {
+-	if (type != 3)
+-	  {
+-	    printf (gettext ("unknown SDT version %u\n"), type);
+-	    return;
+-	  }
+-
+-	/* Descriptor starts with three addresses, pc, base ref and
+-	   semaphore.  Then three zero terminated strings provider,
+-	   name and arguments.  */
+-
+-	union
++      if (strcmp ("stapsdt", name) == 0)
+ 	{
+-	  Elf64_Addr a64[3];
+-	  Elf32_Addr a32[3];
+-	} addrs;
++	  if (type != 3)
++	    {
++	      printf (gettext ("unknown SDT version %u\n"), type);
++	      return;
++	    }
+ 
+-	size_t addrs_size = gelf_fsize (ebl->elf, ELF_T_ADDR, 3, EV_CURRENT);
+-	if (descsz < addrs_size + 3)
+-	  {
+-	  invalid_sdt:
+-	    printf (gettext ("invalid SDT probe descriptor\n"));
+-	    return;
+-	  }
++	  /* Descriptor starts with three addresses, pc, base ref and
++	     semaphore.  Then three zero terminated strings provider,
++	     name and arguments.  */
+ 
+-	Elf_Data src =
++	  union
+ 	  {
+-	    .d_type = ELF_T_ADDR, .d_version = EV_CURRENT,
+-	    .d_buf = (void *) desc, .d_size = addrs_size
+-	  };
+-
+-	Elf_Data dst =
+-	  {
+-	    .d_type = ELF_T_ADDR, .d_version = EV_CURRENT,
+-	    .d_buf = &addrs, .d_size = addrs_size
+-	  };
+-
+-	if (gelf_xlatetom (ebl->elf, &dst, &src,
+-			   elf_getident (ebl->elf, NULL)[EI_DATA]) == NULL)
+-	  {
+-	    printf ("%s\n", elf_errmsg (-1));
+-	    return;
+-	  }
+-
+-	const char *provider = desc + addrs_size;
+-	const char *pname = memchr (provider, '\0', desc + descsz - provider);
+-	if (pname == NULL)
+-	  goto invalid_sdt;
+-
+-	++pname;
+-	const char *args = memchr (pname, '\0', desc + descsz - pname);
+-	if (args == NULL ||
+-	    memchr (++args, '\0', desc + descsz - pname) != desc + descsz - 1)
+-	  goto invalid_sdt;
+-
+-	GElf_Addr pc;
+-	GElf_Addr base;
+-	GElf_Addr sem;
+-	if (gelf_getclass (ebl->elf) == ELFCLASS32)
+-	  {
+-	    pc = addrs.a32[0];
+-	    base = addrs.a32[1];
+-	    sem = addrs.a32[2];
+-	  }
+-	else
+-	  {
+-	    pc = addrs.a64[0];
+-	    base = addrs.a64[1];
+-	    sem = addrs.a64[2];
+-	  }
+-
+-	printf (gettext ("    PC: "));
+-	printf ("%#" PRIx64 ",", pc);
+-	printf (gettext (" Base: "));
+-	printf ("%#" PRIx64 ",", base);
+-	printf (gettext (" Semaphore: "));
+-	printf ("%#" PRIx64 "\n", sem);
+-	printf (gettext ("    Provider: "));
+-	printf ("%s,", provider);
+-	printf (gettext (" Name: "));
+-	printf ("%s,", pname);
+-	printf (gettext (" Args: "));
+-	printf ("'%s'\n", args);
+-	return;
+-      }
+-
+-    switch (type)
+-      {
+-      case NT_GNU_BUILD_ID:
+-	if (strcmp (name, "GNU") == 0 && descsz > 0)
+-	  {
+-	    printf (gettext ("    Build ID: "));
+-	    uint_fast32_t i;
+-	    for (i = 0; i < descsz - 1; ++i)
+-	      printf ("%02" PRIx8, (uint8_t) desc[i]);
+-	    printf ("%02" PRIx8 "\n", (uint8_t) desc[i]);
+-	  }
+-	break;
+-
+-      case NT_GNU_GOLD_VERSION:
+-	if (strcmp (name, "GNU") == 0 && descsz > 0)
+-	  /* A non-null terminated version string.  */
+-	  printf (gettext ("    Linker version: %.*s\n"),
+-		  (int) descsz, desc);
+-	break;
+-
+-      case NT_GNU_ABI_TAG:
+-	if (strcmp (name, "GNU") == 0 && descsz >= 8 && descsz % 4 == 0)
+-	  {
+-	    Elf_Data in =
+-	      {
+-		.d_version = EV_CURRENT,
+-		.d_type = ELF_T_WORD,
+-		.d_size = descsz,
+-		.d_buf = (void *) desc
+-	      };
+-	    /* Normally NT_GNU_ABI_TAG is just 4 words (16 bytes).  If it
+-	       is much (4*) larger dynamically allocate memory to convert.  */
++	    Elf64_Addr a64[3];
++	    Elf32_Addr a32[3];
++	  } addrs;
++
++	  size_t addrs_size = gelf_fsize (ebl->elf, ELF_T_ADDR, 3, EV_CURRENT);
++	  if (descsz < addrs_size + 3)
++	    {
++	    invalid_sdt:
++	      printf (gettext ("invalid SDT probe descriptor\n"));
++	      return;
++	    }
++
++	  Elf_Data src =
++	    {
++	      .d_type = ELF_T_ADDR, .d_version = EV_CURRENT,
++	      .d_buf = (void *) desc, .d_size = addrs_size
++	    };
++
++	  Elf_Data dst =
++	    {
++	      .d_type = ELF_T_ADDR, .d_version = EV_CURRENT,
++	      .d_buf = &addrs, .d_size = addrs_size
++	    };
++
++	  if (gelf_xlatetom (ebl->elf, &dst, &src,
++			     elf_getident (ebl->elf, NULL)[EI_DATA]) == NULL)
++	    {
++	      printf ("%s\n", elf_errmsg (-1));
++	      return;
++	    }
++
++	  const char *provider = desc + addrs_size;
++	  const char *pname = memchr (provider, '\0', desc + descsz - provider);
++	  if (pname == NULL)
++	    goto invalid_sdt;
++
++	  ++pname;
++	  const char *args = memchr (pname, '\0', desc + descsz - pname);
++	  if (args == NULL ||
++	      memchr (++args, '\0', desc + descsz - pname) != desc + descsz - 1)
++	    goto invalid_sdt;
++
++	  GElf_Addr pc;
++	  GElf_Addr base;
++	  GElf_Addr sem;
++	  if (gelf_getclass (ebl->elf) == ELFCLASS32)
++	    {
++	      pc = addrs.a32[0];
++	      base = addrs.a32[1];
++	      sem = addrs.a32[2];
++	    }
++	  else
++	    {
++	      pc = addrs.a64[0];
++	      base = addrs.a64[1];
++	      sem = addrs.a64[2];
++	    }
++
++	  printf (gettext ("    PC: "));
++	  printf ("%#" PRIx64 ",", pc);
++	  printf (gettext (" Base: "));
++	  printf ("%#" PRIx64 ",", base);
++	  printf (gettext (" Semaphore: "));
++	  printf ("%#" PRIx64 "\n", sem);
++	  printf (gettext ("    Provider: "));
++	  printf ("%s,", provider);
++	  printf (gettext (" Name: "));
++	  printf ("%s,", pname);
++	  printf (gettext (" Args: "));
++	  printf ("'%s'\n", args);
++	  return;
++	}
++
++      switch (type)
++	{
++	case NT_GNU_BUILD_ID:
++	  if (strcmp (name, "GNU") == 0 && descsz > 0)
++	    {
++	      printf (gettext ("    Build ID: "));
++	      uint_fast32_t i;
++	      for (i = 0; i < descsz - 1; ++i)
++		printf ("%02" PRIx8, (uint8_t) desc[i]);
++	      printf ("%02" PRIx8 "\n", (uint8_t) desc[i]);
++	    }
++	  break;
++
++	case NT_GNU_GOLD_VERSION:
++	  if (strcmp (name, "GNU") == 0 && descsz > 0)
++	    /* A non-null terminated version string.  */
++	    printf (gettext ("    Linker version: %.*s\n"),
++		    (int) descsz, desc);
++	  break;
++
++	case NT_GNU_ABI_TAG:
++	  if (strcmp (name, "GNU") == 0 && descsz >= 8 && descsz % 4 == 0)
++	    {
++	      Elf_Data in =
++		{
++		  .d_version = EV_CURRENT,
++		  .d_type = ELF_T_WORD,
++		  .d_size = descsz,
++		  .d_buf = (void *) desc
++		};
++	      /* Normally NT_GNU_ABI_TAG is just 4 words (16 bytes).  If it
++		 is much (4*) larger dynamically allocate memory to convert.  */
+ #define FIXED_TAG_BYTES 16
+-	    uint32_t sbuf[FIXED_TAG_BYTES];
+-	    uint32_t *buf;
+-	    if (unlikely (descsz / 4 > FIXED_TAG_BYTES))
+-	      {
+-	        buf = malloc (descsz);
+-		if (unlikely (buf == NULL))
+-		  return;
+-	      }
+-	    else
+-	      buf = sbuf;
+-	    Elf_Data out =
+-	      {
+-		.d_version = EV_CURRENT,
+-		.d_type = ELF_T_WORD,
+-		.d_size = descsz,
+-		.d_buf = buf
+-	      };
+-
+-	    if (elf32_xlatetom (&out, &in, ebl->data) != NULL)
+-	      {
+-		const char *os;
+-		switch (buf[0])
+-		  {
+-		  case ELF_NOTE_OS_LINUX:
+-		    os = "Linux";
+-		    break;
+-
+-		  case ELF_NOTE_OS_GNU:
+-		    os = "GNU";
+-		    break;
+-
+-		  case ELF_NOTE_OS_SOLARIS2:
+-		    os = "Solaris";
+-		    break;
+-
+-		  case ELF_NOTE_OS_FREEBSD:
+-		    os = "FreeBSD";
+-		    break;
+-
+-		  default:
+-		    os = "???";
+-		    break;
+-		  }
+-
+-		printf (gettext ("    OS: %s, ABI: "), os);
+-		for (size_t cnt = 1; cnt < descsz / 4; ++cnt)
+-		  {
+-		    if (cnt > 1)
+-		      putchar_unlocked ('.');
+-		    printf ("%" PRIu32, buf[cnt]);
+-		  }
+-		putchar_unlocked ('\n');
+-	      }
+-	    if (descsz / 4 > FIXED_TAG_BYTES)
+-	      free (buf);
+-	    break;
+-	  }
+-	/* FALLTHROUGH */
+-
+-      default:
+-	/* Unknown type.  */
+-	break;
+-      }
++	      uint32_t sbuf[FIXED_TAG_BYTES];
++	      uint32_t *buf;
++	      if (unlikely (descsz / 4 > FIXED_TAG_BYTES))
++		{
++		  buf = malloc (descsz);
++		  if (unlikely (buf == NULL))
++		    return;
++		}
++	      else
++		buf = sbuf;
++	      Elf_Data out =
++		{
++		  .d_version = EV_CURRENT,
++		  .d_type = ELF_T_WORD,
++		  .d_size = descsz,
++		  .d_buf = buf
++		};
++
++	      if (elf32_xlatetom (&out, &in, ebl->data) != NULL)
++		{
++		  const char *os;
++		  switch (buf[0])
++		    {
++		    case ELF_NOTE_OS_LINUX:
++		      os = "Linux";
++		      break;
++
++		    case ELF_NOTE_OS_GNU:
++		      os = "GNU";
++		      break;
++
++		    case ELF_NOTE_OS_SOLARIS2:
++		      os = "Solaris";
++		      break;
++
++		    case ELF_NOTE_OS_FREEBSD:
++		      os = "FreeBSD";
++		      break;
++
++		    default:
++		      os = "???";
++		      break;
++		    }
++
++		  printf (gettext ("    OS: %s, ABI: "), os);
++		  for (size_t cnt = 1; cnt < descsz / 4; ++cnt)
++		    {
++		      if (cnt > 1)
++			putchar_unlocked ('.');
++		      printf ("%" PRIu32, buf[cnt]);
++		    }
++		  putchar_unlocked ('\n');
++		}
++	      if (descsz / 4 > FIXED_TAG_BYTES)
++		free (buf);
++	      break;
++	    }
++	  /* FALLTHROUGH */
++
++	default:
++	  /* Unknown type.  */
++	  break;
++	}
++    }
+ }
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.164.bb b/meta/recipes-devtools/elfutils/elfutils_0.164.bb
index 4964c05..2b23025 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.164.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.164.bb
@@ -20,6 +20,7 @@ SRC_URI += "\
         file://0001-fix-a-stack-usage-warning.patch \
         file://aarch64_uio.patch \
         file://shadow.patch \
+	file://libebl-Fix-missing-brackets-around-if-statement-body.patch \
 "
 
 # pick the patch from debian
-- 
2.7.4


