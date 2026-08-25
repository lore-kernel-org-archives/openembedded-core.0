Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99F0C61DC6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18279.1787652436015144796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3NlyeLEa;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de008b020so343646f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652434; x=1788257234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4wqAFckj7MLT5WIPRnx6Aqa+SGYA7aEILPUbmoY4gak=;
        b=3NlyeLEaJgKxcOHWrhtRccwRwMrDwqsbxrjUPYG2U0Jp18adkkErhU8envFpMYxgB/
         kHc38b1beimlzdxWuGTwlef92QMoLFc6W+VHRwR99QvuZCsBZMt/wxcWNTa/s3ZkkQLZ
         gg3ahHmYyjQh3qoXH84jF4CX/OEaoabpdxmOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652434; x=1788257234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4wqAFckj7MLT5WIPRnx6Aqa+SGYA7aEILPUbmoY4gak=;
        b=hEknIwaKoPVG4z3u+M4/984AZUDqmlusC7mtOs78yTtzNEWnLkiy1u967+6gVbTZPo
         jEhj+y+n/QXmvROHl1ipxAj7GcrOKHrClCRU2PH8yCQGf59EAXVkSMVwGbTrUftNU4FN
         Ie2dH0W45Qpe8uIgsnxy2DzXxsD7Xl+4/1Zq9h/7OWsnnhhYkhu/doRc9FsrvPoIEMza
         cWtt4UEZ+3qrzexNBbQ6hfUJExQ8JU9hZa3OACkbQqxSJ+YKAIixkp3wEmqBvZ+PwYhn
         Dkyoip71kiUNQEGvBHjgt9F3/unYHmM9UU9shvlKT1zyIZkkvSSlJK4eyIU5O3CmWq8v
         I9kQ==
X-Gm-Message-State: AFuF++l4//8N78MvVBCpJ6Z+fxZp81s85f8/GwRJkH0epg25hSqIubrB
	AfyNMwUtyJdz6mBysqy57NYa0ciE87YT6YtEKAmcHjW2LlSzWbjJ5mr4BT48ArZvUU/j5iAO2Bp
	o4Vj7CKI=
X-Gm-Gg: AR+sD13JDfxq3RPaNyGd+dOv+4R28ZnrPvvz2Ay5L7nVQllOIrO5juEvRgMEXxic9j6
	0kDO8bYDXZouyDIgWtbSl6unHkVIpn8pdq6wZNU9zGh8x24/qf4+X88xrrerpiHgzqjg3AxL2wq
	Kgv2UQFyAct+kpQ0NMeJPf9tuzIe1ecuhHDpdi0Lj1xeDek33kmKN0f1WHhrz7ppuXLdk6iCbT2
	kMXC+R3XdI+w3n/hROpmDMo9knypg38BLAURW0UFWPsXOszLp1XUUC+6wToDfQDVlcuIK+Khi1g
	dK3kWHZLEVipLyowDVqvaptp8BAdhfTrwwAeFIYQ9RCieEzR3SPtLNwoDQ0Q7GUGJLaNlp1I/3H
	JRz3LSjyYgeHK9P8PXsN3Jx3pebB4/xAtKBQD2AsRT0kXXh1vjjUpNdyjoMl6pxhV8KjZ/0ERXq
	/tNqdi1fgD4E47y+riFUUsF4AnzI8E+7owUSQyNEYTy0EggdUogEuUWJZMsGVJ51QQwsw8XqeLQ
	B4WvjsYJojL734DHQkjh8Wsz3WQa8gd6oSV/T583ZGTU14fD+gaxDcoFbqa7d+iGY2UXsc=
X-Received: by 2002:adf:e193:0:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-482d996189amr1039850f8f.9.1787652434164;
        Tue, 25 Aug 2026 03:07:14 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/11] binutils: fix CVE-2025-1147
