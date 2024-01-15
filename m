Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8912C54766
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88279.1705340029595826735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hpTCHrQg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E8siOFQy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fc7a0-2d7fd548-ffb2-4dcd-88df-01fdcd4215eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C8gPsWHMugYACZvvUYKVMjW3jI5l3osVATQMFUW8DTg=;
	b=hpTCHrQg2bZ6GxsU+yxWwVaTZ4T6SAiuJyNLTOTdrKD6/ad7LuSwDRsoYIJajn1V
	aqBaJTqMSmooB7Axp872W8qjBmQ+tCWTmoKOPZeQSaWY/+dWBMp+m3R2Jd8eTedBEGJ
	K6x8zNwOqE8LAymg8RYiDmSfOioq3+EngGdu7EY0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C8gPsWHMugYACZvvUYKVMjW3jI5l3osVATQMFUW8DTg=;
	b=E8siOFQyO6U29GqijDHzNv2Vu/yzENqW2N9gfLOGj21B23CrI548Y2tzP+JJ6Ikh
	pL9DbUDzK58TdnbUHFx8Nt3THxX+g8mPbTSryKitOqzKj0Zu9YzMuGglQWp15GrdTaN
	1AtnejOdRIbl84G99MdQ8K1r8FzrWdk/oJThrARw=
Content-Type: multipart/mixed; boundary="===============6429607857104567168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.190 SUCCEEDED
Message-ID: <0101018d0e2fc7a0-2d7fd548-ffb2-4dcd-88df-01fdcd4215eb-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193709

--===============6429607857104567168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *elfutils* to *0.190* has Succeeded.

Next steps:
    - apply the patch: git am 0001-elfutils-upgrade-0.189-0.190.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From b688870227000295b34a497090f64e16ae4ac39a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 06:34:24 +0000
Subject: [PATCH] elfutils: upgrade 0.189 -> 0.190

---
 .../{elfutils_0.189.bb => elfutils_0.190.bb}  |   2 +-
 ...001-Add-helper-function-for-basename.patch | 117 ++++++++++++------
 .../elfutils/files/0001-dso-link-change.patch |  12 +-
 ...libasm-may-link-with-libbz2-if-found.patch |   6 +-
 ...-check-data_list.data.d.d_buf-before.patch |   6 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |   2 +-
 ...m-compile-test_nlist-with-standard-C.patch |   6 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |   8 +-
 .../elfutils/files/0003-fixheadercheck.patch  |   6 +-
 .../elfutils/files/0003-musl-utils.patch      |   6 +-
 .../0006-Fix-build-on-aarch64-musl.patch      |   2 +-
 .../elfutils/files/ptest.patch                |  10 +-
 12 files changed, 111 insertions(+), 72 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (98%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
index e9b432e4e9..6753d0ae7d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
+SRC_URI[sha256sum] = "8e00a3a9b5f04bc1dc273ae86281d2d26ed412020b391ffcc23198f10231d692"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
index 3e6033fd75..65d7a04a02 100644
--- a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
@@ -1,4 +1,4 @@
-From 666372a5d8d5a23203c70d583904097c9e49c5a0 Mon Sep 17 00:00:00 2001
+From bf2cbd1fcc0c12ecca25165d421d4d70d03dd7a5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Dec 2023 18:23:03 -0800
 Subject: [PATCH] Add helper function for basename
@@ -12,27 +12,31 @@ libraries which have POSIX implementation only.
 Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2023q4/006727.html]
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  lib/Makefile.am                      |  2 +-
  lib/libeu.h                          |  1 +
- lib/{libeu.h => xbasename.c}         | 31 ++++++++++------------------
+ lib/xbasename.c                      | 39 ++++++++++++++++++++++++++++
  libdw/dwarf_getsrc_file.c            |  3 ++-
  libdwfl/core-file.c                  |  3 ++-
  libdwfl/dwfl_module_getsrc_file.c    |  3 ++-
  libdwfl/dwfl_segment_report_module.c |  3 ++-
- libdwfl/find-debuginfo.c             |  7 ++++---
+ libdwfl/find-debuginfo.c             |  7 ++---
  libdwfl/link_map.c                   |  3 ++-
  libdwfl/linux-kernel-modules.c       |  3 ++-
- src/addr2line.c                      |  5 +++--
- src/ar.c                             |  5 +++--
- src/nm.c                             |  4 ++--
+ src/addr2line.c                      |  5 ++--
+ src/ar.c                             |  5 ++--
+ src/nm.c                             |  4 +--
  src/stack.c                          |  3 ++-
  src/strip.c                          |  2 +-
- tests/show-die-info.c                |  2 +-
- tests/varlocs.c                      |  2 +-
- 17 files changed, 42 insertions(+), 40 deletions(-)
- copy lib/{libeu.h => xbasename.c} (57%)
+ tests/Makefile.am                    |  2 +-
+ tests/show-die-info.c                |  3 ++-
+ tests/varlocs.c                      |  3 ++-
+ 18 files changed, 73 insertions(+), 21 deletions(-)
+ create mode 100644 lib/xbasename.c
 
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index b3bb929..ada51c0 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
 @@ -33,7 +33,7 @@ AM_CPPFLAGS += -I$(srcdir)/../libelf
@@ -44,9 +48,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  crc32.c crc32_file.c \
  		  color.c error.c printversion.c
  
+diff --git a/lib/libeu.h b/lib/libeu.h
+index e849a79..2a115ac 100644
 --- a/lib/libeu.h
 +++ b/lib/libeu.h
-@@ -42,6 +42,7 @@ extern char *xstrndup (const char *, siz
+@@ -42,6 +42,7 @@ extern char *xstrndup (const char *, size_t) __attribute__ ((__malloc__));
  extern char *xasprintf(const char *fmt, ...)
  	__attribute__ ((format (printf, 1, 2))) __attribute__ ((__malloc__));
  
@@ -54,6 +60,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  extern uint32_t crc32 (uint32_t crc, unsigned char *buf, size_t len);
  extern int crc32_file (int fd, uint32_t *resp);
  
+diff --git a/lib/xbasename.c b/lib/xbasename.c
+new file mode 100644
+index 0000000..68d5161
 --- /dev/null
 +++ b/lib/xbasename.c
 @@ -0,0 +1,39 @@
@@ -96,6 +105,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    const char *p = strrchr(s, '/');
 +    return p ? p+1 : s;
 +}
+diff --git a/libdw/dwarf_getsrc_file.c b/libdw/dwarf_getsrc_file.c
+index 5289c7d..f75bf7b 100644
 --- a/libdw/dwarf_getsrc_file.c
 +++ b/libdw/dwarf_getsrc_file.c
 @@ -37,6 +37,7 @@
