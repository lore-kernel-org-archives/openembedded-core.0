Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9359178E75
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:32 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id d5-v6so1200761pll.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KSF8o1SpGBUjAEVTYzwbKLlcDt+zxlij66+Xoz1WCIw=;
	b=ZUHgUzbhspdL1zoSflIFByCjPP7/8JVkRjita/hVh/g6jb50Ew4nnLg/BNgCCdbI5n
	njLitPmys2YVMquc6GA6w9Bru/ntaRPxCgnz9BF7OpeTXeDKO3rcQJTOlzyYRPn2A6mw
	atEe3oQoYVK1awwB+lbSmWztqmmutCu5fWiqVMl21AnfzjrGnbPfNMgigrRrATFolBkE
	HdXtdpHra4PBcHq9QulwSSfxlIGy1pI9rM7l5rr3jM8RFPhZ0HIYcbkgzNbB6xTduEK3
	6/50RkMYxuN2o0D5amiAPbxUONLdS9zX6KnC3VdHn+3Pzi+c1oZwxde89Uu2GbLYYKMB
	U7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KSF8o1SpGBUjAEVTYzwbKLlcDt+zxlij66+Xoz1WCIw=;
	b=OrYTlfVafJlJT2bIinhpbbXKhTdrCrLe4vAK3HDeWHFDYLAy9Q9tBsfP6hBtGYwjy+
	wMeq15h7RMFFT7soB62dAdmsVslGdKKWHryNo+JkBxzrlUqbf1kNIjJsd0MpYhoA4ra0
	8nYBwoIETgWgmGICOIOXH82/Inl4rtt+2TKNMdBmZ0lAuczcSGV9sCEVsbn8W99PHVZS
	dH0eCpEKJ+tkGET53OuSjWWS+twenBfPxNe9p8Xq0dJiG37PSzFmrlbeVzgGirCAC6yv
	4DAkelHlfpVFK4dZ63TorFaqCJOnauOGI62HL3fIQoXL0o2JcQmgoVpLWLgQMbrRr7Bk
	3IvA==
X-Gm-Message-State: AOUpUlHF+jRMnF3xzkbpShI4ywEL39o2wx0sHzVAm8FSb5lDitRlRlB3
	63JIbevrU5j99fvFrpeauYQ=
X-Google-Smtp-Source: AA+uWPwUUCU56ZIOtUzygGAE5eTGT975Frg5VfCFq8lO46XSZeBSfwjuGXEapsSCt7of14k5r9T1YA==
X-Received: by 2002:a17:902:163:: with SMTP id
	90-v6mr3051351plb.322.1533742533813; 
	Wed, 08 Aug 2018 08:35:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:05 -0700
Message-Id: <1533742522-24357-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 10/27] binutls: Security fix for CVE-2017-15022
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:32 -0000

From: Armin Kuster <akuster@mvista.com>

Affected: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-15022.patch         | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15022.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 6f7d655..05b7f22 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://CVE-2017-14939.patch \
      file://CVE-2017-14940.patch \
      file://CVE-2017-15021.patch \
+     file://CVE-2017-15022.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15022.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15022.patch
new file mode 100644
index 0000000..c9acfa7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15022.patch
@@ -0,0 +1,61 @@
+From 11855d8a1f11b102a702ab76e95b22082cccf2f8 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 25 Sep 2017 19:46:34 +0930
+Subject: [PATCH] PR22201, DW_AT_name with out of bounds reference
+
+DW_AT_name ought to always have a string value.
+
+	PR 22201
+	* dwarf2.c (scan_unit_for_symbols): Ignore DW_AT_name unless it
+	has string form.
+	(parse_comp_unit): Likewise.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15022
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 7 +++++++
+ bfd/dwarf2.c  | 6 ++++--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -3177,7 +3177,8 @@ scan_unit_for_symbols (struct comp_unit
+ 	      switch (attr.name)
+ 		{
+ 		case DW_AT_name:
+-		  var->name = attr.u.str;
++		  if (is_str_attr (attr.form))
++		    var->name = attr.u.str;
+ 		  break;
+ 
+ 		case DW_AT_decl_file:
+@@ -3429,7 +3430,8 @@ parse_comp_unit (struct dwarf2_debug *st
+ 	  break;
+ 
+ 	case DW_AT_name:
+-	  unit->name = attr.u.str;
++	  if (is_str_attr (attr.form))
++	    unit->name = attr.u.str;
+ 	  break;
+ 
+ 	case DW_AT_low_pc:
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-09-25  Alan Modra  <amodra@gmail.com>
++ 
++       PR 22201
++       * dwarf2.c (scan_unit_for_symbols): Ignore DW_AT_name unless it
++       has string form.
++       (parse_comp_unit): Likewise.
++
+ 2017-09-24  Alan Modra  <amodra@gmail.com>
+  
+        PR 22197
-- 
2.7.4