Date: Tue, 25 Aug 2026 12:06:40 +0200
Message-ID: <188efbb43453920a5c4f6c246dd881e7ab67f319.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244216

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-1147
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=7be4186c22f89a87fff048c28910f5d26a0f61ce

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported (+2 new passes from nm --ifunc-chars=-- tests)
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7be4186c22f89a87fff048c28910f5d26a0f61ce]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-1147.patch     | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d455acd7863..063c6cc2a43 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -78,5 +78,6 @@ SRC_URI = "\
      file://CVE-2025-69652.patch \
      file://CVE-2026-6846.patch \
      file://CVE-2025-69645.patch \
+     file://CVE-2025-1147.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch
new file mode 100644
index 00000000000..9a95775d3f0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch
@@ -0,0 +1,110 @@
+From 7be4186c22f89a87fff048c28910f5d26a0f61ce Mon Sep 17 00:00:00 2001
+From: Dmitry Klochkov <dmitry.klochkov@bell-sw.com>
+Date: Tue, 9 Sep 2025 12:06:25 +0200
+Subject: [PATCH] nm: fix treating an ifunc symbol as a stab if
+ '--ifunc-chars=--' is given
+
+If an ifunc symbol is processed in print_symbol(), a 'type' field of a
+'syminfo' structure is set to any character specified by a user with an
+'--ifunc-chars' option.  But afterwards the 'type' field is used to
+check whether a symbol is a stab in print_symbol_info_{bsd,sysv}()
+functions in order to print additional stab related data.  If the 'type'
+field equals '-', a symbol is treated as a stab.  If '--ifunc-chars=--'
+is given, all ifunc symbols will be treated as stab symbols and
+uninitialized stab related fields of the 'syminfo' structure will be
+printed which can lead to segmentation fault.
+
+To fix this, check if a symbol is a stab before override the 'type'
+field.  Also, add a test case for this fix.
+
+	PR binutils/32556
+	* nm.c (extended_symbol_info): Add is_stab.
+	(print_symbol): Check if a symbol is a stab.
+	(print_symbol_info_bsd): Use info->is_stab.
+	(print_symbol_info_sysv): Use info->is_stab.
+	* testsuite/binutils-all/nm.exp: Test nm --ifunc-chars=--.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=32556
+Fixes: e6f6aa8d184 ("Add option to nm to change the characters displayed for ifunc symbols")
+Signed-off-by: Dmitry Klochkov <dmitry.klochkov@bell-sw.com>
+
+CVE: CVE-2025-1147
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7be4186c22f89a87fff048c28910f5d26a0f61ce]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ binutils/nm.c                          | 10 +++++++---
+ binutils/testsuite/binutils-all/nm.exp | 17 +++++++++++++++++
+ 2 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/nm.c b/binutils/nm.c
+index dce9207f44f..c3d118a93c3 100644
+--- a/binutils/nm.c
++++ b/binutils/nm.c
+@@ -70,6 +70,7 @@ struct extended_symbol_info
+   bfd_vma ssize;
+   elf_symbol_type *elfinfo;
+   coff_symbol_type *coffinfo;
++  bool is_stab;
+   /* FIXME: We should add more fields for Type, Line, Section.  */
+ };
+ #define SYM_VALUE(sym)       (sym->sinfo->value)
+@@ -1208,8 +1209,11 @@ print_symbol (bfd *        abfd,
+ 
+   bfd_get_symbol_info (abfd, sym, &syminfo);
+ 
++  info.is_stab = false;
++  if (syminfo.type == '-')
++    info.is_stab = true;
+   /* PR 22967 - Distinguish between local and global ifunc symbols.  */
+-  if (syminfo.type == 'i'
++  else if (syminfo.type == 'i'
+       && sym->flags & BSF_GNU_INDIRECT_FUNCTION)
+     {
+       if (ifunc_type_chars == NULL || ifunc_type_chars[0] == 0)
+@@ -1873,7 +1877,7 @@ print_symbol_info_bsd (struct extended_symbol_info *info, bfd *abfd)
+ 
+   printf (" %c", SYM_TYPE (info));
+ 
+-  if (SYM_TYPE (info) == '-')
++  if (info->is_stab)
+     {
+       /* A stab.  */
+       printf (" ");
+@@ -1902,7 +1906,7 @@ print_symbol_info_sysv (struct extended_symbol_info *info, bfd *abfd)
+ 
+   printf ("|   %c  |", SYM_TYPE (info));
+ 
+-  if (SYM_TYPE (info) == '-')
++  if (info->is_stab)
+     {
+       /* A stab.  */
+       printf ("%18s|  ", SYM_STAB_NAME (info));		/* (C) Type.  */
+diff --git a/binutils/testsuite/binutils-all/nm.exp b/binutils/testsuite/binutils-all/nm.exp
+index fea68bf76bc..1feb8578fba 100644
+--- a/binutils/testsuite/binutils-all/nm.exp
++++ b/binutils/testsuite/binutils-all/nm.exp
+@@ -329,6 +329,23 @@ if [is_elf_format] {
+ 	    fail "$testname (local ifunc)"
+ 	}
+ 
++	# PR 32556
++	# Test nm --ifunc-chars=--
++
++	set got [binutils_run $NM "$NMFLAGS --ifunc-chars=-- $tmpfile"]
++
++	if [regexp -line "^\\S+ - global_foo$" $got] then {
++	    pass "$testname=-- (global ifunc)"
++	} else {
++	    fail "$testname=-- (global ifunc)"
++	}
++
++	if [regexp -line "^\\S+ - local_foo$" $got] then {
++	    pass "$testname=-- (local ifunc)"
++	} else {
++	    fail "$testname=-- (local ifunc)"
++	}
++
+ 	if { $verbose < 1 } {
+ 	    remote_file host delete "tmpdir/ifunc.o"
+ 	}

