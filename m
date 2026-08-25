Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED36C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18581.1787652436560073262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tXi7dh3d;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so343660f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652435; x=1788257235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZjP9TIe9QVP6mSl04vIUXdfVBXmKWiCNVBGHn1IpbxI=;
        b=tXi7dh3drWEXTBUmvYgCByhWpzBQ3mRWNBo5a+YCl99SmX6nsXOvlYtQDFRadJNBiC
         rTml6smy0UztURcehuW0c5aQ4goqGUf4HAAYqGjrdj8hwwnEideCS2wUYdILtUUTxx96
         Stnt3wX/o32lkDWIvhFSOwXpFz3pTKXUkX8Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652435; x=1788257235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZjP9TIe9QVP6mSl04vIUXdfVBXmKWiCNVBGHn1IpbxI=;
        b=sipjSpDlzZdYlpa8bdvicps/njVSFPCzrFwcGjDMczDwUWlnGfFosaIzMQphgXVwZG
         mdnrS5CqHM85gj7WUkefh45kww465JNxTjEwLB1dABCsMa0mCGusASMjCGd2MrRE5joj
         49JdHXqSkR56w6+l8a6LHorcOGhhDuTIlfTHE0L3uXIjmGvGOQyGy+aVfr8araVSe1Sm
         XGAkqSSxtbhfozHcvyx/4oSO5vFcn174/qRnL1NgJ7U3bw+O8bK5yDHm3zL5IiTY/RDi
         uub5dp+vN8QLDptEPqFOJUcb4+axrhrO4QsFkJ5Jar32LupYZfQ2v5t2k/OZPk0IV15X
         KRvA==
X-Gm-Message-State: AFuF++kaUs3GyS9mDdvRniWeI9D7sMrMgPih25YRcivvKiFdhXrsrOBR
	Q3pSlgyw8thOU6gmRfupS4elDD9O10GCqgrxh59gsVV09MPBC5NcOXKSbbyLEFin30XMcvwzVsm
	mv++IgHo=
X-Gm-Gg: AR+sD12Q1eUKfhSCAK9zqVyvyd0XmgoKzfs/3XTogzZ6cCWqMBhVZ2Edv1EiJawnzzr
	LFGD1SHScuRdGgDBoo6IZB5yoW9uKZbF/eVfNjijs1VRwottiD4OQ98dnYAPN6I0+9fbzcS5JRv
	qgIVo18OXNIjEdVu30tdcCKGsjMQHMgEj/MSk/+z/b/0zOJVeagTdiJySGXqTR0JaOKe2As2BL0
	vbsHJt9pvoWe75oS7UxVoJA8NgOAAsSRYr7JvTs2STZtINqDDKCeeFIDZaREgUPGgbmu4GIWN68
	RpK4USah1JXKtS4E/2n1mj88SEa3KCiUUezZ/ce8UI8WF4x/8kkUVflrcVza20+MGUCuS8zUeoC
	g6S+Rldk2uLTVfu9/XE8XWtgii5hGFCeKeYK7TRXceWC1ErzpvKtX1eCuScCpHntbCSX3IA0vi5
	HHc7xVEqk8yRWU3hxI4RkZzrT4HOZeEZ2oGIkhbU8a2/OmCwErv5Vs7E8ORCo9Wspq+ng7y6lIe
	cVcDddBErhw27/1iGXfeC08tXO48f4CHnrball336x3fbye0SPg8C69pRJ/9bWWnOCzpu0=
X-Received: by 2002:a05:6000:4008:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-482d9934dedmr6277438f8f.2.1787652434725;
        Tue, 25 Aug 2026 03:07:14 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] binutils: fix CVE-2025-8224
Date: Tue, 25 Aug 2026 12:06:41 +0200
Message-ID: <cadb858fcabe3fae57fc7efc5092c1574a50dd3a.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244217

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8224
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=db856d41004301b3a56438efd957ef5cabb91530

[Adapted for binutils 2.42: only the shstrtabsize overflow check in
bfd_elf_get_str_section applies. The second upstream hunk (DT_STRTAB)
does not apply as 2.42 already unconditionally null-terminates the
dynamic string table.]

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=db856d41004301b3a56438efd957ef5cabb91530]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-8224.patch     | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 063c6cc2a43..5534ce577f9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -79,5 +79,6 @@ SRC_URI = "\
      file://CVE-2026-6846.patch \
      file://CVE-2025-69645.patch \
      file://CVE-2025-1147.patch \
+     file://CVE-2025-8224.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
new file mode 100644
index 00000000000..914b9084c27
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
@@ -0,0 +1,54 @@
+From db856d41004301b3a56438efd957ef5cabb91530 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 25 Aug 2024 15:20:21 +0930
+Subject: [PATCH] PR32109, aborting at bfd/bfd.c:1236 in int _bfd_doprnt
+
+Since bfd_section for .strtab isn't set, print the section index
+instead.  Also, don't return NULL on this error as that results in
+multiple mmap/read of the string table.  (We could return NULL if we
+arranged to set sh_size zero first, but just what we do with fuzzed
+object files is of no concern, and terminating the table might make a
+faulty object file usable.)
+
+	PR 32109
+	* elf.c (bfd_elf_get_str_section): Remove outdated comment, and
+	tweak shstrtabsize test to suit.  Don't use string tab bfd_section
+	in error message, use index instead.  Don't return NULL on
+	unterminated string section, terminate it.
+	(_bfd_elf_get_dynamic_symbols): Similarly terminate string table
+	section.
+
+[Backport note: Adapted for binutils 2.42. The upstream commit targets
+a newer codebase that uses _bfd_mmap_readonly_persistent and has an
+explicit unterminated-string error path with return NULL. In 2.42 the
+code uses _bfd_alloc_and_read with shstrtabsize+1 allocation and
+unconditionally null-terminates via shstrtab[shstrtabsize] = '\0'.
+Only the shstrtabsize overflow check fix applies here (shstrtabsize + 1 <= 1
+changed to shstrtabsize == 0). The second upstream hunk (DT_STRTAB
+error_return -> terminate) does not apply as 2.42 already
+unconditionally null-terminates the dynamic string table.]
+
+CVE: CVE-2025-8224
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=db856d41004301b3a56438efd957ef5cabb91530]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -285,9 +285,7 @@ bfd_elf_get_str_section (bfd *abfd, unsigned int shindex)
+       offset = i_shdrp[shindex]->sh_offset;
+       shstrtabsize = i_shdrp[shindex]->sh_size;
+ 
+-      /* Allocate and clear an extra byte at the end, to prevent crashes
+-	 in case the string table is not terminated.  */
+-      if (shstrtabsize + 1 <= 1
++      if (shstrtabsize == 0
+ 	  || bfd_seek (abfd, offset, SEEK_SET) != 0
+ 	  || (shstrtab = _bfd_alloc_and_read (abfd, shstrtabsize + 1,
+ 					      shstrtabsize)) == NULL)
+-- 
+2.43.7