@@ -106,7 +117,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  int
-@@ -98,7 +99,7 @@ dwarf_getsrc_file (Dwarf *dbg, const cha
+@@ -98,7 +99,7 @@ dwarf_getsrc_file (Dwarf *dbg, const char *fname, int lineno, int column,
  	      /* Match the name with the name the user provided.  */
  	      const char *fname2 = line->files->info[lastfile].name;
  	      if (is_basename)
@@ -115,6 +126,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	      else
  		lastmatch = strcmp (fname2, fname) == 0;
  	    }
+diff --git a/libdwfl/core-file.c b/libdwfl/core-file.c
+index 87c940c..52a34b8 100644
 --- a/libdwfl/core-file.c
 +++ b/libdwfl/core-file.c
 @@ -29,6 +29,7 @@
@@ -125,7 +138,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwflP.h"
  #include <gelf.h>
  
-@@ -595,7 +596,7 @@ dwfl_core_file_report (Dwfl *dwfl, Elf *
+@@ -595,7 +596,7 @@ dwfl_core_file_report (Dwfl *dwfl, Elf *elf, const char *executable)
        if (! __libdwfl_dynamic_vaddr_get (module->elf, &file_dynamic_vaddr))
  	continue;
        Dwfl_Module *mod;
@@ -134,6 +147,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				  module->fd, module->elf,
  				  module->l_ld - file_dynamic_vaddr,
  				  true, true);
+diff --git a/libdwfl/dwfl_module_getsrc_file.c b/libdwfl/dwfl_module_getsrc_file.c
+index 513af6b..0418a26 100644
 --- a/libdwfl/dwfl_module_getsrc_file.c
 +++ b/libdwfl/dwfl_module_getsrc_file.c
 @@ -31,6 +31,7 @@
@@ -144,7 +159,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwP.h"
  
  
-@@ -103,7 +104,7 @@ dwfl_module_getsrc_file (Dwfl_Module *mo
+@@ -103,7 +104,7 @@ dwfl_module_getsrc_file (Dwfl_Module *mod,
  		{
  		  /* Match the name with the name the user provided.  */
  		  lastfile = file;
@@ -153,6 +168,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				       fname);
  		}
  	    }
+diff --git a/libdwfl/dwfl_segment_report_module.c b/libdwfl/dwfl_segment_report_module.c
+index 3ef62a7..15621ad 100644
 --- a/libdwfl/dwfl_segment_report_module.c
 +++ b/libdwfl/dwfl_segment_report_module.c
 @@ -29,6 +29,7 @@
@@ -163,7 +180,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwflP.h"
  #include "common.h"
  
-@@ -718,7 +719,7 @@ dwfl_segment_report_module (Dwfl *dwfl,
+@@ -718,7 +719,7 @@ dwfl_segment_report_module (Dwfl *dwfl, int ndx, const char *name,
  	      bias += fixup;
  	      if (module->name[0] != '\0')
  		{
@@ -172,6 +189,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  name_is_final = true;
  		}
  	      break;
+diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
+index 7f7ab63..6aab1a4 100644
 --- a/libdwfl/find-debuginfo.c
 +++ b/libdwfl/find-debuginfo.c
 @@ -31,6 +31,7 @@
@@ -182,7 +201,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <stdio.h>
  #include <fcntl.h>
  #include <sys/stat.h>
-@@ -164,7 +165,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
+@@ -164,7 +165,7 @@ find_debuginfo_in_path (Dwfl_Module *mod, const char *file_name,
  {
    bool cancheck = debuglink_crc != (GElf_Word) 0;
  
@@ -191,7 +210,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    char *localname = NULL;
  
    /* We invent a debuglink .debug name if NULL, but then want to try the
-@@ -278,7 +279,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
+@@ -278,7 +279,7 @@ find_debuginfo_in_path (Dwfl_Module *mod, const char *file_name,
  	  else
  	    {
  	      subdir = NULL;
@@ -200,7 +219,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	    }
  	  try_file_basename = debuglink_null;
  	  break;
-@@ -306,7 +307,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
+@@ -306,7 +307,7 @@ find_debuginfo_in_path (Dwfl_Module *mod, const char *file_name,
  	    if (mod->dw != NULL && (p[0] == '\0' || p[0] == '/'))
  	      {
  		fd = try_open (&main_stat, dir, ".dwz",
@@ -209,6 +228,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		if (fd < 0)
  		  {
  		    if (errno != ENOENT && errno != ENOTDIR)
+diff --git a/libdwfl/link_map.c b/libdwfl/link_map.c
+index 76f2335..cdaa7ed 100644
 --- a/libdwfl/link_map.c
 +++ b/libdwfl/link_map.c
 @@ -29,6 +29,7 @@
@@ -219,7 +240,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "memory-access.h"
  #include "system.h"
  
-@@ -469,7 +470,7 @@ report_r_debug (uint_fast8_t elfclass, u
+@@ -475,7 +476,7 @@ report_r_debug (uint_fast8_t elfclass, uint_fast8_t elfdata,
  		      if (r_debug_info_module == NULL)
  			{
  			  // XXX hook for sysroot
@@ -228,6 +249,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  						      name, fd, elf, base,
  						      true, true);
  			  if (mod != NULL)
+diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
+index 58c0c41..bdbde83 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -40,6 +40,7 @@
@@ -238,7 +261,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwflP.h"
  #include <inttypes.h>
  #include <errno.h>
-@@ -116,7 +117,7 @@ try_kernel_name (Dwfl *dwfl, char **fnam
+@@ -116,7 +117,7 @@ try_kernel_name (Dwfl *dwfl, char **fname, bool try_debug)
  	/* Try the file's unadorned basename as DEBUGLINK_FILE,
  	   to look only for "vmlinux" files.  */
  	fd = INTUSE(dwfl_standard_find_debuginfo) (&fakemod, NULL, NULL, 0,
@@ -247,6 +270,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  						   0, &fakemod.debug.name);
  
        if (fakemod.debug.name != NULL)
+diff --git a/src/addr2line.c b/src/addr2line.c
+index d902d79..5345189 100644
 --- a/src/addr2line.c
 +++ b/src/addr2line.c
 @@ -38,6 +38,7 @@
@@ -257,7 +282,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Name and version of program.  */
-@@ -385,7 +386,7 @@ print_dwarf_function (Dwfl_Module *mod,
+@@ -385,7 +386,7 @@ print_dwarf_function (Dwfl_Module *mod, Dwarf_Addr addr)
  		  if (file == NULL)
  		    file = "???";
  		  else if (only_basenames)
@@ -266,7 +291,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  else if (use_comp_dir && file[0] != '/')
  		    {
  		      const char *const *dirs;
-@@ -568,7 +569,7 @@ print_src (const char *src, int lineno,
+@@ -568,7 +569,7 @@ print_src (const char *src, int lineno, int linecol, Dwarf_Die *cu)
    const char *comp_dir_sep = "";
  
    if (only_basenames)
@@ -275,6 +300,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    else if (use_comp_dir && src[0] != '/')
      {
        Dwarf_Attribute attr;
+diff --git a/src/ar.c b/src/ar.c
+index 3bcb18f..8f2dcd0 100644
 --- a/src/ar.c
 +++ b/src/ar.c
 @@ -42,6 +42,7 @@
@@ -285,7 +312,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Name and version of program.  */
-@@ -1133,7 +1134,7 @@ do_oper_insert (int oper, const char *ar
+@@ -1133,7 +1134,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
        for (int cnt = 0; cnt < argc; ++cnt)
  	{
  	  ENTRY entry;
@@ -294,7 +321,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  entry.data = &argv[cnt];
  	  if (hsearch (entry, ENTER) == NULL)
  	    error_exit (errno, _("cannot insert into hash table"));
-@@ -1242,7 +1243,7 @@ do_oper_insert (int oper, const char *ar
+@@ -1242,7 +1243,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
        /* Open all the new files, get their sizes and add all symbols.  */
        for (int cnt = 0; cnt < argc; ++cnt)
  	{
@@ -303,9 +330,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  size_t bnamelen = strlen (bname);
  	  if (found[cnt] == NULL)
  	    {
+diff --git a/src/nm.c b/src/nm.c
+index fbdee8e..3675f59 100644
 --- a/src/nm.c
 +++ b/src/nm.c
-@@ -1417,7 +1417,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehd
+@@ -1417,7 +1417,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehdr *ehdr,
  			  int lineno;
  			  (void) dwarf_lineno (line, &lineno);
  			  const char *file = dwarf_linesrc (line, NULL, NULL);
@@ -314,7 +343,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			  int n;
  			  n = obstack_printf (&whereob, "%s:%d%c", file,
  					      lineno, '\0');
-@@ -1448,7 +1448,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehd
+@@ -1448,7 +1448,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehdr *ehdr,
  		{
  		  /* We found the line.  */
  		  int n = obstack_printf (&whereob, "%s:%" PRIu64 "%c",
@@ -323,6 +352,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  					  (*found)->lineno,
  					  '\0');
  		  sym_mem[nentries_used].where = obstack_finish (&whereob);
+diff --git a/src/stack.c b/src/stack.c
+index 534aa93..3abef98 100644
 --- a/src/stack.c
 +++ b/src/stack.c
 @@ -31,6 +31,7 @@
@@ -333,7 +364,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* Name and version of program.  */
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
-@@ -152,7 +153,7 @@ module_callback (Dwfl_Module *mod, void
+@@ -152,7 +153,7 @@ module_callback (Dwfl_Module *mod, void **userdata __attribute__((unused)),
  
    int width = get_addr_width (mod);
    printf ("0x%0*" PRIx64 "-0x%0*" PRIx64 " %s\n",
@@ -342,9 +373,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    const unsigned char *id;
    GElf_Addr id_vaddr;
+diff --git a/src/strip.c b/src/strip.c
+index 7f4788b..6436443 100644
 --- a/src/strip.c
 +++ b/src/strip.c
-@@ -1807,7 +1807,7 @@ handle_elf (int fd, Elf *elf, const char
+@@ -1800,7 +1800,7 @@ handle_elf (int fd, Elf *elf, const char *prefix, const char *fname,
  		      elf_errmsg (-1));
  	}
  
@@ -353,6 +386,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        off_t crc_offset = strlen (debug_basename) + 1;
        /* Align to 4 byte boundary */
        crc_offset = ((crc_offset - 1) & ~3) + 4;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 79105f2..43ef6d9 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -705,7 +705,7 @@ update1_LDADD = $(libelf)
+ update2_LDADD = $(libelf)
+ update3_LDADD = $(libdw) $(libelf)
+ update4_LDADD = $(libdw) $(libelf)
+-show_die_info_LDADD = $(libdw) $(libelf)
++show_die_info_LDADD = $(libeu) $(libdw) $(libelf)
+ get_pubnames_LDADD = $(libdw) $(libelf)
+ show_abbrev_LDADD = $(libdw) $(libelf)
+ get_lines_LDADD = $(libdw) $(libelf)
+diff --git a/tests/show-die-info.c b/tests/show-die-info.c
+index 1a3191c..00a6657 100644
 --- a/tests/show-die-info.c
 +++ b/tests/show-die-info.c
 @@ -26,6 +26,7 @@
@@ -372,6 +420,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
        dbg = dwarf_begin (fd, DWARF_C_READ);
        if (dbg == NULL)
+diff --git a/tests/varlocs.c b/tests/varlocs.c
+index 8e563fd..72c64e2 100644
 --- a/tests/varlocs.c
 +++ b/tests/varlocs.c
 @@ -33,6 +33,7 @@
@@ -391,14 +441,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  printf ("module '%s'\n", name);
  	  print_die (&cudie, "CU", 0);
  
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -692,7 +692,7 @@ update1_LDADD = $(libelf)
- update2_LDADD = $(libelf)
- update3_LDADD = $(libdw) $(libelf)
- update4_LDADD = $(libdw) $(libelf)
--show_die_info_LDADD = $(libdw) $(libelf)
-+show_die_info_LDADD = $(libeu) $(libdw) $(libelf)
- get_pubnames_LDADD = $(libdw) $(libelf)
- show_abbrev_LDADD = $(libdw) $(libelf)
- get_lines_LDADD = $(libdw) $(libelf)
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 6acc036406..21bb0f518c 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
+From da159680ad4b49a8068b5cfe9a2f8cd399193ea1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH] dso link change
@@ -23,11 +23,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 88d0ac8..c28d81f 100644
+index d3d9d40..ea61616 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  else
  libasm = ../libasm/libasm.so
 -libdw = ../libdw/libdw.so
@@ -36,11 +36,11 @@ index 88d0ac8..c28d81f 100644
  endif
  libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index c145720..72afd0e 100644
+index 7fb8efb..71c1a61 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -554,7 +554,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+@@ -680,7 +680,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  libasm = ../libasm/libasm.a
  else
 -libdw = ../libdw/libdw.so
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index 09c9d3ea24..07681535c2 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
+From 1e78b06e3e2f31f742f05e09f4bebed44e9ace55 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index c28d81f..951e978 100644
+index ea61616..bc6573f 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
@@ -27,7 +27,7 @@ index c28d81f..951e978 100644
 -libasm = ../libasm/libasm.a
 +libasm = ../libasm/libasm.a $(zip_LIBS)
  libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  else
 -libasm = ../libasm/libasm.so
 +libasm = ../libasm/libasm.so $(zip_LIBS)
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index c8d55d583a..d9f8f430bc 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From f40cbd43acdb1fefef4fa53a6034296d83cbff7d Mon Sep 17 00:00:00 2001
+From ca221a69aefc23f9e5d55dcb3ab6a4a24a51e792 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 160f0b8..5280a70 100644
+index 80f4d13..b103959 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -160,14 +160,16 @@ elf_end (Elf *elf)
+@@ -169,14 +169,16 @@ elf_end (Elf *elf)
  		   architecture doesn't require overly stringent
  		   alignment the raw data buffer is the same as the
  		   one used for presenting to the caller.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 0e6bf5573c..3cb8c3b8d2 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From 2fa52d61b1abdf4a3f3b153c771fb2081666430c Mon Sep 17 00:00:00 2001
+From c083f817b40e8c5aef96238c3c1781d28f6631be Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index a2c0b90227..f9ede84d77 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From e355ca3b8ddcc6e73ee140f53d25634afdaec0da Mon Sep 17 00:00:00 2001
+From a48647899d9e1e80dbfdfdca27afb4f634cf281c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 2ade5d9..f85cdba 100644
+index ac82456..79105f2 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ endif
+@@ -102,7 +102,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index be48ef010b..6cfdd9a45f 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 1643d793761216252bb654e28aaa5b8eb1536bca Mon Sep 17 00:00:00 2001
+From f3fcf64146dfe451b41d5a628a428e1c39c42233 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
-index 6faf113..04d9ca1 100644
+index 3a00ae0..40468fc 100644
 --- a/libelf/gnuhash_xlate.h
 +++ b/libelf/gnuhash_xlate.h
-@@ -40,6 +40,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -42,6 +42,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
       words.  We must detangle them here.   */
    Elf32_Word *dest32 = dest;
    const Elf32_Word *src32 = src;
@@ -29,7 +29,7 @@ index 6faf113..04d9ca1 100644
  
    /* First four control words, 32 bits.  */
    for (unsigned int cnt = 0; cnt < 4; ++cnt)
-@@ -50,7 +51,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -52,7 +53,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
        len -= 4;
      }
  
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 212b358dc2..105ac047d4 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 7e1f91c42ef5b0bf10afefec10dd08588df3ab1f Mon Sep 17 00:00:00 2001
+From 839bef38cb47058a33fda5b4d981961b9957e621 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
-index d0d4d1e..4ecf5a5 100644
+index 3594e8b..a3314e5 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
-@@ -354,8 +354,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
+@@ -355,8 +355,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
  		     we test for the alignment of the section being large
  		     enough for the largest alignment required by a data
  		     block.  */
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 93f5bdcd00..67284d5d0f 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 262ac90394e36e0b4e86042d9c5385703f5b6536 Mon Sep 17 00:00:00 2001
+From 0e6b58fe0197b3f4a50c21052f115f487e4d742c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -39,7 +39,7 @@ index d4a4221..f6336d9 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 18ade66..a6ed4e1 100644
+index f771b92..263de62 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,7 +57,7 @@ index 18ade66..a6ed4e1 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 2a2cc80..8e9f773 100644
+index 6436443..1608496 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
diff --git a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
index 8942ad7828..c48b60e4be 100644
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,4 @@
-From 2396fd67d81e54e18fbad67a5ff67d5684a01013 Mon Sep 17 00:00:00 2001
+From 62438f46abb39e67d5e5aa5c178714c8d7925516 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:27:30 +0800
 Subject: [PATCH] Fix build on aarch64/musl
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index fe6f272a83..50fc38b615 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From bfbf393e7d5b1b41df85ce1c37e887776c45d529 Mon Sep 17 00:00:00 2001
+From ff56f3be5be99061980f6770a9f4dd6429403276 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -22,10 +22,10 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d345495..67933d1 100644
+index af5b6bf..2ef302f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -48,7 +48,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2021 The elfutils developers.])
+@@ -49,7 +49,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2023 The elfutils developers.])
  AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
  
  dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
@@ -35,10 +35,10 @@ index d345495..67933d1 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 72afd0e..a2dfd43 100644
+index 71c1a61..ac82456 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -698,3 +698,5 @@ check: check-am coverage
+@@ -834,3 +834,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
-- 
2.42.0


--===============6429607857104567168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1851 targets, 49 skipped, 0 masked, 0 errors.
Removing 69 recipes from the core2-64 sysroot...done.
Removing 82 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-1e2b3a9a497eeb999aa477a181c57f6494e9e95c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1e2b3a9a497eeb999aa477a181c57f6494e9e95c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 509 Local 281 Mirrors 0 Missed 228 Current 205 (55% match, 68% complete)
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 231 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 256 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 257 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 268 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 269 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 287 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.190-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 294 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 295 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.190-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 298 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 306 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 307 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 308 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 310 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 316 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe iproute2-6.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 321 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 322 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 323 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 327 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 328 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 335 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 336 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 337 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 338 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 342 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 343 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 346 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 350 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 355 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 371 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 374 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 377 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 418 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 423 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 426 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 427 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 428 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 430 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 432 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 437 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 442 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 444 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 445 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 446 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 450 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 451 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 452 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 453 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 454 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 455 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 491 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 493 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 494 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 500 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 517 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 518 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 521 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 527 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 529 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 531 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 532 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 535 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 544 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 557 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 563 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 568 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 575 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 657 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 658 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 662 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 650 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_fetch)
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 672 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 673 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: Running task 674 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 672 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running task 704 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 706 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 720 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 724 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_fetch)
NOTE: Running task 728 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 734 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 735 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: Running task 736 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 737 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe curl-8.5.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe openssl-3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 739 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: Running setscene task 675 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 741 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 743 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 744 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: Running task 745 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 748 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 749 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: Running setscene task 676 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 677 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe curl-8.5.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 679 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: Running task 750 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 751 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 752 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: Running task 754 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 759 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 761 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 680 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: Running task 762 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 763 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 764 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 684 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 765 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: Running setscene task 685 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 766 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 768 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 770 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 686 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe curl-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: Running task 776 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: Running task 777 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 779 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 780 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 782 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 783 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 785 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 786 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: Running task 788 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_unpack)
NOTE: recipe curl-8.5.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe openssl-3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 790 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: Running task 791 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_patch)
NOTE: recipe curl-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 792 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 793 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 688 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 794 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 796 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: Running task 797 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 798 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 799 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 801 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 805 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running noexec task 807 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 822 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 824 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: Running task 827 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 831 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_fetch)
NOTE: Running task 832 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: Running setscene task 691 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running setscene task 692 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: Running task 834 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 835 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 837 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 840 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 846 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe openssl-3.2.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: Running task 850 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: Running task 853 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 855 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: Running task 857 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running noexec task 859 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 860 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 861 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 863 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 864 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 696 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: Running task 865 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.190-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 866 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.190-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: Running task 868 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 869 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 871 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 697 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 874 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: Running task 876 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_patch: Started
NOTE: Running setscene task 699 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 878 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 880 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: Running task 881 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 883 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_patch: Succeeded
NOTE: Running task 884 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: Running task 885 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: Running task 888 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 704 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.2-r0: task do_patch: Succeeded
NOTE: Running task 891 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 892 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 896 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 898 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.190-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Succeeded
NOTE: Running task 899 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 900 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 902 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_fetch: Started
NOTE: Running task 904 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: Running task 909 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe perl-5.38.2-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 912 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: Running task 914 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 915 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 916 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 917 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe perl-5.38.2-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 918 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 919 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: Running task 920 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: Running task 921 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: Running task 922 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: Running task 923 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 926 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 929 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 931 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_fetch)
NOTE: Running task 933 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: Running task 935 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: Running task 936 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: Running setscene task 705 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 937 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 938 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 939 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: Running task 941 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: Running task 942 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_patch)
NOTE: Running task 945 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe elfutils-0.190-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 947 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 948 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 954 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 956 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe perl-5.38.2-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 957 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 959 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: recipe elfutils-0.190-r0: task do_patch: Started
NOTE: Running noexec task 960 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 961 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: Running task 962 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: Running task 972 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Succeeded
NOTE: Running task 974 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 975 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: Running task 977 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_fetch)
NOTE: recipe base-passwd-3.6.3-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: Running task 978 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 983 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 984 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 986 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shadow-4.14.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 987 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_fetch: Started
NOTE: recipe shadow-4.14.2-r0: task do_fetch: Succeeded
NOTE: Running task 988 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 989 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: recipe python3-3.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 990 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 993 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 995 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: Running task 998 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: Running task 999 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_unpack: Started
NOTE: Running task 1005 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: Running task 1006 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe shadow-4.14.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe perl-5.38.2-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.4-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1011 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: Running task 1016 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Started
NOTE: recipe elfutils-0.190-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1019 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shadow-4.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1031 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: Running task 1032 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1034 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1037 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_fetch)
NOTE: Running task 1038 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: Running task 1049 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1050 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_unpack)
NOTE: Running task 1051 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.190-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1052 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shadow-4.14.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: Running task 1057 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 1059 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: Running task 1060 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: Running task 1061 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: Running task 1062 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: Running task 1066 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Started
NOTE: recipe elfutils-0.190-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_deploy_source_date_epoch unihash changed to 5e1457cc14a3867846bd2b279b4de31f45dd4c720088edf4cf65a7d0993454ec
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe shadow-4.14.2-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 1070 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_patch)
NOTE: Running task 1071 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_patch)
NOTE: Running task 1072 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: Running task 1076 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: Running task 1077 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1078 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_unpack)
NOTE: Running task 1084 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1091 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: Running task 1092 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_fetch)
NOTE: Running task 1093 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1094 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 1095 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_patch: Started
NOTE: recipe iptables-1.8.10-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.6.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1108 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Started
NOTE: Running noexec task 1153 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_fetch)
NOTE: Running task 1155 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: recipe iproute2-6.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1156 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1158 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1180 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_collect_spdx_deps)
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.6.0-r0: task do_unpack: Started
NOTE: Running task 1186 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1187 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 707 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe iptables-1.8.10-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 709 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: Running task 1190 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: Running task 1191 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1192 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: Running task 1194 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe iproute2-6.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1195 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1196 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_patch)
NOTE: recipe gawk-5.3.0-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1202 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_populate_lic)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.0-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe iproute2-6.6.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Started
NOTE: recipe elfutils-0.190-r0: task do_populate_lic: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-6.6.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: recipe elfutils-0.190-r0: task do_populate_lic: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_populate_lic unihash changed to e01a09fe4c952a70d26b4ad5ffe83850139ca3643dfbded07e14ef06e70c4e83
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to 1b289daa5d841925e07ab00423babb94bc6e19d3bbe94736fb84a615e6d75ab6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 11ba2cc354e3be468afb4138853584962788f393d9169d6de29653b2024c6b18
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: Running setscene task 510 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running task 1209 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: Running task 1214 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
NOTE: Running task 1215 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: Running task 1216 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_patch)
NOTE: Running task 1217 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1219 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_patch: Started
NOTE: recipe psmisc-23.6-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1234 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Started
NOTE: Running task 1236 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1237 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 1238 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.41-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: recipe python3-3.11.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1247 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Setscene tasks completed
NOTE: Running task 1248 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1249 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_patch)
NOTE: Running task 1250 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Succeeded
NOTE: Running noexec task 1252 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_configure)
NOTE: Running noexec task 1253 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_compile)
NOTE: Running task 1254 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_install)
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Succeeded
NOTE: Running task 1267 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1270 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1271 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1272 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1273 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1275 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1276 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1277 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Succeeded
NOTE: Running task 1278 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to 628f06440e9d67cc0464568d4d3844c74e30d40eda74c77f54d924e16efb13e3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: recipe linux-libc-headers-6.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package unihash changed to a608ed1dd95ad52ccc321f6349910fa5293e46dfd741b9a9834e6bc55b0a9d75
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_create_spdx became valid
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Succeeded
NOTE: Running setscene task 703 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: Running setscene task 704 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_create_spdx_setscene)
NOTE: Running task 1279 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1289 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_install: Succeeded
NOTE: Running task 1291 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1292 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe musl-1.2.4+git-r0: task do_package: Started
NOTE: recipe libgcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1293 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_configure)
NOTE: recipe libgcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1294 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_compile)
NOTE: recipe libgcc-13.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to 9a45e3242ba735d5290f6e1ab12ca7a74923f4e8840dc7af9233311d9447e706
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: recipe libgcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 707 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1295 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1298 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-13.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-13.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1299 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_multilib_install)
NOTE: recipe libgcc-13.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-13.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1300 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-13.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-13.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1302 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1303 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1304 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_configure)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package unihash changed to 46cb4e2fc6b8ddaf438d2f72f6f64798b1e29c985c5ac0a28f515c3846694329
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata became valid
NOTE: Running setscene task 547 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 548 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1307 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_collect_spdx_deps)
NOTE: Running task 1310 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm unihash changed to 816ccfbab10db02069f86cb969a58c5a8aca2099bd0b58826634e349da7eae2e
NOTE: recipe gcc-runtime-13.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1311 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_compile)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1312 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_install)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1314 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1320 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1321 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1322 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1323 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1324 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package)
NOTE: Running task 1325 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1326 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1328 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1329 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1330 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1331 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1333 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1334 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1335 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_configure)
NOTE: recipe zstd-1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1336 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_configure)
NOTE: recipe zlib-1.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1337 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1338 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1339 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1340 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1341 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1342 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1343 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe libtirpc-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1344 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 1345 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1346 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_configure)
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1347 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: recipe opkg-utils-0.6.3-r0: task do_configure: Started
NOTE: Running task 1348 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_compile)
NOTE: Running task 1349 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1350 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: Running task 1351 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_compile)
NOTE: recipe libtirpc-1.3.4-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1352 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_install)
NOTE: recipe zlib-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1353 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.6.3-r0: task do_install: Started
NOTE: recipe zlib-1.3-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1354 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_compile)
NOTE: recipe opkg-utils-0.6.3-r0: task do_install: Succeeded
NOTE: Running task 1356 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3-r0: task do_compile: Started
NOTE: recipe openssl-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1357 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_configure)
NOTE: recipe openssl-3.2.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1358 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1359 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_install)
NOTE: recipe zlib-1.3-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3-r0: task do_install: Succeeded
NOTE: Running task 1361 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1362 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: recipe zlib-1.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1365 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_configure)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1366 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1367 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1368 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1369 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_configure: Succeeded
NOTE: Running task 1370 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1371 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1372 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_compile)
NOTE: recipe xz-5.4.4-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1373 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package unihash changed to c46c642b50faf844a93334fd68491414cef453e21cdc826d10e79489d3476251
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx became valid
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Succeeded
NOTE: Running setscene task 679 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1374 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_compile)
NOTE: Running task 1375 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: Running task 1376 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure_ptest_base)
NOTE: Running task 1377 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: Running task 1378 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: Running task 1379 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: Running task 1380 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1381 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 712 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1382 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: Running task 1383 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1384 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running task 1385 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1386 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1387 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: Running task 1388 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_install: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1390 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1391 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1392 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe opkg-utils-0.6.3-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1393 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe zlib-1.3-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1398 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1399 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1400 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_configure)
NOTE: Running task 1401 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe openssl-3.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1402 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_compile)
NOTE: recipe ncurses-6.4-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.2.0-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.11-r0: task do_install: Succeeded
NOTE: Running task 1404 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1406 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1407 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_package: Succeeded
NOTE: Running task 1408 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package unihash changed to 7c3b9d494421d62360d1e76e2a5c73945d1a58527a3fd7ba322ab6789d1e0803
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx became valid
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1409 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe libpam-1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1410 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1411 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1412 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1414 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe zlib-1.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_package unihash changed to c0f4544f1bb865e10f0fbbd979297c994828b14f83e6eaa4af1c74b8545810c7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata became valid
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running setscene task 700 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running task 1415 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile_ptest_base)
NOTE: Running task 1416 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: Running task 1417 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1418 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1419 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1421 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1423 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1427 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_package: Started
NOTE: Running task 1428 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1429 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure)
NOTE: recipe perl-5.38.2-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 062f6e58ed669432cc6897730f3747fc270bf8cd9b19c83d541dec0799426d51
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx became valid
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1431 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1432 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package unihash changed to 1f87f860fdde216de62ccc33af21bb20fbfea6038080d28357451551a2df6ee9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata became valid
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Succeeded
NOTE: Running setscene task 706 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running task 1433 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: Running task 1434 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1435 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_compile)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1439 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe xz-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1440 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_compile)
NOTE: recipe xz-5.4.4-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 7e5446e140f06bdda8e9eca933ed3e243747f9fb06946955355e0a7543d69a0b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.3-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 709 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1443 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_install)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1447 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1448 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package)
NOTE: Running task 1449 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1454 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.4-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1457 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to e5b7c62f7155251d84605db9929758a8a026543400764c5a974c5a5abc5c9bf6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 703 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running task 1459 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1461 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe libgpg-error-1.47-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe xz-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Started
NOTE: Running task 1463 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_install)
NOTE: recipe libgpg-error-1.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1464 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install)
NOTE: recipe xz-5.4.4-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1467 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1468 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_install: Succeeded
NOTE: Running task 1469 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 573ec5da1aaf06fdc07323a650295965d6ef85525d17a573248e013d69d4b7be
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: recipe libgpg-error-1.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running task 1471 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package unihash changed to 499cc9f5dea3d99152d73d33ff2dcfcd87031bbc16bd07016654cf177559f5e6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx became valid
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: Running setscene task 706 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: Running task 1473 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1474 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1476 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_package)
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.4-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to 8bc074af123100b2deddcbc72fa996ce057f6a7df3bbcb3b5584d76d127d4440
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx became valid
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to 4891bb2a00c550db9efc6777a0c6acf0fae1a56ca7283757c75e14b8deee6404
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx became valid
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package: Succeeded
NOTE: Running setscene task 703 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running task 1483 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package unihash changed to 5f2ddecaec61040ed4638b16257d5f443ff5f765f1f4558845ba62d176036945
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx became valid
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 706 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx_setscene)
NOTE: Running task 1484 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1485 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1486 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_configure_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1490 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1491 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running task 1492 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile)
NOTE: recipe mpfr-4.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1493 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_configure)
NOTE: recipe mpfr-4.2.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe xz-5.4.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_package unihash changed to 667f2fc05a1027e7286e967f26eefaff87482777e730483aa7e95a5f13b09443
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata became valid
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: Running task 1497 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_compile)
NOTE: recipe ncurses-6.4-r0: task do_compile: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1505 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to ef2f8fa8b70c0409181d66a9f648d2b63b2d141c2c3e4b494e67dd72c6474c38
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Running setscene task 712 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running task 1506 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package unihash changed to c7eb12aadda51a477d4e887c86d288c61185833b2f7f8406d7eab1d7d7416452
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx became valid
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 707 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1507 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1508 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1513 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1515 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_configure)
NOTE: recipe iptables-1.8.10-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe libcap-ng-0.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1523 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_configure)
NOTE: recipe libcap-ng-0.8.4-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe zstd-1.5.5-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe libarchive-3.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_configure)
NOTE: recipe libarchive-3.7.2-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_package)
NOTE: recipe zstd-1.5.5-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_configure: Succeeded
NOTE: Running task 1532 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package unihash changed to 08d9a3a6299ce80c892adb54a516c8d03b8021d643312745a6b3728a96c7d4a3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx became valid
NOTE: recipe iptables-1.8.10-r0: task do_configure: Succeeded
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: Running task 1533 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: Running task 1534 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_compile)
NOTE: recipe zstd-1.5.5-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_package unihash changed to 9d8e7205306c26d11d40dfd836f1b24b9fa5fb2d1082e4e0104581583a2bff86
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx became valid
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: Running setscene task 701 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running task 1536 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: Running task 1537 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_install)
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1539 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe ncurses-6.4-r0: task do_install: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1541 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1543 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_package)
NOTE: Running task 1545 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1546 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe base-passwd-3.6.3-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 1547 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe mpfr-4.2.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1548 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_compile)
NOTE: recipe mpfr-4.2.1-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1550 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1556 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe base-passwd-3.6.3-r0: task do_package: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_package unihash changed to 849f75f6fd798cf1760a3f99ce2f657e8aac42d179a01ca5d0e95d158c92105d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx became valid
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_compile)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_install)
NOTE: recipe libcap-ng-0.8.4-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe iptables-1.8.10-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1564 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe iptables-1.8.10-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_package)
NOTE: recipe iptables-1.8.10-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1567 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 9f1e0faf533bd588da62f440a23ac474096f86c57c75d9aab500afd3d0f1e355
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: recipe libcap-ng-0.8.4-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_install: Started
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running task 1568 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package unihash changed to b534a9679d218ff21b2d44f389ef76082a9a65b58936b3da50af1d0b662a75eb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata became valid
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_install: Started
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running task 1573 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_install: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running task 1579 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_package: Started
NOTE: recipe mpfr-4.2.1-r0: task do_install: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1582 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_package)
NOTE: Running task 1583 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.1-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_package unihash changed to ee910d96e9288f148b6f61ad6a94dd229b6ffefa40d67751cf9854d3ccd5768e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_package: Succeeded
NOTE: Running task 1590 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_package unihash changed to 4e45460522577ecd1f3cc8aea67454350861f268a195c60231c77c76f10032a9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx became valid
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to faceb0e1409fad37d24e8e7af18ac9c4c47c5c257e3f95f032fab807ded3ab25
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1592 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_collect_spdx_deps)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1596 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1601 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1602 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package unihash changed to c902d4418fbc8a62acea86b900d05cdd97eb094b5665f6da2dc8f8a9f65ceffb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_package: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_package unihash changed to 412d0906cb6aab36d43d4831b5ac822c3ce35b44d5e000ef23478af178bc99dc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata became valid
NOTE: Running setscene task 706 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: Running task 1603 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_install_ptest_base)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_package unihash changed to 797563cce8574a55c93a4de953e75b2272fcdbd5d0888572706dceb971ca58cc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata became valid
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_package unihash changed to f244a469ec3eefdf625f54209ab28edc17adc7f6565ee212e97b8af8c5791c4e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to 9e0cd83ad4bd5d678afa7c2115ad527130145624bfc6732051d85ee7561ad4fa
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running task 1605 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1606 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package)
NOTE: Running task 1607 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1608 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1609 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_install)
NOTE: Running task 1610 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: Running task 1611 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1612 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_configure)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1615 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: Running task 1618 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_configure: Started
NOTE: recipe shadow-4.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_install: Started
NOTE: Running task 1619 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.69-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_compile)
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_configure: Started
NOTE: Running task 1631 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.69-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1638 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_package)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_install: Succeeded
NOTE: Running task 1640 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_package)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-ng-0.8.4-r0: task do_package: Started
NOTE: Running task 1646 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1648 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libmpc-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmpc-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1656 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1657 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package unihash changed to f245af10383a42fc3be94ff3e8a20fcfb7e4e1df1db763f77f2c0bcd80ba4f34
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-2.69-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_install)
NOTE: recipe libcap-2.69-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_package: Succeeded
NOTE: Running task 1660 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_package unihash changed to 5578e547ccb24d9dce94f289cf23a942ce576031291897fe200b058741d0caa9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata became valid
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_package unihash changed to 65a82e588fb45936510e3a2289ba530cd6595d202993a3d511ae33c5874595a6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata became valid
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_create_spdx_setscene)
NOTE: Running task 1661 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_install: Succeeded
NOTE: Running task 1664 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1665 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1666 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1667 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20230828-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1670 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1671 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_configure)
NOTE: Running task 1672 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1673 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_install: Succeeded
NOTE: Running task 1675 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20230828-3.1-r0: task do_configure: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_configure: Started
NOTE: Running task 1676 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1677 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe util-linux-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1678 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_configure: Started
NOTE: Running task 1679 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1680 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure: Started
NOTE: recipe coreutils-9.4-r0: task do_configure: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe libarchive-3.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_compile)
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 04515e635a3655822a7a9ed516edda0389643a87cbcd557edd3615beb094a260
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb became valid
NOTE: recipe libarchive-3.7.2-r0: task do_compile: Started
NOTE: Running setscene task 707 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 709 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package unihash changed to e165c6b1544ffe637337c71f85e22bc1ceadade53366acaadef141384f325ac5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata became valid
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 712 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1685 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1687 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe gcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1688 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_configure)
NOTE: recipe gcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libpam-1.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_package unihash changed to 06041474bf4b8c5328e7a103ef3fe2da49d02a8f8651ad81b20ae74b771637a4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx became valid
NOTE: Running setscene task 708 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1689 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1692 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package)
NOTE: recipe libcap-2.69-r0: task do_package: Started
NOTE: recipe libarchive-3.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_install)
NOTE: recipe libarchive-3.7.2-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe gcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1695 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe gcc-13.2.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.7.2-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package)
NOTE: recipe libarchive-3.7.2-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1698 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure_ptest_base)
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1699 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_compile)
NOTE: recipe perl-5.38.2-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package unihash changed to 8bfb304cfc55b7a62db502e2d26e413a391163d65230e835fa53c20bd5a08969
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx became valid
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running task 1700 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package unihash changed to 8a9559c0efb131fb968ed707596909fe49b863bb20e56b791cc3779cff0a4529
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package_write_deb became valid
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package_write_ipk_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_configure: Succeeded
NOTE: Running task 1702 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_compile)
NOTE: recipe libarchive-3.7.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1703 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_compile)
NOTE: recipe libarchive-3.7.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 1707 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.7.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_compile: Started
NOTE: Running task 1709 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1711 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 799da1699c0f8bb543c97a9ae169e26ff93fc07be5a743d531fe73420947a987
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: recipe psmisc-23.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running task 1714 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1715 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure: Started
NOTE: recipe psmisc-23.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1716 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_configure)
NOTE: recipe shadow-4.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1718 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_collect_spdx_deps)
NOTE: recipe psmisc-23.6-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe gcc-13.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1724 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1727 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_install)
NOTE: recipe openssl-3.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1730 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_install)
NOTE: recipe libedit-20230828-3.1-r0: task do_install: Started
NOTE: recipe openssl-3.2.0-r0: task do_install: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to ab8c2d8b002d3939412528008c60fec5953893179181acb12f7b5fc3047e6552
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: recipe shadow-4.14.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 703 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running task 1732 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_install: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm unihash changed to 213ccb21baa0c483ce8d6c4a21df09d6779257a27340bd825c6fd7a7c9981456
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1734 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_package)
NOTE: Running task 1735 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1737 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20230828-3.1-r0: task do_package: Started
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_package_write_rpm unihash changed to 450f64932b4227ab8068730af5fe33a76350ddb0f66b40e8820988332ba5fcf3
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1738 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1739 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_compile)
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Started
NOTE: recipe shadow-4.14.2-r0: task do_install: Succeeded
NOTE: Running task 1740 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_package)
NOTE: Running task 1742 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.14.2-r0: task do_package: Started
NOTE: recipe openssl-3.2.0-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_install_ptest_base)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1744 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe openssl-3.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_compile: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_package: Succeeded
NOTE: Running task 1746 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_package unihash changed to 10eb1c70ef7a585982424db37341334de22978bfddb94a212839adcc34d91037
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata became valid
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_install: Started
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 7df7c6fc63dcdabb023131fe449f813dae9b05fc99a5c54ea073d415876f279e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_install: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_configure: Succeeded
NOTE: Running task 1748 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure_ptest_base)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1750 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile)
NOTE: recipe bash-5.2.21-r0: task do_compile: Started
NOTE: recipe openssl-3.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1751 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: Running task 1753 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_package)
NOTE: Running task 1754 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.2.0-r0: task do_package: Started
NOTE: recipe python3-3.11.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1755 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe python3-3.11.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1757 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_configure)
NOTE: recipe python3-3.11.5-r0: task do_configure: Started
NOTE: recipe shadow-4.14.2-r0: task do_package: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_package unihash changed to 9fa9cca596fe5d9b2f3ca2e65b09d87e22c95c0aba7120dd1bb1bf9e2e3f3987
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata became valid
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: Running task 1759 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1760 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 1764 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_compile: Succeeded
NOTE: Running task 1766 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package: Succeeded
NOTE: Running task 1767 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata unihash changed to 84026fb6a5f8d5b7607a80d060874286ca63a40d5ac87eba6ceeb1b604fce208
NOTE: Running task 1768 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx)
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package unihash changed to 42996694b4f146248b4495ea93d23e64f7b023044b71c2a8ea7801336b71ea38
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata became valid
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running task 1769 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1770 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1773 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.39.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1774 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1775 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_compile)
NOTE: recipe util-linux-2.39.3-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1777 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_install)
NOTE: recipe libgcrypt-1.10.3-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1778 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install)
NOTE: recipe libgcrypt-1.10.3-r0: task do_install: Succeeded
NOTE: Running task 1779 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 1780 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package)
NOTE: recipe psmisc-23.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1783 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1784 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe libgcrypt-1.10.3-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_compile: Succeeded
NOTE: Running task 1785 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_install)
NOTE: recipe psmisc-23.6-r0: task do_install: Started
NOTE: recipe psmisc-23.6-r0: task do_install: Succeeded
NOTE: Running task 1786 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1788 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_compile)
NOTE: recipe gawk-5.3.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_package: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package unihash changed to 686b58e0f8801750d01aa5fb9a577db5f3aba26db449197aab853416e45d904a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package unihash changed to ff8c38e66862b7fd995fdb5448a789654846dfea9e7fe0a4ad2c3283518a4dbe
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 709 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 596d0b4b052a72dd77dd2470f66470a60bf214795b730c010e6cdd23500466af
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_compile_ptest_base)
NOTE: Running task 1793 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_compile_ptest_base: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1795 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk)
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Started
NOTE: Running task 1796 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb)
NOTE: Running task 1797 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb unihash changed to f9163600bfa56297faed50b164827bf656cd3f7009b0e8cac145ef95dc3cb9b2
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk unihash changed to 812d6847cc4103a943d0cd23046085c90dbb71fe5d1b134fd74fca51c88d48fc
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to d973dece6af2b37ee7262b76363dbe628185f020e8a74041dba48f7bce58817f
NOTE: recipe util-linux-2.39.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1798 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_install)
NOTE: recipe util-linux-2.39.3-r0: task do_install: Started
NOTE: recipe gawk-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1799 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1800 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package)
NOTE: recipe util-linux-2.39.3-r0: task do_install: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1801 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_install)
NOTE: Running task 1802 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_package: Started
NOTE: recipe gawk-5.3.0-r0: task do_install: Started
NOTE: recipe util-linux-2.39.3-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1803 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package)
NOTE: recipe util-linux-2.39.3-r0: task do_package: Started
NOTE: recipe gawk-5.3.0-r0: task do_install: Succeeded
NOTE: Running task 1804 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_install_ptest_base)
NOTE: recipe gawk-5.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package unihash changed to e8947a888582a027b0904b2e719656e4eb57a6d3ed7ce76a0e0a4f45938e780f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx became valid
NOTE: Running setscene task 710 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1805 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1808 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe coreutils-9.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_compile)
NOTE: recipe coreutils-9.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe gawk-5.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package unihash changed to 7f75fdb1a20c2e91e277eca4c11b902860d62c49562b467e35aa178451d7528d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_configure: Succeeded
NOTE: Running task 1812 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_configure_ptest_base)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1814 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1816 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: Running task 1817 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_compile)
NOTE: recipe curl-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_configure)
NOTE: recipe gnutls-3.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe python3-3.11.5-r0: task do_compile: Started
NOTE: recipe curl-8.5.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1820 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_configure)
NOTE: recipe gnutls-3.8.2-r0: task do_configure: Started
NOTE: recipe openssl-3.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_package unihash changed to 71fd3d43b05787c3ec7d582aabd9bcf853257fcb506dc967b5bcb011388b6aca
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx became valid
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package unihash changed to c181b1e1e8c2d7ce580b57882f965aa1c590df6a31155fd63d5877c1a0efa407
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx became valid
NOTE: Running setscene task 706 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 708 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1825 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 1826 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_compile: Succeeded
NOTE: Running task 1827 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1828 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_install)
NOTE: recipe coreutils-9.4-r0: task do_install: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package unihash changed to 62952c8d98fd605f834990151bfce1b5a5f832682ade2df1fc6fd868d83aea6f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.4-r0: task do_install: Succeeded
NOTE: Running task 1830 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1831 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package)
NOTE: recipe coreutils-9.4-r0: task do_package: Started
NOTE: recipe python3-3.11.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1832 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1833 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_install)
NOTE: recipe python3-3.11.5-r0: task do_install: Started
NOTE: recipe curl-8.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1834 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1835 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_compile)
NOTE: recipe curl-8.5.0-r0: task do_compile: Started
NOTE: recipe perl-5.38.2-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.38.2-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.38.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1837 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_install)
NOTE: recipe coreutils-9.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package unihash changed to d6060a85d64877377a402923678e2a8a34f71db815b8f9b20bae18fb0b553788
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata became valid
NOTE: recipe perl-5.38.2-r0: task do_install: Started
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1839 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe curl-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1840 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_compile)
NOTE: recipe gnutls-3.8.2-r0: task do_compile: Started
NOTE: recipe python3-3.11.5-r0: task do_install: Succeeded
NOTE: Running task 1843 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_install_ptest_base)
NOTE: recipe python3-3.11.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.11.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1844 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package)
NOTE: recipe python3-3.11.5-r0: task do_package: Started
NOTE: recipe curl-8.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1845 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_install)
NOTE: recipe curl-8.5.0-r0: task do_install: Started
NOTE: recipe curl-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1846 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1848 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_package)
NOTE: recipe curl-8.5.0-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_install: Succeeded
NOTE: Running task 1849 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_install_ptest_base)
NOTE: recipe perl-5.38.2-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_package unihash changed to 33ac2b1e7c3ae671f71edf913e9fc2795eab7522fb4aa45605b1be53414e194b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_create_spdx became valid
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package unihash changed to 56cda27b79706cf7c7e0fe20922074bce58e0a1554ba00f01bff37aff55b19cc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata became valid
NOTE: recipe curl-8.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.38.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1854 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1855 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.38.2-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1858 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 1859 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1860 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 1861 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1862 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1863 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1864 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_install)
NOTE: recipe gnutls-3.8.2-r0: task do_install: Started
NOTE: recipe gnutls-3.8.2-r0: task do_install: Succeeded
NOTE: Running task 1865 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.2-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1867 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.2-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_package unihash changed to 76e6161fa8c295c55c936fddb6d160758cf4752df24c5c3f1b62d9300a9b468a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata became valid
NOTE: Running setscene task 712 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1872 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1873 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Started
NOTE: recipe perl-5.38.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package unihash changed to e4253d70ab3ed7a6953387e0fc4c1aaf61f36e33c551ef62263efcf3bbc3492b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk became valid
NOTE: Running setscene task 711 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 712 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_install: Succeeded
NOTE: Running task 1876 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1877 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package)
NOTE: recipe elfutils-0.190-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Started
NOTE: recipe elfutils-0.190-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_configure)
NOTE: recipe elfutils-0.190-r0: task do_configure: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 1883 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package unihash changed to 815fb0f5dfaf1744a570191bcf969162520765f680afe523cb9365745850ed5e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata became valid
NOTE: Running setscene task 713 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1886 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.190-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.190-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package unihash changed to 0400e08d7797bf86344e165960381b8ddee5e91f10162648b46c818c4582021b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 714 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1888 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_ipk)
NOTE: Running task 1889 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_deb)
NOTE: Running task 1890 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.4-r0: task do_package_write_ipk: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_deb: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_ipk unihash changed to 621e9989fb1140ed9f119ea23366ca7af63d0dff354298bffe5a9d3b26db2406
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm unihash changed to 38aa0c0a4c04d1873172be2900cd9da86f7fdde27ca6da4a2ef60b106ec892e9
NOTE: recipe elfutils-0.190-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1891 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.190-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.190-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1892 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_compile)
NOTE: recipe elfutils-0.190-r0: task do_compile: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_deb unihash changed to ca5facccb850dbd6e87e27060e92bc829d4ed5d840bc171b19102ff35b7b95d9
NOTE: recipe coreutils-9.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_rpm unihash changed to 6a85597415ccefc8b7b9061dccf0a13ecbb73be693660c0dd3952aedb6521890
NOTE: recipe elfutils-0.190-r0: task do_compile: Succeeded
NOTE: Running task 1893 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.190-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.190-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1894 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_install)
NOTE: recipe elfutils-0.190-r0: task do_install: Started
NOTE: recipe elfutils-0.190-r0: task do_install: Succeeded
NOTE: Running task 1895 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.190-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.190-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1896 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_package)
NOTE: Running task 1897 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.190-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.190-r0: task do_package: Started
NOTE: recipe elfutils-0.190-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1898 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1900 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_configure)
NOTE: recipe iproute2-6.6.0-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1901 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_configure: Started
NOTE: recipe iproute2-6.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_compile)
NOTE: recipe iproute2-6.6.0-r0: task do_compile: Started
NOTE: recipe binutils-2.41-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_compile: Started
NOTE: recipe iproute2-6.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_install)
NOTE: recipe iproute2-6.6.0-r0: task do_install: Started
NOTE: recipe iproute2-6.6.0-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.190-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_packagedata)
NOTE: recipe elfutils-0.190-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.190-r0: task do_packagedata: Succeeded
NOTE: Running task 1906 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_package)
NOTE: Running task 1907 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.190.bb:do_create_spdx)
NOTE: recipe iproute2-6.6.0-r0: task do_package: Started
NOTE: recipe elfutils-0.190-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.190-r0: task do_create_spdx: Succeeded
NOTE: Running task 1908 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 1909 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.6.0-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_packagedata)
NOTE: recipe iproute2-6.6.0-r0: task do_packagedata: Started
NOTE: recipe gcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1911 of 1934 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_install)
NOTE: recipe gcc-13.2.0-r0: task do_install: Started
NOTE: recipe iproute2-6.6.0-r0: task do_packagedata: Failed
NOTE: recipe gcc-13.2.0-r0: task do_install: Succeeded
NOTE: recipe binutils-2.41-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1911 tasks of which 1236 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115062501.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115062501.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_packagedata
Summary: There were 21 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.7.0-r0 to 0:6.6.0-r0) [version-going-backwards]
ERROR: iproute2-6.6.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/iproute2/6.6.0/temp/log.do_packagedata.3363404
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb:do_packagedata) failed with exit code '1'

