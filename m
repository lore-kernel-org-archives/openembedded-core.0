Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.11528.1620399533640558048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 07:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: +TMhIHXANlJGWkGzpMs/qA4RF+q2mchNjLFa5+/eWAvYGNQFWL8wbrsIhpOd8hHSnHXjllL8yf
 VHlFdSOVj35A==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="185873591"
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; 
   d="scan'208";a="185873591"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 07:58:51 -0700
IronPort-SDR: 1vbd0uGlEInuOYOs2Nswt24Sn1Ci7oDYzZrzbJIbcGYt2u+PtOqPzyVubrO/i8WdvK0wwiT2HC
 uHce567RxP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; 
   d="scan'208";a="533544167"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga001.fm.intel.com with ESMTP; 07 May 2021 07:58:50 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] binutils: fix CVE-2021-3487
Date: Fri,  7 May 2021 22:58:49 +0800
Message-Id: <20210507145849.33840-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

drop changes to changelog file in the patch so it can be backport.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2021-3487.patch     | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index a586faf5ab..3e10279b1d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -47,5 +47,6 @@ SRC_URI = "\
      file://CVE-2020-16592.patch \
      file://CVE-2020-16598.patch \
      file://CVE-2021-20197.patch \
+     file://CVE-2021-3487.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch
new file mode 100644
index 0000000000..1502d03f43
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch
@@ -0,0 +1,83 @@
+From 647cebce12a6b0a26960220caff96ff38978cf24 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 26 Nov 2020 17:08:33 +0000
+Subject: [PATCH] Prevent a memory allocation failure when parsing corrupt
+ DWARF debug sections.
+
+	PR 26946
+	* dwarf2.c (read_section): Check for debug sections with excessive
+	sizes.
+
+
+Upstream-Status: Backport [
+https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=647cebce12a6b0a26960220caff96ff38978cf24
+]
+CVE: CVE-2021-3487
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ bfd/dwarf2.c  | 25 +++++++++++++++++++------
+ 1 files changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 977bf43a6a1..8bbfc81d3e7 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -531,22 +531,24 @@ read_section (bfd *	      abfd,
+ 	      bfd_byte **     section_buffer,
+ 	      bfd_size_type * section_size)
+ {
+-  asection *msec;
+   const char *section_name = sec->uncompressed_name;
+   bfd_byte *contents = *section_buffer;
+-  bfd_size_type amt;
+ 
+   /* The section may have already been read.  */
+   if (contents == NULL)
+     {
++      bfd_size_type amt;
++      asection *msec;
++      ufile_ptr filesize;
++
+       msec = bfd_get_section_by_name (abfd, section_name);
+-      if (! msec)
++      if (msec == NULL)
+ 	{
+ 	  section_name = sec->compressed_name;
+ 	  if (section_name != NULL)
+ 	    msec = bfd_get_section_by_name (abfd, section_name);
+ 	}
+-      if (! msec)
++      if (msec == NULL)
+ 	{
+ 	  _bfd_error_handler (_("DWARF error: can't find %s section."),
+ 			      sec->uncompressed_name);
+@@ -554,12 +556,23 @@ read_section (bfd *	      abfd,
+ 	  return FALSE;
+ 	}
+ 
+-      *section_size = msec->rawsize ? msec->rawsize : msec->size;
++      amt = bfd_get_section_limit_octets (abfd, msec);
++      filesize = bfd_get_file_size (abfd);
++      if (amt >= filesize)
++	{
++	  /* PR 26946 */
++	  _bfd_error_handler (_("DWARF error: section %s is larger than its filesize! (0x%lx vs 0x%lx)"),
++			      section_name, (long) amt, (long) filesize);
++	  bfd_set_error (bfd_error_bad_value);
++	  return FALSE;
++	}
++      *section_size = amt;
+       /* Paranoia - alloc one extra so that we can make sure a string
+ 	 section is NUL terminated.  */
+-      amt = *section_size + 1;
++      amt += 1;
+       if (amt == 0)
+ 	{
++	  /* Paranoia - this should never happen.  */
+ 	  bfd_set_error (bfd_error_no_memory);
+ 	  return FALSE;
+ 	}
+-- 
+2.27.0
+
-- 
2.17.1

