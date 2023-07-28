Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D758C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 03:48:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.25663.1690516087911881564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 20:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YwE2ipGo;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-26809f86bd5so998741a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 20:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690516087; x=1691120887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KcCsRYKfLp44Er2fWBBPehsGbh9dRNgtTfyYxOEQ7Y=;
        b=YwE2ipGoZh/LbHEC8DbnHlPQFuxqNSspBTn3n5dl99HeYgaZXveuTwdCNyL4vTvvTe
         pfYJiwvDqv9rb9X1UIy0JTpFh+bXmc61XshSbd+U1N7f2Nq75DneritfqnOsRKen961V
         nCV0Mo5Ylwqe8m+wPWtz65873T3iNONOWQd6XMqmqgdrh+X3Le9ATdvnWFbsKTotoq9T
         29senF/JM/fg5z53pc3UNmvMpde7hrcg5CKILvIfLwcUbpVlUrlWjazqLxuOD+8SB7t0
         fktwnWBBE9uuDnxrWTX2x95aT+Xs4g3tyZD3PLPt12Uk4u1zVSkjW/llQua+GxtipvDR
         8evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516087; x=1691120887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KcCsRYKfLp44Er2fWBBPehsGbh9dRNgtTfyYxOEQ7Y=;
        b=StCM0RuFm7FEeWdz5YH3uHavUhsOPim6mouS6cPJGbVKo6QXTVs+XZMRgg3pJ7t4A4
         fC7ZKdh7e+UmvnQcMGDHoXsb/A0u36tWICq7qHJMl0mpIS4V8PWymkfjpS+3544k0ReI
         61OiLb2MPzgCvK2MPPLhI7QYnEygdh4osFjgZFXtYCGN6GYVbvzc2vX09x/TMHisKR0W
         t99lnq54tyj2NIB5VZhAUSpZi+ddCVyssfgGyieiL7SNnJdIj6NW0w7vTWQpjfpyyT/t
         q+Za+W5ZoCv8I55fealgI87DBxpFQUxsIHOR2xCYM+aM/LVXjcJWYNQIsIqU1J3Dg7Ci
         XIBA==
X-Gm-Message-State: ABy/qLZH0V2taqpuxd9SfuR/+NF6qj7cnukUTXtrum1g3v7ByhdTvcaM
	8N9wFUh0tcl+6Mpb0+q1B+mygbkOUL2oiw==
X-Google-Smtp-Source: APBJJlGupzeq93VWsxC86RExv0x2smVs/JEKlVUjr5ZgQueqRPqVqrON+iR/9PXvXOHYr/E6mIep0g==
X-Received: by 2002:a17:90a:9412:b0:263:f5b7:bc05 with SMTP id r18-20020a17090a941200b00263f5b7bc05mr414509pjo.14.1690516084447;
        Thu, 27 Jul 2023 20:48:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6608])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b00263f446d432sm3460532pjb.43.2023.07.27.20.48.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:48:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] autoconf: Backport upstreamed patches
Date: Thu, 27 Jul 2023 20:47:56 -0700
Message-ID: <879dfd39716a1c8f7e2a6b20577213f2e9cbe2b3.1690515949.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690515949.git.raj.khem@gmail.com>
References: <cover.1690515949.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 03:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185011

These patches improve the Y2038 support on top of 2.72c release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-prototypes-more-prominently-in-NEWS.patch |  36 ++
 ...d-run-make-fetch-which-updated-these.patch | 123 ++++++
 .../0003-NEWS-Tighten-up-wording.patch        |  29 ++
 ...to-programs-misusing-AC_EGREP_HEADER.patch |  82 ++++
 ...-Fix-timing-bug-on-high-speed-builds.patch |  75 ++++
 ...7-Support-underquoted-callers-better.patch |  57 +++
 ...-for-building-inside-Guix-containers.patch |  54 +++
 ..._DIR-Rewrite-using-AC_CANONICAL_HOST.patch |  82 ++++
 ...PE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch |  77 ++++
 ..._TRADITIONAL-a-compatibility-alias-f.patch | 180 ++++++++
 ...TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch | 328 ++++++++++++++
 ...-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch |  84 ++++
 ...st-few-internal-uses-of-AC_EGREP_CPP.patch | 116 +++++
 ...0015-Support-circa-early-2022-Gnulib.patch |  32 ++
 ...year2038-largefile-option-processing.patch | 121 ++++++
 ...Fix-configure-failure-on-32-bit-ming.patch |  30 ++
 ...18-Document-limitation-of-BusyBox-tr.patch |  45 ++
 ...REQUIRED-Fix-configure-failure-with-.patch |  48 +++
 .../0020-Tone-down-year-2038-changes.patch    | 405 ++++++++++++++++++
 ...-AC_FUNC_MMAP-to-more-modern-systems.patch |  98 +++++
 .../0022-Fix-port-of-AC_FUNC_MMAP.patch       |  91 ++++
 ..._SYS_YEAR2038_RECOMMENDED-diagnostic.patch |  38 ++
 .../0024-Improve-AC_FUNC_MMAP-comments.patch  |  29 ++
 ...S_LARGEFILE-on-GNU-Linux-alpha-s390x.patch |  62 +++
 .../backports/0026-Modernize-INSTALL.patch    | 270 ++++++++++++
 .../0027-doc-fix-broken-cross-refs.patch      |  58 +++
 ...build-host-target-and-the-system-typ.patch | 224 ++++++++++
 .../0029-Shorten-and-improve-INSTALL.patch    | 366 ++++++++++++++++
 .../autoconf/autoconf_2.72c.bb                |  34 +-
 29 files changed, 3273 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch
