Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F0BB878301
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 17so16707188pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5PFEs+uNhOXQ7BLY328OnXSXIcKW2cUI3m/+qizlkPM=;
	b=Wimuuo3a+lUybqgAcmDzOzj/8TpW4C1l9aHaEsgk/qTnOhYCTjXRLYdtReCiG/hvxk
	gF0gwDwEN09lgtlITVp5ICiLANRDzSMTLIH0/BJxp0tnK/5oQcw6gDtw7j1FUYbdB0+t
	lNP9UZeFFImym3BAbhjmaXtlr8RruybQ/I55J0F2svTqsqSXvpJU9xzB7GFrqWJg03fo
	+sb5AKTTQOSQj+BOoxRZnFCw9iJ84XKUujxikMjnlI2idoHfwMpGAwyoeISaPX4EgDd4
	srMhUnOmdxGOdxFgCylC3M6FEbqjZVKWmmspa6kgPrhHkYZ/FkzOJMIyuL8qqARE5s0+
	FekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5PFEs+uNhOXQ7BLY328OnXSXIcKW2cUI3m/+qizlkPM=;
	b=BM+IbMZAAH3FCIxWONKmZN2xmyocEJWXucxdT5aBL9wnYpJ5F1Bp3vLPync0KD6iwQ
	44ltiAzHKlLCyUhajUQGpoEWM+bRdDhtnmzgVonJAqtg+oibIiUOlFgrU6iOxKoagDTK
	YLuPRrJPA7tE/60un2Gn56v3+E8hbIgKKRZweiFCrhWYbUfQ1azgiONkXZFl42E1FZ9U
	iA9kH7HCS9rFDHlNOhnPLgTevn3mVTkwVsOLGivNT2dGvDywVHaAtS2/R7QnG0TLIEUM
	R2i7H0ZTwV+BJVTeTHzfZtbuU+e0OS4bB+SNAHQapDuIb7fDAVFq7fhV4DCA5fKaJtmU
	l6uQ==
X-Gm-Message-State: AJaThX6+Wf+z2RvDJ9B7Ilu5fNKMbRqnm2OzfqtcdtowLgRfMjp5BljR
	eanZn2ZJ+3tvYC8vz5k8nKckpw==
X-Google-Smtp-Source: AGs4zMZ3WzhnKevh7ZIn76n+h7qjijnsUZJKtObWedjiX9J7l+tzVMn5XjAcRHnZhfs5RM80Loy59Q==
X-Received: by 10.99.95.70 with SMTP id t67mr35324366pgb.49.1511750133214;
	Sun, 26 Nov 2017 18:35:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:07 -0800