--===============6429607857104567168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.189-0.190.patch"

RnJvbSBiNjg4ODcwMjI3MDAwMjk1YjM0YTQ5NzA5MGY2NGUxNmFlNGFjMzlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDY6MzQ6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGZ1dGlsczogdXBncmFkZSAwLjE4OSAtPiAwLjE5MAoKLS0tCiAuLi4ve2VsZnV0aWxzXzAuMTg5
LmJiID0+IGVsZnV0aWxzXzAuMTkwLmJifSAgfCAgIDIgKy0KIC4uLjAwMS1BZGQtaGVscGVyLWZ1
bmN0aW9uLWZvci1iYXNlbmFtZS5wYXRjaCB8IDExNyArKysrKysrKysrKystLS0tLS0KIC4uLi9l
bGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaCB8ICAxMiArLQogLi4ubGli
YXNtLW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZvdW5kLnBhdGNoIHwgICA2ICstCiAuLi4tY2hl
Y2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2ggfCAgIDYgKy0KIC4uLi1za2lw
LXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBsb3llZC5wYXRjaCB8ICAgMiArLQogLi4ubS1jb21w
aWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoIHwgICA2ICstCiAuLi5jdnRfZ3Vu
aGFzaC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2ggfCAgIDggKy0KIC4uLi9lbGZ1dGls
cy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBhdGNoICB8ICAgNiArLQogLi4uL2VsZnV0aWxz
L2ZpbGVzLzAwMDMtbXVzbC11dGlscy5wYXRjaCAgICAgIHwgICA2ICstCiAuLi4vMDAwNi1GaXgt
YnVpbGQtb24tYWFyY2g2NC1tdXNsLnBhdGNoICAgICAgfCAgIDIgKy0KIC4uLi9lbGZ1dGlscy9m
aWxlcy9wdGVzdC5wYXRjaCAgICAgICAgICAgICAgICB8ICAxMCArLQogMTIgZmlsZXMgY2hhbmdl
ZCwgMTExIGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy97ZWxmdXRpbHNfMC4xODkuYmIgPT4gZWxmdXRpbHNfMC4xOTAu
YmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Vs
ZnV0aWxzXzAuMTg5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxz
XzAuMTkwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE4OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTkwLmJiCmluZGV4IGU5YjQzMmU0ZTkuLjY3
NTNkMGFlN2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1
dGlsc18wLjE4OS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRp
bHNfMC4xOTAuYmIKQEAgLTI2LDcgKzI2LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL3NvdXJjZXdh
cmUub3JnL2VsZnV0aWxzL2Z0cC8ke1BWfS8ke0JQfS50YXIuYnoyIFwKIFNSQ19VUkk6YXBwZW5k
OmxpYmMtbXVzbCA9ICIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMy1tdXNsLXV0aWxzLnBhdGNo
IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM5YmQ4ZjFhMzM4ZTJiN2Nk
NGFiYzNmZjExYTBlZGRjNmU2OTBmNjk1NzhhNTc0NzhkODE3OWI0MTQ4NzA4YzgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOGUwMGEzYTliNWYwNGJjMWRjMjczYWU4NjI4MWQyZDI2ZWQ0MTIwMjBi
MzkxZmZjYzIzMTk4ZjEwMjMxZDY5MiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCBwdGVz
dCBwa2djb25maWcKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxz
L2ZpbGVzLzAwMDEtQWRkLWhlbHBlci1mdW5jdGlvbi1mb3ItYmFzZW5hbWUucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1BZGQtaGVscGVyLWZ1bmN0aW9u
LWZvci1iYXNlbmFtZS5wYXRjaAppbmRleCAzZTYwMzNmZDc1Li42NWQ3YTA0YTAyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1BZGQtaGVscGVy
LWZ1bmN0aW9uLWZvci1iYXNlbmFtZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMS1BZGQtaGVscGVyLWZ1bmN0aW9uLWZvci1iYXNlbmFtZS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjY2MzcyYTVkOGQ1YTIzMjAzYzcwZDU4MzkwNDA5N2M5
ZTQ5YzVhMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmYyY2JkMWZjYzBjMTJlY2Nh
MjUxNjVkNDIxZDRkNzBkMDNkZDdhNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDkgRGVjIDIwMjMgMTg6MjM6
MDMgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIGhlbHBlciBmdW5jdGlvbiBmb3IgYmFzZW5h
bWUKQEAgLTEyLDI3ICsxMiwzMSBAQCBsaWJyYXJpZXMgd2hpY2ggaGF2ZSBQT1NJWCBpbXBsZW1l
bnRhdGlvbiBvbmx5LgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vc291cmNl
d2FyZS5vcmcvcGlwZXJtYWlsL2VsZnV0aWxzLWRldmVsLzIwMjNxNC8wMDY3MjcuaHRtbF0KIFsx
XSBodHRwczovL2dpdC5tdXNsLWxpYmMub3JnL2NnaXQvbXVzbC9jb21taXQvP2lkPTcyNWUxN2Vk
NmRmZjRkMGNkMjI0ODdiYjY0NDcwODgxZTg2YTkyZTcKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CisKIC0tLQogIGxpYi9NYWtlZmlsZS5hbSAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCiAgbGliL2xpYmV1LmggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwotIGxpYi97bGliZXUuaCA9PiB4YmFzZW5hbWUuY30gICAgICAgICB8IDMxICsrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0KKyBsaWIveGJhc2VuYW1lLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgbGliZHcvZHdhcmZfZ2V0
c3JjX2ZpbGUuYyAgICAgICAgICAgIHwgIDMgKystCiAgbGliZHdmbC9jb3JlLWZpbGUuYyAgICAg
ICAgICAgICAgICAgIHwgIDMgKystCiAgbGliZHdmbC9kd2ZsX21vZHVsZV9nZXRzcmNfZmlsZS5j
ICAgIHwgIDMgKystCiAgbGliZHdmbC9kd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZS5jIHwgIDMg
KystCi0gbGliZHdmbC9maW5kLWRlYnVnaW5mby5jICAgICAgICAgICAgIHwgIDcgKysrKy0tLQor
IGxpYmR3ZmwvZmluZC1kZWJ1Z2luZm8uYyAgICAgICAgICAgICB8ICA3ICsrLS0tCiAgbGliZHdm
bC9saW5rX21hcC5jICAgICAgICAgICAgICAgICAgIHwgIDMgKystCiAgbGliZHdmbC9saW51eC1r
ZXJuZWwtbW9kdWxlcy5jICAgICAgIHwgIDMgKystCi0gc3JjL2FkZHIybGluZS5jICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgKysrLS0KLSBzcmMvYXIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNSArKystLQotIHNyYy9ubS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrLS0KKyBzcmMvYWRkcjJsaW5lLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0t
Cisgc3JjL2FyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKystLQorIHNyYy9u
bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQogIHNyYy9zdGFjay5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrLQogIHNyYy9zdHJpcC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCi0gdGVzdHMvc2hvdy1kaWUtaW5mby5jICAgICAgICAgICAg
ICAgIHwgIDIgKy0KLSB0ZXN0cy92YXJsb2NzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQotIDE3IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQot
IGNvcHkgbGliL3tsaWJldS5oID0+IHhiYXNlbmFtZS5jfSAoNTclKQorIHRlc3RzL01ha2VmaWxl
LmFtICAgICAgICAgICAgICAgICAgICB8ICAyICstCisgdGVzdHMvc2hvdy1kaWUtaW5mby5jICAg
ICAgICAgICAgICAgIHwgIDMgKystCisgdGVzdHMvdmFybG9jcy5jICAgICAgICAgICAgICAgICAg
ICAgIHwgIDMgKystCisgMTggZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi94YmFzZW5hbWUuYwogCitkaWZmIC0t
Z2l0IGEvbGliL01ha2VmaWxlLmFtIGIvbGliL01ha2VmaWxlLmFtCitpbmRleCBiM2JiOTI5Li5h
ZGE1MWMwIDEwMDY0NAogLS0tIGEvbGliL01ha2VmaWxlLmFtCiArKysgYi9saWIvTWFrZWZpbGUu
YW0KIEBAIC0zMyw3ICszMyw3IEBAIEFNX0NQUEZMQUdTICs9IC1JJChzcmNkaXIpLy4uL2xpYmVs
ZgpAQCAtNDQsOSArNDgsMTEgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICAJCSAgY3JjMzIuYyBjcmMzMl9maWxlLmMgXAogIAkJICBjb2xvci5jIGVycm9y
LmMgcHJpbnR2ZXJzaW9uLmMKICAKK2RpZmYgLS1naXQgYS9saWIvbGliZXUuaCBiL2xpYi9saWJl
dS5oCitpbmRleCBlODQ5YTc5Li4yYTExNWFjIDEwMDY0NAogLS0tIGEvbGliL2xpYmV1LmgKICsr
KyBiL2xpYi9saWJldS5oCi1AQCAtNDIsNiArNDIsNyBAQCBleHRlcm4gY2hhciAqeHN0cm5kdXAg
KGNvbnN0IGNoYXIgKiwgc2l6CitAQCAtNDIsNiArNDIsNyBAQCBleHRlcm4gY2hhciAqeHN0cm5k
dXAgKGNvbnN0IGNoYXIgKiwgc2l6ZV90KSBfX2F0dHJpYnV0ZV9fICgoX19tYWxsb2NfXykpOwog
IGV4dGVybiBjaGFyICp4YXNwcmludGYoY29uc3QgY2hhciAqZm10LCAuLi4pCiAgCV9fYXR0cmli
dXRlX18gKChmb3JtYXQgKHByaW50ZiwgMSwgMikpKSBfX2F0dHJpYnV0ZV9fICgoX19tYWxsb2Nf
XykpOwogIApAQCAtNTQsNiArNjAsOSBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogIGV4dGVybiB1aW50MzJfdCBjcmMzMiAodWludDMyX3QgY3JjLCB1bnNp
Z25lZCBjaGFyICpidWYsIHNpemVfdCBsZW4pOwogIGV4dGVybiBpbnQgY3JjMzJfZmlsZSAoaW50
IGZkLCB1aW50MzJfdCAqcmVzcCk7CiAgCitkaWZmIC0tZ2l0IGEvbGliL3hiYXNlbmFtZS5jIGIv
bGliL3hiYXNlbmFtZS5jCituZXcgZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uNjhk
NTE2MQogLS0tIC9kZXYvbnVsbAogKysrIGIvbGliL3hiYXNlbmFtZS5jCiBAQCAtMCwwICsxLDM5
IEBACkBAIC05Niw2ICsxMDUsOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogKyAgICBjb25zdCBjaGFyICpwID0gc3RycmNocihzLCAnLycpOwogKyAgICBy
ZXR1cm4gcCA/IHArMSA6IHM7CiArfQorZGlmZiAtLWdpdCBhL2xpYmR3L2R3YXJmX2dldHNyY19m
aWxlLmMgYi9saWJkdy9kd2FyZl9nZXRzcmNfZmlsZS5jCitpbmRleCA1Mjg5YzdkLi5mNzViZjdi
IDEwMDY0NAogLS0tIGEvbGliZHcvZHdhcmZfZ2V0c3JjX2ZpbGUuYwogKysrIGIvbGliZHcvZHdh
cmZfZ2V0c3JjX2ZpbGUuYwogQEAgLTM3LDYgKzM3LDcgQEAKQEAgLTEwNiw3ICsxMTcsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogIAogIGludAot
QEAgLTk4LDcgKzk5LDcgQEAgZHdhcmZfZ2V0c3JjX2ZpbGUgKER3YXJmICpkYmcsIGNvbnN0IGNo
YQorQEAgLTk4LDcgKzk5LDcgQEAgZHdhcmZfZ2V0c3JjX2ZpbGUgKER3YXJmICpkYmcsIGNvbnN0
IGNoYXIgKmZuYW1lLCBpbnQgbGluZW5vLCBpbnQgY29sdW1uLAogIAkgICAgICAvKiBNYXRjaCB0
aGUgbmFtZSB3aXRoIHRoZSBuYW1lIHRoZSB1c2VyIHByb3ZpZGVkLiAgKi8KICAJICAgICAgY29u
c3QgY2hhciAqZm5hbWUyID0gbGluZS0+ZmlsZXMtPmluZm9bbGFzdGZpbGVdLm5hbWU7CiAgCSAg
ICAgIGlmIChpc19iYXNlbmFtZSkKQEAgLTExNSw2ICsxMjYsOCBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkgICAgICBlbHNlCiAgCQlsYXN0bWF0Y2gg
PSBzdHJjbXAgKGZuYW1lMiwgZm5hbWUpID09IDA7CiAgCSAgICB9CitkaWZmIC0tZ2l0IGEvbGli
ZHdmbC9jb3JlLWZpbGUuYyBiL2xpYmR3ZmwvY29yZS1maWxlLmMKK2luZGV4IDg3Yzk0MGMuLjUy
YTM0YjggMTAwNjQ0CiAtLS0gYS9saWJkd2ZsL2NvcmUtZmlsZS5jCiArKysgYi9saWJkd2ZsL2Nv
cmUtZmlsZS5jCiBAQCAtMjksNiArMjksNyBAQApAQCAtMTI1LDcgKzEzOCw3IEBAIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgI2luY2x1ZGUgImxpYmR3ZmxQ
LmgiCiAgI2luY2x1ZGUgPGdlbGYuaD4KICAKLUBAIC01OTUsNyArNTk2LDcgQEAgZHdmbF9jb3Jl
X2ZpbGVfcmVwb3J0IChEd2ZsICpkd2ZsLCBFbGYgKgorQEAgLTU5NSw3ICs1OTYsNyBAQCBkd2Zs
X2NvcmVfZmlsZV9yZXBvcnQgKER3ZmwgKmR3ZmwsIEVsZiAqZWxmLCBjb25zdCBjaGFyICpleGVj
dXRhYmxlKQogICAgICAgIGlmICghIF9fbGliZHdmbF9keW5hbWljX3ZhZGRyX2dldCAobW9kdWxl
LT5lbGYsICZmaWxlX2R5bmFtaWNfdmFkZHIpKQogIAljb250aW51ZTsKICAgICAgICBEd2ZsX01v
ZHVsZSAqbW9kOwpAQCAtMTM0LDYgKzE0Nyw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAgCQkJCSAgbW9kdWxlLT5mZCwgbW9kdWxlLT5lbGYsCiAgCQkJ
CSAgbW9kdWxlLT5sX2xkIC0gZmlsZV9keW5hbWljX3ZhZGRyLAogIAkJCQkgIHRydWUsIHRydWUp
OworZGlmZiAtLWdpdCBhL2xpYmR3ZmwvZHdmbF9tb2R1bGVfZ2V0c3JjX2ZpbGUuYyBiL2xpYmR3
ZmwvZHdmbF9tb2R1bGVfZ2V0c3JjX2ZpbGUuYworaW5kZXggNTEzYWY2Yi4uMDQxOGEyNiAxMDA2
NDQKIC0tLSBhL2xpYmR3ZmwvZHdmbF9tb2R1bGVfZ2V0c3JjX2ZpbGUuYwogKysrIGIvbGliZHdm
bC9kd2ZsX21vZHVsZV9nZXRzcmNfZmlsZS5jCiBAQCAtMzEsNiArMzEsNyBAQApAQCAtMTQ0LDcg
KzE1OSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAg
I2luY2x1ZGUgImxpYmR3UC5oIgogIAogIAotQEAgLTEwMyw3ICsxMDQsNyBAQCBkd2ZsX21vZHVs
ZV9nZXRzcmNfZmlsZSAoRHdmbF9Nb2R1bGUgKm1vCitAQCAtMTAzLDcgKzEwNCw3IEBAIGR3Zmxf
bW9kdWxlX2dldHNyY19maWxlIChEd2ZsX01vZHVsZSAqbW9kLAogIAkJewogIAkJICAvKiBNYXRj
aCB0aGUgbmFtZSB3aXRoIHRoZSBuYW1lIHRoZSB1c2VyIHByb3ZpZGVkLiAgKi8KICAJCSAgbGFz
dGZpbGUgPSBmaWxlOwpAQCAtMTUzLDYgKzE2OCw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCQkJCSAgICAgICBmbmFtZSk7CiAgCQl9CiAgCSAgICB9
CitkaWZmIC0tZ2l0IGEvbGliZHdmbC9kd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZS5jIGIvbGli
ZHdmbC9kd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZS5jCitpbmRleCAzZWY2MmE3Li4xNTYyMWFk
IDEwMDY0NAogLS0tIGEvbGliZHdmbC9kd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZS5jCiArKysg
Yi9saWJkd2ZsL2R3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlLmMKIEBAIC0yOSw2ICsyOSw3IEBA
CkBAIC0xNjMsNyArMTgwLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICAjaW5jbHVkZSAibGliZHdmbFAuaCIKICAjaW5jbHVkZSAiY29tbW9uLmgiCiAg
Ci1AQCAtNzE4LDcgKzcxOSw3IEBAIGR3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlIChEd2ZsICpk
d2ZsLAorQEAgLTcxOCw3ICs3MTksNyBAQCBkd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZSAoRHdm
bCAqZHdmbCwgaW50IG5keCwgY29uc3QgY2hhciAqbmFtZSwKICAJICAgICAgYmlhcyArPSBmaXh1
cDsKICAJICAgICAgaWYgKG1vZHVsZS0+bmFtZVswXSAhPSAnXDAnKQogIAkJewpAQCAtMTcyLDYg
KzE4OSw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAg
CQkgIG5hbWVfaXNfZmluYWwgPSB0cnVlOwogIAkJfQogIAkgICAgICBicmVhazsKK2RpZmYgLS1n
aXQgYS9saWJkd2ZsL2ZpbmQtZGVidWdpbmZvLmMgYi9saWJkd2ZsL2ZpbmQtZGVidWdpbmZvLmMK
K2luZGV4IDdmN2FiNjMuLjZhYWIxYTQgMTAwNjQ0CiAtLS0gYS9saWJkd2ZsL2ZpbmQtZGVidWdp
bmZvLmMKICsrKyBiL2xpYmR3ZmwvZmluZC1kZWJ1Z2luZm8uYwogQEAgLTMxLDYgKzMxLDcgQEAK
QEAgLTE4Miw3ICsyMDEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogICNpbmNsdWRlIDxzdGRpby5oPgogICNpbmNsdWRlIDxmY250bC5oPgogICNpbmNs
dWRlIDxzeXMvc3RhdC5oPgotQEAgLTE2NCw3ICsxNjUsNyBAQCBmaW5kX2RlYnVnaW5mb19pbl9w
YXRoIChEd2ZsX01vZHVsZSAqbW9kCitAQCAtMTY0LDcgKzE2NSw3IEBAIGZpbmRfZGVidWdpbmZv
X2luX3BhdGggKER3ZmxfTW9kdWxlICptb2QsIGNvbnN0IGNoYXIgKmZpbGVfbmFtZSwKICB7CiAg
ICBib29sIGNhbmNoZWNrID0gZGVidWdsaW5rX2NyYyAhPSAoR0VsZl9Xb3JkKSAwOwogIApAQCAt
MTkxLDcgKzIxMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAgICBjaGFyICpsb2NhbG5hbWUgPSBOVUxMOwogIAogICAgLyogV2UgaW52ZW50IGEgZGVi
dWdsaW5rIC5kZWJ1ZyBuYW1lIGlmIE5VTEwsIGJ1dCB0aGVuIHdhbnQgdG8gdHJ5IHRoZQotQEAg
LTI3OCw3ICsyNzksNyBAQCBmaW5kX2RlYnVnaW5mb19pbl9wYXRoIChEd2ZsX01vZHVsZSAqbW9k
CitAQCAtMjc4LDcgKzI3OSw3IEBAIGZpbmRfZGVidWdpbmZvX2luX3BhdGggKER3ZmxfTW9kdWxl
ICptb2QsIGNvbnN0IGNoYXIgKmZpbGVfbmFtZSwKICAJICBlbHNlCiAgCSAgICB7CiAgCSAgICAg
IHN1YmRpciA9IE5VTEw7CkBAIC0yMDAsNyArMjE5LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJICAgIH0KICAJICB0cnlfZmlsZV9iYXNlbmFtZSA9
IGRlYnVnbGlua19udWxsOwogIAkgIGJyZWFrOwotQEAgLTMwNiw3ICszMDcsNyBAQCBmaW5kX2Rl
YnVnaW5mb19pbl9wYXRoIChEd2ZsX01vZHVsZSAqbW9kCitAQCAtMzA2LDcgKzMwNyw3IEBAIGZp
bmRfZGVidWdpbmZvX2luX3BhdGggKER3ZmxfTW9kdWxlICptb2QsIGNvbnN0IGNoYXIgKmZpbGVf
bmFtZSwKICAJICAgIGlmIChtb2QtPmR3ICE9IE5VTEwgJiYgKHBbMF0gPT0gJ1wwJyB8fCBwWzBd
ID09ICcvJykpCiAgCSAgICAgIHsKICAJCWZkID0gdHJ5X29wZW4gKCZtYWluX3N0YXQsIGRpciwg
Ii5kd3oiLApAQCAtMjA5LDYgKzIyOCw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiAgCQlpZiAoZmQgPCAwKQogIAkJICB7CiAgCQkgICAgaWYgKGVycm5v
ICE9IEVOT0VOVCAmJiBlcnJubyAhPSBFTk9URElSKQorZGlmZiAtLWdpdCBhL2xpYmR3ZmwvbGlu
a19tYXAuYyBiL2xpYmR3ZmwvbGlua19tYXAuYworaW5kZXggNzZmMjMzNS4uY2RhYTdlZCAxMDA2
NDQKIC0tLSBhL2xpYmR3ZmwvbGlua19tYXAuYwogKysrIGIvbGliZHdmbC9saW5rX21hcC5jCiBA
QCAtMjksNiArMjksNyBAQApAQCAtMjE5LDcgKzI0MCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgI2luY2x1ZGUgIm1lbW9yeS1hY2Nlc3MuaCIKICAj
aW5jbHVkZSAic3lzdGVtLmgiCiAgCi1AQCAtNDY5LDcgKzQ3MCw3IEBAIHJlcG9ydF9yX2RlYnVn
ICh1aW50X2Zhc3Q4X3QgZWxmY2xhc3MsIHUKK0BAIC00NzUsNyArNDc2LDcgQEAgcmVwb3J0X3Jf
ZGVidWcgKHVpbnRfZmFzdDhfdCBlbGZjbGFzcywgdWludF9mYXN0OF90IGVsZmRhdGEsCiAgCQkg
ICAgICBpZiAocl9kZWJ1Z19pbmZvX21vZHVsZSA9PSBOVUxMKQogIAkJCXsKICAJCQkgIC8vIFhY
WCBob29rIGZvciBzeXNyb290CkBAIC0yMjgsNiArMjQ5LDggQEAgU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJCQkJCQkgICAgICBuYW1lLCBmZCwgZWxmLCBi
YXNlLAogIAkJCQkJCSAgICAgIHRydWUsIHRydWUpOwogIAkJCSAgaWYgKG1vZCAhPSBOVUxMKQor
ZGlmZiAtLWdpdCBhL2xpYmR3ZmwvbGludXgta2VybmVsLW1vZHVsZXMuYyBiL2xpYmR3ZmwvbGlu
dXgta2VybmVsLW1vZHVsZXMuYworaW5kZXggNThjMGM0MS4uYmRiZGU4MyAxMDA2NDQKIC0tLSBh
L2xpYmR3ZmwvbGludXgta2VybmVsLW1vZHVsZXMuYwogKysrIGIvbGliZHdmbC9saW51eC1rZXJu
ZWwtbW9kdWxlcy5jCiBAQCAtNDAsNiArNDAsNyBAQApAQCAtMjM4LDcgKzI2MSw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgI2luY2x1ZGUgImxpYmR3
ZmxQLmgiCiAgI2luY2x1ZGUgPGludHR5cGVzLmg+CiAgI2luY2x1ZGUgPGVycm5vLmg+Ci1AQCAt
MTE2LDcgKzExNyw3IEBAIHRyeV9rZXJuZWxfbmFtZSAoRHdmbCAqZHdmbCwgY2hhciAqKmZuYW0K
K0BAIC0xMTYsNyArMTE3LDcgQEAgdHJ5X2tlcm5lbF9uYW1lIChEd2ZsICpkd2ZsLCBjaGFyICoq
Zm5hbWUsIGJvb2wgdHJ5X2RlYnVnKQogIAkvKiBUcnkgdGhlIGZpbGUncyB1bmFkb3JuZWQgYmFz
ZW5hbWUgYXMgREVCVUdMSU5LX0ZJTEUsCiAgCSAgIHRvIGxvb2sgb25seSBmb3IgInZtbGludXgi
IGZpbGVzLiAgKi8KICAJZmQgPSBJTlRVU0UoZHdmbF9zdGFuZGFyZF9maW5kX2RlYnVnaW5mbykg
KCZmYWtlbW9kLCBOVUxMLCBOVUxMLCAwLApAQCAtMjQ3LDYgKzI3MCw4IEBAIFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCQkJCQkJICAgMCwgJmZha2Vtb2Qu
ZGVidWcubmFtZSk7CiAgCiAgICAgICAgaWYgKGZha2Vtb2QuZGVidWcubmFtZSAhPSBOVUxMKQor
ZGlmZiAtLWdpdCBhL3NyYy9hZGRyMmxpbmUuYyBiL3NyYy9hZGRyMmxpbmUuYworaW5kZXggZDkw
MmQ3OS4uNTM0NTE4OSAxMDA2NDQKIC0tLSBhL3NyYy9hZGRyMmxpbmUuYwogKysrIGIvc3JjL2Fk
ZHIybGluZS5jCiBAQCAtMzgsNiArMzgsNyBAQApAQCAtMjU3LDcgKzI4Miw3IEBAIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCiAgCiAgLyogTmFtZSBhbmQg
dmVyc2lvbiBvZiBwcm9ncmFtLiAgKi8KLUBAIC0zODUsNyArMzg2LDcgQEAgcHJpbnRfZHdhcmZf
ZnVuY3Rpb24gKER3ZmxfTW9kdWxlICptb2QsCitAQCAtMzg1LDcgKzM4Niw3IEBAIHByaW50X2R3
YXJmX2Z1bmN0aW9uIChEd2ZsX01vZHVsZSAqbW9kLCBEd2FyZl9BZGRyIGFkZHIpCiAgCQkgIGlm
IChmaWxlID09IE5VTEwpCiAgCQkgICAgZmlsZSA9ICI/Pz8iOwogIAkJICBlbHNlIGlmIChvbmx5
X2Jhc2VuYW1lcykKQEAgLTI2Niw3ICsyOTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogIAkJICBlbHNlIGlmICh1c2VfY29tcF9kaXIgJiYgZmlsZVsw
XSAhPSAnLycpCiAgCQkgICAgewogIAkJICAgICAgY29uc3QgY2hhciAqY29uc3QgKmRpcnM7Ci1A
QCAtNTY4LDcgKzU2OSw3IEBAIHByaW50X3NyYyAoY29uc3QgY2hhciAqc3JjLCBpbnQgbGluZW5v
LAorQEAgLTU2OCw3ICs1NjksNyBAQCBwcmludF9zcmMgKGNvbnN0IGNoYXIgKnNyYywgaW50IGxp
bmVubywgaW50IGxpbmVjb2wsIER3YXJmX0RpZSAqY3UpCiAgICBjb25zdCBjaGFyICpjb21wX2Rp
cl9zZXAgPSAiIjsKICAKICAgIGlmIChvbmx5X2Jhc2VuYW1lcykKQEAgLTI3NSw2ICszMDAsOCBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogICAgZWxzZSBp
ZiAodXNlX2NvbXBfZGlyICYmIHNyY1swXSAhPSAnLycpCiAgICAgIHsKICAgICAgICBEd2FyZl9B
dHRyaWJ1dGUgYXR0cjsKK2RpZmYgLS1naXQgYS9zcmMvYXIuYyBiL3NyYy9hci5jCitpbmRleCAz
YmNiMThmLi44ZjJkY2QwIDEwMDY0NAogLS0tIGEvc3JjL2FyLmMKICsrKyBiL3NyYy9hci5jCiBA
QCAtNDIsNiArNDIsNyBAQApAQCAtMjg1LDcgKzMxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCiAgCiAgLyogTmFtZSBhbmQgdmVyc2lvbiBvZiBw
cm9ncmFtLiAgKi8KLUBAIC0xMTMzLDcgKzExMzQsNyBAQCBkb19vcGVyX2luc2VydCAoaW50IG9w
ZXIsIGNvbnN0IGNoYXIgKmFyCitAQCAtMTEzMyw3ICsxMTM0LDcgQEAgZG9fb3Blcl9pbnNlcnQg
KGludCBvcGVyLCBjb25zdCBjaGFyICphcmZuYW1lLCBjaGFyICoqYXJndiwgaW50IGFyZ2MsCiAg
ICAgICAgZm9yIChpbnQgY250ID0gMDsgY250IDwgYXJnYzsgKytjbnQpCiAgCXsKICAJICBFTlRS
WSBlbnRyeTsKQEAgLTI5NCw3ICszMjEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogIAkgIGVudHJ5LmRhdGEgPSAmYXJndltjbnRdOwogIAkgIGlmICho
c2VhcmNoIChlbnRyeSwgRU5URVIpID09IE5VTEwpCiAgCSAgICBlcnJvcl9leGl0IChlcnJubywg
XygiY2Fubm90IGluc2VydCBpbnRvIGhhc2ggdGFibGUiKSk7Ci1AQCAtMTI0Miw3ICsxMjQzLDcg
QEAgZG9fb3Blcl9pbnNlcnQgKGludCBvcGVyLCBjb25zdCBjaGFyICphcgorQEAgLTEyNDIsNyAr
MTI0Myw3IEBAIGRvX29wZXJfaW5zZXJ0IChpbnQgb3BlciwgY29uc3QgY2hhciAqYXJmbmFtZSwg
Y2hhciAqKmFyZ3YsIGludCBhcmdjLAogICAgICAgIC8qIE9wZW4gYWxsIHRoZSBuZXcgZmlsZXMs
IGdldCB0aGVpciBzaXplcyBhbmQgYWRkIGFsbCBzeW1ib2xzLiAgKi8KICAgICAgICBmb3IgKGlu
dCBjbnQgPSAwOyBjbnQgPCBhcmdjOyArK2NudCkKICAJewpAQCAtMzAzLDkgKzMzMCwxMSBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkgIHNpemVfdCBi
bmFtZWxlbiA9IHN0cmxlbiAoYm5hbWUpOwogIAkgIGlmIChmb3VuZFtjbnRdID09IE5VTEwpCiAg
CSAgICB7CitkaWZmIC0tZ2l0IGEvc3JjL25tLmMgYi9zcmMvbm0uYworaW5kZXggZmJkZWU4ZS4u
MzY3NWY1OSAxMDA2NDQKIC0tLSBhL3NyYy9ubS5jCiArKysgYi9zcmMvbm0uYwotQEAgLTE0MTcs
NyArMTQxNyw3IEBAIHNob3dfc3ltYm9scyAoaW50IGZkLCBFYmwgKmVibCwgR0VsZl9FaGQKK0BA
IC0xNDE3LDcgKzE0MTcsNyBAQCBzaG93X3N5bWJvbHMgKGludCBmZCwgRWJsICplYmwsIEdFbGZf
RWhkciAqZWhkciwKICAJCQkgIGludCBsaW5lbm87CiAgCQkJICAodm9pZCkgZHdhcmZfbGluZW5v
IChsaW5lLCAmbGluZW5vKTsKICAJCQkgIGNvbnN0IGNoYXIgKmZpbGUgPSBkd2FyZl9saW5lc3Jj
IChsaW5lLCBOVUxMLCBOVUxMKTsKQEAgLTMxNCw3ICszNDMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkJCSAgaW50IG47CiAgCQkJICBuID0gb2Jz
dGFja19wcmludGYgKCZ3aGVyZW9iLCAiJXM6JWQlYyIsIGZpbGUsCiAgCQkJCQkgICAgICBsaW5l
bm8sICdcMCcpOwotQEAgLTE0NDgsNyArMTQ0OCw3IEBAIHNob3dfc3ltYm9scyAoaW50IGZkLCBF
YmwgKmVibCwgR0VsZl9FaGQKK0BAIC0xNDQ4LDcgKzE0NDgsNyBAQCBzaG93X3N5bWJvbHMgKGlu
dCBmZCwgRWJsICplYmwsIEdFbGZfRWhkciAqZWhkciwKICAJCXsKICAJCSAgLyogV2UgZm91bmQg
dGhlIGxpbmUuICAqLwogIAkJICBpbnQgbiA9IG9ic3RhY2tfcHJpbnRmICgmd2hlcmVvYiwgIiVz
OiUiIFBSSXU2NCAiJWMiLApAQCAtMzIzLDYgKzM1Miw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCQkJCQkgICgqZm91bmQpLT5saW5lbm8sCiAgCQkJ
CQkgICdcMCcpOwogIAkJICBzeW1fbWVtW25lbnRyaWVzX3VzZWRdLndoZXJlID0gb2JzdGFja19m
aW5pc2ggKCZ3aGVyZW9iKTsKK2RpZmYgLS1naXQgYS9zcmMvc3RhY2suYyBiL3NyYy9zdGFjay5j
CitpbmRleCA1MzRhYTkzLi4zYWJlZjk4IDEwMDY0NAogLS0tIGEvc3JjL3N0YWNrLmMKICsrKyBi
L3NyYy9zdGFjay5jCiBAQCAtMzEsNiArMzEsNyBAQApAQCAtMzMzLDcgKzM2NCw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgLyogTmFtZSBhbmQgdmVy
c2lvbiBvZiBwcm9ncmFtLiAgKi8KICBBUkdQX1BST0dSQU1fVkVSU0lPTl9IT09LX0RFRiA9IHBy
aW50X3ZlcnNpb247CiAgCi1AQCAtMTUyLDcgKzE1Myw3IEBAIG1vZHVsZV9jYWxsYmFjayAoRHdm
bF9Nb2R1bGUgKm1vZCwgdm9pZAorQEAgLTE1Miw3ICsxNTMsNyBAQCBtb2R1bGVfY2FsbGJhY2sg
KER3ZmxfTW9kdWxlICptb2QsIHZvaWQgKip1c2VyZGF0YSBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQp
KSwKICAKICAgIGludCB3aWR0aCA9IGdldF9hZGRyX3dpZHRoIChtb2QpOwogICAgcHJpbnRmICgi
MHglMCoiIFBSSXg2NCAiLTB4JTAqIiBQUkl4NjQgIiAlc1xuIiwKQEAgLTM0Miw5ICszNzMsMTEg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAKICAgIGNv
bnN0IHVuc2lnbmVkIGNoYXIgKmlkOwogICAgR0VsZl9BZGRyIGlkX3ZhZGRyOworZGlmZiAtLWdp
dCBhL3NyYy9zdHJpcC5jIGIvc3JjL3N0cmlwLmMKK2luZGV4IDdmNDc4OGIuLjY0MzY0NDMgMTAw
NjQ0CiAtLS0gYS9zcmMvc3RyaXAuYwogKysrIGIvc3JjL3N0cmlwLmMKLUBAIC0xODA3LDcgKzE4
MDcsNyBAQCBoYW5kbGVfZWxmIChpbnQgZmQsIEVsZiAqZWxmLCBjb25zdCBjaGFyCitAQCAtMTgw
MCw3ICsxODAwLDcgQEAgaGFuZGxlX2VsZiAoaW50IGZkLCBFbGYgKmVsZiwgY29uc3QgY2hhciAq
cHJlZml4LCBjb25zdCBjaGFyICpmbmFtZSwKICAJCSAgICAgIGVsZl9lcnJtc2cgKC0xKSk7CiAg
CX0KICAKQEAgLTM1Myw2ICszODYsMjEgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KICAgICAgICBvZmZfdCBjcmNfb2Zmc2V0ID0gc3RybGVuIChkZWJ1Z19i
YXNlbmFtZSkgKyAxOwogICAgICAgIC8qIEFsaWduIHRvIDQgYnl0ZSBib3VuZGFyeSAqLwogICAg
ICAgIGNyY19vZmZzZXQgPSAoKGNyY19vZmZzZXQgLSAxKSAmIH4zKSArIDQ7CitkaWZmIC0tZ2l0
IGEvdGVzdHMvTWFrZWZpbGUuYW0gYi90ZXN0cy9NYWtlZmlsZS5hbQoraW5kZXggNzkxMDVmMi4u
NDNlZjZkOSAxMDA2NDQKKy0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCisrKysgYi90ZXN0cy9NYWtl
ZmlsZS5hbQorQEAgLTcwNSw3ICs3MDUsNyBAQCB1cGRhdGUxX0xEQUREID0gJChsaWJlbGYpCisg
dXBkYXRlMl9MREFERCA9ICQobGliZWxmKQorIHVwZGF0ZTNfTERBREQgPSAkKGxpYmR3KSAkKGxp
YmVsZikKKyB1cGRhdGU0X0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCistc2hvd19kaWVfaW5m
b19MREFERCA9ICQobGliZHcpICQobGliZWxmKQorK3Nob3dfZGllX2luZm9fTERBREQgPSAkKGxp
YmV1KSAkKGxpYmR3KSAkKGxpYmVsZikKKyBnZXRfcHVibmFtZXNfTERBREQgPSAkKGxpYmR3KSAk
KGxpYmVsZikKKyBzaG93X2FiYnJldl9MREFERCA9ICQobGliZHcpICQobGliZWxmKQorIGdldF9s
aW5lc19MREFERCA9ICQobGliZHcpICQobGliZWxmKQorZGlmZiAtLWdpdCBhL3Rlc3RzL3Nob3ct
ZGllLWluZm8uYyBiL3Rlc3RzL3Nob3ctZGllLWluZm8uYworaW5kZXggMWEzMTkxYy4uMDBhNjY1
NyAxMDA2NDQKIC0tLSBhL3Rlc3RzL3Nob3ctZGllLWluZm8uYwogKysrIGIvdGVzdHMvc2hvdy1k
aWUtaW5mby5jCiBAQCAtMjYsNiArMjYsNyBAQApAQCAtMzcyLDYgKzQyMCw4IEBAIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCiAgICAgICAgZGJnID0gZHdh
cmZfYmVnaW4gKGZkLCBEV0FSRl9DX1JFQUQpOwogICAgICAgIGlmIChkYmcgPT0gTlVMTCkKK2Rp
ZmYgLS1naXQgYS90ZXN0cy92YXJsb2NzLmMgYi90ZXN0cy92YXJsb2NzLmMKK2luZGV4IDhlNTYz
ZmQuLjcyYzY0ZTIgMTAwNjQ0CiAtLS0gYS90ZXN0cy92YXJsb2NzLmMKICsrKyBiL3Rlc3RzL3Zh
cmxvY3MuYwogQEAgLTMzLDYgKzMzLDcgQEAKQEAgLTM5MSwxNCArNDQxLDMgQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJICBwcmludGYgKCJtb2R1bGUg
JyVzJ1xuIiwgbmFtZSk7CiAgCSAgcHJpbnRfZGllICgmY3VkaWUsICJDVSIsIDApOwogIAotLS0t
IGEvdGVzdHMvTWFrZWZpbGUuYW0KLSsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtNjkyLDcg
KzY5Miw3IEBAIHVwZGF0ZTFfTERBREQgPSAkKGxpYmVsZikKLSB1cGRhdGUyX0xEQUREID0gJChs
aWJlbGYpCi0gdXBkYXRlM19MREFERCA9ICQobGliZHcpICQobGliZWxmKQotIHVwZGF0ZTRfTERB
REQgPSAkKGxpYmR3KSAkKGxpYmVsZikKLS1zaG93X2RpZV9pbmZvX0xEQUREID0gJChsaWJkdykg
JChsaWJlbGYpCi0rc2hvd19kaWVfaW5mb19MREFERCA9ICQobGliZXUpICQobGliZHcpICQobGli
ZWxmKQotIGdldF9wdWJuYW1lc19MREFERCA9ICQobGliZHcpICQobGliZWxmKQotIHNob3dfYWJi
cmV2X0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCi0gZ2V0X2xpbmVzX0xEQUREID0gJChsaWJk
dykgJChsaWJlbGYpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvMDAwMS1kc28tbGluay1jaGFuZ2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMS1kc28tbGluay1jaGFuZ2UucGF0Y2gKaW5kZXggNmFjYzAzNjQw
Ni4uMjFiYjBmNTE4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxz
L2ZpbGVzLzAwMDEtZHNvLWxpbmstY2hhbmdlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYzVmYjU5YWMwODE5YjViNmQ4MjQ0YzYxM2NiY2Y5MmNiMDk4NDBjMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGExNTk2ODBhZDRiNDlhODA2OGI1Y2ZlOWEyZjhj
ZDM5OTE5M2VhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhv
bmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTUgQXVnIDIwMTcgMTc6MTA6NTcg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHNvIGxpbmsgY2hhbmdlCkBAIC0yMywxMSArMjMsMTEg
QEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2VmaWxlLmFtCi1pbmRleCA4OGQwYWM4
Li5jMjhkODFmIDEwMDY0NAoraW5kZXggZDNkOWQ0MC4uZWE2MTYxNiAxMDA2NDQKIC0tLSBhL3Ny
Yy9NYWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFtCiBAQCAtNDUsNyArNDUsNyBAQCBs
aWJkdyA9IC4uL2xpYmR3L2xpYmR3LmEgLWx6ICQoemlwX0xJQlMpICQobGliZWxmKSAtbGRsIC1s
cHRocmVhZAotIGxpYmVsZiA9IC4uL2xpYmVsZi9saWJlbGYuYSAtbHoKKyBsaWJlbGYgPSAuLi9s
aWJlbGYvbGliZWxmLmEgLWx6ICQoenN0ZF9MSUJTKQogIGVsc2UKICBsaWJhc20gPSAuLi9saWJh
c20vbGliYXNtLnNvCiAtbGliZHcgPSAuLi9saWJkdy9saWJkdy5zbwpAQCAtMzYsMTEgKzM2LDEx
IEBAIGluZGV4IDg4ZDBhYzguLmMyOGQ4MWYgMTAwNjQ0CiAgZW5kaWYKICBsaWJlYmwgPSAuLi9s
aWJlYmwvbGliZWJsLmEgLi4vYmFja2VuZHMvbGliZWJsX2JhY2tlbmRzLmEgLi4vbGliY3B1L2xp
YmNwdS5hCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0gYi90ZXN0cy9NYWtlZmlsZS5h
bQotaW5kZXggYzE0NTcyMC4uNzJhZmQwZSAxMDA2NDQKK2luZGV4IDdmYjhlZmIuLjcxYzFhNjEg
MTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysrIGIvdGVzdHMvTWFrZWZpbGUuYW0K
LUBAIC01NTQsNyArNTU0LDcgQEAgbGliZHcgPSAuLi9saWJkdy9saWJkdy5hIC1seiAkKHppcF9M
SUJTKSAkKGxpYmVsZikgJChsaWJlYmwpIC1sZGwgLWxwdGhyZWFkCi0gbGliZWxmID0gLi4vbGli
ZWxmL2xpYmVsZi5hIC1segorQEAgLTY4MCw3ICs2ODAsNyBAQCBsaWJkdyA9IC4uL2xpYmR3L2xp
YmR3LmEgLWx6ICQoemlwX0xJQlMpICQobGliZWxmKSAkKGxpYmVibCkgLWxkbCAtbHB0aHJlYWQK
KyBsaWJlbGYgPSAuLi9saWJlbGYvbGliZWxmLmEgLWx6ICQoenN0ZF9MSUJTKQogIGxpYmFzbSA9
IC4uL2xpYmFzbS9saWJhc20uYQogIGVsc2UKIC1saWJkdyA9IC4uL2xpYmR3L2xpYmR3LnNvCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJh
c20tbWF5LWxpbmstd2l0aC1saWJiejItaWYtZm91bmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJhc20tbWF5LWxpbmstd2l0aC1saWJiejItaWYt
Zm91bmQucGF0Y2gKaW5kZXggMDljOWQzZWEyNC4uMDc2ODE1MzVjMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliYXNtLW1heS1saW5rLXdp
dGgtbGliYnoyLWlmLWZvdW5kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1
dGlscy9maWxlcy8wMDAxLWxpYmFzbS1tYXktbGluay13aXRoLWxpYmJ6Mi1pZi1mb3VuZC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWQxOTc1ZGVlYWE0N2Y5OGQyMTJmZDE0NGM4YmRhMDc1
YjFhNWQzNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWU3OGIwNmUzZTJmMzFmNzQy
ZjA1ZTA5ZjRiZWJlZDQ0ZTlhY2U1NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDQgT2N0IDIwMTcgMjI6MzA6
NDYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliYXNtIG1heSBsaW5rIHdpdGggbGliYnoyIGlm
IGZvdW5kCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQot
aW5kZXggYzI4ZDgxZi4uOTUxZTk3OCAxMDA2NDQKK2luZGV4IGVhNjE2MTYuLmJjNjU3M2YgMTAw
NjQ0CiAtLS0gYS9zcmMvTWFrZWZpbGUuYW0KICsrKyBiL3NyYy9NYWtlZmlsZS5hbQogQEAgLTQw
LDExICs0MCwxMSBAQCBFWFRSQV9ESVNUICs9IG1ha2UtZGVidWctYXJjaGl2ZS5pbgpAQCAtMjcs
NyArMjcsNyBAQCBpbmRleCBjMjhkODFmLi45NTFlOTc4IDEwMDY0NAogLWxpYmFzbSA9IC4uL2xp
YmFzbS9saWJhc20uYQogK2xpYmFzbSA9IC4uL2xpYmFzbS9saWJhc20uYSAkKHppcF9MSUJTKQog
IGxpYmR3ID0gLi4vbGliZHcvbGliZHcuYSAtbHogJCh6aXBfTElCUykgJChsaWJlbGYpIC1sZGwg
LWxwdGhyZWFkCi0gbGliZWxmID0gLi4vbGliZWxmL2xpYmVsZi5hIC1segorIGxpYmVsZiA9IC4u
L2xpYmVsZi9saWJlbGYuYSAtbHogJCh6c3RkX0xJQlMpCiAgZWxzZQogLWxpYmFzbSA9IC4uL2xp
YmFzbS9saWJhc20uc28KICtsaWJhc20gPSAuLi9saWJhc20vbGliYXNtLnNvICQoemlwX0xJQlMp
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1s
aWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliZWxmLWVsZl9l
bmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRfYnVmLWJlZm9yZS5wYXRjaAppbmRleCBjOGQ1
NWQ1ODNhLi5kOWY4ZjQzMGJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxm
dXRpbHMvZmlsZXMvMDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQu
ZF9idWYtYmVmb3JlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1i
ZWZvcmUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY0MGNiZDQzYWNkYjFmZWZlZjRmYTUz
YTYwMzQyOTZkODNjYmZmN2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNhMjIxYTY5
YWVmYzIzZjllNWQ1NWRjYjNhYjZhNGEyNGE1MWU3OTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRo
dSwgMTYgQXVnIDIwMTggMDk6NTg6MjYgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZWxmL2Vs
Zl9lbmQuYzogY2hlY2sgZGF0YV9saXN0LmRhdGEuZC5kX2J1ZiBiZWZvcmUgZnJlZSBpdApAQCAt
MjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWJlbGYvZWxmX2VuZC5jIGIvbGliZWxmL2VsZl9lbmQu
YwotaW5kZXggMTYwZjBiOC4uNTI4MGE3MCAxMDA2NDQKK2luZGV4IDgwZjRkMTMuLmIxMDM5NTkg
MTAwNjQ0CiAtLS0gYS9saWJlbGYvZWxmX2VuZC5jCiArKysgYi9saWJlbGYvZWxmX2VuZC5jCi1A
QCAtMTYwLDE0ICsxNjAsMTYgQEAgZWxmX2VuZCAoRWxmICplbGYpCitAQCAtMTY5LDE0ICsxNjks
MTYgQEAgZWxmX2VuZCAoRWxmICplbGYpCiAgCQkgICBhcmNoaXRlY3R1cmUgZG9lc24ndCByZXF1
aXJlIG92ZXJseSBzdHJpbmdlbnQKICAJCSAgIGFsaWdubWVudCB0aGUgcmF3IGRhdGEgYnVmZmVy
IGlzIHRoZSBzYW1lIGFzIHRoZQogIAkJICAgb25lIHVzZWQgZm9yIHByZXNlbnRpbmcgdG8gdGhl
IGNhbGxlci4gICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvMDAwMS1za2lwLXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBsb3llZC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hl
bi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoCmluZGV4IDBlNmJmNTU3M2MuLjNjYjhjM2I4ZDIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAt
dGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRl
cGxveWVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZmE1MmQ2MWIxYWJkZjRhM2YzYjE1
M2M3NzFmYjIwODE2NjY0MzBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMDgzZjgx
N2I0MGU4YzVhZWY5NjIzOGMzYzE3ODFkMjhmNjYzMWJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwg
MjEgTWF5IDIwMTkgMTU6MjA6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc2tpcCB0aGUgdGVz
dCB3aGVuIGdjYyBub3QgZGVwbG95ZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNvbXBpbGUtdGVzdF9ubGlz
dC13aXRoLXN0YW5kYXJkLUMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFu
ZGFyZC1DLnBhdGNoCmluZGV4IGEyYzBiOTAyMjcuLmY5ZWRlODRkNzcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFt
LWNvbXBpbGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGls
ZS10ZXN0X25saXN0LXdpdGgtc3RhbmRhcmQtQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZTM1NWNhM2I4ZGRjYzZlNzNlZTE0MGY1M2QyNTYzNGFmZGFlYzBkYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYTQ4NjQ3ODk5ZDllMWU4MGRiZmRmZGNhMjdhZmI0ZjYzNGNmMjgxYyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyMyBKdW4gMjAyMCAwNzo0OTozNSArMDAwMAog
U3ViamVjdDogW1BBVENIXSB0ZXN0cy9NYWtlZmlsZS5hbTogY29tcGlsZSB0ZXN0X25saXN0IHdp
dGggc3RhbmRhcmQgQ0ZMQUdTCkBAIC0xNCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtl
ZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCAyYWRlNWQ5Li5mODVjZGJhIDEwMDY0
NAoraW5kZXggYWM4MjQ1Ni4uNzkxMDVmMiAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFt
CiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTk4LDcgKzk4LDcgQEAgZW5kaWYKK0BAIC0x
MDIsNyArMTAyLDcgQEAgZW5kaWYKICB0ZXN0LW5saXN0JChFWEVFWFQpOiB0ZXN0LW5saXN0LmMK
ICAJJChBTV9WX0NDKSQoQ0MpICQoREVGUykgJChERUZBVUxUX0lOQ0xVREVTKSAkKElOQ0xVREVT
KSBcCiAgCSAgJChBTV9DUFBGTEFHUykgJChDUFBGTEFHUykgXApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9jdnRfZ3VuaGFzaC1p
Zi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxm
dXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNoLWlmLWRlc3QtYW5kLXNyYy1hcmUt
c2FtZS5wYXRjaAppbmRleCBiZTQ4ZWYwMTBiLi42Y2ZkZDlhNDVmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNo
LWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNoLWlmLWRlc3QtYW5kLXNy
Yy1hcmUtc2FtZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTY0M2Q3OTM3NjEyMTYyNTJi
YjY1NGUyOGFhYTViOGViMTUzNmJjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjNm
Y2Y2NDE0NmRmZTQ1MWI0MWQ1YTYyOGE0MjhlMWMzOWM0MjIzMyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFR1ZSwgMTUgQXVnIDIwMTcgMTc6MTM6NTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IGVs
Zl9jdnRfZ3VuaGFzaCBpZiBkZXN0IGFuZCBzcmMgYXJlIHNhbWUuCkBAIC0xOCwxMCArMTgsMTAg
QEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2xpYmVsZi9nbnVoYXNoX3hsYXRlLmggYi9saWJlbGYvZ251aGFzaF94bGF0ZS5oCi1p
bmRleCA2ZmFmMTEzLi4wNGQ5Y2ExIDEwMDY0NAoraW5kZXggM2EwMGFlMC4uNDA0NjhmYyAxMDA2
NDQKIC0tLSBhL2xpYmVsZi9nbnVoYXNoX3hsYXRlLmgKICsrKyBiL2xpYmVsZi9nbnVoYXNoX3hs
YXRlLmgKLUBAIC00MCw2ICs0MCw3IEBAIGVsZl9jdnRfZ251aGFzaCAodm9pZCAqZGVzdCwgY29u
c3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuLCBpbnQgZW5jb2RlKQorQEAgLTQyLDYgKzQyLDcgQEAg
ZWxmX2N2dF9nbnVoYXNoICh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBsZW4s
IGludCBlbmNvZGUpCiAgICAgICB3b3Jkcy4gIFdlIG11c3QgZGV0YW5nbGUgdGhlbSBoZXJlLiAg
ICovCiAgICBFbGYzMl9Xb3JkICpkZXN0MzIgPSBkZXN0OwogICAgY29uc3QgRWxmMzJfV29yZCAq
c3JjMzIgPSBzcmM7CkBAIC0yOSw3ICsyOSw3IEBAIGluZGV4IDZmYWYxMTMuLjA0ZDljYTEgMTAw
NjQ0CiAgCiAgICAvKiBGaXJzdCBmb3VyIGNvbnRyb2wgd29yZHMsIDMyIGJpdHMuICAqLwogICAg
Zm9yICh1bnNpZ25lZCBpbnQgY250ID0gMDsgY250IDwgNDsgKytjbnQpCi1AQCAtNTAsNyArNTEs
NyBAQCBlbGZfY3Z0X2dudWhhc2ggKHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90
IGxlbiwgaW50IGVuY29kZSkKK0BAIC01Miw3ICs1Myw3IEBAIGVsZl9jdnRfZ251aGFzaCAodm9p
ZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuLCBpbnQgZW5jb2RlKQogICAgICAg
IGxlbiAtPSA0OwogICAgICB9CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFkZXJjaGVjay5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBhdGNoCmluZGV4IDIx
MmIzNThkYzIuLjEwNWFjMDQ3ZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9l
bGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA3ZTFmOTFjNDJlZjViMGJmMTBhZmVmZWMxMGRkMDg1ODhkZjNhYjFm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MzliZWYzOGNiNDcwNThhMzNmZGE1YjRk
OTgxOTYxYjk5NTdlNjIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNSBBdWcgMjAxNyAxNzox
NzoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBmaXhoZWFkZXJjaGVjawpAQCAtMjIsMTAgKzIy
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvbGliZWxmL2VsZjMyX3VwZGF0ZW51bGwuYyBiL2xpYmVsZi9lbGYzMl91cGRh
dGVudWxsLmMKLWluZGV4IGQwZDRkMWUuLjRlY2Y1YTUgMTAwNjQ0CitpbmRleCAzNTk0ZThiLi5h
MzMxNGU1IDEwMDY0NAogLS0tIGEvbGliZWxmL2VsZjMyX3VwZGF0ZW51bGwuYwogKysrIGIvbGli
ZWxmL2VsZjMyX3VwZGF0ZW51bGwuYwotQEAgLTM1NCw4ICszNTQsOCBAQCBfX2VsZncyKExJQkVM
RkJJVFMsdXBkYXRlbnVsbF93cmxvY2spIChFbGYgKmVsZiwgaW50ICpjaGFuZ2VfYm9wLCBzaXpl
X3Qgc2hudW0pCitAQCAtMzU1LDggKzM1NSw4IEBAIF9fZWxmdzIoTElCRUxGQklUUyx1cGRhdGVu
dWxsX3dybG9jaykgKEVsZiAqZWxmLCBpbnQgKmNoYW5nZV9ib3AsIHNpemVfdCBzaG51bSkKICAJ
CSAgICAgd2UgdGVzdCBmb3IgdGhlIGFsaWdubWVudCBvZiB0aGUgc2VjdGlvbiBiZWluZyBsYXJn
ZQogIAkJICAgICBlbm91Z2ggZm9yIHRoZSBsYXJnZXN0IGFsaWdubWVudCByZXF1aXJlZCBieSBh
IGRhdGEKICAJCSAgICAgYmxvY2suICAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtbXVzbC11dGlscy5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLW11c2wtdXRpbHMucGF0Y2gKaW5kZXggOTNmNWJk
Y2QwMC4uNjcyODRkNWQwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0
aWxzL2ZpbGVzLzAwMDMtbXVzbC11dGlscy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1tdXNsLXV0aWxzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyNjJhYzkwMzk0ZTM2ZTBiNGU4NjA0MmQ5YzUzODU3MDNmNWI2NTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAwZTZiNThmZTAxOTdiM2Y0YTUwYzIxMDUyZjExNWY0ODdlNGQ3
NDJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAyMyBBdWcgMjAxOSAxMDoxOTo0OCArMDgwMAog
U3ViamVjdDogW1BBVENIXSBtdXNsLXV0aWxzCkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IGQ0YTQy
MjEuLmY2MzM2ZDkgMTAwNjQ0CiAgLyogU3RhdGUgb2YgLUQvLVUgZmxhZ3MuICAqLwogIGV4dGVy
biBib29sIGFybGliX2RldGVybWluaXN0aWNfb3V0cHV0OwogZGlmZiAtLWdpdCBhL3NyYy9lbGZj
b21wcmVzcy5jIGIvc3JjL2VsZmNvbXByZXNzLmMKLWluZGV4IDE4YWRlNjYuLmE2ZWQ0ZTEgMTAw
NjQ0CitpbmRleCBmNzcxYjkyLi4yNjNkZTYyIDEwMDY0NAogLS0tIGEvc3JjL2VsZmNvbXByZXNz
LmMKICsrKyBiL3NyYy9lbGZjb21wcmVzcy5jCiBAQCAtMzcsNiArMzcsMTMgQEAKQEAgLTU3LDcg
KzU3LDcgQEAgaW5kZXggMThhZGU2Ni4uYTZlZDRlMSAxMDA2NDQKICBBUkdQX1BST0dSQU1fVkVS
U0lPTl9IT09LX0RFRiA9IHByaW50X3ZlcnNpb247CiAgCiBkaWZmIC0tZ2l0IGEvc3JjL3N0cmlw
LmMgYi9zcmMvc3RyaXAuYwotaW5kZXggMmEyY2M4MC4uOGU5Zjc3MyAxMDA2NDQKK2luZGV4IDY0
MzY0NDMuLjE2MDg0OTYgMTAwNjQ0CiAtLS0gYS9zcmMvc3RyaXAuYwogKysrIGIvc3JjL3N0cmlw
LmMKIEBAIC00NSw2ICs0NSwxMyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2VsZnV0aWxzL2ZpbGVzLzAwMDYtRml4LWJ1aWxkLW9uLWFhcmNoNjQtbXVzbC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDA2LUZpeC1idWlsZC1vbi1hYXJj
aDY0LW11c2wucGF0Y2gKaW5kZXggODk0MmFkNzgyOC4uYzQ4YjYwZTRiZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDYtRml4LWJ1aWxkLW9uLWFh
cmNoNjQtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmls
ZXMvMDAwNi1GaXgtYnVpbGQtb24tYWFyY2g2NC1tdXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyMzk2ZmQ2N2Q4MWU1NGUxOGZiYWQ2N2E1ZmY2N2Q1Njg0YTAxMDEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA2MjQzOGY0NmFiYjM5ZTY3ZDVlNWFhNWMxNzg3MTRjOGQ3OTI1
NTE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNSBBdWcgMjAxNyAxNzoyNzozMCArMDgwMAog
U3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgb24gYWFyY2g2NC9tdXNsCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvcHRlc3QucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvcHRlc3QucGF0Y2gKaW5kZXggZmU2ZjI3MmE4
My4uNTBmYzM4YjYxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxz
L2ZpbGVzL3B0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy9wdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmZiZjM5M2U3ZDViMWI0MWRm
ODVjZTFjMzdlODg3Nzc2YzQ1ZDUyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmY1
NmYzYmU1YmU5OTA2MTk4MGY2NzcwYTlmNGRkNjQyOTQwMzI3NiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPgogRGF0ZTogV2VkLCAxIE1heSAyMDE5IDE2OjM3OjQ4ICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIENoYW5nZXMgdG8gYWxsb3cgcHRlc3QgdG8gcnVuIHN0YW5kYWxvbmUgb24gdGFyZ2V0
OgpAQCAtMjIsMTAgKzIyLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ug
c3BlY2lmaWNdCiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGQz
NDU0OTUuLjY3OTMzZDEgMTAwNjQ0CitpbmRleCBhZjViNmJmLi4yZWYzMDJmIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC00OCw3ICs0OCw3IEBAIEFD
X0NPUFlSSUdIVChbQ29weXJpZ2h0IChDKSAxOTk2LTIwMjEgVGhlIGVsZnV0aWxzIGRldmVsb3Bl
cnMuXSkKK0BAIC00OSw3ICs0OSw3IEBAIEFDX0NPUFlSSUdIVChbQ29weXJpZ2h0IChDKSAxOTk2
LTIwMjMgVGhlIGVsZnV0aWxzIGRldmVsb3BlcnMuXSkKICBBQ19QUkVSRVEoMi42MykJCQlkbmwg
TWluaW11bSBBdXRvY29uZiB2ZXJzaW9uIHJlcXVpcmVkLgogIAogIGRubCBXZSB1c2UgR05VIG1h
a2UgZXh0ZW5zaW9uczsgYXV0b21ha2UgMS4xMCBkZWZhdWx0cyB0byAtV3BvcnRhYmlsaXR5LgpA
QCAtMzUsMTAgKzM1LDEwIEBAIGluZGV4IGQzNDU0OTUuLjY3OTMzZDEgMTAwNjQ0CiAgCiAgQU1f
U0lMRU5UX1JVTEVTKFt5ZXNdKQogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVz
dHMvTWFrZWZpbGUuYW0KLWluZGV4IDcyYWZkMGUuLmEyZGZkNDMgMTAwNjQ0CitpbmRleCA3MWMx
YTYxLi5hYzgyNDU2IDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3Rz
L01ha2VmaWxlLmFtCi1AQCAtNjk4LDMgKzY5OCw1IEBAIGNoZWNrOiBjaGVjay1hbSBjb3ZlcmFn
ZQorQEAgLTgzNCwzICs4MzQsNSBAQCBjaGVjazogY2hlY2stYW0gY292ZXJhZ2UKICBjb3ZlcmFn
ZToKICAJLSQoc3JjZGlyKS9jb3ZlcmFnZS5zaAogIGVuZGlmCi0tIAoyLjQyLjAKCg==

