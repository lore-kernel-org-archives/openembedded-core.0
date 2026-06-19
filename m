Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F48FCDB470
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38124.1781857996349403326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZbPVxvfL;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cdae130cso9620895e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857994; x=1782462794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3F1ixIBA9AVFxxlazaolJRgG2o+V7vGoezrj9X9Hwk=;
        b=ZbPVxvfLrCK9F9nqCqqfCddUku7oTaiwVokIH7FeE1gWlEipR2GBFcq1wAMF6ROZhp
         Hc8cCkYVa09Cc5o5p6Lfz1M1kTd6cinzx03gILJES2ocToVUk16Dm2/HL5I8ApeimBSD
         M0KWzDwpDpGP9ex9AXR3fOqiPieZ3rGDy+j5VPnVpn+dNNQjREUtw7Gb27jys7xJZb0+
         2lrvoCCaFW4Dbn1pecKVjSnd7ImX4yh5zE67lbs1wfN24Vqa7PNb6CB5lLQF0sTL3f4I
         LKGD870TiowVH+AVFSV5TdXaIIl/bzgFw1+sY3bN5SualTOb2ZTU16AkLfflkDRMIHTS
         mvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857994; x=1782462794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H3F1ixIBA9AVFxxlazaolJRgG2o+V7vGoezrj9X9Hwk=;
        b=e4iiXsK1fqU7WdabwUZU0o5TDbknXEqB8V9AH7sKJ8DROv95q+tDX7GUIWSL05LmxS
         XUwx5PxRV+hpKA0sQkmocf7idf0Q0ZQu8bhuprVkGPGod+0J6MqfjJdvI1LD+//uYAl2
         eJ45Xm4Hqnz/mOC/6q2olCjpCTetbKZXXzKzkerH75oTcdA7fDW1omqj8hkZCPm8aIr/
         qRaL0rZbBFzuB7ZiTqRkPBLYNOlRgop/k0v1VfBp7UB7tlsOlHhcmIcJq7P3SlBMP1cd
         OTVRPkl1kreR/pY/8UGtKBF8y3SbOjzsst+iGf+T10yWfqALlkpn4JYlstJlNoaQJruZ
         jJZQ==
X-Gm-Message-State: AOJu0YwYAJQ3FrjelSejgJbTaDhpaxaXMrIp6ttv9Xvv7d1DKJgVvLzb
	9cKSq7cpkSUpy/1Ko2BgSmelsio77gqVg3rRvbM/MKcTVoLQBlLJUVahksXe66ZG
X-Gm-Gg: AfdE7cmuKFZeu0woTRXIseAhhLT8AFIxW3YFgyVL3YJNmb2Qw/DPrU4jGriAi6lounC
	0eL82muAsrpoSsG8pBygmQIXZ0bvRdl9dwuLqcg4nhJ+oFjhUXZWKVxO53IhsukblIxwZYorAIW
	nrVIKHKnLfRQX2imidwNTNPuvVgBJPx9fAuSlkrSYPVWn0kk1P+DNkrig6MV987FKXbldwPfPut
	yPjolDv5bxZVG8BSTFPUpHI0LDzY2poLaRv2BgJ32cNjJCnL37k6XlCmktPt+/HemGnzfVFtfVJ
	JY8egxWFNoZwrXAClAVNAs+JjxgzXvKz1SeUkpBgaxYSCCvwKW1b9Ic3iuy8ZsrHRy+bXiEg6th
	NjdFVyY3RrmisCMChTdbhaLbYKW4Ru4CRPqaM53xGEalJiVkgoH3sbnyK7hQ+faWL4IngrvkuZR
	wuwW93WCr/8ngQ1CyDd4PgYz4XLgGtgmNypWi2XnTNM/Mm8Rrc
X-Received: by 2002:a05:600c:5494:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-4923ef53be4mr47697025e9.8.1781857994445;
        Fri, 19 Jun 2026 01:33:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/15] debugedit: upgrade 5.2 -> 5.3
Date: Fri, 19 Jun 2026 10:32:50 +0200
Message-ID: <20260619083305.3505156-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239143

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{debugedit_5.2.bb => debugedit_5.3.bb}    |  3 +-
 ...not-check-for-executables-needed-onl.patch | 63 +++++++++++++++++++
 ...003-Makefile.am-do-not-update-manual.patch | 22 ++++---
 3 files changed, 80 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.2.bb => debugedit_5.3.bb} (86%)
 create mode 100644 meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.2.bb b/meta/recipes-devtools/debugedit/debugedit_5.3.bb
similarity index 86%
rename from meta/recipes-devtools/debugedit/debugedit_5.2.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.3.bb
index 76c54ba63d..7732dde52a 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.2.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.3.bb
@@ -11,9 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
            file://0003-Makefile.am-do-not-update-manual.patch \
+           file://0001-configure.ac-do-not-check-for-executables-needed-onl.patch \
            "
 
