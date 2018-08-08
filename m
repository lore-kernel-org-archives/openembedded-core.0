Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 896DB78E65
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:42 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id n7-v6so1266246pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dTW/ceEBzwKksufyLlSIEyIZPVKX28vqyxyuXl4j4fY=;
	b=iVmBQ7QiQa6YBJ5ex853lvJ+Cvx31TyHXs52OxK01xpRSMDGQ40m2XpyTruiOWWhPM
	mKFy4cxO3uW3GYWvHB4zjC4rpzFee11lZd69ZcuJiuinT/zhmg49Y2wYjVHdsdGwplzl
	35QjYPLBZq7oDyJbZU6L52HE2gi3/Wm7QnEJuwrRxgNvcqmaSh6UlKi8bd/gPfWGSg6B
	GMbdJyl1aW8UNQIZc0wl/sZz+S5CfAuKVgrx7SOyArhoxaKZqtY1LLVx2nowVfbyYyPz
	yerAS19X4U2DQDuhAXN1HnMWETxS3XdE3ewEyBndgvzjAXTdb7sZTil3SAUx4uJvy7Ak
	fGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dTW/ceEBzwKksufyLlSIEyIZPVKX28vqyxyuXl4j4fY=;
	b=e7DiMUGd74JDhYIL7XmzxdwrqSQ3BrpCU8meagU2k2ZG7UrtsaWHzuFFHGTRC/1MRg
	k9OqalX8Psq0jv2dFbEMCfwjurmUH7tTWwhFo7t5DyO+Cwx98AciepGOlcGOUWpvll+8
	uW1kbMZ/uYtPd6cyN774ATIf+y+Ii8UQd24OrmnVDGCasSQRdRX3hqBcJM2puulA1LtR
	KCxiYi54Urofvqp+PAOdWcgFlMqGlthSg/U+plaDPzW5pirX6jftU/b7MMBTP97VXznY
	I8smtEj2LsYtmnpt0VnMu7nipp418O2YY6ljfJXT26dJI2+EasvBCkeDoJ39c4+ticTP
	WjFA==
X-Gm-Message-State: AOUpUlGnycj1ZK2ajO9+bSh2Sc4dwaqoOgg8mZ5Vh4zlQSS2ZTlBwMeH
	hn/ZnveELajQD906MmusASypEwa8
X-Google-Smtp-Source: AA+uWPzvJsPVFRZn0g+g5d32p0A4XxRXK2zJzgL/NGx6kn+39vyEc2e3Zz3oJDxtqx98TD9NDBCi6w==
X-Received: by 2002:a62:c819:: with SMTP id
	z25-v6mr3477907pff.44.1533742543738; 
	Wed, 08 Aug 2018 08:35:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:15 -0700
Message-Id: <1533742522-24357-20-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 20/27] binutls: Security fix for CVE-2017-16829
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:42 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-16829.patch         | 82 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16829.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 65d3c34..1fa3eb7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -56,6 +56,7 @@ SRC_URI = "\
      file://CVE-2017-16827.patch \
      file://CVE-2017-16828_p1.patch \
      file://CVE-2017-16828_p2.patch \
+     file://CVE-2017-16829.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16829.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16829.patch
new file mode 100644
index 0000000..f9410e2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16829.patch
@@ -0,0 +1,82 @@
+From cf54ebff3b7361989712fd9c0128a9b255578163 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 17 Oct 2017 21:57:29 +1030
+Subject: [PATCH] PR22307, Heap out of bounds read in
+ _bfd_elf_parse_gnu_properties
+
+When adding an unbounded increment to a pointer, you can't just check
+against the end of the buffer but also must check that overflow
+doesn't result in "negative" pointer movement.  Pointer comparisons
+are signed.  Better, check the increment against the space left using
+an unsigned comparison.
+
+	PR 22307
+	* elf-properties.c (_bfd_elf_parse_gnu_properties): Compare datasz
+	against size left rather than comparing pointers.  Reorganise loop.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-16829
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog        |  6 ++++++
+ bfd/elf-properties.c | 18 +++++++++---------
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+Index: git/bfd/elf-properties.c
+===================================================================
+--- git.orig/bfd/elf-properties.c
++++ git/bfd/elf-properties.c
+@@ -93,15 +93,20 @@ bad_size:
+       return FALSE;
+     }
+ 
+-  while (1)
++  while (ptr != ptr_end)
+     {
+-      unsigned int type = bfd_h_get_32 (abfd, ptr);
+-      unsigned int datasz = bfd_h_get_32 (abfd, ptr + 4);
++      unsigned int type;
++      unsigned int datasz;
+       elf_property *prop;
+ 
++      if ((size_t) (ptr_end - ptr) < 8)
++	goto bad_size;
++
++      type = bfd_h_get_32 (abfd, ptr);
++      datasz = bfd_h_get_32 (abfd, ptr + 4);
+       ptr += 8;
+ 
+-      if ((ptr + datasz) > ptr_end)
++      if (datasz > (size_t) (ptr_end - ptr))
+ 	{
+ 	  _bfd_error_handler
+ 	    (_("warning: %B: corrupt GNU_PROPERTY_TYPE (%ld) type (0x%x) datasz: 0x%x"),
+@@ -182,11 +187,6 @@ bad_size:
+ 
+ next:
+       ptr += (datasz + (align_size - 1)) & ~ (align_size - 1);
+-      if (ptr == ptr_end)
+-	break;
+-
+-      if (ptr > (ptr_end - 8))
+-	goto bad_size;
+     }
+ 
+   return TRUE;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,4 +1,10 @@
+ 2017-10-17  Alan Modra  <amodra@gmail.com>
++ 
++       PR 22307
++       * elf-properties.c (_bfd_elf_parse_gnu_properties): Compare datasz
++       against size left rather than comparing pointers.  Reorganise loop.
++
++2017-10-17  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22306
+        * aoutx.h (aout_get_external_symbols): Handle stringsize of zero,
-- 
2.7.4


