Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD7F7884B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:23 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m11-v6so22578097oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VWSYK2xBOY/D+u3PMKfhRdoXxonEn9KZiYjSzAf4wlg=;
	b=ufoJKFBQ2ZycCrpSVf7vKrcuqrmnWiuldr+f0Vxr8X6CWVawOZwqEWX+cdB1dgjKsF
	u32af1VI0ZHBDXFoOgtyRmTk7WYHTqA62nHqvUk+xrzH9aDDYnbfQ4fPCV86EmFkIOhD
	amJ7bg9AotaTMmD0K42vGau3mgcXRmgOGhDSBhAFnh67WrU+2KuRCM4ykIbS0mxViSST
	klje8cYtTBhoslgYbIZQm5Isvr/ct9swravaseTZ1GLAHUZX1xAiqmBfjF6JhxmREwl1
	VzU3GuCR1+3zdjR+b8w1h5FoXP02vIZZrt9N1eVnriYnM2dKCEZalGR2Zkaz1Qf6yJ1+
	vKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VWSYK2xBOY/D+u3PMKfhRdoXxonEn9KZiYjSzAf4wlg=;
	b=KNhwpaLxtYCvvSiP0wISYUJmwSVOqN4fEKQ0DiF2wIV90m1bOrJRIju2zGoZMRQVAf
	Q1f/67gDfWfVPlA9mEDNkQNBWZGGwSk4st2xkgtd86xYYYu4F004giLltfiBa+EVX9FU
	aGDvWmXKkbrm9QnsK6Ua8pRVGzzcAoJHthmswk42cHa9aafW2U4YOGREQSVfwH+lu3ty
	Z+s4TIb6WVpJ8he2izUYU56ddxoWd6AmxQLNEW7Ideq0gnAdYvDcP4pmUiUqt0szDkqd
	mOP8WmvRj3WaWLIiGWSCtjMa4db5ODAMPAHYX5osV6ZkecAFvLmbKVLyt7EQcdoAHsIf
	pSog==
X-Gm-Message-State: AOUpUlFCMPHjvL5h48F22oxujTzQwQiNIPH9+1yChAI3AlGLEYmqrQIz
	89voGoH0M91rupqSyXFNRQc=
X-Google-Smtp-Source: AAOMgpet9ipR1YctrPZIEp1CKpzsZoFasnl2AP8FSNpG89kqXh9UtgQtzo3JFmOj+vm6PO2Azc19cQ==
X-Received: by 2002:aca:56d7:: with SMTP id
	k206-v6mr13730874oib.106.1533565764598; 
	Mon, 06 Aug 2018 07:29:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:11 -0700
Message-Id: <1533565758-2467-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 05/12] binutls: Security fix CVE-2018-7642
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:23 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-7642.patch          | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 1621e5b..6b915fa 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -39,6 +39,7 @@ SRC_URI = "\
      file://CVE-2018-7643.patch \
      file://CVE-2018-6872.patch \ 
      file://CVE-2018-6759.patch \
+     file://CVE-2018-7642.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch
new file mode 100644
index 0000000..9def46c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch
@@ -0,0 +1,51 @@
+From 116acb2c268c89c89186673a7c92620d21825b25 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 28 Feb 2018 22:09:50 +1030
+Subject: [PATCH] PR22887, null pointer dereference in
+ aout_32_swap_std_reloc_out
+
+	PR 22887
+	* aoutx.h (swap_std_reloc_in): Correct r_index bound check.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-7642
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/aoutx.h   | 6 ++++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+Index: git/bfd/aoutx.h
+===================================================================
+--- git.orig/bfd/aoutx.h
++++ git/bfd/aoutx.h
+@@ -2284,10 +2284,12 @@ NAME (aout, swap_std_reloc_in) (bfd *abf
+   if (r_baserel)
+     r_extern = 1;
+ 
+-  if (r_extern && r_index > symcount)
++  if (r_extern && r_index >= symcount)
+     {
+       /* We could arrange to return an error, but it might be useful
+-	 to see the file even if it is bad.  */
++	 to see the file even if it is bad.  FIXME: Of course this
++	 means that objdump -r *doesn't* see the actual reloc, and
++	 objcopy silently writes a different reloc.  */
+       r_extern = 0;
+       r_index = N_ABS;
+     }
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2018-02-28  Alan Modra  <amodra@gmail.com>
++
++       PR 22887
++       * aoutx.h (swap_std_reloc_in): Correct r_index bound check.
++
+ 2018-02-06  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22794
-- 
2.7.4