-SRC_URI[sha256sum] = "705296803cc4403f38764e891b4ed38f8d8d4f8a9164bd4f86c9d4bedcac68dd"
+SRC_URI[sha256sum] = "3b8c6396fe235e0270c9b9c0d244cfd0e86c284fc27e820acc58360e7cfa08c2"
 
 DEPENDS = "elfutils xxhash"
 DEPENDS:append:libc-musl = " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch b/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch
new file mode 100644
index 0000000000..a241972efa
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-for-executables-needed-onl.patch
@@ -0,0 +1,63 @@
+From bb64eddf41794ca5fd85dc3fecd29246d4d9ad23 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 17 Jun 2026 18:59:57 +0200
+Subject: [PATCH] configure.ac: do not check for executables needed only in
+ tests
+
+Otherwise this would require depending on various native pieces
+needlessly.
+
+This is effectively a revert of https://sourceware.org/cgit/debugedit/commit/?id=83963a11a07035445d93be9cf1feaf2d8865f052
+
+Upstream-Status: Inappropriate [undoes what is clearly upstream preference]
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 27 +--------------------------
+ 1 file changed, 1 insertion(+), 26 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4868844..8d74463 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,31 +51,6 @@ AC_CHECK_TOOL([NM], [nm])
+ AC_CHECK_TOOL([AR], [ar])
+ AM_MISSING_PROG(HELP2MAN, help2man)
+ 
+-AC_CHECK_PROG([HAS_CPIO], [cpio], [yes], [no])
+-if test x$HAS_CPIO = xno; then
+-  AC_MSG_ERROR([cpio needed by find-debuginfo])
+-fi
+-
+-AC_CHECK_PROG([HAS_EU_STRIP], [eu-strip], [yes], [no])
+-if test x$HAS_EU_STRIP = xno; then
+-  AC_MSG_ERROR([eu-strip needed by find-debuginfo (strip_to_debug)])
+-fi
+-
+-AC_CHECK_PROG([HAS_XZ], [xz], [yes], [no])
+-if test x$HAS_XZ = xno; then
+-  AC_MSG_ERROR([xz needed by find-debuginfo (add_minidebug)])
+-fi
+-
+-AC_CHECK_PROG([HAS_GDB_ADD_INDEX], [gdb-add-index], [yes], [no])
+-if test x$HAS_GDB_ADD_INDEX = xno; then
+-  AC_MSG_ERROR([gdb-add-index needed by find-debuginfo])
+-fi
+-
+-AC_CHECK_PROG([HAS_EU_ELFLINT], [eu-elflint], [yes], [no])
+-if test x$HAS_HAS_EU_ELFLINT = xno; then
+-  AC_MSG_ERROR([eu-elflint needed by find-debuginfo (--check-elf)])
+-fi
+-
+ # Whether dwz support -j.
+ # Make sure to compile something with -g.
+ # Run dwz on it with -j1.
+@@ -93,7 +68,7 @@ if test "x$DWZ" = "xdwz"; then
+   fi
+   CFLAGS="$save_CFLAGS"
+ else
+-  AC_MSG_ERROR([dwz needed by find-debuginfo])
++  AC_MSG_WARN([dwz needed by find-debuginfo])
+ fi
+ AC_SUBST([DWZ_J])
+ 
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
index d0414f739a..50be95696d 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -1,4 +1,4 @@
-From b2715c3f4d28fab1c238086d9b5435e269b06301 Mon Sep 17 00:00:00 2001
+From f9e6f9cadedc94323e8878e60aaa684be7c52d97 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
 Subject: [PATCH] Makefile.am: do not update manual
@@ -16,16 +16,16 @@ Upstream-Status: Inappropriate [OE Specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- Makefile.am | 30 ------------------------------
- 1 file changed, 30 deletions(-)
+ Makefile.am | 38 --------------------------------------
+ 1 file changed, 38 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index c590edf..692e016 100644
+index d3068d5..f218a05 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
- # Manual pages are generated for dist
- dist_man_MANS = debugedit.1 sepdebugcrcfix.1 find-debuginfo.1
+@@ -60,44 +60,6 @@ debugedit_classify_ar_LDADD = @LIBELF_LIBS@
+ dist_man_MANS = debugedit.1 sepdebugcrcfix.1 find-debuginfo.1 \
+ 	debugedit-classify-ar.1
  
 -# The 'case' ensures the man pages are only generated if the corresponding
 -# source script (the first prerequisite) or configure.ac (for the version)
@@ -49,6 +49,14 @@ index c590edf..692e016 100644
 -	  * ) : ;; \
 -	esac
 -
+-debugedit-classify-ar.1: tools/debugedit-classify-ar.c configure.ac debugedit-classify-ar$(EXEEXT)
+-	@case '$?' in \
+-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
+-		--name='Checks whether ELF archive members should be processed' \
+-		./debugedit-classify-ar$(EXEEXT) ;;\
+-	  * ) : ;; \
+-	esac
+-
 -find-debuginfo.1: $(top_srcdir)/scripts/find-debuginfo.in configure.ac find-debuginfo
 -	@case '$?' in \
 -	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
-- 
2.47.3