--===============6429607857104567168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/elfutils/elfutils-doc: FILELIST: added "/usr/share/man/man1/eu-srcfiles.1"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: FILELIST: removed "/usr/lib/elfutils/ptest/tests/run-strip-reloc.sh /usr/lib/elfutils/ptest/tests/run-copymany-sections.sh", added "/usr/lib/elfutils/ptest/backends/loongarch_unwind.o /usr/lib/elfutils/ptest/backends/loongarch_cfi.o /usr/lib/elfutils/ptest/tests/strip-reloc-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.os /usr/lib/elfutils/ptest/tests/run-strip-reloc-ppc64.sh /usr/lib/elfutils/ptest/backends/loongarch_retval.os /usr/lib/elfutils/ptest/tests/test-copymany-subr.sh /usr/lib/elfutils/ptest/tests/testfilegdbindex9.bz2 /usr/lib/elfutils/ptest/tests/run-copymany-be32.sh /usr/lib/elfutils/ptest/tests/run-copymany-be64.sh /usr/lib/elfutils/ptest/tests/run-copymany-le32.sh /usr/lib/elfutils/ptest/tests/run-copymany-le64.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.os /usr/lib/elfutils/ptest/tests/system_elf_gelf_test-system-elf-gelf-test.o /usr/lib/elfutils/ptest/backends/loongarch_regs.o /usr/lib/elfut
 ils/ptest/tests/run-srcfiles-self.sh /usr/lib/elfutils/ptest/tests/testfilegdbindex9-no-maininfo.bz2 /usr/lib/elfutils/ptest/backends/loongarch_cfi.os /usr/lib/elfutils/ptest/tests/system-elf-gelf-test.c /usr/lib/elfutils/ptest/tests/run-strip-reloc-self.sh /usr/lib/elfutils/ptest/backends/loongarch_corenote.o /usr/lib/elfutils/ptest/tests/libelf.h /usr/lib/elfutils/ptest/backends/loongarch_regs.os /usr/lib/elfutils/ptest/tests/run-debuginfod-IXr.sh /usr/lib/elfutils/ptest/libelf/elf32_getchdr.h /usr/lib/elfutils/ptest/tests/system-elf-gelf-test /usr/lib/elfutils/ptest/tests/run-strip-reloc-ko.sh /usr/lib/elfutils/ptest/backends/loongarch_retval.o /usr/lib/elfutils/ptest/backends/loongarch_initreg.o /usr/lib/elfutils/ptest/backends/loongarch_corenote.os"
