Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A79D78072
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id r12so18023502pgu.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yR5gqPz9WTGoMuwnGOY4fLPeAIHXkOywc0JmW3zI9ew=;
	b=p4F4Vtj3iJnSIr5P2pAwAuzDDRtp7eKw6zFPiqtWcHkPFo1rkUgSMuAX3b55WbBqBR
	z3frIbfpBgmZ4Z3hkQ5EU8o+KBHjBT0ACwsvy6V2u60oQ/shrwtv846jEABcbttGMRbP
	Fza+dtY0ztummBbbXWODwedITCd/XsydZOrZ+Hrib2PJ8F2cGMepLr3+9b7QT31DMafZ
	EloAyRW8S6hiUPZJEpjYeFw+mcxonVsqqQs2l1ONaOrabJTqdZC5GMWd05A53ljl3yG3
	HBaTqNjxiiJHq4/f3QfRsusjHbBS3zJyNkA1nQYRjrec4nt0TLiBAX9wcKFeEq2rPMAb
	qr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yR5gqPz9WTGoMuwnGOY4fLPeAIHXkOywc0JmW3zI9ew=;
	b=Gz0lRhrSs+2kMczqkQ7DWZmf+HXcwMA1NI/LStgV2K2bmKbxfz3BRQHrd9oHEXAD1K
	TKk0eXLpxfh6MUsoBVqtTfVTTg0iIVGL+cV1lNDx6hLHRwkNPZMQo8ecXajKfELjLIXP
	k+4QXXsbVpVRmMLI6aY+h5/xBJg6aYf6zmiV0WnLsIXez2togxJn24Ys+fsM5xeFvJ7u
	O+AToCF1jtCvoao6qwBWjlyMA2PC38kWeSZfcmp4O3QhDW/1vSTmVa1lzhKfPr0+fZWy
	m91fjWqw+8AOy+sI/RAzJ7vgyUQNXRZqJ2xlkm0xMhRlK+7WP1fsy+CAupI63BKgOpNl
	5ijg==
X-Gm-Message-State: AJaThX6htDrVWQHJck3ULS94t5CgM+HMb4vqt3Y+M4gVz4cDGOwBpQvY
	s1Q++VZgDLxUrEnpkXEJeMuSTg==
X-Google-Smtp-Source: AGs4zMbw1CoD7nS6HvBR5A8W0wfATNF/803fFd6gWJSc6K79NlJoiddKYOla4pr+v0xm7HBsvNCYlg==
X-Received: by 10.98.18.88 with SMTP id a85mr26079551pfj.141.1511750125731;
	Sun, 26 Nov 2017 18:35:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:59 -0800
Message-Id: <1511750112-2263-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 13/26] binutls: Security fix for CVE-2017-9744
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:24 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9744.patch          | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9744.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 946f16c..815e2bf 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -55,6 +55,7 @@ SRC_URI = "\
      file://CVE-2017-9039.patch \
      file://CVE-2017-9040_9042.patch \
      file://CVE-2017-9742.patch \
+     file://CVE-2017-9744.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9744.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9744.patch
new file mode 100644
index 0000000..c34a5a6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9744.patch
@@ -0,0 +1,46 @@
+From f461bbd847f15657f3dd2f317c30c75a7520da1f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 14 Jun 2017 17:01:54 +0100
+Subject: [PATCH] Fix address violation bug when disassembling a corrupt SH
+ binary.
+
+	PR binutils/21578
+	* elf32-sh.c (sh_elf_set_mach_from_flags): Fix check for invalid
+	flag value.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9744
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog  | 6 ++++++
+ bfd/elf32-sh.c | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/elf32-sh.c
+===================================================================
+--- git.orig/bfd/elf32-sh.c
++++ git/bfd/elf32-sh.c
+@@ -6344,7 +6344,7 @@ sh_elf_set_mach_from_flags (bfd *abfd)
+ {
+   flagword flags = elf_elfheader (abfd)->e_flags & EF_SH_MACH_MASK;
+ 
+-  if (flags >= sizeof(sh_ef_bfd_table))
++  if (flags >= ARRAY_SIZE (sh_ef_bfd_table))
+     return FALSE;
+ 
+   if (sh_ef_bfd_table[flags] == 0)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-06-14  Nick Clifton  <nickc@redhat.com>
++ 
++       PR binutils/21578
++       * elf32-sh.c (sh_elf_set_mach_from_flags): Fix check for invalid
++       flag value.
++
+ 2017-04-29  Alan Modra  <amodra@gmail.com>
+ 
+        PR 21432
-- 
2.7.4


