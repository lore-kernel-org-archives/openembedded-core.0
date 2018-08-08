Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id A156278D7A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:25 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id u11-v6so1197192plq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SVZlvq0U/9PwFxW6hyC3tMYjScqUwWPfOD5XafPGxLY=;
	b=YgiM30kyq3jjGR0kEzsNA3xGJJDRzLZmaRI258gkrdzqKCDpFFKndm73NnbRirLo2n
	13k7v12UNNsCBLoRa32U3PFyZV0cD3Xm+ir/KLv83yIwqDkNTnbmwZeGLOCAHlLRUC1l
	oxUsgMTzJ89oUWShP1kzdrELWdzNTWKkkSBjl5C8QpDhXGLm6ORrlhOuwlQr2bKWig8o
	UmYSFv4cxAkkIkYMj6FDWYi+E4NuFqp+SqkiDhgBOR+CGdIW62B2Z2aB7u6VuDtmbhGW
	XUaOsF9K6YddmfMdrjbaAB7FxS+niIAaXFM0q0LUELAXxJyRWvpLKD/pr35RoFwpThVR
	2hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SVZlvq0U/9PwFxW6hyC3tMYjScqUwWPfOD5XafPGxLY=;
	b=NYpROBdTNfiB5guJCV/FAlGeyhfpA+AqbxEiYWjubsv5SqsgAaycmnel9DrTQUe9Av
	6sCziFKplZm+j7oRu67ZzajEj/4OUFWQXXqEn7QtiG/3f/DIxcAtnfU6FWFXF+uRahTo
	e7ozHcgiBBvOPfhqlesO1/BdjXrDGBlQ1cCcZpWo3Xv+wLXqxs+0bbCYy6+K0fLGkpKi
	r/howXI7OLbo5EA1wHJnvO52B06ZYxplTkgjTTg0gr+kHgerZxP+tU8LyUCNKzkol82o
	1+vlyXUJt8klwC2Afa6bRQGoq2RCmcZe7Lm1IyshZhn7fJ0cq1bLfoYhdSIQY2p4Y/BO
	TXcg==
X-Gm-Message-State: AOUpUlECsgNll6cc7pVajktM0GjFhjA/4BuZfdVRkiYYsIGGqL4X6oyE
	QrRble6+8HAFV5jFYpPHdLs=
X-Google-Smtp-Source: AA+uWPzweYoBpmqH1Z39NAl4r/DqUxv15JK3QtIWt/ALaaLXTDzLiA24s2Eo+aGZPBkpllMu0UcvQA==
X-Received: by 2002:a17:902:65:: with SMTP id
	92-v6mr3073708pla.318.1533742526764; 
	Wed, 08 Aug 2018 08:35:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:34:58 -0700
Message-Id: <1533742522-24357-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 03/27] binutls: Security fix CVE-2017-14932
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:25 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-14932.patch         | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14932.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 2232781..788f98a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://CVE-2017-12967.patch \
      file://CVE-2017-14930.patch \
+     file://CVE-2017-14932.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14932.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14932.patch
new file mode 100644
index 0000000..a436031
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14932.patch
@@ -0,0 +1,46 @@
+From e338894dc2e603683bed2172e8e9f25b29051005 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 26 Sep 2017 09:32:18 +0930
+Subject: [PATCH] PR22204, Lack of DW_LNE_end_sequence causes "infinite" loop
+
+	PR 22204
+	* dwarf2.c (decode_line_info): Ensure line_ptr stays within
+	bounds in inner loop.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14932
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/dwarf2.c  | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -2269,7 +2269,7 @@ decode_line_info (struct comp_unit *unit
+       bfd_vma high_pc = 0;
+ 
+       /* Decode the table.  */
+-      while (! end_sequence)
++      while (!end_sequence && line_ptr < line_end)
+ 	{
+ 	  op_code = read_1_byte (abfd, line_ptr, line_end);
+ 	  line_ptr += 1;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-09-26  Alan Modra  <amodra@gmail.com>
++
++       PR 22204
++       * dwarf2.c (decode_line_info): Ensure line_ptr stays within
++       bounds in inner loop.
++
+ 2017-09-24  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22191
-- 
2.7.4


