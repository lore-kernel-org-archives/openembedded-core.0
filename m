Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB8F78E35
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:26 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id n7-v6so1265872pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KicGJ1ukBmTfnC0Ko88+qGe3FumRwgxmObrvAeAL99E=;
	b=H9wFA8hKAH37ZqlotX8R//9gl9R36K7adW583envwse1PKCS/EPs+x/bfZOiL8BzHf
	pkoeLkDOcsrmnUOgz7je05dDjbJ9QV2BhQYltixrDbaFbqqBtQuCDFdGVhPpecQfpGH9
	PHj6ojHIk5Qt5LjHPvYVko74aH15M0et2XqlfyL09SwtyjtwckHslMjhh7SWgL4yAZj6
	7nKBWLrnfa0i1QbeBzxrPzUqsO4Ex3Kse3BF+NDdu9mvoPngIe/uaXFzwq+Ar6/QA/hl
	MKx43UQaTdEo7+QSP3QuCiZtODAIoDjapppd8fK1pnd/8UbxGsYdNiVQYblqaWccyvkF
	UPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KicGJ1ukBmTfnC0Ko88+qGe3FumRwgxmObrvAeAL99E=;
	b=ll8Xet+Bry/Muy8qi8j3llyrxkZUwRqnOcAmZfrl2wTadX7pDr2MnLruzvHZh+P0DS
	wcdIccG11vCOkeiTx6EvimozVQOvoHN2/pu58HG7UDukCd2undFZg3c5tB4YLPLytL6H
	Bb8H52RCtHqwGkPx8aF7xG2BZ9P7C1YzOygV0TULPwIRCkFtGS5N6ZRGP0tlxskykZ1F
	YHr197yp6Ra6ATd5+fVmBlpKoOhmSoTA2IH8GS9R+FzKsLH7rPaHWt8EShHpPIXk1ucs
	pyZj+5yRnsn5DtitrYCCJVTE1wuCa6F8BwUqRdXJ30DcqBoAIZ9yFrFzde/vg0DrzInS
	HQgg==
X-Gm-Message-State: AOUpUlEq41nlgnhGhyCHn+BWhIHhY9Uqww5Dq6Bopmn5kb2MuekT4c+s
	1iZHZ2RCIrhmNqP7W3oMpYVKDTzc
X-Google-Smtp-Source: AA+uWPyIqm+8cxoLRe5/4MjcLo2PyXCyPU2QDGiowemYp9+bpHzCMue1uXPShCNoQoShvp/1HV0KSw==
X-Received: by 2002:a65:5b08:: with SMTP id
	y8-v6mr2999174pgq.297.1533742527698; 
	Wed, 08 Aug 2018 08:35:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:34:59 -0700