Message-Id: <1511750112-2263-21-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 21/26] binutls: Security fix for CVE-2017-9752
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:32 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-9752.patch          | 208 +++++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9752.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 99fc1b1..68d21c8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -63,6 +63,7 @@ SRC_URI = "\
      file://CVE-2017-9749.patch \
      file://CVE-2017-9750.patch \
      file://CVE-2017-9751.patch \
+     file://CVE-2017-9752.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9752.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9752.patch
new file mode 100644
index 0000000..f63a993
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9752.patch
@@ -0,0 +1,208 @@
+From c53d2e6d744da000aaafe0237bced090aab62818 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 14 Jun 2017 11:27:15 +0100
+Subject: [PATCH] Fix potential address violations when processing a corrupt
+ Alpha VMA binary.
+
+	PR binutils/21589
+	* vms-alpha.c (_bfd_vms_get_value): Add an extra parameter - the
+	maximum value for the ascic pointer.  Check that name processing
+	does not read beyond this value.
+	(_bfd_vms_slurp_etir): Add checks for attempts to read beyond the
+	end of etir record.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9752
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog   |  9 +++++++++
+ bfd/vms-alpha.c | 51 +++++++++++++++++++++++++++++++++++++++++----------
+ 2 files changed, 50 insertions(+), 10 deletions(-)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -9,6 +9,15 @@
+ 
+ 2017-06-14  Nick Clifton  <nickc@redhat.com>
+  
++       PR binutils/21589
++       * vms-alpha.c (_bfd_vms_get_value): Add an extra parameter - the
++       maximum value for the ascic pointer.  Check that name processing
++       does not read beyond this value.
++       (_bfd_vms_slurp_etir): Add checks for attempts to read beyond the
++       end of etir record.
++
++2017-06-14  Nick Clifton  <nickc@redhat.com>
++ 
+        PR binutils/21578
+        * elf32-sh.c (sh_elf_set_mach_from_flags): Fix check for invalid
+        flag value.
+Index: git/bfd/vms-alpha.c
+===================================================================
+--- git.orig/bfd/vms-alpha.c
++++ git/bfd/vms-alpha.c
+@@ -1456,7 +1456,7 @@ dst_retrieve_location (bfd *abfd, unsign
+ /* Write multiple bytes to section image.  */
+ 
+ static bfd_boolean
+-image_write (bfd *abfd, unsigned char *ptr, int size)
++image_write (bfd *abfd, unsigned char *ptr, unsigned int size)
+ {
+ #if VMS_DEBUG
+   _bfd_vms_debug (8, "image_write from (%p, %d) to (%ld)\n", ptr, size,
+@@ -1603,14 +1603,16 @@ _bfd_vms_etir_name (int cmd)
+ #define HIGHBIT(op) ((op & 0x80000000L) == 0x80000000L)
+ 
+ static void
+-_bfd_vms_get_value (bfd *abfd, const unsigned char *ascic,
++_bfd_vms_get_value (bfd *abfd,
++		    const unsigned char *ascic,
++		    const unsigned char *max_ascic,
+                     struct bfd_link_info *info,
+                     bfd_vma *vma,
+                     struct alpha_vms_link_hash_entry **hp)
+ {
+   char name[257];
+-  int len;
+-  int i;
++  unsigned int len;
++  unsigned int i;
+   struct alpha_vms_link_hash_entry *h;
+ 
+   /* Not linking.  Do not try to resolve the symbol.  */
+@@ -1622,6 +1624,14 @@ _bfd_vms_get_value (bfd *abfd, const uns
+     }
+ 
+   len = *ascic;
++  if (ascic + len >= max_ascic)
++    {
++      _bfd_error_handler (_("Corrupt vms value"));
++      *vma = 0;
++      *hp = NULL;
++      return;
++    }
++
+   for (i = 0; i < len; i++)
+     name[i] = ascic[i + 1];
+   name[i] = 0;
+@@ -1741,6 +1751,15 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+       _bfd_hexdump (8, ptr, cmd_length - 4, 0);
+ #endif
+ 
++      /* PR 21589: Check for a corrupt ETIR record.  */
++      if (cmd_length < 4)
++	{
++	corrupt_etir:
++	  _bfd_error_handler (_("Corrupt ETIR record encountered"));
++	  bfd_set_error (bfd_error_bad_value);
++	  return FALSE;
++	}
++
+       switch (cmd)
+         {
+           /* Stack global
+@@ -1748,7 +1767,7 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+ 
+              stack 32 bit value of symbol (high bits set to 0).  */
+         case ETIR__C_STA_GBL:
+-          _bfd_vms_get_value (abfd, ptr, info, &op1, &h);
++          _bfd_vms_get_value (abfd, ptr, maxptr, info, &op1, &h);
+           _bfd_vms_push (abfd, op1, alpha_vms_sym_to_ctxt (h));
+           break;
+ 
+@@ -1757,6 +1776,8 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+ 
+              stack 32 bit value, sign extend to 64 bit.  */
+         case ETIR__C_STA_LW:
++	  if (ptr + 4 >= maxptr)
++	    goto corrupt_etir;
+           _bfd_vms_push (abfd, bfd_getl32 (ptr), RELC_NONE);
+           break;
+ 
+@@ -1765,6 +1786,8 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+ 
+              stack 64 bit value of symbol.  */
+         case ETIR__C_STA_QW:
++	  if (ptr + 8 >= maxptr)
++	    goto corrupt_etir;
+           _bfd_vms_push (abfd, bfd_getl64 (ptr), RELC_NONE);
+           break;
+ 
+@@ -1778,6 +1801,8 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+           {
+             int psect;
+ 
++	    if (ptr + 12 >= maxptr)
++	      goto corrupt_etir;
+             psect = bfd_getl32 (ptr);
+             if ((unsigned int) psect >= PRIV (section_count))
+               {
+@@ -1867,6 +1892,8 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+           {
+             int size;
+ 
++	    if (ptr + 4 >= maxptr)
++	      goto corrupt_etir;
+             size = bfd_getl32 (ptr);
+             _bfd_vms_pop (abfd, &op1, &rel1);
+             if (rel1 != RELC_NONE)
+@@ -1879,7 +1906,7 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+           /* Store global: write symbol value
+              arg: cs	global symbol name.  */
+         case ETIR__C_STO_GBL:
+-          _bfd_vms_get_value (abfd, ptr, info, &op1, &h);
++          _bfd_vms_get_value (abfd, ptr, maxptr, info, &op1, &h);
+           if (h && h->sym)
+             {
+               if (h->sym->typ == EGSD__C_SYMG)
+@@ -1901,7 +1928,7 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+           /* Store code address: write address of entry point
+              arg: cs	global symbol name (procedure).  */
+         case ETIR__C_STO_CA:
+-          _bfd_vms_get_value (abfd, ptr, info, &op1, &h);
++          _bfd_vms_get_value (abfd, ptr, maxptr, info, &op1, &h);
+           if (h && h->sym)
+             {
+               if (h->sym->flags & EGSY__V_NORM)
+@@ -1946,8 +1973,10 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+              da	data.  */
+         case ETIR__C_STO_IMM:
+           {
+-            int size;
++            unsigned int size;
+ 
++	    if (ptr + 4 >= maxptr)
++	      goto corrupt_etir;
+             size = bfd_getl32 (ptr);
+             image_write (abfd, ptr + 4, size);
+           }
+@@ -1960,7 +1989,7 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+              store global longword: store 32bit value of symbol
+              arg: cs	symbol name.  */
+         case ETIR__C_STO_GBL_LW:
+-          _bfd_vms_get_value (abfd, ptr, info, &op1, &h);
++          _bfd_vms_get_value (abfd, ptr, maxptr, info, &op1, &h);
+ #if 0
+           abort ();
+ #endif
+@@ -2013,7 +2042,7 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+              da	signature.  */
+ 
+         case ETIR__C_STC_LP_PSB:
+-          _bfd_vms_get_value (abfd, ptr + 4, info, &op1, &h);
++          _bfd_vms_get_value (abfd, ptr + 4, maxptr, info, &op1, &h);
+           if (h && h->sym)
+             {
+               if (h->sym->typ == EGSD__C_SYMG)
+@@ -2109,6 +2138,8 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+           /* Augment relocation base: increment image location counter by offset
+              arg: lw	offset value.  */
+         case ETIR__C_CTL_AUGRB:
++	  if (ptr + 4 >= maxptr)
++	    goto corrupt_etir;
+           op1 = bfd_getl32 (ptr);
+           image_inc_ptr (abfd, op1);
+           break;
-- 
2.7.4