new file mode 100644
index 00000000000..3faf6f0a814
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch
@@ -0,0 +1,36 @@
+From 5ffc09fca39de051537fbebd7c6c33d5255a520f Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 27 Mar 2023 18:10:36 -0700
+Subject: [PATCH 01/29] mention prototypes more prominently in NEWS
+
+* NEWS: Mention the function prototype issue early.
+(From a suggestion by Zack Weinberg.)
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index cf01ee210..d64648c6f 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,14 @@ GNU Autoconf NEWS - User visible changes.
+ 
+ ** Backward incompatibilities
+ 
++*** AC_CHECK_FUNC and similar macros now use function prototypes.
++  AC_CHECK_FUNC and and similar macros now use C declarations with
++  function prototypes, a feature introduced in C89.  The new approach
++  should work better with C23, which removed the non-prototyped K&R
++  style that AC_CHECK_FUNC previously used.  However, this change
++  means Autoconf no longer supports pre-1989 C compilers, as they do
++  not support function prototypes.
++
+ *** Autoconf now requires perl 5.10 (2007) or later.
+   Generated 'configure' scripts continue to run without perl.
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch
new file mode 100644
index 00000000000..35f324c4aeb
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch
@@ -0,0 +1,123 @@
+From e2220ed33e69d8bc6504e3f6279894afe33a99a5 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 29 Mar 2023 12:59:09 -0700
+Subject: [PATCH 02/29] build: run "make fetch", which updated these:
+
+* build-aux/texinfo.tex: Update from texinfo.
+* lib/Autom4te/FileUtils.pm: Update from automake.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build-aux/texinfo.tex     | 50 +++++++++++++++++++++------------------
+ lib/Autom4te/FileUtils.pm |  5 +++-
+ 2 files changed, 31 insertions(+), 24 deletions(-)
+
+diff --git a/build-aux/texinfo.tex b/build-aux/texinfo.tex
+index d25161109..55a002d27 100644
+--- a/build-aux/texinfo.tex
++++ b/build-aux/texinfo.tex
+@@ -3,7 +3,7 @@
+ % Load plain if necessary, i.e., if running under initex.
+ \expandafter\ifx\csname fmtname\endcsname\relax\input plain\fi
+ %
+-\def\texinfoversion{2023-03-21.06}
++\def\texinfoversion{2023-03-27.21}
+ %
+ % Copyright 1985, 1986, 1988, 1990-2023 Free Software Foundation, Inc.
+ %
+@@ -1102,27 +1102,33 @@ where each line of input produces a line of output.}
+ 
+ % Output page labels information.
+ % See PDF reference v.1.7 p.594, section 8.3.1.
++% Page label ranges must be increasing.
+ \ifpdf
+ \def\pagelabels{%
+   \def\title{0 << /P (T-) /S /D >>}%
+-  \edef\roman{\the\romancount << /S /r >>}%
+-  \edef\arabic{\the\arabiccount << /S /D >>}%
+   %
+-  % Page label ranges must be increasing.  Remove any duplicates.
+-  % (There is a slight chance of this being wrong if e.g. there is
+-  % a @contents but no @titlepage, etc.)
+-  %
+-  \ifnum\romancount=0 \def\roman{}\fi
+-  \ifnum\arabiccount=0 \def\title{}%
+-  \else
+-    \ifnum\romancount=\arabiccount \def\roman{}\fi
+-  \fi
+-  %
+-  \ifnum\romancount<\arabiccount
+-    \pdfcatalog{/PageLabels << /Nums [\title \roman \arabic ] >> }\relax
++  % support @contents at very end of document
++  \ifnum\contentsendcount=\pagecount
++    \ifnum\arabiccount<\romancount
++      \pdfcatalog{/PageLabels << /Nums
++                  [\title
++                   \the\arabiccount << /S /D >>
++                   \the\romancount << /S /r >>
++                  ] >> }\relax
++    \fi
++  % no contents in document
++  \else\ifnum\contentsendcount=0
++    \pdfcatalog{/PageLabels << /Nums
++                [\title
++                 \the\arabiccount << /S /D >>
++                ] >> }\relax
+   \else
+-    \pdfcatalog{/PageLabels << /Nums [\title \arabic \roman ] >> }\relax
+-  \fi
++    \pdfcatalog{/PageLabels << /Nums
++                [\title
++                 \the\romancount << /S /r >>
++                 \the\contentsendcount << /S /D >>
++                ] >> }\relax
++  \fi\fi
+ }
+ \else
+   \let\pagelabels\relax
+@@ -1131,6 +1137,8 @@ where each line of input produces a line of output.}
+ \newcount\pagecount \pagecount=0
+ \newcount\romancount \romancount=0
+ \newcount\arabiccount \arabiccount=0
++\newcount\contentsendcount \contentsendcount=0
++
+ \ifpdf
+   \let\ptxadvancepageno\advancepageno
+   \def\advancepageno{%
+@@ -6809,12 +6817,8 @@ might help (with 'rm \jobname.?? \jobname.??s')%
+ % Get ready to use Arabic numerals again
+ \def\contentsendroman{%
+   \lastnegativepageno = \pageno
+-  \global\pageno = \savepageno
+-  %
+-  % If \romancount > \arabiccount, the contents are at the end of the
+-  % document.  Otherwise, advance where the Arabic numerals start for
+-  % the page numbers.
+-  \ifnum\romancount>\arabiccount\else\global\arabiccount=\pagecount\fi
++  \global\pageno=1
++  \contentsendcount = \pagecount
+ }
+ 
+ % Typeset the label for a chapter or appendix for the short contents.
+diff --git a/lib/Autom4te/FileUtils.pm b/lib/Autom4te/FileUtils.pm
+index ab58b9de4..2468fe6d8 100644
+--- a/lib/Autom4te/FileUtils.pm
++++ b/lib/Autom4te/FileUtils.pm
+@@ -39,9 +39,12 @@ use strict;
+ use warnings FATAL => 'all';
+ 
+ use Exporter;
+-use Time::HiRes qw(stat);
+ use IO::File;
+ 
++# use sub-second resolution timestamps if available,
++# carry on with one-second resolution timestamps if that is all we have
++BEGIN { eval { require Time::HiRes; import Time::HiRes qw(stat) } }
++
+ use Autom4te::Channels;
+ use Autom4te::ChannelDefs;
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch
new file mode 100644
index 00000000000..76c37a005bd
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch
@@ -0,0 +1,29 @@
+From e05aa447945c0d72ad924fd89a28830cf1a0f8d3 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 31 Mar 2023 10:37:57 -0700
+Subject: [PATCH 03/29] * NEWS: Tighten up wording.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index d64648c6f..884e46f45 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,9 +5,7 @@ GNU Autoconf NEWS - User visible changes.
+ ** Backward incompatibilities
+ 
+ *** AC_CHECK_FUNC and similar macros now use function prototypes.
+-  AC_CHECK_FUNC and and similar macros now use C declarations with
+-  function prototypes, a feature introduced in C89.  The new approach
+-  should work better with C23, which removed the non-prototyped K&R
++  This should work better with C23, which removed the non-prototyped K&R
+   style that AC_CHECK_FUNC previously used.  However, this change
+   means Autoconf no longer supports pre-1989 C compilers, as they do
+   not support function prototypes.
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
new file mode 100644
index 00000000000..1b30d9926cb
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
@@ -0,0 +1,82 @@
+From 232cab527897bcdf4d55492d41af73d31905bda5 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 31 Mar 2023 10:46:20 -0700
+Subject: [PATCH 04/29] Cater to programs misusing AC_EGREP_HEADER
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Frederic Berat in:
+https://lists.gnu.org/archive/html/autoconf/2022-11/msg00127.html
+* lib/autoconf/programs.m4 (AC_PROG_EGREP): Also set
+EGREP_TRADITIONAL and ac_cv_path_EGREP_TRADITIONAL.
+* tests/c.at (AC_PROG_EGREP and AC_EGREP_HEADER):
+New test, taken from Frederic Berat’s email in:
+https://lists.gnu.org/r/autoconf/2023-03/msg00043.html
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/programs.m4 | 10 ++++++++++
+ tests/c.at               | 24 ++++++++++++++++++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/lib/autoconf/programs.m4 b/lib/autoconf/programs.m4
+index 1b7460c85..62ba6b8b6 100644
+--- a/lib/autoconf/programs.m4
++++ b/lib/autoconf/programs.m4
+@@ -371,6 +371,16 @@ AC_CACHE_CHECK([for egrep], ac_cv_path_EGREP,
+    fi])
+  EGREP="$ac_cv_path_EGREP"
+  AC_SUBST([EGREP])
++ dnl
++ dnl Also set EGREP_TRADITIONAL even though unnecessary here,
++ dnl for wrong but too-common code with the following pattern:
++ dnl   AC_PROG_EGREP
++ dnl   if false; then
++ dnl      AC_EGREP_HEADER([printf], [stdio.h], [has_printf=yes])
++ dnl   fi
++ dnl   AC_EGREP_HEADER([malloc], [stdlib.h], [has_malloc=yes])
++ EGREP_TRADITIONAL=$EGREP
++ ac_cv_path_EGREP_TRADITIONAL=$EGREP
+ ])# AC_PROG_EGREP
+ 
+ # _AC_PROG_EGREP_TRADITIONAL
+diff --git a/tests/c.at b/tests/c.at
+index c37f43b10..fad54760f 100644
+--- a/tests/c.at
++++ b/tests/c.at
+@@ -232,6 +232,30 @@ AT_CHECK_DEFINES(
+ AT_CLEANUP
+ 
+ 
++## ----------------------------------- ##
++## AC_PROG_EGREP and AC_EGREP_HEADER.  ##
++## ----------------------------------- ##
++
++AT_SETUP([AC_PROG_EGREP and AC_EGREP_HEADER])
++
++_AT_CHECK_AC_MACRO(
++[[AC_PROG_CPP
++  AC_PROG_EGREP
++
++  # Although this code is incorrect (it should use AS_IF),
++  # it follows a too-common real world pattern.
++  # For now, test for it; we may remove this test later.
++  if false; then
++    AC_EGREP_HEADER([^], [limits.h])
++  fi
++
++  AC_EGREP_HEADER([$], [limits.h], [],
++    [AC_MSG_ERROR([[egrep-related macros do not tolerate misuse of 'if']])])
++]])
++
++AT_CLEANUP
++
++
+ ## ------------------------------------ ##
+ ## AC_NO_EXECUTABLES (working linker).  ##
+ ## ------------------------------------ ##
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch
new file mode 100644
index 00000000000..53fb40b4df3
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch
@@ -0,0 +1,75 @@
+From 713d9822bbfb2923115065efaefed34a0113f8a1 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sat, 1 Apr 2023 16:44:03 -0700
+Subject: [PATCH 06/29] Fix timing bug on high-speed builds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Bogdan via Jacob Bachmeyer in:
+https://lists.gnu.org/r/autoconf/2023-04/msg00002.html
+* bin/autom4te.in: If a file timestamp equals a dependency’s
+timestamp, consider the file to be out of date.  Although this may
+result in extra work, it fixes some rare timing bugs.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bin/autom4te.in | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/bin/autom4te.in b/bin/autom4te.in
+index 4b61f0a82..71d7e6a62 100644
+--- a/bin/autom4te.in
++++ b/bin/autom4te.in
+@@ -910,10 +910,8 @@ sub up_to_date ($)
+   return 0
+     if ! -f $tfile || ! -f $ofile;
+ 
+-  # The youngest of the cache files must be older than the oldest of
++  # The younger of the cache files must be older than the oldest of
+   # the dependencies.
+-  # FIXME: These timestamps have only 1-second resolution.
+-  # Time::HiRes fixes this, but assumes Perl 5.8 or later.
+   my $tmtime = mtime ($tfile);
+   my $omtime = mtime ($ofile);
+   my ($file, $mtime) = ($tmtime < $omtime
+@@ -926,7 +924,7 @@ sub up_to_date ($)
+   # We depend at least upon the arguments.
+   foreach my $dep (@ARGV)
+     {
+-      if ($mtime < mtime ($dep))
++      if ($mtime <= mtime ($dep))
+ 	{
+ 	  verb "up_to_date ($file): outdated: $dep";
+ 	  return 0;
+@@ -949,7 +947,7 @@ sub up_to_date ($)
+       # timestamp of that missing file was newer).
+       return 0
+ 	if ! $dep;
+-      if ($mtime < mtime ($dep))
++      if ($mtime <= mtime ($dep))
+ 	{
+ 	  verb "up_to_date ($file): outdated: $dep";
+ 	  return 0;
+@@ -1038,7 +1036,7 @@ $icache_file = new Autom4te::XFile $icache, O_RDWR|O_CREAT;
+ $icache_file->lock (LOCK_EX)
+   if ($flock_implemented eq "yes");
+ 
+-# Read the cache index if available and older than autom4te itself.
++# Read the cache index if available and younger than autom4te itself.
+ # If autom4te is younger, then some structures such as C4che might
+ # have changed, which would corrupt its processing.
+ Autom4te::C4che->load ($icache_file)
+@@ -1105,7 +1103,7 @@ else
+     # Actual M4 expansion, if the user wants it, or if $output is old
+     # (STDOUT is pretty old).
+     handle_output ($req, $output)
+-      if $force || mtime ($output) < mtime ($ocache . $req->id);
++      if $force || mtime ($output) <= mtime ($ocache . $req->id);
+   }
+ 
+ # If we ran up to here, the cache is valid.
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch
new file mode 100644
index 00000000000..f9f9345ade6
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch
@@ -0,0 +1,57 @@
+From 794182506c3c5814d48b2fc4d832770f608ce0ef Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sat, 1 Apr 2023 20:25:13 -0700
+Subject: [PATCH 07/29] Support underquoted callers better
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported bh Khem Raj for mcpp 2.7.2 (2008) in:
+https://lists.gnu.org/r/autoconf/2023-04/msg00001.html
+* lib/autoconf/programs.m4 (_AC_PATH_PROG_FLAVOR_GNU):
+Add two ‘@%:@(’s to cater to underquoted callers.
+* lib/m4sugar/m4sh.m4 (_AS_PATH_WALK): Use quadrigraph instead of
+‘#’, for underquoted callers.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/programs.m4 | 5 +++--
+ lib/m4sugar/m4sh.m4      | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/autoconf/programs.m4 b/lib/autoconf/programs.m4
+index 62ba6b8b6..d06d18c44 100644
+--- a/lib/autoconf/programs.m4
++++ b/lib/autoconf/programs.m4
+@@ -543,11 +543,12 @@ dnl   # for best performing tool in a list breaks down.
+ # ----------------------------------------------------------------
+ m4_define([_AC_PATH_PROG_FLAVOR_GNU],
+ [# Check for GNU $1
+-case `"$1" --version 2>&1` in
++case `"$1" --version 2>&1` in @%:@(
+ *GNU*)
+   $2;;
+ m4_ifval([$3],
+-[*)
++[@%:@(
++*)
+   $3;;
+ ])esac
+ ])# _AC_PATH_PROG_FLAVOR_GNU
+diff --git a/lib/m4sugar/m4sh.m4 b/lib/m4sugar/m4sh.m4
+index ab5ca7db7..368487fa0 100644
+--- a/lib/m4sugar/m4sh.m4
++++ b/lib/m4sugar/m4sh.m4
+@@ -1389,7 +1389,7 @@ m4_if([$1], m4_translit([[$1]], [:;]),
+ for as_dir in $as_dummy])
+ do
+   IFS=$as_save_IFS
+-  case $as_dir in #(((
++  case $as_dir in @%:@(((
+     '') as_dir=./ ;;
+     */) ;;
+     *) as_dir=$as_dir/ ;;
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch
new file mode 100644
index 00000000000..cec7dcddefe
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch
@@ -0,0 +1,54 @@
+From 8babe5f2ccb73cc574933743b381557a4db02424 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Thu, 30 Mar 2023 10:50:36 -0400
+Subject: [PATCH 08/29] New script for building inside Guix containers.
+
+build-aux/test-build-guix, goes with the top level manifest.scm.
+See the top of the file for usage instructions.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build-aux/test-build-guix | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+ create mode 100755 build-aux/test-build-guix
+
+diff --git a/build-aux/test-build-guix b/build-aux/test-build-guix
+new file mode 100755
+index 000000000..4470af9b7
+--- /dev/null
++++ b/build-aux/test-build-guix
+@@ -0,0 +1,30 @@
++#! /bin/sh
++
++# From a pristine Git checkout, run
++#  guix shell --container --manifest=manifest.scm -- build-aux/test-build-guix
++# to perform a complete bootstrap and test build of Autoconf.
++
++set -ex
++
++# Guix bug? /bin/sh is usually *not* the shell specified in the manifest.
++SHELL="$(command -v sh)"
++export SHELL
++if [ "$(realpath /bin/sh)" != "$(realpath "$SHELL")" ]; then
++    (
++        cd /bin
++        rm sh
++        ln -s "$SHELL" sh
++    )
++    exec "$SHELL" "$0" "$@"
++fi
++
++./bootstrap
++if [ -d _build ]; then
++    rm -rf _build/*
++else
++    mkdir _build
++fi
++cd _build
++../configure
++make all info pdf dvi
++make distcheck
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
new file mode 100644
index 00000000000..c1c60dcf53f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
@@ -0,0 +1,82 @@
+From dcf9bb7e3b12f3bd74edff60e80b53e668159579 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 10:27:08 -0400
+Subject: [PATCH 09/29] AC_XENIX_DIR: Rewrite using AC_CANONICAL_HOST.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+AC_XENIX_DIR is an obsolete macro, defined as AC_HEADER_DIRENT plus
+code to make absolutely sure configure scripts that depended on a
+shell variable internal to the original (2.13 era) definition of
+AC_XENIX_DIR are not broken by autoupdate.  (That variable had the
+temptingly public-sounding name “XENIX.”)  This compatibility code
+uses AC_EGREP_CPP, which is itself discouraged for use in new
+configure scripts.
+
+(N.B. codesearch.debian.net does not find any uses whatsoever of
+this macro, nor any code in an .ac or .m4 file that depends on the
+XENIX variable.)
+
+Change the compatibility code to use AC_CANONICAL_HOST instead,
+and clarify which pieces of the code inserted by autoupdate are
+probably still necessary.
+
+* lib/autoconf/specific.m4 (AC_XENIX_DIR): Set XENIX variable
+  based on value of host_os. Clarify what manual cleanup is
+  recommended after autoupdate replaces this obsolete macro.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 26 +++++++++++---------------
+ 1 file changed, 11 insertions(+), 15 deletions(-)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 1b3ee661b..a2dc5d488 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -754,9 +754,9 @@ dnl it should only be defined when necessary.
+ ## Checks for UNIX variants.  ##
+ ## -------------------------- ##
+ 
+-
+-# These are kludges which should be replaced by a single POSIX check.
+-# They aren't cached, to discourage their use.
++# These macros are all obsolete, from the early days of Autoconf,
++# before the invention of AC_CANONICAL_SYSTEM.  Autoupdate will
++# replace each with inline code for a more modern feature check.
+ 
+ # AC_AIX
+ # ------
+@@ -776,19 +776,15 @@ AU_DEFUN([AC_ISC_POSIX], [AC_SEARCH_LIBS([strerror], [cposix])])
+ # AC_XENIX_DIR
+ # ------------
+ AU_DEFUN([AC_XENIX_DIR],
+-[AC_MSG_CHECKING([for Xenix])
+-AC_EGREP_CPP([yes],
+-[#if defined M_XENIX && ! defined M_UNIX
+-  yes
+-@%:@endif],
+-	     [AC_MSG_RESULT([yes]); XENIX=yes],
+-	     [AC_MSG_RESULT([no]); XENIX=])
+-
+-AC_HEADER_DIRENT[]dnl
++[AC_HEADER_DIRENT
++# Autoupdate added the next two lines to ensure that your configure
++# script's behavior did not change.  They are safe to remove unless
++# you have code that depends on the XENIX shell variable.
++AC_CANONICAL_HOST
++AS_CASE([$host_os], [xenix*], [XENIX=yes], [XENIX=no])
++# End of code added by autoupdate
+ ],
+-[You shouldn't need to depend upon XENIX.  Remove the
+-'AC_MSG_CHECKING', 'AC_EGREP_CPP', and this warning if this part
+-of the test is useless.])
++[Check for code depending on the XENIX shell variable.])
+ 
+ 
+ # AC_DYNIX_SEQ
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
new file mode 100644
index 00000000000..49322712ac2
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
@@ -0,0 +1,77 @@
+From 51d98495d1aac00970d791f064e83ca762bf81c7 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 10:43:51 -0400
+Subject: [PATCH 10/29] AC_TYPE_UID_T: Rewrite using AC_CHECK_TYPE.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+AC_TYPE_UID_T uses AC_EGREP_HEADER to search sys/types.h for
+occurrences of the string ‘uid_t’ and, if found, assumes both
+uid_t and gid_t are available.  This would be better done using
+a pair of AC_CHECK_TYPE operations.
+
+I also converted two uses of old-style AC_CHECK_TYPE, immediately
+below, to new-style.  (There are probably other old-style uses in
+this file, I only did the ones I happened to see.)
+
+* lib/autoconf/types.m4 (AC_TYPE_UID_T): Check for uid_t and gid_t,
+  separately, using AC_CHECK_TYPE, instead of grepping sys/types.h.
+  (AC_TYPE_SIZE_T, AC_TYPE_SSIZE_T): Use new-style AC_CHECK_TYPE.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/types.m4 | 30 +++++++++++++++++-------------
+ 1 file changed, 17 insertions(+), 13 deletions(-)
+
+diff --git a/lib/autoconf/types.m4 b/lib/autoconf/types.m4
+index ebac0cf6d..ef2456135 100644
+--- a/lib/autoconf/types.m4
++++ b/lib/autoconf/types.m4
+@@ -589,25 +589,29 @@ AC_DEFUN([AC_TYPE_MBSTATE_T],
+ 
+ # AC_TYPE_UID_T
+ # -------------
+-# FIXME: Rewrite using AC_CHECK_TYPE.
+ AN_IDENTIFIER([gid_t], [AC_TYPE_UID_T])
+ AN_IDENTIFIER([uid_t], [AC_TYPE_UID_T])
+ AC_DEFUN([AC_TYPE_UID_T],
+-[AC_CACHE_CHECK(for uid_t in sys/types.h, ac_cv_type_uid_t,
+-[AC_EGREP_HEADER(uid_t, sys/types.h,
+-  ac_cv_type_uid_t=yes, ac_cv_type_uid_t=no)])
+-if test $ac_cv_type_uid_t = no; then
+-  AC_DEFINE(uid_t, int, [Define to 'int' if <sys/types.h> doesn't define.])
+-  AC_DEFINE(gid_t, int, [Define to 'int' if <sys/types.h> doesn't define.])
+-fi
+-])
+-
+-
++[AC_CHECK_TYPE([uid_t], [],
++  [AC_DEFINE([uid_t], [int],
++    [Define as 'int' if <sys/types.h> doesn't define.])])
++AC_CHECK_TYPE([gid_t], [],
++  [AC_DEFINE([gid_t], [int],
++    [Define as 'int' if <sys/types.h> doesn't define.])])])
++
++# This should be obsoleted, size_t is in C90.
+ AN_IDENTIFIER([size_t], [AC_TYPE_SIZE_T])
+-AC_DEFUN([AC_TYPE_SIZE_T], [AC_CHECK_TYPE(size_t, unsigned int)])
++AC_DEFUN([AC_TYPE_SIZE_T],
++[AC_CHECK_TYPE([size_t], [],
++  [AC_DEFINE([size_t], [unsigned int],
++    [Define as 'unsigned int' if <stddef.h> doesn't define.])])])
+ 
+ AN_IDENTIFIER([ssize_t], [AC_TYPE_SSIZE_T])
+-AC_DEFUN([AC_TYPE_SSIZE_T], [AC_CHECK_TYPE(ssize_t, int)])
++AC_DEFUN([AC_TYPE_SSIZE_T],
++[AC_CHECK_TYPE([ssize_t], [],
++  [AC_DEFINE([ssize_t], [int],
++    [Define as 'int' if <sys/types.h> doesn't define.])])])
++
+ 
+ AN_IDENTIFIER([pid_t], [AC_TYPE_PID_T])
+ AC_DEFUN([AC_TYPE_PID_T],
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
new file mode 100644
index 00000000000..9c1f435d530
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
@@ -0,0 +1,180 @@
+From daaca7f74f94d6a7a51d571156d5fbaba5ef9a87 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 21:03:30 -0400
+Subject: [PATCH 11/29] Make AC_PROG_GCC_TRADITIONAL a compatibility alias for
+ AC_PROG_CC.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This macro is one of the last remaining internal uses of AC_EGREP_CPP.
+It has only ever done anything useful with GCC, and GCC dropped
+support for ‘traditional’ compilation in version 3.3 (released 2003)
+so I do not think it is worth trying to preserve.
+
+* lib/autoconf/c.m4 (AC_PROG_GCC_TRADITIONAL): Make into a
+  compatibility alias for AC_PROG_CC, similar to AC_PROG_CC_STDC.
+* lib/autoconf/general.m4 (AC_EGREP_CPP): Remove stale comment.
+* doc/autoconf.texi, NEWS: Document this change.
+* tests/mktests.pl: Exclude AC_PROG_GCC_TRADITIONAL from
+  autoupdate tests.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                    |  7 +++++++
+ doc/autoconf.texi       | 29 ++++++++++++++---------------
+ lib/autoconf/c.m4       | 30 ++++++------------------------
+ lib/autoconf/general.m4 |  2 --
+ tests/mktests.pl        |  2 +-
+ 5 files changed, 28 insertions(+), 42 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 6a106f155..53c57ff59 100644
+--- a/NEWS
++++ b/NEWS
+@@ -81,6 +81,13 @@ GNU Autoconf NEWS - User visible changes.
+   with plain apostrophes instead of the older GNU style `like this'
+   with grave accent and apostrophe.
+ 
++*** AC_PROG_GCC_TRADITIONAL no longer does anything.
++
++  This macro has had no useful effect since GCC dropped support for
++  traditional-mode compilation in version 3.3 (released in 2003), and
++  the systems that needed it are also long obsolete.  It is now a
++  compatibility synonym for AC_PROG_CC.
++
+ ** Notable bug fixes
+ 
+ *** Autoconf caches now use finer-grained timestamps.
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 8db64d8bb..037c8055f 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -7764,20 +7764,6 @@ This macro is obsolescent, as current C compilers support prototypes.
+ New programs need not use this macro.
+ @end defmac
+ 
+-@anchor{AC_PROG_GCC_TRADITIONAL}
+-@defmac AC_PROG_GCC_TRADITIONAL
+-@acindex{PROG_GCC_TRADITIONAL}
+-@ovindex CC
+-Add @option{-traditional} to output variable @code{CC} if using a
+-GNU C compiler and @code{ioctl} does not work properly without
+-@option{-traditional}.  That usually happens when the fixed header files
+-have not been installed on an old system.
+-
+-This macro is obsolescent, since current versions of the GNU C
+-compiler fix the header files automatically when installed.
+-@end defmac
+-
+-
+ @node C++ Compiler
+ @subsection C++ Compiler Characteristics
+ 
+@@ -23986,7 +23972,8 @@ These days portable programs should use @code{waitpid}, not
+ 
+ @defmac AC_GCC_TRADITIONAL
+ @acindex{GCC_TRADITIONAL}
+-Replaced by @code{AC_PROG_GCC_TRADITIONAL} (@pxref{AC_PROG_GCC_TRADITIONAL}).
++Replaced by @code{AC_PROG_GCC_TRADITIONAL} (@pxref{AC_PROG_GCC_TRADITIONAL}),
++which is itself obsolete.
+ @end defmac
+ 
+ @defmac AC_GETGROUPS_T
+@@ -24369,6 +24356,18 @@ Now done by @code{AC_PROG_CC} (@pxref{AC_PROG_CC}).
+ Now done by @code{AC_PROG_CC} (@pxref{AC_PROG_CC}).
+ @end defmac
+ 
++@anchor{AC_PROG_GCC_TRADITIONAL}
++@defmac AC_PROG_GCC_TRADITIONAL
++@acindex{PROG_GCC_TRADITIONAL}
++Used to put GCC into ``traditional'' (pre-ISO C) compilation mode,
++on systems with headers that did not work correctly with a
++standard-compliant compiler.  GCC has not supported traditional
++compilation in many years, and all of the systems that required this are
++long obsolete themselves.  This macro is now a compatibility synonym for
++@code{AC_PROG_CC} (@pxref{AC_PROG_CC}).
++
++@end defmac
++
+ @defmac AC_PROGRAMS_CHECK
+ @acindex{PROGRAMS_CHECK}
+ Replaced by @code{AC_CHECK_PROGS} (@pxref{AC_CHECK_PROGS}).
+diff --git a/lib/autoconf/c.m4 b/lib/autoconf/c.m4
+index fef6c516d..33648b5b9 100644
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -551,30 +551,6 @@ fi[]dnl
+ ])# _AC_PROG_CC_G
+ 
+ 
+-# AC_PROG_GCC_TRADITIONAL
+-# -----------------------
+-AC_DEFUN([AC_PROG_GCC_TRADITIONAL],
+-[AC_REQUIRE([AC_PROG_CC])dnl
+-if test $ac_cv_c_compiler_gnu = yes; then
+-    AC_CACHE_CHECK(whether $CC needs -traditional,
+-      ac_cv_prog_gcc_traditional,
+-[  ac_pattern="Autoconf.*'x'"
+-  AC_EGREP_CPP($ac_pattern, [#include <sgtty.h>
+-Autoconf TIOCGETP],
+-  ac_cv_prog_gcc_traditional=yes, ac_cv_prog_gcc_traditional=no)
+-
+-  if test $ac_cv_prog_gcc_traditional = no; then
+-    AC_EGREP_CPP($ac_pattern, [#include <termio.h>
+-Autoconf TCGETA],
+-    ac_cv_prog_gcc_traditional=yes)
+-  fi])
+-  if test $ac_cv_prog_gcc_traditional = yes; then
+-    CC="$CC -traditional"
+-  fi
+-fi
+-])# AC_PROG_GCC_TRADITIONAL
+-
+-
+ # AC_PROG_CC_C_O
+ # --------------
+ AC_DEFUN([AC_PROG_CC_C_O],
+@@ -1675,6 +1651,12 @@ AU_DEFUN([AC_PROG_CC_STDC],
+   [$0 is obsolete; use AC_PROG_CC]
+ )
+ 
++# AC_PROG_GCC_TRADITIONAL
++# -----------------------
++AU_DEFUN([AC_PROG_GCC_TRADITIONAL],
++  [AC_REQUIRE([AC_PROG_CC])],
++  [$0 is obsolete; use AC_PROG_CC]
++)
+ 
+ # AC_C_BACKSLASH_A
+ # ----------------
+diff --git a/lib/autoconf/general.m4 b/lib/autoconf/general.m4
+index ecda0a51c..47d896d54 100644
+--- a/lib/autoconf/general.m4
++++ b/lib/autoconf/general.m4
+@@ -2766,8 +2766,6 @@ AU_DEFUN([AC_TRY_CPP],
+ # AC_EGREP_CPP(PATTERN, PROGRAM,
+ #              [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
+ # ------------------------------------------------------
+-# Because this macro is used by AC_PROG_GCC_TRADITIONAL, which must
+-# come early, it is not included in AC_BEFORE checks.
+ AC_DEFUN([AC_EGREP_CPP],
+ [AC_LANG_PREPROC_REQUIRE()dnl
+ AC_REQUIRE([_AC_PROG_EGREP_TRADITIONAL])dnl
+diff --git a/tests/mktests.pl b/tests/mktests.pl
+index effed0bca..81f63586c 100644
+--- a/tests/mktests.pl
++++ b/tests/mktests.pl
+@@ -112,7 +112,7 @@ my @ac_exclude_list = (
+ # Check all AU_DEFUN'ed macros with AT_CHECK_AU_MACRO, except these.
+ my @au_exclude_list = (
+   # Empty.
+-  qr/^AC_(C_CROSS|PROG_CC_(C[89]9|STDC))$/,
++  qr/^AC_(C_CROSS|PROG_(CC_(C[89]9|STDC)|GCC_TRADITIONAL))$/,
+ 
+   # Use AC_REQUIRE.
+   qr/^AC_(CYGWIN|MINGW32|EMXOS2)$/,
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
new file mode 100644
index 00000000000..4d28101b46f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
@@ -0,0 +1,328 @@
+From b5891a57b586ef6ff78bb752d62915b78cd58d7e Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 15:07:58 -0400
+Subject: [PATCH 12/29] Overhaul AC_TYPE_GETGROUPS and AC_FUNC_GETGROUPS.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+AC_TYPE_GETGROUPS is the last remaining use of AC_EGREP_HEADER in
+stock Autoconf macros.  It uses it only when cross compiling, as a
+fallback from an AC_RUN_IFELSE check, testing for a bug in system
+headers from the late 1980s or early 1990s, where gid_t *existed*
+but the second argument to getgroups needed to be an array of int,
+and this didn’t cause a compile error (i.e. the system headers
+declare getgroups with no prototype or an incorrect prototype).
+AC_FUNC_GETGROUPS also uses AC_RUN_IFELSE to test for obscure
+problems specific to long-obsolete Unixes.
+
+The downsides of AC_RUN_IFELSE and AC_EGREP_HEADER seem more severe
+than the chances of someone compiling a current-generation program,
+that uses getgroups, on an OS old enough to have one of the really
+nasty bugs.  Accordingly, this patch changes AC_FUNC_GETGROUPS to use
+a host_os-based *blacklist* both in native and cross compilation.
+This is limited to the two host_os values for which either our old
+code, or Gnulib, documented a serious bug: ultrix* and nextstep*.
+Currently it does not try to pin down the exact version ranges subject
+to the bugs — that would require research by someone with access to
+the full history of these OSes.
+
+An incorrect guess by this blacklist can be overridden by setting
+ac_cv_func_getgroups_works in config.site.  AC_TYPE_GETGROUPS, for its
+part, now does a series of regular old AC_COMPILE_IFELSE checks to
+probe the prototype of getgroups, and considers that good enough.
+
+While I was in there I noticed that AC_FUNC_GETGROUPS does not
+AC_SUBST a documented output variable, and that the name of this
+variable is misspelled in the manual.
+
+* lib/autoconf/functions.m4 (AC_FUNC_GETGROUPS): Use AC_SEARCH_LIBS
+  to probe for getgroups.  Use an AC_CANONICAL_HOST-based blacklist
+  for bug detection, not AC_RUN_IFELSE.  AC_SUBST the GETGROUPS_LIB
+  output variable.
+* lib/autoconf/types.m4 (AC_TYPE_GETGROUPS): Check only the prototype
+  of getgroups, using AC_COMPILE_IFELSE; do not use either AC_RUN_IFELSE
+  or AC_EGREP_HEADER.
+* doc/autoconf.texi: Update to match. Correct misspelling of
+  GETGROUPS_LIB.
+* tests.local.at (_AT_CHECK_ENV): Allow GETGROUPS_LIB output variable.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                      | 11 +++++
+ doc/autoconf.texi         | 25 ++++++----
+ lib/autoconf/functions.m4 | 61 ++++++++++++------------
+ lib/autoconf/types.m4     | 97 ++++++++++++++++++++++++---------------
+ tests/local.at            |  2 +-
+ 5 files changed, 120 insertions(+), 76 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 53c57ff59..8e4ecc1bf 100644
+--- a/NEWS
++++ b/NEWS
+@@ -38,6 +38,17 @@ GNU Autoconf NEWS - User visible changes.
+   This matters only for uses that, contrary to the documentation
+   and despite warnings, use m4_divert with numbered diversions.
+ 
++*** AC_FUNC_GETGROUPS and AC_TYPE_GETGROUPS no longer run test programs.
++  These macros were testing for OS bugs that we believe are at least
++  twenty years in the past.  Most operating systems are now trusted to
++  provide an accurate prototype for getgroups in unistd.h, and to
++  implement it as specified in POSIX.
++
++  AC_FUNC_GETGROUPS still includes a short blacklist of OSes with
++  known, severe bugs in getgroups.  It can be overridden using
++  config.site.  If you encounter a mistake in this blacklist
++  please report it to bug-autoconf.
++
+ ** New features
+ 
+ *** New macro AC_SYS_YEAR2038.
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 037c8055f..5d5f613e6 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -5257,17 +5257,26 @@ and also contains workarounds for other portability problems of
+ @defmac AC_FUNC_GETGROUPS
+ @acindex{FUNC_GETGROUPS}
+ @cvindex HAVE_GETGROUPS
+-@ovindex GETGROUPS_LIBS
++@ovindex GETGROUPS_LIB
+ @c @fuindex getgroups
+ @prindex @code{getgroups}
+ @caindex func_getgroups_works
+-If the @code{getgroups} function is available and works,
+-define @code{HAVE_GETGROUPS}.  Set @code{GETGROUPS_LIBS} to any libraries
+-needed to get that function.  This macro runs @code{AC_TYPE_GETGROUPS}.
+-
+-This macro is obsolescent. New programs need not use this macro.  But
+-they may want to use the Gnulib module @code{getgroups}, which provides
+-workarounds to other portability problems of this function.
++Perform all the checks performed by @code{AC_TYPE_GETGROUPS}
++(@pxref{AC_TYPE_GETGROUPS}).
++Then, if the @code{getgroups} function is available
++and known to work correctly, define @code{HAVE_GETGROUPS}.
++Set the output variable @code{GETGROUPS_LIB} to any libraries
++needed to get that function.
++
++This macro relies on a list of systems with known, serious bugs in
++@code{getgroups}.  If this list mis-identifies your system's
++@code{getgroups} as buggy, or as not buggy, you can override it by
++setting the cache variable @code{ac_cv_func_getgroups_works} in a
++@file{config.site} file (@pxref{Site Defaults}).  Please also report the
++error to @email{bug-autoconf@@gnu.org, the Autoconf Bugs mailing list}.
++
++The Gnulib module @code{getgroups} provides workarounds for additional,
++less severe portability problems with this function.
+ @end defmac
+ 
+ @anchor{AC_FUNC_GETLOADAVG}
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 655d6ba8f..74512e97d 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -698,47 +698,46 @@ AS_IF([test "$ac_cv_func_fseeko_ftello" = "need _LARGEFILE_SOURCE"],
+ # When cross-compiling, assume getgroups is broken.
+ AN_FUNCTION([getgroups], [AC_FUNC_GETGROUPS])
+ AC_DEFUN([AC_FUNC_GETGROUPS],
+-[AC_REQUIRE([AC_TYPE_GETGROUPS])dnl
+-AC_REQUIRE([AC_TYPE_SIZE_T])dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl for cross-compiles
+-AC_CHECK_FUNC(getgroups)
++[AC_REQUIRE([AC_CANONICAL_HOST])dnl
++AC_REQUIRE([AC_TYPE_GETGROUPS])dnl
+ 
+-# If we don't yet have getgroups, see if it's in -lbsd.
++# On older systems getgroups might be in -lbsd.
+ # This is reported to be necessary on an ITOS 3000WS running SEIUX 3.1.
+ ac_save_LIBS=$LIBS
+-if test $ac_cv_func_getgroups = no; then
+-  AC_CHECK_LIB(bsd, getgroups, [GETGROUPS_LIB=-lbsd])
+-fi
+-
+-# Run the program to test the functionality of the system-supplied
+-# getgroups function only if there is such a function.
++LIBS=
++GETGROUPS_LIB=
++AC_SEARCH_LIBS([getgroups], [bsd],
++  [test "$ac_res" = "none required" || GETGROUPS_LIB="$ac_res"
++   ac_cv_func_getgroups=yes],
++  [ac_cv_func_getgroups=no])
++LIBS=$ac_save_LIBS
++AC_SUBST([GETGROUPS_LIB])
++
++# Known severe bugs in getgroups on particular systems.
++#  - On Ultrix 4.3 and NextSTEP 3.2, getgroups (0, 0) is reported to
++#    fail, rather than returning the number of supplementary groups as
++#    it ought to.  We do not know the exact range of releases affected
++#    in either case.
++# We currently reject all versions of the systems with known bugs, and
++# no other systems.  Please send corrections to bug-autoconf@gnu.org.
+ if test $ac_cv_func_getgroups = yes; then
++  # This AC_CACHE_CHECK exists so that one may override an incorrect
++  # guess by setting ac_cv_func_getgroups_works in a config.site file.
+   AC_CACHE_CHECK([for working getgroups], ac_cv_func_getgroups_works,
+-   [AC_RUN_IFELSE([AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+-      [[/* On Ultrix 4.3, getgroups (0, 0) always fails.  */
+-       return getgroups (0, 0) == -1;]])],
+-		  [ac_cv_func_getgroups_works=yes],
+-		  [ac_cv_func_getgroups_works=no],
+-		  [case "$host_os" in # ((
+-			     # Guess yes on glibc systems.
+-		     *-gnu*) ac_cv_func_getgroups_works="guessing yes" ;;
+-			     # If we don't know, assume the worst.
+-		     *)      ac_cv_func_getgroups_works="guessing no" ;;
+-		   esac])
+-   ])
++   [AS_CASE([$host_os],
++     [ultrix* | nextstep*],
++      [ac_cv_func_getgroups_works=no # getgroups(0,0) fails
++],
++      [ac_cv_func_getgroups_works=yes])])
+ else
+   ac_cv_func_getgroups_works=no
+ fi
+-case "$ac_cv_func_getgroups_works" in
+-  *yes)
+-    AC_DEFINE(HAVE_GETGROUPS, 1,
+-	      [Define to 1 if your system has a working 'getgroups' function.])
+-    ;;
+-esac
+-LIBS=$ac_save_LIBS
++if test $ac_cv_func_getgroups_works = yes; then
++  AC_DEFINE(HAVE_GETGROUPS, 1,
++            [Define to 1 if your system has a working 'getgroups' function.])
++fi
+ ])# AC_FUNC_GETGROUPS
+ 
+-
+ # _AC_LIBOBJ_GETLOADAVG
+ # ---------------------
+ # Set up the AC_LIBOBJ replacement of 'getloadavg'.
+diff --git a/lib/autoconf/types.m4 b/lib/autoconf/types.m4
+index ef2456135..af3872b2f 100644
+--- a/lib/autoconf/types.m4
++++ b/lib/autoconf/types.m4
+@@ -258,44 +258,69 @@ AN_IDENTIFIER([ptrdiff_t], [AC_CHECK_TYPES])
+ # AC_TYPE_GETGROUPS
+ # -----------------
+ AC_DEFUN([AC_TYPE_GETGROUPS],
++dnl We now unconditionally assume that if <unistd.h> has a prototype for
++dnl getgroups, it is accurate; and that if <unistd.h> does _not_ declare
++dnl getgroups with a prototype, the second argument is an array of int.
++dnl (Older versions of Autoconf made these assumptions only when cross
++dnl compiling.)  See AC_FUNC_GETGROUPS, over in functions.m4, for why
++dnl this uses AC_COMPILE_IFELSE rather than AC_LINK_IFELSE.
+ [AC_REQUIRE([AC_TYPE_UID_T])dnl
+-AC_CACHE_CHECK(type of array argument to getgroups, ac_cv_type_getgroups,
+-[AC_RUN_IFELSE([AC_LANG_SOURCE(
+-[[/* Thanks to Mike Rendell for this test.  */
+-]AC_INCLUDES_DEFAULT[
+-#define NGID 256
+-#undef MAX
+-#define MAX(x, y) ((x) > (y) ? (x) : (y))
+-
+-int
+-main (void)
+-{
+-  gid_t gidset[NGID];
+-  int i, n;
+-  union { gid_t gval; long int lval; }  val;
+-
+-  val.lval = -1;
+-  for (i = 0; i < NGID; i++)
+-    gidset[i] = val.gval;
+-  n = getgroups (sizeof (gidset) / MAX (sizeof (int), sizeof (gid_t)) - 1,
+-		 gidset);
+-  /* Exit non-zero if getgroups seems to require an array of ints.  This
+-     happens when gid_t is short int but getgroups modifies an array
+-     of ints.  */
+-  return n > 0 && gidset[n] != val.gval;
+-}]])],
+-	       [ac_cv_type_getgroups=gid_t],
+-	       [ac_cv_type_getgroups=int],
+-	       [ac_cv_type_getgroups=cross])
+-if test $ac_cv_type_getgroups = cross; then
+-  dnl When we can't run the test program (we are cross compiling), presume
+-  dnl that <unistd.h> has either an accurate prototype for getgroups or none.
+-  dnl Old systems without prototypes probably use int.
+-  AC_EGREP_HEADER([getgroups.*int.*gid_t], unistd.h,
+-		  ac_cv_type_getgroups=gid_t, ac_cv_type_getgroups=int)
+-fi])
++AC_CACHE_CHECK([type of array argument to getgroups], ac_cv_type_getgroups,
++[# If AC_TYPE_UID_T says there isn't any gid_t typedef, then we can skip
++# everything below.
++AS_IF([test $ac_cv_type_gid_t = no],
++  [ac_cv_type_getgroups=int],
++  [# Test programs below rely on strict type checking of extern declarations:
++  # 'extern int getgroups(int, int *); extern int getgroups(int, pid_t *);'
++  # is valid in C89 if and only if pid_t is a typedef for int.  Unlike
++  # anything involving either an assignment or a function call, compilers
++  # tend to make this kind of type mismatch a hard error, not just an
++  # "incompatible pointer types" warning.
++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
++[AC_INCLUDES_DEFAULT
++[extern int getgroups(int, gid_t *);]],
++[[return !(getgroups(0, 0) >= 0);]])],
++    [ac_getgroups_gidarray=yes],
++    [ac_getgroups_gidarray=no])
++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
++[AC_INCLUDES_DEFAULT
++[extern int getgroups(int, int *);]],
++[[return !(getgroups(0, 0) >= 0);]])],
++    [ac_getgroups_intarray=yes],
++    [ac_getgroups_intarray=no])
++
++  AS_CASE([int:$ac_getgroups_intarray,gid:$ac_getgroups_gidarray],
++    [int:yes,gid:no], [ac_cv_type_getgroups=int],
++    [int:no,gid:yes], [ac_cv_type_getgroups=gid_t],
++    [int:yes,gid:yes], [
++      # Both programs compiled - this means *either* that getgroups
++      # was declared with no prototype, in which case we should use int,
++      # or that it was declared prototyped but gid_t is a typedef for int,
++      # in which case we should use gid_t.  Distinguish the two cases
++      # by testing if the compiler catches a blatantly incorrect function
++      # signature for getgroups.
++      AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
++[AC_INCLUDES_DEFAULT
++[extern int getgroups(int, float);]],
++[[return !(getgroups(0, 0) >= 0);]])], [
++        # Compiler did not catch incorrect argument list;
++        # getgroups is unprototyped.
++        ac_cv_type_getgroups=int
++      ], [
++        # Compiler caught incorrect argument list;
++        # gid_t is a typedef for int.
++        ac_cv_type_getgroups=gid_t
++      ])
++    ], [
++      # Both programs failed to compile - this probably means getgroups
++      # wasn't declared at all.  Use 'int', as this is probably a very
++      # old system where the type _would have been_ int.
++      ac_cv_type_getgroups=int
++    ])
++  ])
++])dnl AC_CACHE_CHECK
+ AC_DEFINE_UNQUOTED(GETGROUPS_T, $ac_cv_type_getgroups,
+-		   [Define to the type of elements in the array set by
++		   [Define to the type of elements in the array argument to
+ 		    'getgroups'. Usually this is either 'int' or 'gid_t'.])
+ ])# AC_TYPE_GETGROUPS
+ 
+diff --git a/tests/local.at b/tests/local.at
+index 64a9fb264..db49f84a9 100644
+--- a/tests/local.at
++++ b/tests/local.at
+@@ -401,7 +401,7 @@ if test -f state-env.before && test -f state-env.after; then
+       [interpval|PATH_SEPARATOR],
+       [GFC|F77_DUMMY_MAIN|f77_(case|underscore)],
+       [FC(_DUMMY_MAIN|FLAGS|LIBS|FLAGS_[fF]|_MODEXT|_MODINC|_MODOUT|_DEFINE)?],
+-      [ALLOCA|GETLOADAVG_LIBS|KMEM_GROUP|NEED_SETGID|POW_LIB],
++      [ALLOCA|GETGROUPS_LIB|GETLOADAVG_LIBS|KMEM_GROUP|NEED_SETGID|POW_LIB],
+       [AWK|LEX|LEXLIB|LEX_OUTPUT_ROOT|LN_S|M4|MKDIR_P|AR|RANLIB|SET_MAKE|YACC],
+       [EGREP_TRADITIONAL],
+       [GREP|[EF]GREP|SED],
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
new file mode 100644
index 00000000000..2dadd833203
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
@@ -0,0 +1,84 @@
+From a7dc6d83c7d12b8409c512c3c10ad29f01e6c164 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 21:54:31 -0400
+Subject: [PATCH 13/29] Fold AC_C_STRINGIZE into AC_PROG_CC.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Another of the last few uses of AC_EGREP_CPP is to check for the ISO C
+“stringification” operator.  As this is a feature of C89, let’s fold
+the test into the extensive C89 tests we already have, and make
+AC_C_STRINGIZE just lean on AC_PROG_CC, in the same way
+AC_C_PROTOTYPES does.
+
+* lib/autoconf/c.m4 (_AC_C_C89_TEST_GLOBALS): Add test of preprocessor
+  stringification and token pasting.
+  (AC_C_STRINGIZE): Just check ac_prog_cc_stdc.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/c.m4 | 31 ++++++++++++++++++++-----------
+ 1 file changed, 20 insertions(+), 11 deletions(-)
+
+diff --git a/lib/autoconf/c.m4 b/lib/autoconf/c.m4
+index 33648b5b9..c8c6a665c 100644
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -1143,6 +1143,21 @@ static char *f (char * (*g) (char **, int), char **p, ...)
+   return s;
+ }
+ 
++/* C89 style stringification. */
++#define noexpand_stringify(a) #a
++const char *stringified = noexpand_stringify(arbitrary+token=sequence);
++
++/* C89 style token pasting.  Exercises some of the corner cases that
++   e.g. old MSVC gets wrong, but not very hard. */
++#define noexpand_concat(a,b) a##b
++#define expand_concat(a,b) noexpand_concat(a,b)
++extern int vA;
++extern int vbee;
++#define aye A
++#define bee B
++int *pvA = &expand_concat(v,aye);
++int *pvbee = &noexpand_concat(v,bee);
++
+ /* OSF 4.0 Compaq cc is some sort of almost-ANSI by default.  It has
+    function prototypes and stuff, but not \xHH hex character constants.
+    These do not provoke an error unfortunately, instead are silently treated
+@@ -2112,16 +2127,10 @@ fi
+ # --------------
+ # Checks if '#' can be used to glue strings together at the CPP level.
+ # Defines HAVE_STRINGIZE if positive.
++# Obsolete - new code should assume C89 compliance.
+ AC_DEFUN([AC_C_STRINGIZE],
+-[AC_CACHE_CHECK([for preprocessor stringizing operator],
+-		[ac_cv_c_stringize],
+-[AC_EGREP_CPP([@%:@teststring],
+-	      [@%:@define x(y) #y
+-
+-char *s = x(teststring);],
+-	      [ac_cv_c_stringize=no],
+-	      [ac_cv_c_stringize=yes])])
+-if test $ac_cv_c_stringize = yes; then
++[AC_REQUIRE([AC_PROG_CC])
++if test "$ac_prog_cc_stdc" != no; then
+   AC_DEFINE(HAVE_STRINGIZE, 1,
+ 	    [Define to 1 if cpp supports the ANSI @%:@ stringizing operator.])
+ fi
+@@ -2130,8 +2139,8 @@ fi
+ 
+ # AC_C_PROTOTYPES
+ # ---------------
+-# Check if the C compiler supports prototypes, included if it needs
+-# options.
++# Check if the C compiler supports prototypes.
++# Obsolete - new code should assume C89 compliance.
+ AC_DEFUN([AC_C_PROTOTYPES],
+ [AC_REQUIRE([AC_PROG_CC])dnl
+ if test "$ac_prog_cc_stdc" != no; then
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
new file mode 100644
index 00000000000..85e9a45615f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
@@ -0,0 +1,116 @@
+From e25dfa75e18295d28de67747b4ff9d65f65c4f06 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 22:17:55 -0400
+Subject: [PATCH 14/29] Remove the last few internal uses of AC_EGREP_CPP.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Most of the remaining uses were converted to AC_COMPILE_IFELSE.
+The use in AC_FUNC_LOADAVG becomes an AC_PREPROC_IFELSE because
+we can’t be sure getloadavg.c can be _compiled_ at this point in
+the build.  The use in AC_C_VARARRAYS could be either _PREPROC_ or
+_COMPILE_; we use _COMPILE_ because, _PREPROC_ is never used, then
+we don’t have to do the “checking how to run the C preprocessor” test.
+
+* lib/autoconf/c.m4 (AC_C_VARARRAYS): Use AC_COMPILE_IFELSE instead of
+  AC_EGREP_CPP.
+* lib/autoconf/headers.m4 (_AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H)
+  (_AC_HEADER_TIOCGWINSZ_IN_SYS_IOCTL_H): Likewise.
+* lib/autoconf/functions.m4 (AC_FUNC_GETLOADAVG): Use AC_PREPROC_IFELSE
+  instead of AC_EGREP_CPP.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/c.m4         |  8 ++++----
+ lib/autoconf/functions.m4 | 10 +++++-----
+ lib/autoconf/headers.m4   | 24 ++++++++++--------------
+ 3 files changed, 19 insertions(+), 23 deletions(-)
+
+diff --git a/lib/autoconf/c.m4 b/lib/autoconf/c.m4
+index c8c6a665c..b8350c339 100644
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -2197,11 +2197,11 @@ AC_DEFUN([AC_C_VARARRAYS],
+ [
+   AC_CACHE_CHECK([for variable-length arrays],
+     ac_cv_c_vararrays,
+-    [AC_EGREP_CPP([defined],
+-       [#ifdef __STDC_NO_VLA__
+-	defined
++    [AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++[[	#ifndef __STDC_NO_VLA__
++	#error __STDC_NO_VLA__ not defined
+ 	#endif
+-       ],
++]])],
+        [ac_cv_c_vararrays='no: __STDC_NO_VLA__ is defined'],
+        [AC_COMPILE_IFELSE(
+ 	  [AC_LANG_PROGRAM(
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 74512e97d..499e4c024 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -842,11 +842,11 @@ AC_CHECK_FUNCS(getloadavg, [],
+ # Some definitions of getloadavg require that the program be installed setgid.
+ AC_CACHE_CHECK(whether getloadavg requires setgid,
+ 	       ac_cv_func_getloadavg_setgid,
+-[AC_EGREP_CPP([Yowza Am I SETGID yet],
+-[#include "$srcdir/$ac_config_libobj_dir/getloadavg.c"
+-#ifdef LDAV_PRIVILEGED
+-Yowza Am I SETGID yet
+-@%:@endif],
++[AC_PREPROC_IFELSE([AC_LANG_SOURCE(
++[[#include "$srcdir/$ac_config_libobj_dir/getloadavg.c"
++#ifndef LDAV_PRIVILEGED
++#error setgid not needed
++@%:@endif]])],
+ 	      ac_cv_func_getloadavg_setgid=yes,
+ 	      ac_cv_func_getloadavg_setgid=no)])
+ if test $ac_cv_func_getloadavg_setgid = yes; then
+diff --git a/lib/autoconf/headers.m4 b/lib/autoconf/headers.m4
+index 7f70e8fd4..19c124cc3 100644
+--- a/lib/autoconf/headers.m4
++++ b/lib/autoconf/headers.m4
+@@ -721,13 +721,11 @@ you to include it and time.h simultaneously.])
+ m4_define([_AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H],
+ [AC_CACHE_CHECK([whether termios.h defines TIOCGWINSZ],
+ 		ac_cv_sys_tiocgwinsz_in_termios_h,
+-[AC_EGREP_CPP([yes],
+-	      [#include <sys/types.h>
+-#include <termios.h>
+-#ifdef TIOCGWINSZ
+-  yes
+-#endif
+-],
++[AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++[AC_INCLUDES_DEFAULT
++[#include <termios.h>
++const int tiocgwinsz = TIOCGWINSZ;
++]])],
+ 		ac_cv_sys_tiocgwinsz_in_termios_h=yes,
+ 		ac_cv_sys_tiocgwinsz_in_termios_h=no)])
+ ])# _AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H
+@@ -738,13 +736,11 @@ m4_define([_AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H],
+ m4_define([_AC_HEADER_TIOCGWINSZ_IN_SYS_IOCTL],
+ [AC_CACHE_CHECK([whether sys/ioctl.h defines TIOCGWINSZ],
+ 		ac_cv_sys_tiocgwinsz_in_sys_ioctl_h,
+-[AC_EGREP_CPP([yes],
+-	      [#include <sys/types.h>
+-#include <sys/ioctl.h>
+-#ifdef TIOCGWINSZ
+-  yes
+-#endif
+-],
++[AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++[AC_INCLUDES_DEFAULT
++[#include <sys/ioctl.h>
++const int tiocgwinsz = TIOCGWINSZ;
++]])],
+ 		ac_cv_sys_tiocgwinsz_in_sys_ioctl_h=yes,
+ 		ac_cv_sys_tiocgwinsz_in_sys_ioctl_h=no)])
+ ])# _AC_HEADER_TIOCGWINSZ_IN_SYS_IOCTL
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch
new file mode 100644
index 00000000000..36d1a94be68
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch
@@ -0,0 +1,32 @@
+From 1982523c6f052a2b361035a9d5d9737510ed0738 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 3 Apr 2023 09:12:40 -0700
+Subject: [PATCH 15/29] Support circa early 2022 Gnulib
+
+Problem reported by Frederic Berat in:
+https://lists.gnu.org/r/bug-rcs/2023-04/msg00001.html
+* lib/autoconf/specific.m4 (_AC_SYS_LARGEFILE_TEST_INCLUDES):
+Bring back for compatibility with post-2.71, pre-2.73 Gnulib.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index a2dc5d488..5dc006959 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -277,6 +277,8 @@ m4_define([_AC_SYS_LARGEFILE_TEST_CODE],
+ 		       && LARGE_OFF_T % 2147483647 == 1)
+ 		      ? 1 : -1]];[]dnl
+ ])
++# Defined by Autoconf 2.71 and circa 2022 Gnulib unwisely depended on it.
++m4_define([_AC_SYS_LARGEFILE_TEST_INCLUDES], [_AC_SYS_LARGEFILE_TEST_CODE])
+ 
+ # _AC_SYS_LARGEFILE_OPTIONS
+ # -------------------------
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch
new file mode 100644
index 00000000000..e96faf26662
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch
@@ -0,0 +1,121 @@
+From a1e82aff0fd842b0f09e2cd166560dfda725ba13 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 9 Apr 2023 11:41:57 -0700
+Subject: [PATCH 16/29] Improve year2038, largefile option processing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* lib/autoconf/specific.m4 (_AC_SYS_YEAR2038_PROBE)
+(_AC_SYS_YEAR2038_ENABLE, _AC_SYS_YEAR2038_OPT_IN)
+(AC_SYS_YEAR2038, _AC_SYS_LARGEFILE_PROBE)
+(_AC_SYS_LARGEFILE_ENABLE): Do not use enable_largefile to record
+whether largefile is required, as ‘./configure
+--disable-largefile’ sets enable_largefile=no even if largefile is
+required and this disables largefile.  Instead, use a separate
+shell variable ac_largefile_required and test it as well.
+Similarly for enable_year2038.
+(_AC_SYS_LARGEFILE_ENABLE): Omit --disable-largefile help string
+if year2038 is required, since largefile is a prereq for year2038.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 35 ++++++++++++++++++++++-------------
+ 1 file changed, 22 insertions(+), 13 deletions(-)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 5dc006959..1a3f4a65c 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -155,10 +155,10 @@ AS_CASE([$ac_cv_sys_year2038_opts],
+   ["none needed"], [],
+   ["support not detected"],
+     [ac_have_year2038=no
+-     AS_CASE([$enable_year2038],
+-      [required],
++     AS_CASE([$ac_year2038_required,$enable_year2038],
++      [yes,*],
+         [AC_MSG_FAILURE([support for timestamps after Jan 2038 is required])],
+-      [yes],
++      [*,yes],
+         [# If we're not cross compiling and 'touch' works with a large
+         # timestamp, then we can presume the system supports wider time_t
+         # *somehow* and we just weren't able to detect it.  One common
+@@ -209,10 +209,12 @@ AS_CASE([$ac_cv_sys_year2038_opts],
+ m4_define([_AC_SYS_YEAR2038_ENABLE],
+ [m4_divert_text([DEFAULTS],
+   m4_provide_if([AC_SYS_YEAR2038_REQUIRED],
+-    [enable_year2038=required],
++    [ac_year2038_required=yes],
++    [ac_year2038_required=no]))dnl
++m4_divert_text([DEFAULTS],
+   m4_provide_if([AC_SYS_YEAR2038],
+     [enable_year2038=yes],
+-    [enable_year2038=no])))]dnl
++    [enable_year2038=no]))]dnl
+ [m4_provide_if([AC_SYS_YEAR2038_REQUIRED], [],
+ [AC_ARG_ENABLE([year2038],
+   m4_provide_if([AC_SYS_YEAR2038],
+@@ -231,7 +233,8 @@ m4_define([_AC_SYS_YEAR2038_ENABLE],
+ # documented macro.
+ AC_DEFUN([_AC_SYS_YEAR2038_OPT_IN],
+ [m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
+-  AS_IF([test "$enable_year2038" != no], [_AC_SYS_YEAR2038_PROBE])
++  AS_IF([test "$ac_year2038_required,$enable_year2038" != no,no],
++    [_AC_SYS_YEAR2038_PROBE])
+   AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
+ ])])
+ 
+@@ -244,7 +247,8 @@ AC_DEFUN([AC_SYS_YEAR2038],
+ [m4_provide_if([AC_SYS_LARGEFILE_REQUIRED], [],
+   [AC_REQUIRE([AC_SYS_LARGEFILE])])]dnl
+ [m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
+-  AS_IF([test "$enable_year2038" != no], [_AC_SYS_YEAR2038_PROBE])
++  AS_IF([test "$ac_year2038_required,$enable_year2038" != no,no],
++    [_AC_SYS_YEAR2038_PROBE])
+   AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
+ ])])
+ 
+@@ -326,7 +330,7 @@ AS_CASE([$ac_cv_sys_largefile_opts],
+   ["none needed"], [],
+   ["support not detected"],
+     [ac_have_largefile=no
+-     AS_IF([test $enable_largefile = required],
++     AS_IF([test $ac_largefile_required,$ac_year2038_required != no,no],
+        [AC_MSG_FAILURE([support for large files is required])])],
+ 
+   ["-D_FILE_OFFSET_BITS=64"],
+@@ -358,11 +362,15 @@ _AC_SYS_YEAR2038_OPT_IN
+ m4_define([_AC_SYS_LARGEFILE_ENABLE],
+ [m4_divert_text([DEFAULTS],
+   m4_provide_if([AC_SYS_LARGEFILE_REQUIRED],
+-    [enable_largefile=required],
+-    [enable_largefile=yes]))]dnl
++    [ac_largefile_required=yes],
++    [ac_largefile_required=no]))dnl
++m4_divert_text([DEFAULTS],
++  [enable_largefile=yes])]dnl
+ [m4_provide_if([AC_SYS_LARGEFILE_REQUIRED], [],
+-[AC_ARG_ENABLE([largefile],
+-  [AS_HELP_STRING([--disable-largefile], [omit support for large files])])])])
++   [m4_provide_if([AC_SYS_YEAR2038_REQUIRED], [],
++      [AC_ARG_ENABLE([largefile],
++         [AS_HELP_STRING([--disable-largefile],
++	    [omit support for large files])])])])])
+ 
+ # AC_SYS_LARGEFILE
+ # ----------------
+@@ -377,7 +385,8 @@ m4_define([_AC_SYS_LARGEFILE_ENABLE],
+ # large files; see also AC_SYS_LARGEFILE_REQUIRED.
+ AC_DEFUN([AC_SYS_LARGEFILE],
+ [m4_provide_if([_AC_SYS_LARGEFILE_PROBE], [], [dnl
+-  AS_IF([test "$enable_largefile" != no], [_AC_SYS_LARGEFILE_PROBE])
++  AS_IF([test "$ac_largefile_required,$enable_largefile,$ac_year2038_required" != no,no,no],
++    [_AC_SYS_LARGEFILE_PROBE])
+   AC_CONFIG_COMMANDS_PRE([_AC_SYS_LARGEFILE_ENABLE])
+ ])])
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch
new file mode 100644
index 00000000000..f62fe1cd79c
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch
@@ -0,0 +1,30 @@
+From 0cc3c4ca8e6c550bf590ae45a916982b6ec50203 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Fri, 14 Apr 2023 16:18:35 +0200
+Subject: [PATCH 17/29] AC_SYS_YEAR2038: Fix configure failure on 32-bit mingw.
+
+* lib/autoconf/specific.m4 (_AC_SYS_YEAR2038_PROBE): Use the same option
+spelling as in _AC_SYS_YEAR2038_OPTIONS.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 1a3f4a65c..3bf1a0ed1 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -182,7 +182,7 @@ AS_CASE([$ac_cv_sys_year2038_opts],
+     [AC_DEFINE([_TIME_BITS], [64],
+       [Number of bits in time_t, on hosts where this is settable.])],
+ 
+-  ["-D__MINGW_USE_VC2005_COMPAT=1"],
++  ["-D__MINGW_USE_VC2005_COMPAT"],
+     [AC_DEFINE([__MINGW_USE_VC2005_COMPAT], [1],
+       [Define to 1 on platforms where this makes time_t a 64-bit type.])],
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch
new file mode 100644
index 00000000000..478c4e4229a
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch
@@ -0,0 +1,45 @@
+From e704a13c9644f4f4b9a9dd4e215ee7a1707f5850 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Fri, 3 Mar 2023 14:32:13 +0100
+Subject: [PATCH 18/29] Document limitation of BusyBox tr.
+
+BusyBox 1.35.0 tr, which is shipped with Alpine Linux 3.17, does not support
+the POSIX [x*n] syntax.
+
+* doc/autoconf.texi (Limitations of Usual Tools): Document limitation of 'tr'
+from BusyBox.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/autoconf.texi | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 5d5f613e6..b3c708e87 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -20368,6 +20368,20 @@ $ @kbd{echo abc | coreutils/tr bc d}
+ add
+ @end example
+ 
++On platforms with the BusyBox tools, @command{tr} does not support the
++@code{[@var{x}*@var{n}]} option syntax.
++
++@example
++$ @kbd{echo abc | tr 'abcd' '[A*4]'}
++[A*
++$ @kbd{echo abc | coreutils/tr 'abcd' '[A*4]'}
++AAA
++$ @kbd{echo xyz | tr 'a-z' '[A*]'}
++]]]
++$ @kbd{echo xyz | coreutils/tr 'a-z' '[A*]'}
++AAA
++@end example
++
+ Posix requires @command{tr} to operate on binary files.  But at least
+ Solaris @command{/usr/ucb/tr} and @command{/usr/bin/tr} silently discard
+ @code{NUL} in the input prior to doing any translation.  When using
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch
new file mode 100644
index 00000000000..db9307e13c9
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch
@@ -0,0 +1,48 @@
+From 2277f2c15744ad1cc5cd1ecc50a43108e50530a2 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Wed, 19 Apr 2023 14:17:24 -0700
+Subject: [PATCH 19/29] AC_SYS_YEAR2038_REQUIRED: Fix configure failure with
+ MSVC.
+
+* lib/autoconf/specific.m4 (_AC_SYS_LARGEFILE_PROBE): Distinguish the results
+"support not detected" and "supported through gnulib". If the result is
+"supported through gnulib", don't fail.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 3bf1a0ed1..f411695fe 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -323,11 +323,24 @@ AC_DEFUN([_AC_SYS_LARGEFILE_PROBE],
+     test $ac_opt_found = no || break
+   done
+   CC="$ac_save_CC"
++  dnl Gnulib implements large file support for native Windows, based on the
++  dnl variables WINDOWS_64_BIT_OFF_T, WINDOWS_64_BIT_ST_SIZE.
++  m4_ifdef([gl_LARGEFILE], [
++    AC_REQUIRE([AC_CANONICAL_HOST])
++    if test $ac_opt_found != yes; then
++      AS_CASE([$host_os],
++        [mingw*],
++          [ac_cv_sys_largefile_opts="supported through gnulib"
++           ac_opt_found=yes]
++      )
++    fi
++  ])
+   test $ac_opt_found = yes || ac_cv_sys_largefile_opts="support not detected"])
+ 
+ ac_have_largefile=yes
+ AS_CASE([$ac_cv_sys_largefile_opts],
+   ["none needed"], [],
++  ["supported through gnulib"], [],
+   ["support not detected"],
+     [ac_have_largefile=no
+      AS_IF([test $ac_largefile_required,$ac_year2038_required != no,no],
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch
new file mode 100644
index 00000000000..cbd89cc3bab
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch
@@ -0,0 +1,405 @@
+From 9c0183724614517a67d0955065171465bab7154a Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 26 Apr 2023 18:21:48 -0700
+Subject: [PATCH 20/29] Tone down year-2038 changes
+
+New macro AC_SYS_YEAR2038_RECOMMENDED replaces new macro
+AC_SYS_YEAR2038_REQUIRED, and gives the builder an out of
+specifying --disable-year2038.  Remove new macro
+AC_SYS_LARGEFILE_REQUIRED, which was added only for symmetry and
+does not seem to have a great need.
+* NEWS, doc/autoconf.texi: Document this.
+* lib/autoconf/specific.m4:
+Be more specific about mid-January 2038 than just Jan 2038.
+(_AC_SYS_YEAR2038_PROBE): Ignore IF-NOT-DETECTED arg.
+If support is not detected, merely set ac_have_year2038=no instead
+of erroring out.  All callers changed.
+(_AC_SYS_YEAR2038_OPT_IN): Remove.  All callers removed.
+(AC_SYS_YEAR2038): Simplify by requiring AC_SYS_LARGEFILE
+and then testing the result.
+(AC_SYS_YEAR2038_REQUIRED, AC_SYS_LARGEFILE_REQUIRED): Remove.
+(AC_SYS_YEAR2038_RECOMMENDED): New macro.
+(_AC_SYS_LARGEFILE_PROBE): If support is not detected, merely set
+ac_have_largefile=no instead of erroring out.  All callers changed.
+Take on the burden of invoking year2038 probe as needed.
+(AC_SYS_LARGEFILE): Simplify.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                     |  18 ++--
+ doc/autoconf.texi        |  34 +++-----
+ lib/autoconf/specific.m4 | 177 +++++++++++----------------------------
+ 3 files changed, 69 insertions(+), 160 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 8e4ecc1bf..a48a00858 100644
+--- a/NEWS
++++ b/NEWS
+@@ -51,7 +51,7 @@ GNU Autoconf NEWS - User visible changes.
+ 
+ ** New features
+ 
+-*** New macro AC_SYS_YEAR2038.
++*** New macros AC_SYS_YEAR2038 and AC_SYS_YEAR2038_RECOMMENDED.
+   This causes 'configure' to widen time_t if possible on systems where
+   time_t by default cannot represent file and other timestamps after
+   January 2038.  Widening is possible only on 32-bit GNU/Linux x86 and
+@@ -67,18 +67,14 @@ GNU Autoconf NEWS - User visible changes.
+   This is similar to longstanding consistency requirements with
+   --enable-largefile and --disable-largefile.
+ 
++  AC_SYS_YEAR2038_RECOMMENDED acts like AC_SYS_YEAR2038 except that
++  'configure' fails if the target lacks support for post-2038
++  timestamps and --disable-year2038 is not given.
++
+ *** AC_SYS_LARGEFILE now optionally arranges to widen time_t.
+   It now acts like AC_SYS_YEAR2038, except 'configure' defaults to
+-  --disable-year2038 unless AC_SYS_YEAR2038 is also present.
+-  As with AC_SYS_YEAR2038, application and library builders should
+-  configure consistently.
+-
+-*** New macros AC_SYS_LARGEFILE_REQUIRED and AC_SYS_YEAR2038_REQUIRED.
+-  These act like AC_SYS_LARGEFILE and AC_SYS_YEAR2038 respectively,
+-  except that 'configure' fails if the target lacks support
+-  for large files and for post-2038 timestamps, respectively.
+-  As with AC_SYS_YEAR2038, application and library builders should
+-  configure consistently.
++  --disable-year2038 unless either AC_SYS_YEAR2038 or
++  AC_SYS_YEAR2038_RECOMMENDED is also present.
+ 
+ *** AC_USE_SYSTEM_EXTENSIONS now enables C23 Annex F extensions
+   by defining __STDC_WANT_IEC_60559_EXT__.
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index b3c708e87..0f3047b31 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -8808,18 +8808,20 @@ if possible.  These types may include @code{blkcnt_t}, @code{dev_t},
+ 
+ Also, arrange for a @command{configure} option @code{--enable-year2038}
+ to request widening the type @code{time_t} as needed to represent file
+-wand other timestamps after January 2038.  This widening is possible
++wand other timestamps after mid-January 2038.  This widening is possible
+ only on 32-bit GNU/Linux x86 and ARM systems with glibc 2.34 or later.
+ If year-2038 support is requested but @command{configure} fails to find a way
+ to widen @code{time_t} and inspection of the system suggests that
+ this feature is available somehow, @command{configure} will error out.
+ If you want the default to be @code{--enable-year2038}, you can use
+-@code{AC_SYS_YEAR2038} instead of @code{AC_SYS_LARGEFILE}.
++@code{AC_SYS_YEAR2038} or @code{AC_SYS_YEAR2038_RECOMMENDED}
++instead of @code{AC_SYS_LARGEFILE}.
+ In other words, older packages that have long used @code{AC_SYS_LARGEFILE}
+ can have year-2038 support on 32-bit GNU/Linux x86 and ARM systems either by
+ regenerating @file{configure} with current Autoconf and configuring with
+-@option{--enable-year2038}, or by using @code{AC_SYS_YEAR2038} and
+-configuring without @option{--disable-year2038}.
++@option{--enable-year2038}, or by using @code{AC_SYS_YEAR2038} or
++@code{AC_SYS_YEAR2038_RECOMMENDED} and configuring without
++@option{--disable-year2038}.
+ A future version of Autoconf might change the @code{AC_SYS_LARGEFILE}
+ default to @code{--enable-year2038}; if and when that happens,
+ @code{AC_SYS_LARGEFILE} and @code{AC_SYS_YEAR2038} will become equivalent.
+@@ -8886,19 +8888,6 @@ library, enabling or disabling the application's large-file support may
+ break binary compatibility with that library.
+ @end defmac
+ 
+-@defmac AC_SYS_LARGEFILE_REQUIRED
+-@acindex{SYS_LARGEFILE_REQUIRED}
+-This macro has the same effect as @code{AC_SYS_LARGEFILE},
+-but also declares that the program being configured
+-requires support for large files.
+-If a large @code{off_t} is unavailable,
+-@command{configure} will error out.
+-The @option{--disable-largefile} option will not be available.
+-
+-Large-file and year-2038 support for applications and libraries should
+-be configured compatibly.  @xref{AC_SYS_LARGEFILE}.
+-@end defmac
+-
+ @anchor{AC_SYS_LONG_FILE_NAMES}
+ @defmac AC_SYS_LONG_FILE_NAMES
+ @acindex{SYS_LONG_FILE_NAMES}
+@@ -8927,14 +8916,13 @@ applications and libraries should be configured compatibly.
+ @xref{AC_SYS_LARGEFILE}.
+ @end defmac
+ 
+-@defmac AC_SYS_YEAR2038_REQUIRED
+-@acindex{SYS_YEAR2038_REQUIRED}
++@defmac AC_SYS_YEAR2038_RECOMMENDED
++@acindex{SYS_YEAR2038_RECOMMENDED}
+ This macro has the same effect as @code{AC_SYS_YEAR2038},
+ but also declares that the program being configured
+-requires support for timestamps after mid-January of 2038.
+-If a large @code{time_t} is unavailable,
+-@command{configure} will unconditionally error out.
+-The @option{--disable-year2038} option will not be available.
++should support timestamps after mid-January 2038.
++If a large @code{time_t} is unavailable, @command{configure} will error
++out unless the @option{--disable-year2038} option is specified.
+ 
+ Year-2038 support for applications and libraries should be configured
+ compatibly.  @xref{AC_SYS_YEAR2038}.
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index f411695fe..88e0479e8 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -115,8 +115,8 @@ m4_define([_AC_SYS_YEAR2038_OPTIONS], m4_normalize(
+                                       dnl 32-bit MinGW (misconfiguration)
+ ))
+ 
+-# _AC_SYS_YEAR2038_PROBE([IF-NOT-DETECTED])
+-# -----------------------------------------
++# _AC_SYS_YEAR2038_PROBE
++# ----------------------
+ # Subroutine of AC_SYS_YEAR2038.  Probe for time_t that can represent
+ # time points more than 2**31 - 1 seconds after the epoch (dates after
+ # 2038-01-18, see above) and set the cache variable ac_cv_sys_year2038_opts
+@@ -129,13 +129,10 @@ m4_define([_AC_SYS_YEAR2038_OPTIONS], m4_normalize(
+ # AC_TRY_RUN.  Note also that some systems only support large time_t
+ # together with large off_t.
+ #
+-# If support is not detected, the behavior depends on which of the
+-# top-level AC_SYS_YEAR2038 macros was used (see below).
+-#
+ # If you change this macro you may also need to change
+ # _AC_SYS_YEAR2038_OPTIONS.
+ AC_DEFUN([_AC_SYS_YEAR2038_PROBE],
+-[AC_CACHE_CHECK([for $CC option to enable timestamps after Jan 2038],
++[AC_CACHE_CHECK([for $CC option for timestamps after 2038],
+   [ac_cv_sys_year2038_opts],
+   [ac_save_CPPFLAGS="$CPPFLAGS"
+   ac_opt_found=no
+@@ -154,29 +151,7 @@ ac_have_year2038=yes
+ AS_CASE([$ac_cv_sys_year2038_opts],
+   ["none needed"], [],
+   ["support not detected"],
+-    [ac_have_year2038=no
+-     AS_CASE([$ac_year2038_required,$enable_year2038],
+-      [yes,*],
+-        [AC_MSG_FAILURE([support for timestamps after Jan 2038 is required])],
+-      [*,yes],
+-        [# If we're not cross compiling and 'touch' works with a large
+-        # timestamp, then we can presume the system supports wider time_t
+-        # *somehow* and we just weren't able to detect it.  One common
+-        # case that we deliberately *don't* probe for is a system that
+-        # supports both 32- and 64-bit ABIs but only the 64-bit ABI offers
+-        # wide time_t.  (It would be inappropriate for us to override an
+-        # intentional use of -m32.)  Error out, demanding use of
+-        # --disable-year2038 if this is intentional.
+-        AS_IF([test $cross_compiling = no],
+-          [AS_IF([TZ=UTC0 touch -t 210602070628.15 conftest.time 2>/dev/null],
+-            [AS_CASE([`TZ=UTC0 LC_ALL=C ls -l conftest.time 2>/dev/null`],
+-              [*'Feb  7  2106'* | *'Feb  7 17:10'*],
+-              [AC_MSG_FAILURE(m4_text_wrap(
+-      [this system appears to support timestamps after January 2038,
+-       but no mechanism for enabling wide 'time_t' was detected.
+-       Did you mean to build a 64-bit binary? (e.g. 'CC="${CC} -m64"'.)
+-       To proceed with 32-bit time_t, configure with '--disable-year2038'.],
+-      [], [], [55]))])])])])],
++    [ac_have_year2038=no],
+ 
+   ["-D_TIME_BITS=64"],
+     [AC_DEFINE([_TIME_BITS], [64],
+@@ -189,7 +164,7 @@ AS_CASE([$ac_cv_sys_year2038_opts],
+   ["-U_USE_32_BIT_TIME_T"*],
+     [AC_MSG_FAILURE(m4_text_wrap(
+       [the 'time_t' type is currently forced to be 32-bit.
+-       It will stop working after January 2038.
++       It will stop working after mid-January 2038.
+        Remove _USE_32BIT_TIME_T from the compiler flags.],
+       [], [], [55]))],
+ 
+@@ -199,44 +174,23 @@ AS_CASE([$ac_cv_sys_year2038_opts],
+ 
+ # _AC_SYS_YEAR2038_ENABLE
+ # -----------------------
+-# Subroutine of AC_SYS_YEAR2038 and _AC_SYS_YEAR2038_OPT_IN.
+ # Depending on which of the YEAR2038 macros was used, add either an
+-# --enable-year2038, or a --disable-year2038, or no option at all to
+-# the configure script.  Note that this is expanded very late and
++# --enable-year2038 or a --disable-year2038 to
++# the configure script.  This is expanded very late and
+ # therefore there cannot be any code in the AC_ARG_ENABLE.  The
+ # default value for 'enable_year2038' is emitted unconditionally
+ # because the generated code always looks at this variable.
+ m4_define([_AC_SYS_YEAR2038_ENABLE],
+ [m4_divert_text([DEFAULTS],
+-  m4_provide_if([AC_SYS_YEAR2038_REQUIRED],
+-    [ac_year2038_required=yes],
+-    [ac_year2038_required=no]))dnl
+-m4_divert_text([DEFAULTS],
+   m4_provide_if([AC_SYS_YEAR2038],
+     [enable_year2038=yes],
+     [enable_year2038=no]))]dnl
+-[m4_provide_if([AC_SYS_YEAR2038_REQUIRED], [],
+ [AC_ARG_ENABLE([year2038],
+   m4_provide_if([AC_SYS_YEAR2038],
+     [AS_HELP_STRING([--disable-year2038],
+-      [omit support for dates after Jan 2038])],
++      [don't support timestamps after 2038])],
+     [AS_HELP_STRING([--enable-year2038],
+-      [include support for dates after Jan 2038])]))])])
+-
+-# _AC_SYS_YEAR2038_OPT_IN
+-# -----------------------
+-# If the --enable-year2038 option is given to configure, attempt to
+-# detect and activate support for large time_t on 32-bit systems.
+-# This macro is automatically invoked by AC_SYS_LARGEFILE when large
+-# *file* support is detected.  It does not AC_REQUIRE AC_SYS_LARGEFILE
+-# to avoid a dependency loop, and is therefore unsafe to expose as a
+-# documented macro.
+-AC_DEFUN([_AC_SYS_YEAR2038_OPT_IN],
+-[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
+-  AS_IF([test "$ac_year2038_required,$enable_year2038" != no,no],
+-    [_AC_SYS_YEAR2038_PROBE])
+-  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
+-])])
++      [support timestamps after 2038])]))])
+ 
+ # AC_SYS_YEAR2038
+ # ---------------
+@@ -244,28 +198,39 @@ AC_DEFUN([_AC_SYS_YEAR2038_OPT_IN],
+ # On systems where time_t is not always 64 bits, this probe can be
+ # skipped by passing the --disable-year2038 option to configure.
+ AC_DEFUN([AC_SYS_YEAR2038],
+-[m4_provide_if([AC_SYS_LARGEFILE_REQUIRED], [],
+-  [AC_REQUIRE([AC_SYS_LARGEFILE])])]dnl
+-[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
+-  AS_IF([test "$ac_year2038_required,$enable_year2038" != no,no],
+-    [_AC_SYS_YEAR2038_PROBE])
+-  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
+-])])
+-
+-# AC_SYS_YEAR2038_REQUIRED
+-# ------------------------
+-# Same as AC_SYS_YEAR2038, but declares that this program *requires*
+-# support for large time_t.  If we cannot find any way to make time_t
+-# capable of representing values larger than 2**31 - 1, configure will
+-# error out.  Furthermore, no --enable-year2038 nor --disable-year2038
+-# option will be available.
+-AC_DEFUN([AC_SYS_YEAR2038_REQUIRED],
+-[m4_provide_if([AC_SYS_LARGEFILE_REQUIRED], [],
+-  [AC_REQUIRE([AC_SYS_LARGEFILE])])]dnl
+-[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
+-  _AC_SYS_YEAR2038_PROBE
+-  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
+-])])
++[AC_REQUIRE([AC_SYS_LARGEFILE])dnl
++AS_IF([test "$enable_year2038,$ac_have_year2038,$cross_compiling" = yes,no,no],
++ [# If we're not cross compiling and 'touch' works with a large
++  # timestamp, then we can presume the system supports wider time_t
++  # *somehow* and we just weren't able to detect it.  One common
++  # case that we deliberately *don't* probe for is a system that
++  # supports both 32- and 64-bit ABIs but only the 64-bit ABI offers
++  # wide time_t.  (It would be inappropriate for us to override an
++  # intentional use of -m32.)  Error out, demanding use of
++  # --disable-year2038 if this is intentional.
++  AS_IF([TZ=UTC0 touch -t 210602070628.15 conftest.time 2>/dev/null],
++    [AS_CASE([`TZ=UTC0 LC_ALL=C ls -l conftest.time 2>/dev/null`],
++       [*'Feb  7  2106'* | *'Feb  7 17:10'*],
++       [AC_MSG_FAILURE(m4_text_wrap(
++	  [this system appears to support timestamps after mid-January 2038,
++	   but no mechanism for enabling wide 'time_t' was detected.
++	   Did you mean to build a 64-bit binary? (E.g., 'CC="${CC} -m64"'.)
++	   To proceed with 32-bit time_t, configure with '--disable-year2038'.],
++	  [], [], [55]))])])])])
++
++# AC_SYS_YEAR2038_RECOMMENDED
++# ---------------------------
++# Same as AC_SYS_YEAR2038, but recommend support for large time_t.
++# If we cannot find any way to make time_t capable of representing
++# values larger than 2**31 - 1, error out unless --disable-year2038 is given.
++AC_DEFUN([AC_SYS_YEAR2038_RECOMMENDED],
++[AC_REQUIRE([AC_SYS_YEAR2038])dnl
++AS_IF([test "$enable_year2038,$ac_have_year2038" = yes,no],
++   [AC_MSG_FAILURE(m4_text_wrap(
++      [could not enable timestamps after mid-January 2038.
++       Did you mean to build a 64-bit binary? (E.g., 'CC="${CC} -m64"'.)
++       To proceed with 32-bit time_t, configure with '--disable-year2038'.],
++      [], [], [55]))])])
+ 
+ # _AC_SYS_LARGEFILE_TEST_CODE
+ # ---------------------------
+@@ -342,9 +307,7 @@ AS_CASE([$ac_cv_sys_largefile_opts],
+   ["none needed"], [],
+   ["supported through gnulib"], [],
+   ["support not detected"],
+-    [ac_have_largefile=no
+-     AS_IF([test $ac_largefile_required,$ac_year2038_required != no,no],
+-       [AC_MSG_FAILURE([support for large files is required])])],
++    [ac_have_largefile=no],
+ 
+   ["-D_FILE_OFFSET_BITS=64"],
+     [AC_DEFINE([_FILE_OFFSET_BITS], [64],
+@@ -360,30 +323,9 @@ AS_CASE([$ac_cv_sys_largefile_opts],
+   [AC_MSG_ERROR(
+     [internal error: bad value for \$ac_cv_sys_largefile_opts])])
+ 
+-_AC_SYS_YEAR2038_OPT_IN
+-])
+-
+-# _AC_SYS_LARGEFILE_ENABLE
+-# ------------------------
+-# Subroutine of AC_SYS_LARGEFILE.  If AC_SYS_LARGEFILE_REQUIRED was
+-# not used at any point in this configure script, add a
+-# --disable-largefile option to the configure script.  Note that this
+-# is expanded very late and therefore there cannot be any code in the
+-# AC_ARG_ENABLE.  The default value for 'enable_largefile' is emitted
+-# unconditionally because the generated shell code always looks at
+-# this variable.
+-m4_define([_AC_SYS_LARGEFILE_ENABLE],
+-[m4_divert_text([DEFAULTS],
+-  m4_provide_if([AC_SYS_LARGEFILE_REQUIRED],
+-    [ac_largefile_required=yes],
+-    [ac_largefile_required=no]))dnl
+-m4_divert_text([DEFAULTS],
+-  [enable_largefile=yes])]dnl
+-[m4_provide_if([AC_SYS_LARGEFILE_REQUIRED], [],
+-   [m4_provide_if([AC_SYS_YEAR2038_REQUIRED], [],
+-      [AC_ARG_ENABLE([largefile],
+-         [AS_HELP_STRING([--disable-largefile],
+-	    [omit support for large files])])])])])
++AS_IF([test "$enable_year2038" != no],
++  [_AC_SYS_YEAR2038_PROBE])
++AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])])
+ 
+ # AC_SYS_LARGEFILE
+ # ----------------
+@@ -394,29 +336,12 @@ m4_divert_text([DEFAULTS],
+ # Additionally, on Linux file systems with 64-bit inodes a file that happens
+ # to have a 64-bit inode number cannot be accessed by 32-bit applications on
+ # Linux x86/x86_64.  This can occur with file systems such as XFS and NFS.
+-# This macro allows configuration to continue if the system doesn't support
+-# large files; see also AC_SYS_LARGEFILE_REQUIRED.
+ AC_DEFUN([AC_SYS_LARGEFILE],
+-[m4_provide_if([_AC_SYS_LARGEFILE_PROBE], [], [dnl
+-  AS_IF([test "$ac_largefile_required,$enable_largefile,$ac_year2038_required" != no,no,no],
+-    [_AC_SYS_LARGEFILE_PROBE])
+-  AC_CONFIG_COMMANDS_PRE([_AC_SYS_LARGEFILE_ENABLE])
+-])])
+-
+-# AC_SYS_LARGEFILE_REQUIRED
+-# -------------------------
+-# Same as AC_SYS_LARGEFILE, but declares that this program *requires*
+-# support for large files.  If we cannot find a combination of compiler
+-# options and #defines that makes 'off_t' capable of representing 2**63 - 1,
+-# 'configure' will error out.  Furthermore, 'configure' will not offer a
+-# --disable-largefile command line option.
+-# If both AC_SYS_LARGEFILE and AC_SYS_LARGEFILE_REQUIRED are used in the
+-# same configure script -- in either order -- AC_SYS_LARGEFILE_REQUIRED wins.
+-AC_DEFUN([AC_SYS_LARGEFILE_REQUIRED],
+-[m4_provide_if([_AC_SYS_LARGEFILE_PROBE], [], [dnl
+-  _AC_SYS_LARGEFILE_PROBE
+-  AC_CONFIG_COMMANDS_PRE([_AC_SYS_LARGEFILE_ENABLE])
+-])])
++[AC_ARG_ENABLE([largefile],
++   [AS_HELP_STRING([--disable-largefile],
++      [omit support for large files])])dnl
++AS_IF([test "$enable_largefile,$enable_year2038" != no,no],
++  [_AC_SYS_LARGEFILE_PROBE])])
+ 
+ # AC_SYS_LONG_FILE_NAMES
+ # ----------------------
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch
new file mode 100644
index 00000000000..56bcbb6ca12
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch
@@ -0,0 +1,98 @@
+From 028526149ee804617a302ccef22cc6adbda681b0 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 10 May 2023 17:20:49 -0700
+Subject: [PATCH 21/29] Port AC_FUNC_MMAP to more-modern systems
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* lib/autoconf/functions.m4 (AC_FUNC_MMAP): Don’t call
+getpagesize, as it’s tricky to configure, modern POSIX doesn’t
+require it, and calling it without including <unistd.h> provokes a
+compile-time error on modern systems.  Instead, rework the test
+to not need getpagesize.  Add a FIXME comment for unnecessary
+tests; I don't want to remove them now as we're too close to
+a release.  Remove long-obsolete comment about GNU grep.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/functions.m4 | 44 +++++----------------------------------
+ 1 file changed, 5 insertions(+), 39 deletions(-)
+
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 499e4c024..5a0f01856 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -1283,6 +1283,7 @@ AU_ALIAS([AM_FUNC_MKTIME], [AC_FUNC_MKTIME])
+ AN_FUNCTION([mmap], [AC_FUNC_MMAP])
+ AC_DEFUN([AC_FUNC_MMAP],
+ [AC_REQUIRE([AC_CANONICAL_HOST])dnl for cross-compiles
++dnl FIXME: Remove the unnecessary checks for unistd.h, sys/param.h, getpagesize.
+ AC_CHECK_HEADERS_ONCE([unistd.h sys/param.h])
+ AC_CHECK_FUNCS_ONCE([getpagesize])
+ AC_CACHE_CHECK([for working mmap], [ac_cv_func_mmap_fixed_mapped],
+@@ -1305,48 +1306,11 @@ AC_CACHE_CHECK([for working mmap], [ac_cv_func_mmap_fixed_mapped],
+    VM page cache was not coherent with the file system buffer cache
+    like early versions of FreeBSD and possibly contemporary NetBSD.)
+    For shared mappings, we should conversely verify that changes get
+-   propagated back to all the places they're supposed to be.
+-
+-   Grep wants private fixed already mapped.
+-   The main things grep needs to know about mmap are:
+-   * does it exist and is it safe to write into the mmap'd area
+-   * how to use it (BSD variants)  */
++   propagated back to all the places they're supposed to be.  */
+ 
+ #include <fcntl.h>
+ #include <sys/mman.h>
+ 
+-/* This mess was copied from the GNU getpagesize.h.  */
+-#ifndef HAVE_GETPAGESIZE
+-# ifdef _SC_PAGESIZE
+-#  define getpagesize() sysconf(_SC_PAGESIZE)
+-# else /* no _SC_PAGESIZE */
+-#  ifdef HAVE_SYS_PARAM_H
+-#   include <sys/param.h>
+-#   ifdef EXEC_PAGESIZE
+-#    define getpagesize() EXEC_PAGESIZE
+-#   else /* no EXEC_PAGESIZE */
+-#    ifdef NBPG
+-#     define getpagesize() NBPG * CLSIZE
+-#     ifndef CLSIZE
+-#      define CLSIZE 1
+-#     endif /* no CLSIZE */
+-#    else /* no NBPG */
+-#     ifdef NBPC
+-#      define getpagesize() NBPC
+-#     else /* no NBPC */
+-#      ifdef PAGESIZE
+-#       define getpagesize() PAGESIZE
+-#      endif /* PAGESIZE */
+-#     endif /* no NBPC */
+-#    endif /* no NBPG */
+-#   endif /* no EXEC_PAGESIZE */
+-#  else /* no HAVE_SYS_PARAM_H */
+-#   define getpagesize() 8192	/* punt totally */
+-#  endif /* no HAVE_SYS_PARAM_H */
+-# endif /* no _SC_PAGESIZE */
+-
+-#endif /* no HAVE_GETPAGESIZE */
+-
+ int
+ main (void)
+ {
+@@ -1355,7 +1319,9 @@ main (void)
+   int i, pagesize;
+   int fd, fd2;
+ 
+-  pagesize = getpagesize ();
++  /* The "page size" need not equal the system page size,
++     and need not even be a power of 2.  */
++  pagesize = 8192;
+ 
+   /* First, make a file with some known garbage in it. */
+   data = (char *) malloc (pagesize);
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch
new file mode 100644
index 00000000000..1b168c7b55f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch
@@ -0,0 +1,91 @@
+From 33c26d2700f927432c756ccf7a4fc89403d35b95 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 10 May 2023 22:57:27 -0700
+Subject: [PATCH 22/29] Fix port of AC_FUNC_MMAP
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Matt Turner in:
+https://lists.gnu.org/r/bug-autoconf/2023-05/msg00005.html
+* lib/autoconf/functions.m4 (AC_FUNC_MMAP): Go back to getting the
+page size, since the zero-fill test needs this after all.
+However, prefer sysconf (_SC_PAGESIZE) or sysconf (_SC_PAGE_SIZE)
+to getpagesize (), and use ‘long’ not ‘int’ to store the page size.
+Also, declare getpagesize if it is used as a function.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/functions.m4 | 41 ++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 36 insertions(+), 5 deletions(-)
+
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 5a0f01856..3d6e4aca8 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -1283,7 +1283,6 @@ AU_ALIAS([AM_FUNC_MKTIME], [AC_FUNC_MKTIME])
+ AN_FUNCTION([mmap], [AC_FUNC_MMAP])
+ AC_DEFUN([AC_FUNC_MMAP],
+ [AC_REQUIRE([AC_CANONICAL_HOST])dnl for cross-compiles
+-dnl FIXME: Remove the unnecessary checks for unistd.h, sys/param.h, getpagesize.
+ AC_CHECK_HEADERS_ONCE([unistd.h sys/param.h])
+ AC_CHECK_FUNCS_ONCE([getpagesize])
+ AC_CACHE_CHECK([for working mmap], [ac_cv_func_mmap_fixed_mapped],
+@@ -1311,17 +1310,49 @@ AC_CACHE_CHECK([for working mmap], [ac_cv_func_mmap_fixed_mapped],
+ #include <fcntl.h>
+ #include <sys/mman.h>
+ 
++#ifndef getpagesize
++# ifdef _SC_PAGESIZE
++#  define getpagesize() sysconf (_SC_PAGESIZE)
++# elif defined _SC_PAGE_SIZE
++#  define getpagesize() sysconf (_SC_PAGE_SIZE)
++# elif HAVE_GETPAGESIZE
++int getpagesize ();
++# else
++#  ifdef HAVE_SYS_PARAM_H
++#   include <sys/param.h>
++#   ifdef EXEC_PAGESIZE
++#    define getpagesize() EXEC_PAGESIZE
++#   else /* no EXEC_PAGESIZE */
++#    ifdef NBPG
++#     define getpagesize() NBPG * CLSIZE
++#     ifndef CLSIZE
++#      define CLSIZE 1
++#     endif /* no CLSIZE */
++#    else /* no NBPG */
++#     ifdef NBPC
++#      define getpagesize() NBPC
++#     else /* no NBPC */
++#      ifdef PAGESIZE
++#       define getpagesize() PAGESIZE
++#      endif /* PAGESIZE */
++#     endif /* no NBPC */
++#    endif /* no NBPG */
++#   endif /* no EXEC_PAGESIZE */
++#  else /* no HAVE_SYS_PARAM_H */
++#   define getpagesize() 8192	/* punt totally */
++#  endif /* no HAVE_SYS_PARAM_H */
++# endif
++#endif
++
+ int
+ main (void)
+ {
+   char *data, *data2, *data3;
+   const char *cdata2;
+-  int i, pagesize;
++  long i, pagesize;
+   int fd, fd2;
+ 
+-  /* The "page size" need not equal the system page size,
+-     and need not even be a power of 2.  */
+-  pagesize = 8192;
++  pagesize = getpagesize ();
+ 
+   /* First, make a file with some known garbage in it. */
+   data = (char *) malloc (pagesize);
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch
new file mode 100644
index 00000000000..9fb33c3196a
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch
@@ -0,0 +1,38 @@
+From ccc0d640c4d829504568330f9674408af5092ffc Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sat, 13 May 2023 09:56:33 -0700
+Subject: [PATCH 23/29] Improve AC_SYS_YEAR2038_RECOMMENDED diagnostic
+
+* lib/autoconf/specific.m4 (AC_SYS_YEAR2038_RECOMMENDED):
+Do not recommend gcc -m64, as that likely will not work.
+Problem reported by Bruno Haible in:
+https://lists.gnu.org/r/bug-gnulib/2023-05/msg00060.html
+Instead, mention that 32-bit time_t is not recommended
+for this package, before telling the builder how
+to configure with 32-bit time_t anyway.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 88e0479e8..91f20bf0d 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -228,8 +228,9 @@ AC_DEFUN([AC_SYS_YEAR2038_RECOMMENDED],
+ AS_IF([test "$enable_year2038,$ac_have_year2038" = yes,no],
+    [AC_MSG_FAILURE(m4_text_wrap(
+       [could not enable timestamps after mid-January 2038.
+-       Did you mean to build a 64-bit binary? (E.g., 'CC="${CC} -m64"'.)
+-       To proceed with 32-bit time_t, configure with '--disable-year2038'.],
++       This package recommends support for these later timestamps.
++       However, to proceed with signed 32-bit time_t even though it
++       will fail then, configure with '--disable-year2038'.],
+       [], [], [55]))])])
+ 
+ # _AC_SYS_LARGEFILE_TEST_CODE
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch
new file mode 100644
index 00000000000..2644c578367
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch
@@ -0,0 +1,29 @@
+From 8e7281d7bebb5e389befe6e9a5afbb7b2ae13ae0 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 17 May 2023 11:50:27 -0700
+Subject: [PATCH 24/29] Improve AC_FUNC_MMAP comments
+
+* lib/autoconf/functions.m4 (AC_FUNC_MMAP): Add comment.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/functions.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 3d6e4aca8..54d04cc38 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -1311,6 +1311,8 @@ AC_CACHE_CHECK([for working mmap], [ac_cv_func_mmap_fixed_mapped],
+ #include <sys/mman.h>
+ 
+ #ifndef getpagesize
++/* Prefer sysconf to the legacy getpagesize function, as getpagesize has
++   been removed from POSIX and is limited to page sizes that fit in 'int'.  */
+ # ifdef _SC_PAGESIZE
+ #  define getpagesize() sysconf (_SC_PAGESIZE)
+ # elif defined _SC_PAGE_SIZE
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch
new file mode 100644
index 00000000000..b7affed40d3
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch
@@ -0,0 +1,62 @@
+From 103514e40da5f20aebf83a3446452ccebe5172bb Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 19 Jun 2023 14:04:29 -0700
+Subject: [PATCH 25/29] Fix AC_SYS_LARGEFILE on GNU/Linux alpha, s390x
+
+Problem reported by Matoro <https://bugs.gnu.org/64123>.
+* lib/autoconf/specific.m4 (_AC_SYS_LARGEFILE_TEST_CODE):
+New overridable macro FTYPE, to test types other than off_t.
+(_AC_SYS_LARGEFILE_TEST_CODE): Test ino_t for
+-D_FILE_OFFSETBITS=64 too, if no flags are needed for off_t.
+Needed for GNU/Linux on alpha and s390x.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 21 +++++++++++++++------
+ 1 file changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 91f20bf0d..9d5974548 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -238,13 +238,16 @@ AS_IF([test "$enable_year2038,$ac_have_year2038" = yes,no],
+ # C code used to probe for large file support.
+ m4_define([_AC_SYS_LARGEFILE_TEST_CODE],
+ [@%:@include <sys/types.h>
+- /* Check that off_t can represent 2**63 - 1 correctly.
+-    We can't simply define LARGE_OFF_T to be 9223372036854775807,
++@%:@ifndef FTYPE
++@%:@ define FTYPE off_t
++@%:@endif
++ /* Check that FTYPE can represent 2**63 - 1 correctly.
++    We can't simply define LARGE_FTYPE to be 9223372036854775807,
+     since some C++ compilers masquerading as C compilers
+     incorrectly reject 9223372036854775807.  */
+-@%:@define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
+-  int off_t_is_large[[(LARGE_OFF_T % 2147483629 == 721
+-		       && LARGE_OFF_T % 2147483647 == 1)
++@%:@define LARGE_FTYPE (((FTYPE) 1 << 31 << 31) - 1 + ((FTYPE) 1 << 31 << 31))
++  int FTYPE_is_large[[(LARGE_FTYPE % 2147483629 == 721
++		       && LARGE_FTYPE % 2147483647 == 1)
+ 		      ? 1 : -1]];[]dnl
+ ])
+ # Defined by Autoconf 2.71 and circa 2022 Gnulib unwisely depended on it.
+@@ -284,7 +287,13 @@ AC_DEFUN([_AC_SYS_LARGEFILE_PROBE],
+     AS_IF([test x"$ac_opt" != x"none needed"],
+       [CC="$ac_save_CC $ac_opt"])
+     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([_AC_SYS_LARGEFILE_TEST_CODE])],
+-      [ac_cv_sys_largefile_opts="$ac_opt"
++     [AS_IF([test x"$ac_opt" = x"none needed"],
++	[# GNU/Linux s390x and alpha need _FILE_OFFSET_BITS=64 for wide ino_t.
++	 CC="$CC -DFTYPE=ino_t"
++	 AC_COMPILE_IFELSE([], [],
++	   [CC="$CC -D_FILE_OFFSET_BITS=64"
++	    AC_COMPILE_IFELSE([], [ac_opt='-D_FILE_OFFSET_BITS=64'])])])
++      ac_cv_sys_largefile_opts=$ac_opt
+       ac_opt_found=yes])
+     test $ac_opt_found = no || break
+   done
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch
new file mode 100644
index 00000000000..8d2539611d7
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch
@@ -0,0 +1,270 @@
+From a7421b411b4359b97528c8f4e9dd8abe82235813 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 20 Jun 2023 13:23:19 -0700
+Subject: [PATCH 26/29] Modernize INSTALL
+
+Problem reported for gettext bootstrap by Julien Palard in:
+https://savannah.gnu.org/bugs/?62196
+* doc/install.texi: Give a brief info as to how to bootstrap,
+on packages built from Git rather from a distribution tarball.
+Remove aging details about c99, macOS, X, HP-UX, OSF/1, Solaris,
+Haiku, sun4.  Improve documentation for enable/disable and
+with/without options.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/install.texi | 157 +++++++++++++++++++++--------------------------
+ 1 file changed, 70 insertions(+), 87 deletions(-)
+
+diff --git a/doc/install.texi b/doc/install.texi
+index e06689613..cec245fd0 100644
+--- a/doc/install.texi
++++ b/doc/install.texi
+@@ -18,9 +18,21 @@ warranty of any kind.
+ @node Basic Installation
+ @section Basic Installation
+ 
+-Briefly, the shell command
+-@samp{./configure@tie{}&& make@tie{}&& make@tie{}install}
+-should configure, build, and install this package.  The following
++Briefly, the following shell commands:
++
++@example
++test -f configure || ./bootstrap
++./configure
++make
++make install
++@end example
++
++@noindent
++should configure, build, and install this package.
++The @command{./bootstrap} line is intended for developers;
++you can omit it when building from a distribution tarball.
++
++The following
+ more-detailed instructions are generic; see the @file{README} file for
+ instructions specific to this package.
+ @ifclear autoconf
+@@ -32,6 +44,17 @@ More recommendations for GNU packages can be found in
+ @ref{Makefile Conventions, , Makefile Conventions, standards,
+ GNU Coding Standards}.
+ 
++If the @command{bootstrap} shell script exists, it attempts to build the
++@command{configure} shell script and related files, perhaps by
++downloading other software components from the network, and by using
++developer tools that are less commonly installed.  Because the output of
++@command{bootstrap} is system-independent, it is normally run by a
++package developer so that its output can be put into the distribution
++tarball and ordinary builders and users need not run @command{bootstrap}.
++Some packages have commands like @command{./autopull.sh} and
++@command {./autogen.sh} that you can run instead of @command{./bootstrap},
++for more fine-grained control over bootstrapping.
++
+ The @command{configure} shell script attempts to guess correct values
+ for various system-dependent variables used during compilation.  It uses
+ those values to create a @file{Makefile} in each directory of the
+@@ -63,8 +86,15 @@ The simplest way to compile this package is:
+ 
+ @enumerate
+ @item
+-@command{cd} to the directory containing the package's source code and type
+-@samp{./configure} to configure the package for your system.
++@command{cd} to the directory containing the package's source code.
++
++@item
++If this is a developer checkout and file @samp{configure} does not yet exist,
++type @samp{./bootstrap} to create it.
++You may need special developer tools and network access to bootstrap.
++
++@item
++Type @samp{./configure} to configure the package for your system.
+ 
+ Running @command{configure} might take a while.  While running, it prints some
+ messages telling which features it is checking for.
+@@ -124,7 +154,7 @@ parameters by setting variables in the command line or in the environment.
+ Here is an example:
+ 
+ @example
+-./configure CC=c99 CFLAGS=-g LIBS=-lposix
++./configure CC=gcc CFLAGS=-g LIBS=-lposix
+ @end example
+ 
+ @xref{Defining Variables}, for more details.
+@@ -148,21 +178,10 @@ architecture at a time in the source code directory.  After you have
+ installed the package for one architecture, use @samp{make distclean}
+ before reconfiguring for another architecture.
+ 
+-On MacOS X 10.5 and later systems, you can create libraries and
+-executables that work on multiple system types---known as @dfn{fat} or
+-@dfn{universal} binaries---by specifying multiple @option{-arch} options
+-to the compiler but only a single @option{-arch} option to the
+-preprocessor.  Like this:
+-
+-@example
+-./configure CC="gcc -arch i386 -arch x86_64 -arch ppc -arch ppc64" \
+-            CXX="g++ -arch i386 -arch x86_64 -arch ppc -arch ppc64" \
+-            CPP="gcc -E" CXXCPP="g++ -E"
+-@end example
+-
+-This is not guaranteed to produce working output in all cases, you may
+-have to build one architecture at a time and combine the results
+-using the @command{lipo} tool if you have problems.
++Some platforms, notably macOS, support ``fat'' or ``universal'' binaries,
++where a single binary can execute on different architectures.
++On these platforms you can configure and compile just once,
++with options specific to that platform.
+ 
+ @node Installation Names
+ @section Installation Names
+@@ -227,20 +246,16 @@ an extra prefix or suffix on their names by giving @command{configure}
+ the option @option{--program-prefix=@var{PREFIX}} or
+ @option{--program-suffix=@var{SUFFIX}}.
+ 
+-Some packages pay attention to @option{--enable-@var{feature}} options
++Some packages pay attention to @option{--enable-@var{feature}}
++and @option{--disable-@var{feature}} options
+ to @command{configure}, where @var{feature} indicates an optional part
+ of the package.  They may also pay attention to
+-@option{--with-@var{package}} options, where @var{package} is something
+-like @samp{gnu-as} or @samp{x} (for the X Window System).  The
+-@file{README} should mention any @option{--enable-} and @option{--with-}
++@option{--with-@var{package}} and @option{--without-@var{package}} options,
++where @var{package} is something like @samp{gnu-ld}.
++@samp{./configure --help} should mention the
++@option{--enable-...} and @option{--with-...}
+ options that the package recognizes.
+ 
+-For packages that use the X Window System, @command{configure} can
+-usually find the X include and library files automatically, but if it
+-doesn't, you can use the @command{configure} options
+-@option{--x-includes=@var{dir}} and @option{--x-libraries=@var{dir}} to
+-specify their locations.
+-
+ Some packages offer the ability to configure how verbose the execution
+ of @command{make} will be.  For these packages, running
+ @samp{./configure --enable-silent-rules} sets the default to minimal
+@@ -248,53 +263,6 @@ output, which can be overridden with @code{make V=1}; while running
+ @samp{./configure --disable-silent-rules} sets the default to verbose,
+ which can be overridden with @code{make V=0}.
+ 
+-@node Particular Systems
+-@section Particular systems
+-
+-On HP-UX, the default C compiler is not ANSI C compatible.  If GNU CC is
+-not installed, it is recommended to use the following options in order to
+-use an ANSI C compiler:
+-
+-@example
+-./configure CC="cc -Ae -D_XOPEN_SOURCE=500"
+-@end example
+-
+-@noindent
+-and if that doesn't work, install pre-built binaries of GCC for HP-UX.
+-
+-HP-UX @command{make} updates targets which have the same timestamps as
+-their prerequisites, which makes it generally unusable when shipped
+-generated files such as @command{configure} are involved.  Use GNU
+-@command{make} instead.
+-
+-On OSF/1 a.k.a.@: Tru64, some versions of the default C compiler cannot
+-parse its @code{<wchar.h>} header file.  The option @option{-nodtk} can be
+-used as a workaround.  If GNU CC is not installed, it is therefore
+-recommended to try
+-
+-@example
+-./configure CC="cc"
+-@end example
+-
+-@noindent
+-and if that doesn't work, try
+-
+-@example
+-./configure CC="cc -nodtk"
+-@end example
+-
+-On Solaris, don't put @code{/usr/ucb} early in your @env{PATH}.  This
+-directory contains several dysfunctional programs; working variants
+-of these programs are available in @code{/usr/bin}.  So, if you need
+-@code{/usr/ucb} in your @env{PATH}, put it @emph{after} @code{/usr/bin}.
+-
+-On Haiku, software installed for all users goes in @file{/boot/common},
+-not @file{/usr/local}.  It is recommended to use the following options:
+-
+-@example
+-./configure --prefix=/boot/common
+-@end example
+-
+ @node System Type
+ @section Specifying the System Type
+ 
+@@ -304,7 +272,8 @@ will run on.  Usually, assuming the package is built to be run on the
+ @emph{same} architectures, @command{configure} can figure that out, but
+ if it prints a message saying it cannot guess the machine type, give it
+ the @option{--build=@var{type}} option.  @var{type} can either be a
+-short name for the system type, such as @samp{sun4}, or a canonical name
++short name like @samp{mingw64} for the system type, or a canonical name
++like @samp{x86_64-pc-linux-gnu}
+ which has the form:
+ 
+ @example
+@@ -319,6 +288,7 @@ where @var{system} can have one of these forms:
+ @var{kernel}-@var{os}
+ @end example
+ 
++@noindent
+ See the file @file{config.sub} for the possible values of each field.
+ If @file{config.sub} isn't included in this package, then this package
+ doesn't need to know the machine type.
+@@ -405,13 +375,6 @@ traditionally @file{config.cache}.  @var{file} defaults to
+ @itemx -C
+ Alias for @option{--cache-file=config.cache}.
+ 
+-@item --quiet
+-@itemx --silent
+-@itemx -q
+-Do not print messages saying which checks are being made.  To suppress
+-all normal output, redirect it to @file{/dev/null} (any error messages
+-will still be shown).
+-
+ @item --srcdir=@var{dir}
+ Look for the package's source code in directory @var{dir}.  Usually
+ @command{configure} can determine that directory automatically.
+@@ -421,13 +384,33 @@ Use @var{dir} as the installation prefix.  @ref{Installation Names}
+ for more details, including other options available for fine-tuning
+ the installation locations.
+ 
++@item --build=@var{type}
++Build for architecture @var{type}.  @ref{Specifying the System Type}
++for more details, including other system type options.
++
++@item --enable-@var{feature}
++@itemx --disable-@var{feature}
++Enable or disable the optional @var{feature}.  @xref{Optional Features}.
++
++@item --with-@var{package}
++@itemx --without-@var{package}
++Use or omit @var{package} when building.  @xref{Optional Features}.
++
++@item --quiet
++@itemx --silent
++@itemx -q
++Do not print messages saying which checks are being made.  To suppress
++all normal output, redirect it to @file{/dev/null} (any error messages
++will still be shown).
++
+ @item --no-create
+ @itemx -n
+ Run the configure checks, but stop before creating any output files.
+ @end table
+ 
+ @noindent
+-@command{configure} also accepts some other, not widely useful, options.
++@command{configure} also recognizes several environment variables,
++and accepts some other, less widely useful, options.
+ Run @samp{configure --help} for more details.
+ 
+ @c Local Variables:
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch
new file mode 100644
index 00000000000..7ab50747551
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch
@@ -0,0 +1,58 @@
+From eaea61e4485cdecf989fa777ff4e166c945a6eea Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 20 Jun 2023 13:39:15 -0700
+Subject: [PATCH 27/29] doc: fix broken cross-refs
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/autoconf.texi | 5 +----
+ doc/install.texi  | 2 +-
+ 2 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 0f3047b31..7817fc1b5 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -604,7 +604,6 @@ Running @command{configure} Scripts
+ * Multiple Architectures::      Compiling for multiple architectures at once
+ * Installation Names::          Installing in different directories
+ * Optional Features::           Selecting optional features
+-* Particular Systems::          Particular systems
+ * System Type::                 Specifying the system type
+ * Sharing Defaults::            Setting site-wide defaults for @command{configure}
+ * Defining Variables::          Specifying the compiler etc.
+@@ -23304,7 +23303,6 @@ may use comes with Autoconf.
+ * Multiple Architectures::      Compiling for multiple architectures at once
+ * Installation Names::          Installing in different directories
+ * Optional Features::           Selecting optional features
+-* Particular Systems::          Particular systems
+ * System Type::                 Specifying the system type
+ * Sharing Defaults::            Setting site-wide defaults for @command{configure}
+ * Defining Variables::          Specifying the compiler etc.
+@@ -26990,8 +26988,7 @@ for simple differences.
+ @item
+ Most tests which produce their result in a substituted variable allow to
+ override the test by setting the variable on the @command{configure}
+-command line (@pxref{Compilers and Options}, @pxref{Defining Variables},
+-@pxref{Particular Systems}).
++command line (@pxref{Compilers and Options}, @pxref{Defining Variables}).
+ 
+ @item
+ Many tests store their result in a cache variable (@pxref{Caching
+diff --git a/doc/install.texi b/doc/install.texi
+index cec245fd0..6d9788fa9 100644
+--- a/doc/install.texi
++++ b/doc/install.texi
+@@ -385,7 +385,7 @@ for more details, including other options available for fine-tuning
+ the installation locations.
+ 
+ @item --build=@var{type}
+-Build for architecture @var{type}.  @ref{Specifying the System Type}
++Build for architecture @var{type}.  @ref{System Type}.
+ for more details, including other system type options.
+ 
+ @item --enable-@var{feature}
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch
new file mode 100644
index 00000000000..95ad80df5e2
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch
@@ -0,0 +1,224 @@
+From 328f9b88ef896e8e31818c50d9ec2ade5c892ea4 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Fri, 23 Jun 2023 17:37:35 +0200
+Subject: [PATCH 28/29] INSTALL: Clarify --build, --host, --target, and the
+ system types.
+
+* doc/install.texi (Compilers and Options): Add another reference.
+(System Types): Renamed from System Type. Explain how to canonicalize
+and how to validate a system type. Don't explain --build, --host,
+--target here.
+(Building for a different system type): New section.
+(Troubleshooting the Build Type): New section.
+(Configuring a Compiler): New section.
+(configure Invocation): Mention the --host option, not the --build
+option, since --build is so rarely needed.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/autoconf.texi |   6 +--
+ doc/install.texi  | 132 +++++++++++++++++++++++++++++++++++++---------
+ 2 files changed, 111 insertions(+), 27 deletions(-)
+
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 7817fc1b5..043f7fb21 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -604,7 +604,7 @@ Running @command{configure} Scripts
+ * Multiple Architectures::      Compiling for multiple architectures at once
+ * Installation Names::          Installing in different directories
+ * Optional Features::           Selecting optional features
+-* System Type::                 Specifying the system type
++* System Types::                Specifying a system type
+ * Sharing Defaults::            Setting site-wide defaults for @command{configure}
+ * Defining Variables::          Specifying the compiler etc.
+ * configure Invocation::        Changing how @command{configure} runs
+@@ -22383,7 +22383,7 @@ system it's running on.  To do so it runs a script called
+ command or symbols predefined by the C preprocessor.
+ 
+ Alternately, the user can specify the system type with command line
+-arguments to @command{configure} (@pxref{System Type}.  Doing so is
++arguments to @command{configure} (@pxref{System Types}.  Doing so is
+ necessary when
+ cross-compiling.  In the most complex case of cross-compiling, three
+ system types are involved.  The options to specify them are:
+@@ -23303,7 +23303,7 @@ may use comes with Autoconf.
+ * Multiple Architectures::      Compiling for multiple architectures at once
+ * Installation Names::          Installing in different directories
+ * Optional Features::           Selecting optional features
+-* System Type::                 Specifying the system type
++* System Types::                Specifying a system type
+ * Sharing Defaults::            Setting site-wide defaults for @command{configure}
+ * Defining Variables::          Specifying the compiler etc.
+ * configure Invocation::        Changing how @command{configure} runs
+diff --git a/doc/install.texi b/doc/install.texi
+index 6d9788fa9..a3ef17828 100644
+--- a/doc/install.texi
++++ b/doc/install.texi
+@@ -157,8 +157,16 @@ Here is an example:
+ ./configure CC=gcc CFLAGS=-g LIBS=-lposix
+ @end example
+ 
+-@xref{Defining Variables}, for more details.
+-
++See
++@ref{Defining Variables} and
++@ifset autoconf
++@ref{Preset Output Variables}
++@end ifset
++@ifclear autoconf
++@ref{Preset Output Variables,,, autoconf, Autoconf}
++@c (@url{https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Preset-Output-Variables.html})
++@end ifclear
++for more details.
+ 
+ @node Multiple Architectures
+ @section Compiling For Multiple Architectures
+@@ -263,18 +271,17 @@ output, which can be overridden with @code{make V=1}; while running
+ @samp{./configure --disable-silent-rules} sets the default to verbose,
+ which can be overridden with @code{make V=0}.
+ 
+-@node System Type
+-@section Specifying the System Type
++@node System Types
++@section Specifying a System Type
+ 
+-There may be some features @command{configure} cannot figure out
+-automatically, but needs to determine by the type of machine the package
+-will run on.  Usually, assuming the package is built to be run on the
+-@emph{same} architectures, @command{configure} can figure that out, but
+-if it prints a message saying it cannot guess the machine type, give it
+-the @option{--build=@var{type}} option.  @var{type} can either be a
+-short name like @samp{mingw64} for the system type, or a canonical name
+-like @samp{x86_64-pc-linux-gnu}
+-which has the form:
++The following sections go into details regarding situations where you
++may have to specify a system type, either through the option
++@option{--host=@var{type}}, or through the option
++@option{--build=@var{type}}, or -- in the case of compilers -- through
++@option{--target=@var{type}}.
++
++A system type @var{type} can either be a short name like @samp{mingw64},
++or a canonical name like @samp{x86_64-pc-linux-gnu} which has the form:
+ 
+ @example
+ @var{cpu}-@var{company}-@var{system}
+@@ -291,16 +298,93 @@ where @var{system} can have one of these forms:
+ @noindent
+ See the file @file{config.sub} for the possible values of each field.
+ If @file{config.sub} isn't included in this package, then this package
+-doesn't need to know the machine type.
++doesn't need to know any machine type.
++
++The file @file{config.sub} is a program that validates and canonicalizes
++a system type.
++It can do canonicalization, as in
++
++@example
++$ sh config.sub x86_64-linux
++x86_64-pc-linux-gnu
++$ sh config.sub arm64-linux
++aarch64-unknown-linux-gnu
++@end example
++
++@noindent
++It also validates the parts.  For example, this interaction tells you
++that ``crusoe'' is not a valid cpu architecture name:
+ 
+-If you are @emph{building} compiler tools for cross-compiling, you
+-should use the option @option{--target=@var{type}} to select the type of
+-system they will produce code for.
++@example
++$ sh config.sub crusoe-linux
++Invalid configuration `crusoe-linux': machine `crusoe-unknown' not recognized
++@end example
++
++@node Building for a different system type
++@section Creating binaries for a different system type
++
++When you want to create binaries that will run on a different machine
++type than the one you are building on, you need to specify both
++@itemize @bullet
++@item
++a @option{--host=@var{type}} option, specifying the machine type on
++which the binaries shall run,
++@item
++compiler variables (@code{CC} for the C compiler, @code{CXX} for the C++
++compiler, and so on), pointing to compilers that generate object code
++for that machine type.
++@end itemize
++
++For example, to create binaries intended to run on a 64-bit ARM
++processor:
++@example
++./configure --host=aarch64-linux-gnu \
++            CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++
++@end example
+ 
+-If you want to @emph{use} a cross compiler, that generates code for a
+-platform different from the build platform, you should specify the
+-@dfn{host} platform (i.e., that on which the generated programs will
+-eventually be run) with @option{--host=@var{type}}.
++If you do this on a machine that can execute such binaries (e.g.@: by
++virtue of the @code{qemu-aarch64} program, system libraries for that
++architecture under @code{$QEMU_LD_PREFIX}, and a Linux
++@code{binfmt_misc} configuration), the build behaves like a native
++build.
++If not, the build is a cross-build, in the sense that @code{configure}
++will make cross-compilation guesses instead of running test programs,
++and ``make check'' will not work.
++
++@node Troubleshooting the Build Type
++@section Fixing a ``cannot guess build type'' error
++
++In rare cases, it may happen that @code{configure} fails with the error
++message ``cannot guess build type''.
++This error means that the files @file{config.guess} and
++@file{config.sub} don't recognize the type of the system on which you
++are building.
++In this case, first fetch the newest versions of these files, from
++@url{https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess}
++and
++@url{https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub},
++respectively, and use these as drop-in replacement for the files
++@file{config.guess} and @file{config.sub} that were shipped with this
++package.
++
++If this resolves the problem, feel free to report the solution to the
++maintainers of this package.
++
++Otherwise, it means that your system is not yet supported by
++@file{config.guess} and @file{config.sub}.
++As a workaround, you can use a configure option
++@option{--build=@var{type}}, where @var{type} comes closest to your
++system type.
++Also, you're welcome to file a report to
++@email{config-patches@@gnu.org}.
++
++@node Configuring a Compiler
++@section Configuration options specific to a compiler
++
++If you are building a compiler, and this compiler should generate code
++for a system type that is different from the one on which the compiler
++binaries shall run on, use the option @option{--target=@var{type}} to
++select the type of system for which the compiler should produce code.
+ 
+ @node Sharing Defaults
+ @section Sharing Defaults
+@@ -384,9 +468,9 @@ Use @var{dir} as the installation prefix.  @ref{Installation Names}
+ for more details, including other options available for fine-tuning
+ the installation locations.
+ 
+-@item --build=@var{type}
+-Build for architecture @var{type}.  @ref{System Type}.
+-for more details, including other system type options.
++@item --host=@var{type}
++Build binaries for architecture @var{type}.  @ref{System Types} and
++@ref{Building for a different system type} for more details.
+ 
+ @item --enable-@var{feature}
+ @itemx --disable-@var{feature}
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch b/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch
new file mode 100644
index 00000000000..9129ab789ac
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch
@@ -0,0 +1,366 @@
+From d8ca8b323873e5cd9d969a062f70b31db450ba53 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sat, 24 Jun 2023 14:39:34 -0700
+Subject: [PATCH 29/29] Shorten and improve INSTALL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Rewrite install.texi so that INSTALL is shorter and hopefully
+more useful for new installers.
+* doc/install.texi: When not building the Autoconf manual, put
+copyright notice at the end, and omit external references as they
+do not work in INSTALL.
+Avoid long URLs as they do not work well in INSTALL or
+in info files.  Be more consistent (though not entirely
+consistent) about “system” vs “architecture”.
+(System Types, Building for a different system type)
+(Troubleshooting the Build Type): Coalesce into a single section
+and rewrite for clarity and brevity.  Mention build-aux.  Do not
+mention --target here as it’s too rare to make the cut.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/install.texi | 224 +++++++++++++++++------------------------------
+ 1 file changed, 82 insertions(+), 142 deletions(-)
+
+diff --git a/doc/install.texi b/doc/install.texi
+index a3ef17828..6c3a9c21c 100644
+--- a/doc/install.texi
++++ b/doc/install.texi
+@@ -2,23 +2,13 @@
+ @c the INSTALL file.
+ 
+ @ifclear autoconf
+-
+ @unnumbered Installation Instructions
+-
+-Copyright @copyright{} 1994--1996, 1999--2002, 2004--2017, 2020--2023
+-Free Software Foundation, Inc.
+-
+-Copying and distribution of this file, with or without modification, are
+-permitted in any medium without royalty provided the copyright notice
+-and this notice are preserved.  This file is offered as-is, without
+-warranty of any kind.
+-
+ @end ifclear
+ 
+ @node Basic Installation
+ @section Basic Installation
+ 
+-Briefly, the following shell commands:
++The following shell commands:
+ 
+ @example
+ test -f configure || ./bootstrap
+@@ -41,8 +31,13 @@ of the features documented below.  The lack of an optional feature in a
+ given package is not necessarily a bug.
+ @end ifclear
+ More recommendations for GNU packages can be found in
++@ifset autoconf
+ @ref{Makefile Conventions, , Makefile Conventions, standards,
+ GNU Coding Standards}.
++@end ifset
++@ifclear autoconf
++the GNU Coding Standards.
++@end ifclear
+ 
+ If the @command{bootstrap} shell script exists, it attempts to build the
+ @command{configure} shell script and related files, perhaps by
+@@ -61,8 +56,8 @@ those values to create a @file{Makefile} in each directory of the
+ package.  It may also create one or more @file{.h} files containing
+ system-dependent definitions.  Finally, it creates a shell script
+ @file{config.status} that you can run in the future to recreate the
+-current configuration, and a file @file{config.log} containing compiler
+-output (useful mainly for debugging @command{configure}).
++current configuration, and a file @file{config.log} containing
++output useful for debugging @command{configure}.
+ 
+ It can also use an optional file (typically called @file{config.cache}
+ and enabled with @option{--cache-file=config.cache} or simply
+@@ -77,10 +72,9 @@ they can be considered for the next release.  If you are using the
+ cache, and at some point @file{config.cache} contains results you don't
+ want to keep, you may remove or edit it.
+ 
+-The file @file{configure.ac} (or @file{configure.in}) is used to create
+-@file{configure} by a program called @command{autoconf}.  You need
+-@file{configure.ac} if you want to change it or regenerate
+-@file{configure} using a newer version of @command{autoconf}.
++The @command{autoconf} program generates @file{configure} from the file
++@file{configure.ac}.  Normally you should edit @file{configure.ac}
++instead of editing @file{configure} directly.
+ 
+ The simplest way to compile this package is:
+ 
+@@ -95,8 +89,7 @@ You may need special developer tools and network access to bootstrap.
+ 
+ @item
+ Type @samp{./configure} to configure the package for your system.
+-
+-Running @command{configure} might take a while.  While running, it prints some
++This might take a while.  While running, @command{configure} prints
+ messages telling which features it is checking for.
+ 
+ @item
+@@ -125,21 +118,11 @@ code directory by typing @samp{make clean}.  To also remove the files
+ that @command{configure} created (so you can compile the package for a
+ different kind of computer), type @samp{make distclean}.  There is also
+ a @samp{make maintainer-clean} target, but that is intended mainly for
+-the package's developers.  If you use it, you may have to get all sorts
+-of other programs in order to regenerate files that came with the
+-distribution.
++the package's developers.  If you use it, you may have to bootstrap again.
+ 
+ @item
+-Often, you can also type @samp{make uninstall} to remove the installed
+-files again.  In practice, not all packages have tested that
+-uninstallation works correctly, even though it is required by the
+-GNU Coding Standards.
+-
+-@item
+-Some packages, particularly those that use Automake, provide @samp{make
+-distcheck}, which can by used by developers to test that all other
+-targets like @samp{make install} and @samp{make uninstall} work
+-correctly.  This target is generally not run by end users.
++If the package follows the GNU Coding Standards,
++you can type @samp{make uninstall} to remove the installed files.
+ @end enumerate
+ 
+ @node Compilers and Options
+@@ -158,21 +141,17 @@ Here is an example:
+ @end example
+ 
+ See
+-@ref{Defining Variables} and
++@ref{Defining Variables}
+ @ifset autoconf
+-@ref{Preset Output Variables}
++and @ref{Preset Output Variables}
+ @end ifset
+-@ifclear autoconf
+-@ref{Preset Output Variables,,, autoconf, Autoconf}
+-@c (@url{https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Preset-Output-Variables.html})
+-@end ifclear
+ for more details.
+ 
+ @node Multiple Architectures
+ @section Compiling For Multiple Architectures
+ 
+ You can compile the package for more than one kind of computer at the
+-same time, by placing the object files for each architecture in their
++same time, by placing the object files for each system in their
+ own directory.  To do this, you can use GNU @command{make}.
+ @command{cd} to the directory where you want the object files and
+ executables to go and run the @command{configure} script.
+@@ -182,9 +161,9 @@ known as a @dfn{VPATH} build.
+ 
+ With a non-GNU @command{make},
+ it is safer to compile the package for one
+-architecture at a time in the source code directory.  After you have
+-installed the package for one architecture, use @samp{make distclean}
+-before reconfiguring for another architecture.
++system at a time in the source code directory.  After you have
++installed the package for one system, use @samp{make distclean}
++before reconfiguring for another system.
+ 
+ Some platforms, notably macOS, support ``fat'' or ``universal'' binaries,
+ where a single binary can execute on different architectures.
+@@ -274,117 +253,65 @@ which can be overridden with @code{make V=0}.
+ @node System Types
+ @section Specifying a System Type
+ 
+-The following sections go into details regarding situations where you
+-may have to specify a system type, either through the option
+-@option{--host=@var{type}}, or through the option
+-@option{--build=@var{type}}, or -- in the case of compilers -- through
+-@option{--target=@var{type}}.
+-
+-A system type @var{type} can either be a short name like @samp{mingw64},
+-or a canonical name like @samp{x86_64-pc-linux-gnu} which has the form:
+-
+-@example
+-@var{cpu}-@var{company}-@var{system}
+-@end example
+-
+-@noindent
+-where @var{system} can have one of these forms:
++By default @command{configure} builds for the current system.
++To create binaries that can run on a different system type,
++specify a @option{--host=@var{type}} option along with compiler
++variables that specify how to generate object code for @var{type}.
++For example, to create binaries intended to run on a 64-bit ARM
++processor:
+ 
+ @example
+-@var{os}
+-@var{kernel}-@var{os}
++./configure --host=aarch64-linux-gnu \
++   CC=aarch64-linux-gnu-gcc \
++   CXX=aarch64-linux-gnu-g++
+ @end example
+ 
+ @noindent
+-See the file @file{config.sub} for the possible values of each field.
+-If @file{config.sub} isn't included in this package, then this package
+-doesn't need to know any machine type.
+-
+-The file @file{config.sub} is a program that validates and canonicalizes
+-a system type.
+-It can do canonicalization, as in
++If done on a machine that can execute these binaries
++(e.g., via @command{qemu-aarch64}, @env{$QEMU_LD_PREFIX}, and Linux's
++@code{binfmt_misc} capability), the build behaves like a native build.
++Otherwise it is a cross-build: @code{configure}
++will make cross-compilation guesses instead of running test programs,
++and @code{make check} will not work.
++
++A system type can either be a short name like @samp{mingw64},
++or a canonical name like @samp{x86_64-pc-linux-gnu}.
++Canonical names have the form @var{cpu}-@var{company}-@var{system}
++where @var{system} is either @var{os} or @var{kernel}-@var{os}.
++To canonicalize and validate a system type,
++you can run the command @file{config.sub},
++which is often squirreled away in a subdirectory like @file{build-aux}.
++For example:
+ 
+ @example
+-$ sh config.sub x86_64-linux
+-x86_64-pc-linux-gnu
+-$ sh config.sub arm64-linux
++$ build-aux/config.sub arm64-linux
+ aarch64-unknown-linux-gnu
++$ build-aux/config.sub riscv-lnx
++Invalid configuration 'riscv-lnx': OS 'lnx' not recognized
+ @end example
+ 
+ @noindent
+-It also validates the parts.  For example, this interaction tells you
+-that ``crusoe'' is not a valid cpu architecture name:
+-
+-@example
+-$ sh config.sub crusoe-linux
+-Invalid configuration `crusoe-linux': machine `crusoe-unknown' not recognized
+-@end example
+-
+-@node Building for a different system type
+-@section Creating binaries for a different system type
+-
+-When you want to create binaries that will run on a different machine
+-type than the one you are building on, you need to specify both
+-@itemize @bullet
+-@item
+-a @option{--host=@var{type}} option, specifying the machine type on
+-which the binaries shall run,
+-@item
+-compiler variables (@code{CC} for the C compiler, @code{CXX} for the C++
+-compiler, and so on), pointing to compilers that generate object code
+-for that machine type.
+-@end itemize
+-
+-For example, to create binaries intended to run on a 64-bit ARM
+-processor:
+-@example
+-./configure --host=aarch64-linux-gnu \
+-            CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++
+-@end example
+-
+-If you do this on a machine that can execute such binaries (e.g.@: by
+-virtue of the @code{qemu-aarch64} program, system libraries for that
+-architecture under @code{$QEMU_LD_PREFIX}, and a Linux
+-@code{binfmt_misc} configuration), the build behaves like a native
+-build.
+-If not, the build is a cross-build, in the sense that @code{configure}
+-will make cross-compilation guesses instead of running test programs,
+-and ``make check'' will not work.
+-
+-@node Troubleshooting the Build Type
+-@section Fixing a ``cannot guess build type'' error
+-
+-In rare cases, it may happen that @code{configure} fails with the error
+-message ``cannot guess build type''.
+-This error means that the files @file{config.guess} and
+-@file{config.sub} don't recognize the type of the system on which you
+-are building.
+-In this case, first fetch the newest versions of these files, from
+-@url{https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess}
+-and
+-@url{https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub},
+-respectively, and use these as drop-in replacement for the files
+-@file{config.guess} and @file{config.sub} that were shipped with this
+-package.
+-
+-If this resolves the problem, feel free to report the solution to the
+-maintainers of this package.
+-
+-Otherwise, it means that your system is not yet supported by
+-@file{config.guess} and @file{config.sub}.
+-As a workaround, you can use a configure option
+-@option{--build=@var{type}}, where @var{type} comes closest to your
+-system type.
+-Also, you're welcome to file a report to
++You can look at the @file{config.sub} file to see which types are recognized.
++If the file is absent, this package does not need the system type.
++
++If @command{configure} fails with the diagnostic ``cannot guess build type''.
++@file{config.sub} did not recognize your system's type.
++In this case, first fetch the newest versions of these files
++from the @url{https://savannah.gnu.org/projects/config, GNU config package}.
++If that fixes things, please report it to the
++maintainers of the package containing @command{configure}.
++Otherwise, you can try the configure option
++@option{--build=@var{type}} where @var{type} comes close to your
++system type; also, please report the problem to
+ @email{config-patches@@gnu.org}.
+ 
+-@node Configuring a Compiler
+-@section Configuration options specific to a compiler
+-
+-If you are building a compiler, and this compiler should generate code
+-for a system type that is different from the one on which the compiler
+-binaries shall run on, use the option @option{--target=@var{type}} to
+-select the type of system for which the compiler should produce code.
++For more details about configuring system types, see
++@ifset autoconf
++@ref{Manual Configuration}.
++@end ifset
++@ifclear autoconf
++the Autoconf documentation.
++@end ifclear
+ 
+ @node Sharing Defaults
+ @section Sharing Defaults
+@@ -469,8 +396,8 @@ for more details, including other options available for fine-tuning
+ the installation locations.
+ 
+ @item --host=@var{type}
+-Build binaries for architecture @var{type}.  @ref{System Types} and
+-@ref{Building for a different system type} for more details.
++Build binaries for system @var{type}.
++@xref{System Types}.
+ 
+ @item --enable-@var{feature}
+ @itemx --disable-@var{feature}
+@@ -497,6 +424,19 @@ Run the configure checks, but stop before creating any output files.
+ and accepts some other, less widely useful, options.
+ Run @samp{configure --help} for more details.
+ 
++@ifclear autoconf
++@node Copyright notice
++@section Copyright notice
++
++Copyright @copyright{} 1994--1996, 1999--2002, 2004--2017, 2020--2023
++Free Software Foundation, Inc.
++
++Copying and distribution of this file, with or without modification, are
++permitted in any medium without royalty provided the copyright notice
++and this notice are preserved.  This file is offered as-is, without
++warranty of any kind.
++@end ifclear
++
+ @c Local Variables:
+ @c fill-column: 72
+ @c ispell-local-dictionary: "american"
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72c.bb b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
index fe9779e4ddb..76130d58a5f 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
@@ -19,9 +19,41 @@ SRC_URI = " \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
-           "
+	   ${BACKPORTS} \
+"
 SRC_URI:append:class-native = " file://no-man.patch"
 
+BACKPORTS = "\
+           file://backports/0001-mention-prototypes-more-prominently-in-NEWS.patch \
+           file://backports/0002-build-run-make-fetch-which-updated-these.patch \
+           file://backports/0003-NEWS-Tighten-up-wording.patch \
+           file://backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch \
+           file://backports/0006-Fix-timing-bug-on-high-speed-builds.patch \
+           file://backports/0007-Support-underquoted-callers-better.patch \
+           file://backports/0008-New-script-for-building-inside-Guix-containers.patch \
+           file://backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch \
+           file://backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch \
+           file://backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch \
+           file://backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch \
+           file://backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch \
+           file://backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch \
+           file://backports/0015-Support-circa-early-2022-Gnulib.patch \
+           file://backports/0016-Improve-year2038-largefile-option-processing.patch \
+           file://backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch \
+           file://backports/0018-Document-limitation-of-BusyBox-tr.patch \
+           file://backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch \
+           file://backports/0020-Tone-down-year-2038-changes.patch \
+           file://backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch \
+           file://backports/0022-Fix-port-of-AC_FUNC_MMAP.patch \
+           file://backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch \
+           file://backports/0024-Improve-AC_FUNC_MMAP-comments.patch \
+           file://backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch \
+           file://backports/0026-Modernize-INSTALL.patch \
+           file://backports/0027-doc-fix-broken-cross-refs.patch \
+           file://backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch \
+           file://backports/0029-Shorten-and-improve-INSTALL.patch \
+"
+
 SRC_URI[sha256sum] = "21b64169c820c6cdf27fc981ca9c2fb615546e5dead92bccf8d92d0784cdd364"
 
 RDEPENDS:${PN} = "m4 gnu-config \
-- 
2.41.0