Message-Id: <1533742522-24357-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 04/27] binutls: Security fix CVE-2017-14933
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:26 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   2 +
 .../binutils/binutils/CVE-2017-14933_p1.patch      |  58 ++++++++++++
 .../binutils/binutils/CVE-2017-14933_p2.patch      | 102 +++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 788f98a..fb4ca64 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -38,6 +38,8 @@ SRC_URI = "\
      file://CVE-2017-12967.patch \
      file://CVE-2017-14930.patch \
      file://CVE-2017-14932.patch \
+     file://CVE-2017-14933_p1.patch \
+     file://CVE-2017-14933_p2.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p1.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p1.patch
new file mode 100644
index 0000000..9df8138
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p1.patch
@@ -0,0 +1,58 @@
+From 30d0157a2ad64e64e5ff9fcc0dbe78a3e682f573 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 26 Sep 2017 14:37:47 +0100
+Subject: [PATCH] Avoid needless resource usage when processing a corrupt DWARF
+ directory or file name table.
+
+	PR 22210
+	* dwarf2.c (read_formatted_entries): Fail early if we know that
+	the loop parsing data entries will overflow the end of the
+	section.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14933 #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/dwarf2.c  | 10 ++++++++++
+ 2 files changed, 17 insertions(+)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-09-26  Nick Clifton  <nickc@redhat.com>
++
++	PR 22210
++	* dwarf2.c (read_formatted_entries): Fail early if we know that
++	the loop parsing data entries will overflow the end of the
++	section.
++
+ 2017-09-26  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22204
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -1933,6 +1933,17 @@ read_formatted_entries (struct comp_unit
+ 
+   data_count = _bfd_safe_read_leb128 (abfd, buf, &bytes_read, FALSE, buf_end);
+   buf += bytes_read;
++
++  /* PR 22210.  Paranoia check.  Don't bother running the loop
++     if we know that we are going to run out of buffer.  */
++  if (data_count > (bfd_vma) (buf_end - buf))
++    {
++      _bfd_error_handler (_("Dwarf Error: data count (%Lx) larger than buffer size."),
++                         data_count);
++      bfd_set_error (bfd_error_bad_value);
++      return FALSE;
++    }
++
+   for (datai = 0; datai < data_count; datai++)
+     {
+       bfd_byte *format = format_header_data;
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p2.patch
new file mode 100644
index 0000000..607d92f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14933_p2.patch
@@ -0,0 +1,102 @@
+From 33e0a9a056bd23e923b929a4f2ab049ade0b1c32 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 26 Sep 2017 23:20:06 +0930
+Subject: [PATCH] Tidy reading data in read_formatted_entries
+
+Using read_attribute_value accomplishes two things: It checks for
+unexpected formats, and ensures the buffer pointer always increments.
+
+	PR 22210
+	* dwarf2.c (read_formatted_entries): Use read_attribute_value to
+	read data.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14933 #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  6 ++++++
+ bfd/dwarf2.c  | 37 +++++++------------------------------
+ 2 files changed, 13 insertions(+), 30 deletions(-)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-09-26  Alan Modra  <amodra@gmail.com>
++
++	PR 22210
++	* dwarf2.c (read_formatted_entries): Use read_attribute_value to
++	read data.
++
+ 2017-09-26  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR 22210
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -1955,6 +1955,7 @@ read_formatted_entries (struct comp_unit
+ 	  char *string_trash;
+ 	  char **stringp = &string_trash;
+ 	  unsigned int uint_trash, *uintp = &uint_trash;
++	  struct attribute attr;
+ 
+ 	  content_type = _bfd_safe_read_leb128 (abfd, format, &bytes_read,
+ 						FALSE, buf_end);
+@@ -1986,47 +1987,23 @@ read_formatted_entries (struct comp_unit
+ 	  form = _bfd_safe_read_leb128 (abfd, format, &bytes_read, FALSE,
+ 					buf_end);
+ 	  format += bytes_read;
++
++	  buf = read_attribute_value (&attr, form, 0, unit, buf, buf_end);
++	  if (buf == NULL)
++	    return FALSE;
+ 	  switch (form)
+ 	    {
+ 	    case DW_FORM_string:
+-	      *stringp = read_string (abfd, buf, buf_end, &bytes_read);
+-	      buf += bytes_read;
+-	      break;
+-
+ 	    case DW_FORM_line_strp:
+-	      *stringp = read_indirect_line_string (unit, buf, buf_end, &bytes_read);
+-	      buf += bytes_read;
++	      *stringp = attr.u.str;
+ 	      break;
+ 
+ 	    case DW_FORM_data1:
+-	      *uintp = read_1_byte (abfd, buf, buf_end);
+-	      buf += 1;
+-	      break;
+-
+ 	    case DW_FORM_data2:
+-	      *uintp = read_2_bytes (abfd, buf, buf_end);
+-	      buf += 2;
+-	      break;
+-
+ 	    case DW_FORM_data4:
+-	      *uintp = read_4_bytes (abfd, buf, buf_end);
+-	      buf += 4;
+-	      break;
+-
+ 	    case DW_FORM_data8:
+-	      *uintp = read_8_bytes (abfd, buf, buf_end);
+-	      buf += 8;
+-	      break;
+-
+ 	    case DW_FORM_udata:
+-	      *uintp = _bfd_safe_read_leb128 (abfd, buf, &bytes_read, FALSE,
+-					      buf_end);
+-	      buf += bytes_read;
+-	      break;
+-
+-	    case DW_FORM_block:
+-	      /* It is valid only for DW_LNCT_timestamp which is ignored by
+-		 current GDB.  */
++	      *uintp = attr.u.val;
+ 	      break;
+ 	    }
+ 	}
-- 
2.7.4


