Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id D350A78213
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:25 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u14so7590275plm.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CayQ8Jt2iTY0nlmie0RI3CTwC0d4HPxcZ1tWgcCEfVA=;
	b=DZcHdQrLOrN/ICMURjwlVL11m3xVsV65qZcg9wUtDFYmfmYRZ9k5zdODw3AqPWh4hr
	gDXVWqfRV6ksLbOqZM7vM8M1GC1HuPlajy0eNHahWsMJCgmwF5Aup8ipzy34Hzab4/Gt
	iMWC/RbhQyXbdMaMFXc3uh3r7VpooVidFgIS7/pXSFnXyulRAkZeovksxmJnM+UxNgMM
	ceqmBQ/n+4PmUIdVnPT6NsZDFEETliDSs5Eej8HnA7ZYpmc3Qenqk65gM5ZyLP/Lu+G/
	deRPjo+v7L9DcKS9XL7FIn1v/V2BtCO1fjQMgMmA5cCEcVnsfpUOYy87cga/kfQ3op34
	vbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CayQ8Jt2iTY0nlmie0RI3CTwC0d4HPxcZ1tWgcCEfVA=;
	b=rzU98+LfjjLHCeXuVDd2O64CPHMwrXF5PUa0lV1te0A7OMI6hG00BRcjHkeVxW69iJ
	xTTxOGq+qXzW5/hBq53+4+3pgNf9cPswfMGB8PjlJbT2SvuHVMSWyZrKAtitpaBXj7TO
	F2BkIyxZcQsU6CnJ4RjI2Ngk70f7jNTcj4Xc31G80QPhze+WPEVpybRvHCApiMpY0taU
	fZvhUIEobtOZqm9fGmzOB6LlwPM8GQcafTLhIIJfFJJc/TdipGiM/4pvKAAgwffAvjf6
	xaE12pRg8h0EeZw92FAc/y6m5Xz0idw5+MWZALAEIu5BlzuwumH6J3HzNisa/w9YGMBM
	MFZQ==
X-Gm-Message-State: AJaThX7pih3FXNLrnxp2JDf8lVjGHWFm1MFcpaYut5GE24XuTDjtlG+T
	NPqRTif4TO89D1SzSJkpRBWu9g==
X-Google-Smtp-Source: AGs4zMbl3Z87RiGSo2V/wNp6tootvAXwjHs4Omgb2zgxWtBgf1G3w1mk6nFKRJAljSG/lJa76mj34g==
X-Received: by 10.159.197.65 with SMTP id d1mr36585429plo.58.1511750127439;
	Sun, 26 Nov 2017 18:35:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:01 -0800
Message-Id: <1511750112-2263-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 15/26] binutls: Security for fix CVE-2017-9746
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:27 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9746.patch          | 91 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9746.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index d555d5f..235306b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -57,6 +57,7 @@ SRC_URI = "\
      file://CVE-2017-9742.patch \
      file://CVE-2017-9744.patch \
      file://CVE-2017-9745.patch \
+     file://CVE-2017-9746.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9746.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9746.patch
new file mode 100644
index 0000000..bd4a40c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9746.patch
@@ -0,0 +1,91 @@
+From ae87f7e73eba29bd38b3a9684a10b948ed715612 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 14 Jun 2017 16:50:03 +0100
+Subject: [PATCH] Fix address violation when disassembling a corrupt binary.
+
+	PR binutils/21580
+binutils * objdump.c (disassemble_bytes): Check for buffer overrun when
+	printing out rae insns.
+
+ld	* testsuite/ld-nds32/diff.d: Adjust expected output.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9746
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/objdump.c           | 27 +++++++++++++++------------
+ ld/ChangeLog                 |  5 +++++
+ ld/testsuite/ld-nds32/diff.d |  6 +++---
+ 3 files changed, 23 insertions(+), 15 deletions(-)
+
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -1855,20 +1855,23 @@ disassemble_bytes (struct disassemble_in
+ 
+ 	      for (j = addr_offset * opb; j < addr_offset * opb + pb; j += bpc)
+ 		{
+-		  int k;
+-
+-		  if (bpc > 1 && inf->display_endian == BFD_ENDIAN_LITTLE)
+-		    {
+-		      for (k = bpc - 1; k >= 0; k--)
+-			printf ("%02x", (unsigned) data[j + k]);
+-		      putchar (' ');
+-		    }
+-		  else
++		  /* PR 21580: Check for a buffer ending early.  */
++		  if (j + bpc <= stop_offset * opb)
+ 		    {
+-		      for (k = 0; k < bpc; k++)
+-			printf ("%02x", (unsigned) data[j + k]);
+-		      putchar (' ');
++		      int k;
++
++		      if (inf->display_endian == BFD_ENDIAN_LITTLE)
++			{
++			  for (k = bpc - 1; k >= 0; k--)
++			    printf ("%02x", (unsigned) data[j + k]);
++			}
++		      else
++			{
++			  for (k = 0; k < bpc; k++)
++			    printf ("%02x", (unsigned) data[j + k]);
++			}
+ 		    }
++		  putchar (' ');
+ 		}
+ 
+ 	      for (; pb < octets_per_line; pb += bpc)
+Index: git/ld/testsuite/ld-nds32/diff.d
+===================================================================
+--- git.orig/ld/testsuite/ld-nds32/diff.d
++++ git/ld/testsuite/ld-nds32/diff.d
+@@ -7,9 +7,9 @@
+ 
+ Disassembly of section .data:
+ 00008000 <WORD> (7e 00 00 00|00 00 00 7e).*
+-00008004 <HALF> (7e 00 7e fe|00 7e 7e fe).*
+-00008006 <BYTE> 7e fe 00 fe.*
+-00008007 <ULEB128> fe 00.*
++00008004 <HALF> (7e 00|00 7e).*
++00008006 <BYTE> 7e.*
++00008007 <ULEB128> fe.*
+ 	...
+ 00008009 <ULEB128_2> fe 00.*
+ .*
+Index: git/ld/ChangeLog
+===================================================================
+--- git.orig/ld/ChangeLog
++++ git/ld/ChangeLog
+@@ -1,3 +1,8 @@
++2017-06-14  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21580
++       * testsuite/ld-nds32/diff.d: Adjust expected output.
++
+ 2017-03-07  Alan Modra  <amodra@gmail.com>
+ 
+ 	* ldlang.c (open_input_bfds): Check that lang_assignment_statement
-- 
2.7.4