packages/core2-64-poky-linux/elfutils/elfutils: FILELIST: added "/usr/bin/eu-srcfiles"
packages/core2-64-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: FILELIST: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
Changes to packages/core2-64-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
  /usr/bin/eu-srcfiles was added

--===============6429607857104567168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/elfutils/elfutils-binutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PKGSIZE changed from 1331808 to 1360480 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-dbg: FILELIST: removed "/usr/lib/.debug/libelf-0.189.so /usr/lib/.debug/libdw-0.189.so /usr/lib/.debug/libdebuginfod-0.189.so /usr/lib/.debug/libasm-0.189.so", added "/usr/lib/.debug/libelf-0.190.so /usr/lib/.debug/libasm-0.190.so /usr/lib/elfutils/ptest/tests/.debug/system-elf-gelf-test /usr/lib/.debug/libdw-0.190.so /usr/bin/.debug/eu-srcfiles /usr/lib/.debug/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PKGSIZE changed from 28457112 to 29406912 (+3%)
packages/core2-64-poky-linux/elfutils/elfutils-dev: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-dev: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-dev: PKGSIZE changed from 215674 to 216322 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-doc: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-doc: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-doc: FILELIST: added "/usr/share/man/man1/eu-srcfiles.1"
packages/core2-64-poky-linux/elfutils/elfutils-doc: PKGSIZE changed from 69790 to 73546 (+5%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-de: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-de: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGSIZE changed from 157322 to 157744 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PKGSIZE changed from 155486 to 155908 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PKGSIZE changed from 106776 to 106582 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PKGSIZE changed from 92248 to 92046 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PKGSIZE changed from 165530 to 165373 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PKGSIZE changed from 193954 to 193756 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-ptest: FILELIST: removed "/usr/lib/elfutils/ptest/tests/run-copymany-sections.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc.sh", added "/usr/lib/elfutils/ptest/tests/run-debuginfod-IXr.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc-ko.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.o /usr/lib/elfutils/ptest/backends/loongarch_corenote.o /usr/lib/elfutils/ptest/tests/libelf.h /usr/lib/elfutils/ptest/backends/loongarch_retval.os /usr/lib/elfutils/ptest/tests/run-strip-reloc-ppc64.sh /usr/lib/elfutils/ptest/libelf/elf32_getchdr.h /usr/lib/elfutils/ptest/tests/system-elf-gelf-test.c /usr/lib/elfutils/ptest/tests/run-copymany-le64.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc-self.sh /usr/lib/elfutils/ptest/tests/run-copymany-be32.sh /usr/lib/elfutils/ptest/tests/run-copymany-be64.sh /usr/lib/elfutils/ptest/tests/run-copymany-le32.sh /usr/lib/elfutils/ptest/tests/system_elf_gelf_test-system-elf-gelf-test.o /usr/lib/elfutils/ptes
 t/backends/loongarch_unwind.o /usr/lib/elfutils/ptest/tests/testfilegdbindex9.bz2 /usr/lib/elfutils/ptest/backends/loongarch_regs.os /usr/lib/elfutils/ptest/tests/run-srcfiles-self.sh /usr/lib/elfutils/ptest/tests/strip-reloc-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.os /usr/lib/elfutils/ptest/backends/loongarch_cfi.o /usr/lib/elfutils/ptest/tests/test-copymany-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_cfi.os /usr/lib/elfutils/ptest/backends/loongarch_initreg.os /usr/lib/elfutils/ptest/backends/loongarch_corenote.os /usr/lib/elfutils/ptest/tests/system-elf-gelf-test /usr/lib/elfutils/ptest/backends/loongarch_regs.o /usr/lib/elfutils/ptest/tests/testfilegdbindex9-no-maininfo.bz2 /usr/lib/elfutils/ptest/backends/loongarch_retval.o"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PKGSIZE changed from 46650699 to 47672612 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-src: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-src: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-src: FILELIST: directory renamed /usr/src/debug/elfutils/0.189/libdw -> /usr/src/debug/elfutils/0.190/libdw, directory renamed /usr/src/debug/elfutils/0.189/debuginfod -> /usr/src/debug/elfutils/0.190/debuginfod, directory renamed /usr/src/debug/elfutils/0.189/libdwelf -> /usr/src/debug/elfutils/0.190/libdwelf, directory renamed /usr/src/debug/elfutils/0.189/libebl -> /usr/src/debug/elfutils/0.190/libebl, directory renamed /usr/src/debug/elfutils/0.189/libdwfl -> /usr/src/debug/elfutils/0.190/libdwfl, directory renamed /usr/src/debug/elfutils/0.189/lib -> /usr/src/debug/elfutils/0.190/lib, directory renamed /usr/src/debug/elfutils/0.189/libcpu -> /usr/src/debug/elfutils/0.190/libcpu, directory renamed /usr/src/debug/elfutils/0.189/libasm -> /usr/src/debug/elfutils/0.190/libasm, removed "/usr/src/debug/elfutils/0.189/src/findtextrel.c /usr/src/debug/elfutils/0.189/libelf/version_xlate.h /usr/src/debug/elfutils/0.189/backends/ppc64_reloc.d
 ef /usr/src/debug/elfutils/0.189/backends/riscv_reloc.def /usr/src/debug/elfutils/0.189/tests/getsrc_die.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_shdr.c /usr/src/debug/elfutils/0.189/backends/sparc_retval.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verdef.c /usr/src/debug/elfutils/0.189/libelf/elf_error.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_versym.c /usr/src/debug/elfutils/0.189/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.189/backends/sh_corenote.c /usr/src/debug/elfutils/0.189/libelf/elf_strptr.c /usr/src/debug/elfutils/0.189/backends/aarch64_retval.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlatetom.c /usr/src/debug/elfutils/0.189/backends/sh_init.c /usr/src/debug/elfutils/0.189/tests/update1.c /usr/src/debug/elfutils/0.189/tests/get-lines.c /usr/src/debug/elfutils/0.189/backends/arm_initreg.c /usr/src/debug/elfutils/0.189/backends/csky_reloc.def /usr/src/debug/elfutils/0.189/backends/s390_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_cntl
 .c /usr/src/debug/elfutils/0.189/src/nm.c /usr/src/debug/elfutils/0.189/backends/common-reloc.c /usr/src/debug/elfutils/0.189/backends/arm_attrs.c /usr/src/debug/elfutils/0.189/backends/i386_symbol.c /usr/src/debug/elfutils/0.189/tests/get-aranges.c /usr/src/debug/elfutils/0.189/tests/allregs.c /usr/src/debug/elfutils/0.189/backends/i386_reloc.def /usr/src/debug/elfutils/0.189/backends/s390_cfi.c /usr/src/debug/elfutils/0.189/libelf/gelf_getmove.c /usr/src/debug/elfutils/0.189/libelf/gelf_getnote.c /usr/src/debug/elfutils/0.189/tests/asm-tst6.c /usr/src/debug/elfutils/0.189/backends/sparc_symbol.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.189/tests/elfputzdata.c /usr/src/debug/elfutils/0.189/src/elflint.c /usr/src/debug/elfutils/0.189/src/elfcompress.c /usr/src/debug/elfutils/0.189/backends/ia64_symbol.c /usr/src/debug/elfutils/0.189/tests/scnnames.c /usr/src/debug/elfutils/0.189/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.
 189/tests/show-abbrev.c /usr/src/debug/elfutils/0.189/backends/csky_cfi.c /usr/src/debug/elfutils/0.189/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.189/src/arlib-argp.c /usr/src/debug/elfutils/0.189/libelf/elf_rawdata.c /usr/src/debug/elfutils/0.189/libelf/elf_rawfile.c /usr/src/debug/elfutils/0.189/libelf/elf_readall.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_rel.c /usr/src/debug/elfutils/0.189/libelf/elf_fill.c /usr/src/debug/elfutils/0.189/tests/asm-tst8.c /usr/src/debug/elfutils/0.189/libelf/libelfP.h /usr/src/debug/elfutils/0.189/libelf/elf32_offscn.c /usr/src/debug/elfutils/0.189/src/elfclassify.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.189/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.189/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.189/libelf/elf_ndxscn.c /usr/src/debug/elfutils/0.189/libelf/elf_newscn.c /usr/src/debug/elfutils/0.189/libelf/gelf_getrela.c /usr/src/debug/elfutils/0.189/backends/aarch
 64_symbol.c /usr/src/debug/elfutils/0.189/backends/csky_initreg.c /usr/src/debug/elfutils/0.189/src/readelf.c /usr/src/debug/elfutils/0.189/tests/low_high_pc.c /usr/src/debug/elfutils/0.189/tests/vendorelf.c /usr/src/debug/elfutils/0.189/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.189/backends/i386_retval.c /usr/src/debug/elfutils/0.189/libelf/note_xlate.h /usr/src/debug/elfutils/0.189/src/objdump.c /usr/src/debug/elfutils/0.189/src/unstrip.c /usr/src/debug/elfutils/0.189/tests/early-offscn.c /usr/src/debug/elfutils/0.189/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.189/backends/arm_auxv.c /usr/src/debug/elfutils/0.189/backends/arm_init.c /usr/src/debug/elfutils/0.189/backends/arm_regs.c /usr/src/debug/elfutils/0.189/tests/rerequest_tag.c /usr/src/debug/elfutils/0.189/tests/newscn.c /usr/src/debug/elfutils/0.189/libelf/elf_hash.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverdef.c /usr/src/debug/elfutils/0.189/tests/asm-tst2.c /usr/src/debug/elfutils/0.189/b
 ackends/sparc_reloc.def /usr/src/debug/elfutils/0.189/libelf/elf32_updatenull.c /usr/src/debug/elfutils/0.189/tests/unit-info.c /usr/src/debug/elfutils/0.189/libelf/chdr_xlate.h /usr/src/debug/elfutils/0.189/tests/get-units-invalid.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsyminfo.c /usr/src/debug/elfutils/0.189/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.189/backends/ppc64_retval.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_ehdr.c /usr/src/debug/elfutils/0.189/tests/asm-tst4.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_rela.c /usr/src/debug/elfutils/0.189/libelf/elf_getident.c /usr/src/debug/elfutils/0.189/libelf/elf_compress.c /usr/src/debug/elfutils/0.189/backends/s390_unwind.c /usr/src/debug/elfutils/0.189/backends/arm_corenote.c /usr/src/debug/elfutils/0.189/backends/bpf_regs.c /usr/src/debug/elfutils/0.189/backends/bpf_init.c /usr/src/debug/elfutils/0.189/libelf/elf_getdata_rawchunk.c /usr/src/debug/elfutils/0.189/tests/read_unaligned.c /usr/src/debug/elfu
 tils/0.189/backends/csky_symbol.c /usr/src/debug/elfutils/0.189/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.189/backends/csky_corenote.c /usr/src/debug/elfutils/0.189/tests/allfcts.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verdaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_vernaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verneed.c /usr/src/debug/elfutils/0.189/backends/alpha_corenote.c /usr/src/debug/elfutils/0.189/libelf/elf32_getchdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getehdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getphdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getshdr.c /usr/src/debug/elfutils/0.189/backends/ppc_reloc.def /usr/src/debug/elfutils/0.189/tests/all-dwarf-ranges.c /usr/src/debug/elfutils/0.189/libelf/elf32_newehdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_newphdr.c /usr/src/debug/elfutils/0.189/tests/dwarfcfi.c /usr/src/debug/elfutils/0.189/backends/m68k_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf32_xl
 atetom.c /usr/src/debug/elfutils/0.189/libelf/elf_gnu_hash.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_dyn.c /usr/src/debug/elfutils/0.189/backends/aarch64_regs.c /usr/src/debug/elfutils/0.189/tests/addsections.c /usr/src/debug/elfutils/0.189/backends/ppc_attrs.c /usr/src/debug/elfutils/0.189/libelf/gelf_getdyn.c /usr/src/debug/elfutils/0.189/libelf/gelf_getlib.c /usr/src/debug/elfutils/0.189/backends/s390_corenote.c /usr/src/debug/elfutils/0.189/libelf/gelf_getrel.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsym.c /usr/src/debug/elfutils/0.189/libelf/gelf_offscn.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_phdr.c /usr/src/debug/elfutils/0.189/tests/deleted-lib.c /usr/src/debug/elfutils/0.189/tests/rdwrmmap.c /usr/src/debug/elfutils/0.189/libelf/elf_end.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_symshndx.c /usr/src/debug/elfutils/0.189/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.189/backends/riscv_corenote.c /usr/src/debug/elfutils/0.189/libelf/elf_getar
 hdr.c /usr/src/debug/elfutils/0.189/backends/ia64_retval.c /usr/src/debug/elfutils/0.189/backends/m68k_retval.c /usr/src/debug/elfutils/0.189/backends/ia64_init.c /usr/src/debug/elfutils/0.189/backends/ia64_regs.c /usr/src/debug/elfutils/0.189/libelf/common.h /usr/src/debug/elfutils/0.189/libelf/elf_getaroff.c /usr/src/debug/elfutils/0.189/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.189/src/addr2line.c /usr/src/debug/elfutils/0.189/backends/linux-core-note.c /usr/src/debug/elfutils/0.189/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.189/libelf/libelf.h /usr/src/debug/elfutils/0.189/backends/ppc_cfi.c /usr/src/debug/elfutils/0.189/tests/elfstrtab.c /usr/src/debug/elfutils/0.189/libelf/elf_flagehdr.c /usr/src/debug/elfutils/0.189/libelf/elf_flagphdr.c /usr/src/debug/elfutils/0.189/tests/showptable.c /usr/src/debug/elfutils/0.189/tests/update2.c /usr/src/debug/elfutils/0.189/backends/i386_unwind.c /usr/src/debug/elfutils/0.189/tests/dwarf_default_lower_bound.c /usr/src
 /debug/elfutils/0.189/tests/msg_tst.c /usr/src/debug/elfutils/0.189/backends/ppc_auxv.c /usr/src/debug/elfutils/0.189/backends/ppc_init.c /usr/src/debug/elfutils/0.189/backends/ppc_regs.c /usr/src/debug/elfutils/0.189/backends/s390_init.c /usr/src/debug/elfutils/0.189/backends/s390_regs.c /usr/src/debug/elfutils/0.189/tests/newdata.c /usr/src/debug/elfutils/0.189/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_move.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlatetof.c /usr/src/debug/elfutils/0.189/tests/newfile.c /usr/src/debug/elfutils/0.189/backends/riscv_init.c /usr/src/debug/elfutils/0.189/tests/getphdrnum.c /usr/src/debug/elfutils/0.189/backends/sparc_init.c /usr/src/debug/elfutils/0.189/libelf/elf32_checksum.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverneed.c /usr/src/debug/elfutils/0.189/libelf/gelf.h /usr/src/debug/elfutils/0.189/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.189/backends/m68k_reloc.def /usr/src/debug/elfutils/0.189/ba
 ckends/bpf_symbol.c /usr/src/debug/elfutils/0.189/backends/libebl_CPU.h /usr/src/debug/elfutils/0.189/backends/i386_corenote.c /usr/src/debug/elfutils/0.189/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.189/backends/sparc_auxv.c /usr/src/debug/elfutils/0.189/backends/ia64_reloc.def /usr/src/debug/elfutils/0.189/tests/zstrptr.c /usr/src/debug/elfutils/0.189/backends/i386_cfi.c /usr/src/debug/elfutils/0.189/tests/ecp.c /usr/src/debug/elfutils/0.189/tests/backtrace.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.189/backends/aarch64_init.c /usr/src/debug/elfutils/0.189/libelf/elf_kind.c /usr/src/debug/elfutils/0.189/backends/x86_64_init.c /usr/src/debug/elfutils/0.189/tests/elfcopy.c /usr/src/debug/elfutils/0.189/tests/leb128.c /usr/src/debug/elfutils/0.189/libelf/gelf_checksum.c /usr/src/debug/elfutils/0.189/backends/m68k_corenote.c /usr/src/debug/elfutils/0.189/libelf/gelf_getauxv.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_lib
 .c /usr/src/debug/elfutils/0.189/tests/update4.c /usr/src/debug/elfutils/0.189/backends/alpha_reloc.def /usr/src/debug/elfutils/0.189/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.189/tests/debugaltlink.c /usr/src/debug/elfutils/0.189/tests/arsymtest.c /usr/src/debug/elfutils/0.189/backends/i386_auxv.c /usr/src/debug/elfutils/0.189/backends/i386_init.c /usr/src/debug/elfutils/0.189/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.189/backends/i386_regs.c /usr/src/debug/elfutils/0.189/libelf/elf.h /usr/src/debug/elfutils/0.189/libelf/elf_getscn.c /usr/src/debug/elfutils/0.189/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.189/tests/dwarf-getmacros.c /usr/src/debug/elfutils/0.189/backends/alpha_regs.c /usr/src/debug/elfutils/0.189/tests/dwarf-getstring.c /usr/src/debug/elfutils/0.189/backends/sparc_initreg.c /usr/src/debug/elfutils/0.189/tests/debuglink.c /usr/src/debug/elfutils/0.189/backends/ppc_retval.c /usr/src/debug/elfutils/0.189/backends/ppc_symbol.c
  /usr/src/debug/elfutils/0.189/backends/sparc_cfi.c /usr/src/debug/elfutils/0.189/backends/riscv_symbol.c /usr/src/debug/elfutils/0.189/backends/s390_initreg.c /usr/src/debug/elfutils/0.189/backends/sh_regs.c /usr/src/debug/elfutils/0.189/backends/ppc_corenote.c /usr/src/debug/elfutils/0.189/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.189/backends/x86_corenote.c /usr/src/debug/elfutils/0.189/tests/dwflmodtest.c /usr/src/debug/elfutils/0.189/tests/alldts.c /usr/src/debug/elfutils/0.189/libelf/gnuhash_xlate.h /usr/src/debug/elfutils/0.189/tests/fillfile.c /usr/src/debug/elfutils/0.189/libelf/elf32_updatefile.c /usr/src/debug/elfutils/0.189/backends/csky_attrs.c /usr/src/debug/elfutils/0.189/tests/show-die-info.c /usr/src/debug/elfutils/0.189/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.189/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.189/backends/sh_reloc.def /usr/src/debug/elfutils/0.189/libelf/gelf_getvernaux.c /usr/src/debug/elfutils/0.189/libelf/elf_flagelf.
 c /usr/src/debug/elfutils/0.189/libelf/elf_flagscn.c /usr/src/debug/elfutils/0.189/libelf/elf_newdata.c /usr/src/debug/elfutils/0.189/libelf/elf_nextscn.c /usr/src/debug/elfutils/0.189/libelf/elf_version.c /usr/src/debug/elfutils/0.189/tests/emptyfile.c /usr/src/debug/elfutils/0.189/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.189/backends/arm_reloc.def /usr/src/debug/elfutils/0.189/src/strings.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.189/libelf/nlist.c /usr/src/debug/elfutils/0.189/tests/typeiter.c /usr/src/debug/elfutils/0.189/libelf/nlist.h /usr/src/debug/elfutils/0.189/tests/asm-tst7.c /usr/src/debug/elfutils/0.189/libelf/elf_flagdata.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_syminfo.c /usr/src/debug/elfutils/0.189/tests/get-pubnames.c /usr/src/debug/elfutils/0.189/libelf/gelf_getehdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getphdr.c /usr/src/debug/elfutils/0.189/libelf/g
 elf_getshdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_newehdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_newphdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getchdr.c /usr/src/debug/elfutils/0.189/tests/get-files.c /usr/src/debug/elfutils/0.189/backends/arc_symbol.c /usr/src/debug/elfutils/0.189/backends/ppc64_init.c /usr/src/debug/elfutils/0.189/tests/typeiter2.c /usr/src/debug/elfutils/0.189/tests/aggregate_size.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverdaux.c /usr/src/debug/elfutils/0.189/tests/elfgetzdata.c /usr/src/debug/elfutils/0.189/tests/next-lines.c /usr/src/debug/elfutils/0.189/backends/riscv_initreg.c /usr/src/debug/elfutils/0.189/tests/sectiondump.c /usr/src/debug/elfutils/0.189/libelf/dl-hash.h /usr/src/debug/elfutils/0.189/backends/s390_reloc.def /usr/src/debug/elfutils/0.189/libelf/gelf_getversym.c /usr/src/debug/elfutils/0.189/tests/asm-tst9.c /usr/src/debug/elfutils/0.189/tests/dwflsyms.c /usr/src/debug/elfutils/0.189/tests/vdsosyms.c /usr/src/debug/elfu
 tils/0.189/backends/arm_cfi.c /usr/src/debug/elfutils/0.189/backends/m68k_init.c /usr/src/debug/elfutils/0.189/backends/loongarch_init.c /usr/src/debug/elfutils/0.189/backends/m68k_regs.c /usr/src/debug/elfutils/0.189/libelf/elf_scnshndx.c /usr/src/debug/elfutils/0.189/tests/elfgetchdr.c /usr/src/debug/elfutils/0.189/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.189/backends/riscv_cfi.c /usr/src/debug/elfutils/0.189/libelf/elf32_xlatetof.c /usr/src/debug/elfutils/0.189/libelf/elf_next.c /usr/src/debug/elfutils/0.189/tests/get-units-split.c /usr/src/debug/elfutils/0.189/tests/varlocs.c /usr/src/debug/elfutils/0.189/tests/find-prologues.c /usr/src/debug/elfutils/0.189/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.189/backends/csky_init.c /usr/src/debug/elfutils/0.189/backends/csky_regs.c /usr/src/debug/elfutils/0.189/libelf/elf_getbase.c /usr/src/debug/elfutils/0.189/backends/sparc_corenote.c /usr/src/debug/elfutils/0.189/libelf/elf_getdata.c /usr/src/debug/elfutils/0.18
 9/tests/next_cfi.c /usr/src/debug/elfutils/0.189/libelf/elf_getphdrnum.c /usr/src/debug/elfutils/0.189/libelf/elf_getshdrnum.c /usr/src/debug/elfutils/0.189/tests/next-files.c /usr/src/debug/elfutils/0.189/src/size.c /usr/src/debug/elfutils/0.189/backends/x86_64_regs.c /usr/src/debug/elfutils/0.189/tests/asm-tst1.c /usr/src/debug/elfutils/0.189/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf_update.c /usr/src/debug/elfutils/0.189/libelf/elf_memory.c /usr/src/debug/elfutils/0.189/backends/sh_retval.c /usr/src/debug/elfutils/0.189/backends/sh_symbol.c /usr/src/debug/elfutils/0.189/libelf/gelf_getclass.c /usr/src/debug/elfutils/0.189/tests/asm-tst3.c /usr/src/debug/elfutils/0.189/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.189/tests/buildid.c /usr/src/debug/elfutils/0.189/tests/elfshphehdr.c /usr/src/debug/elfutils/0.189/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.189/src/elfcmp.c /usr/src/debug/elfutils/0.189/src/ranlib.c /usr/src/debug/elfutil
 s/0.189/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.189/src/arlib2.c /usr/src/debug/elfutils/0.189/tests/saridx.c /usr/src/debug/elfutils/0.189/backends/riscv_regs.c /usr/src/debug/elfutils/0.189/backends/ppc_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf_rand.c /usr/src/debug/elfutils/0.189/tests/xlate_notes.c /usr/src/debug/elfutils/0.189/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.189/src/ar.c /usr/src/debug/elfutils/0.189/tests/funcretval.c /usr/src/debug/elfutils/0.189/tests/asm-tst5.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_sym.c /usr/src/debug/elfutils/0.189/tests/line2addr.c /usr/src/debug/elfutils/0.189/backends/riscv_retval.c /usr/src/debug/elfutils/0.189/libelf/elf32_fsize.c /usr/src/debug/elfutils/0.189/backends/sparc_regs.c /usr/src/debug/elfutils/0.189/libelf/elf_begin.c /usr/src/debug/elfutils/0.189/tests/addrscopes.c /usr/src/debug/elfutils/0.189/tests/funcscopes.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-elf-align.c /usr/src/debug/
 elfutils/0.189/tests/arextract.c /usr/src/debug/elfutils/0.189/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.189/backends/m68k_cfi.c /usr/src/debug/elfutils/0.189/libelf/elf_compress_gnu.c /usr/src/debug/elfutils/0.189/backends/arc_reloc.def /usr/src/debug/elfutils/0.189/libelf/elf_getshdrstrndx.c /usr/src/debug/elfutils/0.189/libelf/gelf_fsize.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlate.c /usr/src/debug/elfutils/0.189/tests/arls.c /usr/src/debug/elfutils/0.189/tests/hash.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlate.h /usr/src/debug/elfutils/0.189/src/arlib.c /usr/src/debug/elfutils/0.189/src/stack.c /usr/src/debug/elfutils/0.189/src/strip.c /usr/src/debug/elfutils/0.189/tests/strptr.c /usr/src/debug/elfutils/0.189/src/arlib.h /usr/src/debug/elfutils/0.189/backends/alpha_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf_getarsym.c /usr/src/debug/elfutils/0.189/libelf/elf_clone.c /usr/src/debug/elfutils/0.189/backends/sparc_attrs.c /usr/src/debug/elfutils
 /0.189/backends/x86_64_retval.c /usr/src/debug/elfutils/0.189/backends/bpf_reloc.def /usr/src/debug/elfutils/0.189/backends/arm_retval.c /usr/src/debug/elfutils/0.189/backends/arm_symbol.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_auxv.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsymshndx.c /usr/src/debug/elfutils/0.189/backends/alpha_init.c /usr/src/debug/elfutils/0.189/backends/s390_symbol.c /usr/src/debug/elfutils/0.189/backends/alpha_auxv.c /usr/src/debug/elfutils/0.189/backends/m68k_initreg.c /usr/src/debug/elfutils/0.189/tests/addrcfi.c /usr/src/debug/elfutils/0.189/backends/i386_initreg.c /usr/src/debug/elfutils/0.189/backends/alpha_retval.c /usr/src/debug/elfutils/0.189/tests/update3.c /usr/src/debug/elfutils/0.189/backends/arc_init.c /usr/src/debug/elfutils/0.189/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.189/libelf/elf_flagshdr.c /usr/src/debug/elfutils/0.189/tests/system-elf-libelf-test.c /usr/src/debug/elfutils/0.189/tests/peel_type.c", added "/usr/src
 /debug/elfutils/0.190/src/findtextrel.c /usr/src/debug/elfutils/0.190/tests/system-elf-gelf-test.c /usr/src/debug/elfutils/0.190/libelf/version_xlate.h /usr/src/debug/elfutils/0.190/backends/ppc64_reloc.def /usr/src/debug/elfutils/0.190/backends/riscv_reloc.def /usr/src/debug/elfutils/0.190/tests/getsrc_die.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_shdr.c /usr/src/debug/elfutils/0.190/backends/sparc_retval.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verdef.c /usr/src/debug/elfutils/0.190/libelf/elf_error.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_versym.c /usr/src/debug/elfutils/0.190/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.190/backends/sh_corenote.c /usr/src/debug/elfutils/0.190/libelf/elf_strptr.c /usr/src/debug/elfutils/0.190/backends/aarch64_retval.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlatetom.c /usr/src/debug/elfutils/0.190/backends/sh_init.c /usr/src/debug/elfutils/0.190/tests/update1.c /usr/src/debug/elfutils/0.190/tests/get-lines.c /
 usr/src/debug/elfutils/0.190/backends/arm_initreg.c /usr/src/debug/elfutils/0.190/backends/csky_reloc.def /usr/src/debug/elfutils/0.190/backends/s390_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_cntl.c /usr/src/debug/elfutils/0.190/src/nm.c /usr/src/debug/elfutils/0.190/backends/common-reloc.c /usr/src/debug/elfutils/0.190/backends/arm_attrs.c /usr/src/debug/elfutils/0.190/backends/i386_symbol.c /usr/src/debug/elfutils/0.190/tests/get-aranges.c /usr/src/debug/elfutils/0.190/tests/allregs.c /usr/src/debug/elfutils/0.190/backends/i386_reloc.def /usr/src/debug/elfutils/0.190/backends/s390_cfi.c /usr/src/debug/elfutils/0.190/libelf/gelf_getmove.c /usr/src/debug/elfutils/0.190/libelf/gelf_getnote.c /usr/src/debug/elfutils/0.190/tests/asm-tst6.c /usr/src/debug/elfutils/0.190/backends/sparc_symbol.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.190/tests/elfputzdata.c /usr/src/debug/elfutils/0.190/src/elflint.c /usr/src/debug/elfutils/0
 .190/src/elfcompress.c /usr/src/debug/elfutils/0.190/backends/ia64_symbol.c /usr/src/debug/elfutils/0.190/tests/scnnames.c /usr/src/debug/elfutils/0.190/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.190/tests/show-abbrev.c /usr/src/debug/elfutils/0.190/backends/csky_cfi.c /usr/src/debug/elfutils/0.190/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.190/src/arlib-argp.c /usr/src/debug/elfutils/0.190/libelf/elf_rawdata.c /usr/src/debug/elfutils/0.190/libelf/elf_rawfile.c /usr/src/debug/elfutils/0.190/libelf/elf_readall.c /usr/src/debug/elfutils/0.190/backends/loongarch_initreg.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_rel.c /usr/src/debug/elfutils/0.190/libelf/elf_fill.c /usr/src/debug/elfutils/0.190/tests/asm-tst8.c /usr/src/debug/elfutils/0.190/libelf/libelfP.h /usr/src/debug/elfutils/0.190/libelf/elf32_offscn.c /usr/src/debug/elfutils/0.190/src/elfclassify.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.190/tests/dwfl-proc
 -attach.c /usr/src/debug/elfutils/0.190/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.190/libelf/elf_ndxscn.c /usr/src/debug/elfutils/0.190/libelf/elf_newscn.c /usr/src/debug/elfutils/0.190/libelf/gelf_getrela.c /usr/src/debug/elfutils/0.190/backends/aarch64_symbol.c /usr/src/debug/elfutils/0.190/backends/csky_initreg.c /usr/src/debug/elfutils/0.190/src/readelf.c /usr/src/debug/elfutils/0.190/tests/low_high_pc.c /usr/src/debug/elfutils/0.190/tests/vendorelf.c /usr/src/debug/elfutils/0.190/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.190/backends/i386_retval.c /usr/src/debug/elfutils/0.190/libelf/note_xlate.h /usr/src/debug/elfutils/0.190/src/objdump.c /usr/src/debug/elfutils/0.190/src/unstrip.c /usr/src/debug/elfutils/0.190/tests/early-offscn.c /usr/src/debug/elfutils/0.190/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.190/backends/arm_auxv.c /usr/src/debug/elfutils/0.190/backends/arm_init.c /usr/src/debug/elfutils/0.190/backends/arm_regs.c /usr/src/debug
 /elfutils/0.190/tests/rerequest_tag.c /usr/src/debug/elfutils/0.190/tests/newscn.c /usr/src/debug/elfutils/0.190/libelf/elf_hash.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverdef.c /usr/src/debug/elfutils/0.190/tests/asm-tst2.c /usr/src/debug/elfutils/0.190/backends/sparc_reloc.def /usr/src/debug/elfutils/0.190/libelf/elf32_updatenull.c /usr/src/debug/elfutils/0.190/tests/unit-info.c /usr/src/debug/elfutils/0.190/libelf/chdr_xlate.h /usr/src/debug/elfutils/0.190/tests/get-units-invalid.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsyminfo.c /usr/src/debug/elfutils/0.190/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.190/backends/ppc64_retval.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_ehdr.c /usr/src/debug/elfutils/0.190/tests/asm-tst4.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_rela.c /usr/src/debug/elfutils/0.190/libelf/elf_getident.c /usr/src/debug/elfutils/0.190/libelf/elf_compress.c /usr/src/debug/elfutils/0.190/backends/s390_unwind.c /usr/src/debug/elfutils
 /0.190/backends/arm_corenote.c /usr/src/debug/elfutils/0.190/backends/bpf_regs.c /usr/src/debug/elfutils/0.190/backends/bpf_init.c /usr/src/debug/elfutils/0.190/libelf/elf_getdata_rawchunk.c /usr/src/debug/elfutils/0.190/tests/read_unaligned.c /usr/src/debug/elfutils/0.190/backends/csky_symbol.c /usr/src/debug/elfutils/0.190/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.190/backends/csky_corenote.c /usr/src/debug/elfutils/0.190/tests/allfcts.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verdaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_vernaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verneed.c /usr/src/debug/elfutils/0.190/backends/alpha_corenote.c /usr/src/debug/elfutils/0.190/libelf/elf32_getehdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_getphdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_getshdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_newehdr.c /usr/src/debug/elfutils/0.190/backends/ppc_reloc.def /usr/src/debug/elfutils/0.190/tests/all-dwa
 rf-ranges.c /usr/src/debug/elfutils/0.190/libelf/elf32_newphdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_getchdr.h /usr/src/debug/elfutils/0.190/tests/dwarfcfi.c /usr/src/debug/elfutils/0.190/backends/m68k_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf32_xlatetom.c /usr/src/debug/elfutils/0.190/libelf/elf_gnu_hash.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_dyn.c /usr/src/debug/elfutils/0.190/backends/aarch64_regs.c /usr/src/debug/elfutils/0.190/tests/addsections.c /usr/src/debug/elfutils/0.190/backends/ppc_attrs.c /usr/src/debug/elfutils/0.190/libelf/gelf_getdyn.c /usr/src/debug/elfutils/0.190/libelf/gelf_getlib.c /usr/src/debug/elfutils/0.190/backends/s390_corenote.c /usr/src/debug/elfutils/0.190/libelf/gelf_getrel.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsym.c /usr/src/debug/elfutils/0.190/libelf/gelf_offscn.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_phdr.c /usr/src/debug/elfutils/0.190/tests/deleted-lib.c /usr/src/debug/elfutils/0.190/tests/rdwrmmap.c 
 /usr/src/debug/elfutils/0.190/libelf/elf_end.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_symshndx.c /usr/src/debug/elfutils/0.190/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.190/backends/riscv_corenote.c /usr/src/debug/elfutils/0.190/libelf/elf_getarhdr.c /usr/src/debug/elfutils/0.190/backends/ia64_retval.c /usr/src/debug/elfutils/0.190/backends/m68k_retval.c /usr/src/debug/elfutils/0.190/backends/ia64_init.c /usr/src/debug/elfutils/0.190/backends/ia64_regs.c /usr/src/debug/elfutils/0.190/libelf/common.h /usr/src/debug/elfutils/0.190/libelf/elf_getaroff.c /usr/src/debug/elfutils/0.190/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.190/src/addr2line.c /usr/src/debug/elfutils/0.190/backends/linux-core-note.c /usr/src/debug/elfutils/0.190/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.190/libelf/libelf.h /usr/src/debug/elfutils/0.190/backends/ppc_cfi.c /usr/src/debug/elfutils/0.190/tests/elfstrtab.c /usr/src/debug/elfutils/0.190/libelf/elf_flagehdr.c /usr/src/
 debug/elfutils/0.190/libelf/elf_flagphdr.c /usr/src/debug/elfutils/0.190/tests/showptable.c /usr/src/debug/elfutils/0.190/tests/update2.c /usr/src/debug/elfutils/0.190/backends/i386_unwind.c /usr/src/debug/elfutils/0.190/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.190/tests/msg_tst.c /usr/src/debug/elfutils/0.190/backends/ppc_auxv.c /usr/src/debug/elfutils/0.190/backends/ppc_init.c /usr/src/debug/elfutils/0.190/backends/ppc_regs.c /usr/src/debug/elfutils/0.190/backends/s390_init.c /usr/src/debug/elfutils/0.190/backends/s390_regs.c /usr/src/debug/elfutils/0.190/tests/newdata.c /usr/src/debug/elfutils/0.190/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_move.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlatetof.c /usr/src/debug/elfutils/0.190/tests/newfile.c /usr/src/debug/elfutils/0.190/backends/riscv_init.c /usr/src/debug/elfutils/0.190/tests/getphdrnum.c /usr/src/debug/elfutils/0.190/backends/sparc_init.c /usr/src/debug/elfutils/0.190/libe
 lf/elf32_checksum.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverneed.c /usr/src/debug/elfutils/0.190/libelf/gelf.h /usr/src/debug/elfutils/0.190/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.190/backends/m68k_reloc.def /usr/src/debug/elfutils/0.190/backends/bpf_symbol.c /usr/src/debug/elfutils/0.190/backends/libebl_CPU.h /usr/src/debug/elfutils/0.190/backends/i386_corenote.c /usr/src/debug/elfutils/0.190/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.190/backends/sparc_auxv.c /usr/src/debug/elfutils/0.190/backends/ia64_reloc.def /usr/src/debug/elfutils/0.190/tests/zstrptr.c /usr/src/debug/elfutils/0.190/backends/i386_cfi.c /usr/src/debug/elfutils/0.190/tests/ecp.c /usr/src/debug/elfutils/0.190/tests/backtrace.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.190/backends/loongarch_cfi.c /usr/src/debug/elfutils/0.190/backends/aarch64_init.c /usr/src/debug/elfutils/0.190/libelf/elf_kind.c /usr/src/debug/elfutils/0.190/backends
 /x86_64_init.c /usr/src/debug/elfutils/0.190/tests/elfcopy.c /usr/src/debug/elfutils/0.190/tests/leb128.c /usr/src/debug/elfutils/0.190/libelf/gelf_checksum.c /usr/src/debug/elfutils/0.190/backends/m68k_corenote.c /usr/src/debug/elfutils/0.190/libelf/gelf_getauxv.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_lib.c /usr/src/debug/elfutils/0.190/tests/update4.c /usr/src/debug/elfutils/0.190/backends/alpha_reloc.def /usr/src/debug/elfutils/0.190/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.190/tests/debugaltlink.c /usr/src/debug/elfutils/0.190/tests/arsymtest.c /usr/src/debug/elfutils/0.190/backends/i386_auxv.c /usr/src/debug/elfutils/0.190/backends/i386_init.c /usr/src/debug/elfutils/0.190/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.190/backends/i386_regs.c /usr/src/debug/elfutils/0.190/libelf/elf.h /usr/src/debug/elfutils/0.190/libelf/elf_getscn.c /usr/src/debug/elfutils/0.190/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.190/tests/dwarf-getmac
 ros.c /usr/src/debug/elfutils/0.190/backends/loongarch_unwind.c /usr/src/debug/elfutils/0.190/backends/alpha_regs.c /usr/src/debug/elfutils/0.190/tests/dwarf-getstring.c /usr/src/debug/elfutils/0.190/backends/sparc_initreg.c /usr/src/debug/elfutils/0.190/tests/debuglink.c /usr/src/debug/elfutils/0.190/backends/ppc_retval.c /usr/src/debug/elfutils/0.190/backends/ppc_symbol.c /usr/src/debug/elfutils/0.190/backends/sparc_cfi.c /usr/src/debug/elfutils/0.190/backends/riscv_symbol.c /usr/src/debug/elfutils/0.190/backends/s390_initreg.c /usr/src/debug/elfutils/0.190/backends/sh_regs.c /usr/src/debug/elfutils/0.190/backends/ppc_corenote.c /usr/src/debug/elfutils/0.190/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.190/backends/x86_corenote.c /usr/src/debug/elfutils/0.190/tests/dwflmodtest.c /usr/src/debug/elfutils/0.190/tests/alldts.c /usr/src/debug/elfutils/0.190/libelf/gnuhash_xlate.h /usr/src/debug/elfutils/0.190/tests/fillfile.c /usr/src/debug/elfutils/0.190/libelf/elf32_updatefile.c /u
 sr/src/debug/elfutils/0.190/backends/csky_attrs.c /usr/src/debug/elfutils/0.190/tests/show-die-info.c /usr/src/debug/elfutils/0.190/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.190/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.190/backends/sh_reloc.def /usr/src/debug/elfutils/0.190/libelf/gelf_getvernaux.c /usr/src/debug/elfutils/0.190/libelf/elf_flagelf.c /usr/src/debug/elfutils/0.190/libelf/elf_flagscn.c /usr/src/debug/elfutils/0.190/libelf/elf_newdata.c /usr/src/debug/elfutils/0.190/libelf/elf_nextscn.c /usr/src/debug/elfutils/0.190/libelf/elf_version.c /usr/src/debug/elfutils/0.190/tests/emptyfile.c /usr/src/debug/elfutils/0.190/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.190/backends/arm_reloc.def /usr/src/debug/elfutils/0.190/src/strings.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.190/backends/loongarch_regs.c /usr/src/debug/elfutils/0.190/libelf/nlist.c /usr/src/debug/elfutils/0.190/tests/typeiter.c /usr/src/debug/elf
 utils/0.190/libelf/nlist.h /usr/src/debug/elfutils/0.190/tests/libelf.h /usr/src/debug/elfutils/0.190/tests/asm-tst7.c /usr/src/debug/elfutils/0.190/libelf/elf_flagdata.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_syminfo.c /usr/src/debug/elfutils/0.190/tests/get-pubnames.c /usr/src/debug/elfutils/0.190/libelf/gelf_getehdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getphdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getshdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_newehdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_newphdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getchdr.c /usr/src/debug/elfutils/0.190/tests/get-files.c /usr/src/debug/elfutils/0.190/backends/arc_symbol.c /usr/src/debug/elfutils/0.190/backends/ppc64_init.c /usr/src/debug/elfutils/0.190/tests/typeiter2.c /usr/src/debug/elfutils/0.190/backends/loongarch_corenote.c /usr/src/debug/elfutils/0.190/tests/aggregate_size.c /usr/src/debug/elfutils/0.190/libelf/
 gelf_getverdaux.c /usr/src/debug/elfutils/0.190/tests/elfgetzdata.c /usr/src/debug/elfutils/0.190/tests/next-lines.c /usr/src/debug/elfutils/0.190/backends/riscv_initreg.c /usr/src/debug/elfutils/0.190/tests/sectiondump.c /usr/src/debug/elfutils/0.190/libelf/dl-hash.h /usr/src/debug/elfutils/0.190/backends/s390_reloc.def /usr/src/debug/elfutils/0.190/libelf/gelf_getversym.c /usr/src/debug/elfutils/0.190/tests/asm-tst9.c /usr/src/debug/elfutils/0.190/tests/dwflsyms.c /usr/src/debug/elfutils/0.190/tests/vdsosyms.c /usr/src/debug/elfutils/0.190/backends/arm_cfi.c /usr/src/debug/elfutils/0.190/backends/m68k_init.c /usr/src/debug/elfutils/0.190/backends/loongarch_init.c /usr/src/debug/elfutils/0.190/backends/m68k_regs.c /usr/src/debug/elfutils/0.190/libelf/elf_scnshndx.c /usr/src/debug/elfutils/0.190/tests/elfgetchdr.c /usr/src/debug/elfutils/0.190/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.190/backends/riscv_cfi.c /usr/src/debug/elfutils/0.190/libelf/elf32_xlatetof.c /usr/src/d
 ebug/elfutils/0.190/libelf/elf_next.c /usr/src/debug/elfutils/0.190/tests/get-units-split.c /usr/src/debug/elfutils/0.190/tests/varlocs.c /usr/src/debug/elfutils/0.190/tests/find-prologues.c /usr/src/debug/elfutils/0.190/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.190/backends/csky_init.c /usr/src/debug/elfutils/0.190/backends/csky_regs.c /usr/src/debug/elfutils/0.190/libelf/elf_getbase.c /usr/src/debug/elfutils/0.190/backends/sparc_corenote.c /usr/src/debug/elfutils/0.190/libelf/elf_getdata.c /usr/src/debug/elfutils/0.190/tests/next_cfi.c /usr/src/debug/elfutils/0.190/libelf/elf_getphdrnum.c /usr/src/debug/elfutils/0.190/libelf/elf_getshdrnum.c /usr/src/debug/elfutils/0.190/tests/next-files.c /usr/src/debug/elfutils/0.190/src/size.c /usr/src/debug/elfutils/0.190/backends/x86_64_regs.c /usr/src/debug/elfutils/0.190/tests/asm-tst1.c /usr/src/debug/elfutils/0.190/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf_memory.c /usr/src/debug/elfutils/0.190/backen
 ds/sh_retval.c /usr/src/debug/elfutils/0.190/backends/sh_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf_update.c /usr/src/debug/elfutils/0.190/libelf/gelf_getclass.c /usr/src/debug/elfutils/0.190/tests/asm-tst3.c /usr/src/debug/elfutils/0.190/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.190/tests/buildid.c /usr/src/debug/elfutils/0.190/tests/elfshphehdr.c /usr/src/debug/elfutils/0.190/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.190/src/elfcmp.c /usr/src/debug/elfutils/0.190/src/ranlib.c /usr/src/debug/elfutils/0.190/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.190/src/arlib2.c /usr/src/debug/elfutils/0.190/tests/saridx.c /usr/src/debug/elfutils/0.190/backends/riscv_regs.c /usr/src/debug/elfutils/0.190/backends/ppc_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf_rand.c /usr/src/debug/elfutils/0.190/tests/xlate_notes.c /usr/src/debug/elfutils/0.190/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.190/src/ar.c /usr/src/debug/elfutils/0.190/tests/funcr
 etval.c /usr/src/debug/elfutils/0.190/tests/asm-tst5.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_sym.c /usr/src/debug/elfutils/0.190/tests/line2addr.c /usr/src/debug/elfutils/0.190/backends/riscv_retval.c /usr/src/debug/elfutils/0.190/libelf/elf32_fsize.c /usr/src/debug/elfutils/0.190/backends/sparc_regs.c /usr/src/debug/elfutils/0.190/libelf/elf_begin.c /usr/src/debug/elfutils/0.190/tests/addrscopes.c /usr/src/debug/elfutils/0.190/tests/funcscopes.c /usr/src/debug/elfutils/0.190/src/srcfiles.cxx /usr/src/debug/elfutils/0.190/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.190/tests/arextract.c /usr/src/debug/elfutils/0.190/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.190/backends/m68k_cfi.c /usr/src/debug/elfutils/0.190/libelf/elf_compress_gnu.c /usr/src/debug/elfutils/0.190/backends/arc_reloc.def /usr/src/debug/elfutils/0.190/libelf/elf_getshdrstrndx.c /usr/src/debug/elfutils/0.190/libelf/gelf_fsize.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlat
 e.c /usr/src/debug/elfutils/0.190/tests/arls.c /usr/src/debug/elfutils/0.190/tests/hash.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlate.h /usr/src/debug/elfutils/0.190/src/arlib.c /usr/src/debug/elfutils/0.190/src/stack.c /usr/src/debug/elfutils/0.190/src/strip.c /usr/src/debug/elfutils/0.190/tests/strptr.c /usr/src/debug/elfutils/0.190/src/arlib.h /usr/src/debug/elfutils/0.190/backends/alpha_symbol.c /usr/src/debug/elfutils/0.190/backends/loongarch_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_getarsym.c /usr/src/debug/elfutils/0.190/libelf/elf_clone.c /usr/src/debug/elfutils/0.190/backends/sparc_attrs.c /usr/src/debug/elfutils/0.190/backends/x86_64_retval.c /usr/src/debug/elfutils/0.190/backends/bpf_reloc.def /usr/src/debug/elfutils/0.190/backends/arm_retval.c /usr/src/debug/elfutils/0.190/backends/arm_symbol.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_auxv.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsymshndx.c /usr/src/debug/elfutils/0.190/backends/alpha_init.c /u
 sr/src/debug/elfutils/0.190/backends/s390_symbol.c /usr/src/debug/elfutils/0.190/backends/alpha_auxv.c /usr/src/debug/elfutils/0.190/backends/m68k_initreg.c /usr/src/debug/elfutils/0.190/tests/addrcfi.c /usr/src/debug/elfutils/0.190/backends/i386_initreg.c /usr/src/debug/elfutils/0.190/backends/alpha_retval.c /usr/src/debug/elfutils/0.190/tests/update3.c /usr/src/debug/elfutils/0.190/backends/arc_init.c /usr/src/debug/elfutils/0.190/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.190/libelf/elf_flagshdr.c /usr/src/debug/elfutils/0.190/tests/system-elf-libelf-test.c /usr/src/debug/elfutils/0.190/tests/peel_type.c"
packages/core2-64-poky-linux/elfutils/elfutils-src: PKGSIZE changed from 4784766 to 4873827 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PKGSIZE changed from 10693708 to 10784886 (+1%)
packages/core2-64-poky-linux/elfutils/elfutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils: FILELIST: added "/usr/bin/eu-srcfiles"
packages/core2-64-poky-linux/elfutils/elfutils: PKGSIZE changed from 1586405 to 1641909 (+3%)
packages/core2-64-poky-linux/elfutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils: SRC_URI changed from "https://sourceware.org/elfutils/ftp/0.189/elfutils-0.189.tar.bz2 file://run-ptest file://0001-dso-link-change.patch file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0006-Fix-build-on-aarch64-musl.patch file://0001-libasm-may-link-with-libbz2-if-found.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-Add-helper-function-for-basename.patch" to "https://sourceware.org/elfutils/ftp/0.190/elfutils-0.190.tar.bz2 file://run-ptest file://0001-dso-link-change.patch file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0006-Fix-build-on-aarch64-musl.patch file://0001-libasm-may-link-with-libbz2-if-found.patch file://0001-libelf-elf_end.c-check-data_list
 .data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-Add-helper-function-for-basename.patch"
packages/core2-64-poky-linux/elfutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libasm: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libasm: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libasm: FILES: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libdebuginfod: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILES: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libdw: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: PKGSIZE changed from 642078 to 646174 (+1%)
packages/core2-64-poky-linux/elfutils/libdw: FILES: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libelf: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libelf: FILELIST: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: PKGSIZE changed from 104575 to 108671 (+4%)
packages/core2-64-poky-linux/elfutils/libelf: FILES: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
Changes to packages/core2-64-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 8291224 to 8291256 (+0%)
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
  /usr/bin/eu-srcfiles was added

--===============6429607857104567168==--

