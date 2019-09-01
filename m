Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id EDF7C7F4AA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 00:08:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o3so4946525plb.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 17:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o+acMhsHqRRaLTTvEAcZ2tvc4oa1fgvEJGYtBGLHdPg=;
	b=EZgVVxqASxQIwwoTYWz0LHcC5crAiJFcwDjOmEkrHu/aazttm6BGqFN+Z3iEnzFWWo
	1XkUeAkTUmiM4PGxrniayWgTa7CpREBFD3tSc2EbW03FUfj1CU3LVaeHVR1bkLhktxfR
	jVtpPQpSMFDxrlSlylGzl7UxJALDEGgQM7UGKUWMb7dUB/IY1crS+nf7KazI3SRX7gyD
	ZX5hiAi3ROwO2kXKLh9izFtuSzW9MaxGteYkP/HNNVxnT5pZcZGXssymXEQRsqqGI997
	IZFPqCvlFz9biEpqniA1vWLI3LwiWBTyV3+aEZAtQ1YtOrv00G1TzQHEUH98HdGb55ar
	JyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o+acMhsHqRRaLTTvEAcZ2tvc4oa1fgvEJGYtBGLHdPg=;
	b=W5a4QK3L4KnJ+XkOnpOptEVw95mQYmo95l7PwVbhq95sqSKMQ8V6QuW721pQVzpuTs
	5pF0+VoYYnzmUf7G+NaA6q2R/zQTqIf7dsDOQOFefbOnAPTTZM/AT05c7srrJFbb7RoP
	cEFVTdgp7ngaQ9x17hrU7MBsB1darIXUc3/Ac82NJ8zz3uCOi24JRz8/lJwgDi1H2z4V
	1rrXFj3neTXn9SL1JEAvWxc0BAfw3bWF0+bgpQ6M/9pocChY82L0GM13dVsF/3s/RLJu
	lpmFQPWuRGV6nb6TF2jJP4G5T/1OEDEgL2BhRh+rLg/Eqyhz7g4CBs5/njKLxUVC3ANM
	+C8w==
X-Gm-Message-State: APjAAAUCCg98jCwaMjN3L07U2jbHy+Dfflf0m/pYrq3yOrn/laJBQdAj
	8g7//0xlSmGjWyADcL0i+y4x+6cU
X-Google-Smtp-Source: APXvYqzy8/bj3+q3qbRThS6bzQS2L6VEPxsvHm/y4PEoPzka4chqgqlrLjm4TscDs2CG+pVBfMR3fg==
X-Received: by 2002:a17:902:b40c:: with SMTP id
	x12mr22984807plr.81.1567296488965; 
	Sat, 31 Aug 2019 17:08:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	v15sm11179712pfn.69.2019.08.31.17.08.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 17:08:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2019 17:08:07 -0700
Message-Id: <1567296487-14903-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][v2][PATCH] binutils: Security fix for CVE-2019-12972
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
X-List-Received-Date: Sun, 01 Sep 2019 00:08:08 -0000

From: Armin Kuster <akuster@mvista.com>

Source: git://sourceware.org / binutils-gdb.git
MR: 98770
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=890f750a3b053532a4b839a2dd6243076de12031
ChangeID: 7ced6bffbe01cbeadf50177eb332eef514baa19c
Description:

Fixes CVE-2019-12972

Signed-off-by: Armin Kuster <akuster@mvista.com>

[v2]
forgot to refresh inc file before sending
---
 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 .../binutils/binutils/CVE-2019-12972.patch         | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 247f779..e1a6673 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -47,6 +47,7 @@ SRC_URI = "\
      file://CVE-2018-18606.patch \
      file://CVE-2018-18607.patch \
      file://CVE-2019-14444.patch \
+     file://CVE-2019-12972.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
new file mode 100644
index 0000000..3e95b92
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
@@ -0,0 +1,39 @@
+From 890f750a3b053532a4b839a2dd6243076de12031 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 21 Jun 2019 11:51:38 +0930
+Subject: [PATCH] PR24689, string table corruption
+
+The testcase in the PR had a e_shstrndx section of type SHT_GROUP.
+hdr->contents were initialized by setup_group rather than being read
+from the file, thus last byte was not zero and string dereference ran
+off the end of the buffer.
+
+	PR 24689
+	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
+
+Upstream-Status: Backport
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=890f750a3b053532a4b839a2dd6243076de12031
+
+CVE: CVE-2019-12972
+Affects: <= 2.23.0
+Dropped Changelog
+Signed-off-by Armin Kuster <akuster@mvista.com>
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/elfcode.h | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/elfcode.h
+===================================================================
+--- git.orig/bfd/elfcode.h
++++ git/bfd/elfcode.h
+@@ -747,7 +747,8 @@ elf_object_p (bfd *abfd)
+   /* A further sanity check.  */
+   if (i_ehdrp->e_shnum != 0)
+     {
+-      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd))
++      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd)
++	  || i_shdrp[i_ehdrp->e_shstrndx].sh_type != SHT_STRTAB)
+ 	{
+ 	  /* PR 2257:
+ 	     We used to just goto got_wrong_format_error here
-- 
2.7.4


