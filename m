Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.7464.1611915868680902341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K0h4S7PW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f48.google.com with SMTP id bx12so9939640edb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gaoQDVOcQlD2zFxWkGFcWoGcKWcnGf3wfW9jg22Am+8=;
        b=K0h4S7PWn/v6JiO6/71tVngTbysGTpOwOjNLePDuz7w2V8PzTurbltJEPZFk7A1oLk
         xN4YGkkKuXh+X0EuB5U2lQoJl3Tng5vZqEt/HbTUXY84yNKyPiUtgPd951AnImiMWoaX
         5VMWMhchCaKQhZNQPY67EtOXHiQPKhO/vaQ50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gaoQDVOcQlD2zFxWkGFcWoGcKWcnGf3wfW9jg22Am+8=;
        b=cqXGtZ+W4PBBTwF0ld4IYia6bEpFuh2qAViwEdiXZObfSq3JiquXOyC8V5FcoKVsyq
         ihg+b7H2S8MnrWCEz9l8d2p5yEVJA0baBjIp6XqlGiiy3Of2hX93D0tDm+cQAWzUs5/A
         NCOvFBKIz6jQLtvP1oOACOAd2JRv+Q8dznVOOLVlJMCzyIyI5T4UrYbI4GLClZDUJUIe
         YNinoMyxkBxTQFkH2/tzScYr7T5bKd8muv1a6Y51cg+uPAUNd4mWk1mjVbKX/JqI1ysx
         1lKBpXMgPlckHZovcezkx3swt6bOU8kInx/X5dMrLad8DrCSmJ91C6POil9VxPy6GS2z
         ehPg==
X-Gm-Message-State: AOAM530nYJqIm+6Zbht/kudmYWpdejzmUVPgRhEhRy5rT0zR/hZfywLQ
	dOjtLWiOh/oEMYVqbp/LeYEiM5dahJ0hzA==
X-Google-Smtp-Source: ABdhPJxmuKeSx5PAhjGPF4DfCBWpAiKFxZikyg8AaBJEKIBTO3GV+Ez273nIZVH+MxeTtQu0BOYVDA==
X-Received: by 2002:a50:d6dc:: with SMTP id l28mr4274017edj.105.1611915866209;
        Fri, 29 Jan 2021 02:24:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:25 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/13] lrzsz: Fix to work with autoconf 2.70
Date: Fri, 29 Jan 2021 10:24:16 +0000
Message-Id: <20210129102419.1360572-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing gettext version needed for autoconf 2.70.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lrzsz-0.12.20/autotools-update.patch      | 249 ++++++++++--------
 1 file changed, 142 insertions(+), 107 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
index 33af38b4a8d..4a50f7410a2 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
@@ -3,9 +3,10 @@ Update autotools infrastructure (including gettext) to modern versions.
 Upstream-Status: Pending
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 
-diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
---- clean/lrzsz-0.12.20/configure.in	1998-12-30 07:50:07.000000000 +0000
-+++ lrzsz-0.12.20/configure.in	2019-11-25 16:22:37.000000000 +0000
+Index: lrzsz-0.12.20/configure.in
+===================================================================
+--- lrzsz-0.12.20.orig/configure.in
++++ lrzsz-0.12.20/configure.in
 @@ -92,7 +92,6 @@ AC_PROG_RANLIB
  AC_ISC_POSIX
  AC_AIX
@@ -14,7 +15,7 @@ diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
  AC_C_CONST
  AC_C_INLINE
  
-@@ -253,18 +252,13 @@ ihave$lookup_facility
+@@ -253,18 +252,14 @@ ihave$lookup_facility
  fi
  
  
@@ -24,6 +25,7 @@ diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
  
 -AM_GNU_GETTEXT
 +AM_GNU_GETTEXT([external])
++AM_GNU_GETTEXT_VERSION([0.21])
  
 -AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME")
 -AC_LINK_FILES($nls_cv_header_libgt, $nls_cv_header_intl)
@@ -36,9 +38,10 @@ diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
 +[
  chmod +x debian/rules;
  test -z "$CONFIG_HEADERS" || echo timestamp > stamp-h])
-diff -uprN clean/lrzsz-0.12.20/intl/bindtextdom.c lrzsz-0.12.20/intl/bindtextdom.c
---- clean/lrzsz-0.12.20/intl/bindtextdom.c	1998-04-26 14:22:36.000000000 +0100
-+++ lrzsz-0.12.20/intl/bindtextdom.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/bindtextdom.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/bindtextdom.c
++++ /dev/null
 @@ -1,199 +0,0 @@
 -/* Implementation of the bindtextdomain(3) function
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -239,9 +242,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/bindtextdom.c lrzsz-0.12.20/intl/bindtextdom
 -/* Alias for function name in GNU C Library.  */
 -weak_alias (__bindtextdomain, bindtextdomain);
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/cat-compat.c lrzsz-0.12.20/intl/cat-compat.c
---- clean/lrzsz-0.12.20/intl/cat-compat.c	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/cat-compat.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/cat-compat.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/cat-compat.c
++++ /dev/null
 @@ -1,262 +0,0 @@
 -/* Compatibility code for gettext-using-catgets interface.
 -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
@@ -505,9 +509,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/cat-compat.c lrzsz-0.12.20/intl/cat-compat.c
 -  return dest - 1;
 -}
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/ChangeLog lrzsz-0.12.20/intl/ChangeLog
---- clean/lrzsz-0.12.20/intl/ChangeLog	1998-04-26 14:22:35.000000000 +0100
-+++ lrzsz-0.12.20/intl/ChangeLog	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/ChangeLog
+===================================================================
+--- lrzsz-0.12.20.orig/intl/ChangeLog
++++ /dev/null
 @@ -1,1022 +0,0 @@
 -1997-09-06 02:10  Ulrich Drepper  <drepper@cygnus.com>
 -
@@ -1531,9 +1536,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/ChangeLog lrzsz-0.12.20/intl/ChangeLog
 -	which allow to use the X/Open catgets function with an interface
 -	like the Uniforum gettext function.  For system which does not
 -	have neither of those a complete implementation is provided.
-diff -uprN clean/lrzsz-0.12.20/intl/dcgettext.c lrzsz-0.12.20/intl/dcgettext.c
---- clean/lrzsz-0.12.20/intl/dcgettext.c	1998-04-26 14:22:36.000000000 +0100
-+++ lrzsz-0.12.20/intl/dcgettext.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/dcgettext.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/dcgettext.c
++++ /dev/null
 @@ -1,593 +0,0 @@
 -/* Implementation of the dcgettext(3) function
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -2128,9 +2134,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/dcgettext.c lrzsz-0.12.20/intl/dcgettext.c
 -  return dest - 1;
 -}
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/dgettext.c lrzsz-0.12.20/intl/dgettext.c
---- clean/lrzsz-0.12.20/intl/dgettext.c	1998-04-26 14:20:52.000000000 +0100
-+++ lrzsz-0.12.20/intl/dgettext.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/dgettext.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/dgettext.c
++++ /dev/null
 @@ -1,59 +0,0 @@
 -/* dgettext.c -- implementation of the dgettext(3) function
 -   Copyright (C) 1995 Software Foundation, Inc.
@@ -2191,9 +2198,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/dgettext.c lrzsz-0.12.20/intl/dgettext.c
 -/* Alias for function name in GNU C Library.  */
 -weak_alias (__dgettext, dgettext);
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/explodename.c lrzsz-0.12.20/intl/explodename.c
---- clean/lrzsz-0.12.20/intl/explodename.c	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/explodename.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/explodename.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/explodename.c
++++ /dev/null
 @@ -1,181 +0,0 @@
 -/* Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
 -   Contributed by Ulrich Drepper <drepper@gnu.ai.mit.edu>, 1995.
@@ -2376,9 +2384,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/explodename.c lrzsz-0.12.20/intl/explodename
 -
 -  return mask;
 -}
-diff -uprN clean/lrzsz-0.12.20/intl/finddomain.c lrzsz-0.12.20/intl/finddomain.c
---- clean/lrzsz-0.12.20/intl/finddomain.c	1998-04-26 14:22:36.000000000 +0100
-+++ lrzsz-0.12.20/intl/finddomain.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/finddomain.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/finddomain.c
++++ /dev/null
 @@ -1,189 +0,0 @@
 -/* Handle list of needed message catalogs
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -2569,9 +2578,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/finddomain.c lrzsz-0.12.20/intl/finddomain.c
 -
 -  return retval;
 -}
-diff -uprN clean/lrzsz-0.12.20/intl/gettext.c lrzsz-0.12.20/intl/gettext.c
---- clean/lrzsz-0.12.20/intl/gettext.c	1998-04-26 14:22:36.000000000 +0100
-+++ lrzsz-0.12.20/intl/gettext.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/gettext.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/gettext.c
++++ /dev/null
 @@ -1,70 +0,0 @@
 -/* Implementation of gettext(3) function
 -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
@@ -2643,9 +2653,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/gettext.c lrzsz-0.12.20/intl/gettext.c
 -/* Alias for function name in GNU C Library.  */
 -weak_alias (__gettext, gettext);
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/gettext.h lrzsz-0.12.20/intl/gettext.h
---- clean/lrzsz-0.12.20/intl/gettext.h	1998-04-26 14:22:35.000000000 +0100
-+++ lrzsz-0.12.20/intl/gettext.h	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/gettext.h
+===================================================================
+--- lrzsz-0.12.20.orig/intl/gettext.h
++++ /dev/null
 @@ -1,105 +0,0 @@
 -/* Internal header for GNU gettext internationalization functions
 -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
@@ -2752,9 +2763,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/gettext.h lrzsz-0.12.20/intl/gettext.h
 -/* @@ begin of epilog @@ */
 -
 -#endif	/* gettext.h  */
-diff -uprN clean/lrzsz-0.12.20/intl/gettextP.h lrzsz-0.12.20/intl/gettextP.h
---- clean/lrzsz-0.12.20/intl/gettextP.h	1998-04-26 14:22:35.000000000 +0100
-+++ lrzsz-0.12.20/intl/gettextP.h	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/gettextP.h
+===================================================================
+--- lrzsz-0.12.20.orig/intl/gettextP.h
++++ /dev/null
 @@ -1,73 +0,0 @@
 -/* Header describing internals of gettext library
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -2829,9 +2841,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/gettextP.h lrzsz-0.12.20/intl/gettextP.h
 -/* @@ begin of epilog @@ */
 -
 -#endif /* gettextP.h  */
-diff -uprN clean/lrzsz-0.12.20/intl/hash-string.h lrzsz-0.12.20/intl/hash-string.h
---- clean/lrzsz-0.12.20/intl/hash-string.h	1998-04-26 14:22:36.000000000 +0100
-+++ lrzsz-0.12.20/intl/hash-string.h	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/hash-string.h
+===================================================================
+--- lrzsz-0.12.20.orig/intl/hash-string.h
++++ /dev/null
 @@ -1,63 +0,0 @@
 -/* Implements a string hashing function.
 -   Copyright (C) 1995, 1997 Free Software Foundation, Inc.
@@ -2896,9 +2909,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/hash-string.h lrzsz-0.12.20/intl/hash-string
 -    }
 -  return hval;
 -}
-diff -uprN clean/lrzsz-0.12.20/intl/intl-compat.c lrzsz-0.12.20/intl/intl-compat.c
---- clean/lrzsz-0.12.20/intl/intl-compat.c	1998-04-26 14:20:52.000000000 +0100
-+++ lrzsz-0.12.20/intl/intl-compat.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/intl-compat.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/intl-compat.c
++++ /dev/null
 @@ -1,76 +0,0 @@
 -/* intl-compat.c - Stub functions to call gettext functions from GNU gettext
 -   Library.
@@ -2976,9 +2990,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/intl-compat.c lrzsz-0.12.20/intl/intl-compat
 -{
 -  return textdomain__ (domainname);
 -}
-diff -uprN clean/lrzsz-0.12.20/intl/l10nflist.c lrzsz-0.12.20/intl/l10nflist.c
---- clean/lrzsz-0.12.20/intl/l10nflist.c	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/l10nflist.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/l10nflist.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/l10nflist.c
++++ /dev/null
 @@ -1,409 +0,0 @@
 -/* Handle list of needed message catalogs
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -3389,9 +3404,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/l10nflist.c lrzsz-0.12.20/intl/l10nflist.c
 -  return dest - 1;
 -}
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/libgettext.h lrzsz-0.12.20/intl/libgettext.h
---- clean/lrzsz-0.12.20/intl/libgettext.h	1998-04-26 14:22:36.000000000 +0100
-+++ lrzsz-0.12.20/intl/libgettext.h	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/libgettext.h
+===================================================================
+--- lrzsz-0.12.20.orig/intl/libgettext.h
++++ /dev/null
 @@ -1,182 +0,0 @@
 -/* Message catalogs for internationalization.
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -3575,9 +3591,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/libgettext.h lrzsz-0.12.20/intl/libgettext.h
 -#endif
 -
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/linux-msg.sed lrzsz-0.12.20/intl/linux-msg.sed
---- clean/lrzsz-0.12.20/intl/linux-msg.sed	1998-04-26 14:20:52.000000000 +0100
-+++ lrzsz-0.12.20/intl/linux-msg.sed	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/linux-msg.sed
+===================================================================
+--- lrzsz-0.12.20.orig/intl/linux-msg.sed
++++ /dev/null
 @@ -1,100 +0,0 @@
 -# po2msg.sed - Convert Uniforum style .po file to Linux style .msg file
 -# Copyright (C) 1995 Free Software Foundation, Inc.
@@ -3679,9 +3696,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/linux-msg.sed lrzsz-0.12.20/intl/linux-msg.s
 -  tb
 -}
 -d
-diff -uprN clean/lrzsz-0.12.20/intl/loadinfo.h lrzsz-0.12.20/intl/loadinfo.h
---- clean/lrzsz-0.12.20/intl/loadinfo.h	1998-04-26 14:20:52.000000000 +0100
-+++ lrzsz-0.12.20/intl/loadinfo.h	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/loadinfo.h
+===================================================================
+--- lrzsz-0.12.20.orig/intl/loadinfo.h
++++ /dev/null
 @@ -1,58 +0,0 @@
 -#ifndef PARAMS
 -# if __STDC__
@@ -3741,9 +3759,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/loadinfo.h lrzsz-0.12.20/intl/loadinfo.h
 -				     const char **special,
 -				     const char **sponsor,
 -				     const char **revision));
-diff -uprN clean/lrzsz-0.12.20/intl/loadmsgcat.c lrzsz-0.12.20/intl/loadmsgcat.c
---- clean/lrzsz-0.12.20/intl/loadmsgcat.c	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/loadmsgcat.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/loadmsgcat.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/loadmsgcat.c
++++ /dev/null
 @@ -1,199 +0,0 @@
 -/* Load needed message catalogs
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -3944,9 +3963,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/loadmsgcat.c lrzsz-0.12.20/intl/loadmsgcat.c
 -     translations invalid.  */
 -  ++_nl_msg_cat_cntr;
 -}
-diff -uprN clean/lrzsz-0.12.20/intl/localealias.c lrzsz-0.12.20/intl/localealias.c
---- clean/lrzsz-0.12.20/intl/localealias.c	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/localealias.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/localealias.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/localealias.c
++++ /dev/null
 @@ -1,378 +0,0 @@
 -/* Handle aliases for locale names
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -4326,9 +4346,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/localealias.c lrzsz-0.12.20/intl/localealias
 -  return c1 - c2;
 -#endif
 -}
-diff -uprN clean/lrzsz-0.12.20/intl/Makefile.in lrzsz-0.12.20/intl/Makefile.in
---- clean/lrzsz-0.12.20/intl/Makefile.in	1998-04-26 14:22:35.000000000 +0100
-+++ lrzsz-0.12.20/intl/Makefile.in	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/Makefile.in
+===================================================================
+--- lrzsz-0.12.20.orig/intl/Makefile.in
++++ /dev/null
 @@ -1,214 +0,0 @@
 -# Makefile for directory with message catalog handling in GNU NLS Utilities.
 -# Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -4544,9 +4565,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/Makefile.in lrzsz-0.12.20/intl/Makefile.in
 -# Tell versions [3.59,3.63) of GNU make not to export all variables.
 -# Otherwise a system limit (for SysV at least) may be exceeded.
 -.NOEXPORT:
-diff -uprN clean/lrzsz-0.12.20/intl/po2tbl.sed.in lrzsz-0.12.20/intl/po2tbl.sed.in
---- clean/lrzsz-0.12.20/intl/po2tbl.sed.in	1998-04-26 14:20:52.000000000 +0100
-+++ lrzsz-0.12.20/intl/po2tbl.sed.in	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/po2tbl.sed.in
+===================================================================
+--- lrzsz-0.12.20.orig/intl/po2tbl.sed.in
++++ /dev/null
 @@ -1,102 +0,0 @@
 -# po2tbl.sed - Convert Uniforum style .po file to lookup table for catgets
 -# Copyright (C) 1995 Free Software Foundation, Inc.
@@ -4650,9 +4672,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/po2tbl.sed.in lrzsz-0.12.20/intl/po2tbl.sed.
 -  s/0*\(.*\)/int _msg_tbl_length = \1;/p
 -}
 -d
-diff -uprN clean/lrzsz-0.12.20/intl/textdomain.c lrzsz-0.12.20/intl/textdomain.c
---- clean/lrzsz-0.12.20/intl/textdomain.c	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/textdomain.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/textdomain.c
+===================================================================
+--- lrzsz-0.12.20.orig/intl/textdomain.c
++++ /dev/null
 @@ -1,106 +0,0 @@
 -/* Implementation of the textdomain(3) function
 -   Copyright (C) 1995, 1996, 1997 Free Software Foundation, Inc.
@@ -4760,14 +4783,16 @@ diff -uprN clean/lrzsz-0.12.20/intl/textdomain.c lrzsz-0.12.20/intl/textdomain.c
 -/* Alias for function name in GNU C Library.  */
 -weak_alias (__textdomain, textdomain);
 -#endif
-diff -uprN clean/lrzsz-0.12.20/intl/VERSION lrzsz-0.12.20/intl/VERSION
---- clean/lrzsz-0.12.20/intl/VERSION	1998-04-26 14:22:37.000000000 +0100
-+++ lrzsz-0.12.20/intl/VERSION	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/VERSION
+===================================================================
+--- lrzsz-0.12.20.orig/intl/VERSION
++++ /dev/null
 @@ -1 +0,0 @@
 -GNU gettext library from gettext-0.10.32
-diff -uprN clean/lrzsz-0.12.20/intl/xopen-msg.sed lrzsz-0.12.20/intl/xopen-msg.sed
---- clean/lrzsz-0.12.20/intl/xopen-msg.sed	1998-04-26 14:20:52.000000000 +0100
-+++ lrzsz-0.12.20/intl/xopen-msg.sed	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/intl/xopen-msg.sed
+===================================================================
+--- lrzsz-0.12.20.orig/intl/xopen-msg.sed
++++ /dev/null
 @@ -1,104 +0,0 @@
 -# po2msg.sed - Convert Uniforum style .po file to X/Open style .msg file
 -# Copyright (C) 1995 Free Software Foundation, Inc.
@@ -4873,9 +4898,10 @@ diff -uprN clean/lrzsz-0.12.20/intl/xopen-msg.sed lrzsz-0.12.20/intl/xopen-msg.s
 -  tb
 -}
 -d
-diff -uprN clean/lrzsz-0.12.20/lib/Makefile.am lrzsz-0.12.20/lib/Makefile.am
---- clean/lrzsz-0.12.20/lib/Makefile.am	1998-12-27 16:25:26.000000000 +0000
-+++ lrzsz-0.12.20/lib/Makefile.am	2019-11-25 16:22:34.000000000 +0000
+Index: lrzsz-0.12.20/lib/Makefile.am
+===================================================================
+--- lrzsz-0.12.20.orig/lib/Makefile.am
++++ lrzsz-0.12.20/lib/Makefile.am
 @@ -1,6 +1,4 @@
  noinst_LIBRARIES=libzmodem.a
 -CFLAGS=@CFLAGS@
@@ -4883,9 +4909,10 @@ diff -uprN clean/lrzsz-0.12.20/lib/Makefile.am lrzsz-0.12.20/lib/Makefile.am
  
  EXTRA_DIST = alloca.c ansi2knr.1 ansi2knr.c \
  	getopt.c getopt1.c mkdir.c mktime.c \
-diff -uprN clean/lrzsz-0.12.20/Makefile.am lrzsz-0.12.20/Makefile.am
---- clean/lrzsz-0.12.20/Makefile.am	1998-12-30 11:19:40.000000000 +0000
-+++ lrzsz-0.12.20/Makefile.am	2019-11-26 11:47:29.000000000 +0000
+Index: lrzsz-0.12.20/Makefile.am
+===================================================================
+--- lrzsz-0.12.20.orig/Makefile.am
++++ lrzsz-0.12.20/Makefile.am
 @@ -1,5 +1,5 @@
 -SUBDIRS = lib intl src po man testsuite
 -EXTRA_DIST = check.lrzsz COMPATABILITY README.cvs README.isdn4linux \
@@ -4908,9 +4935,10 @@ diff -uprN clean/lrzsz-0.12.20/Makefile.am lrzsz-0.12.20/Makefile.am
  
 +
 +ACLOCAL_AMFLAGS = -I m4
-diff -uprN clean/lrzsz-0.12.20/po/cat-id-tbl.c lrzsz-0.12.20/po/cat-id-tbl.c
---- clean/lrzsz-0.12.20/po/cat-id-tbl.c	1998-12-29 09:24:24.000000000 +0000
-+++ lrzsz-0.12.20/po/cat-id-tbl.c	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/po/cat-id-tbl.c
+===================================================================
+--- lrzsz-0.12.20.orig/po/cat-id-tbl.c
++++ /dev/null
 @@ -1,234 +0,0 @@
 -/* Automatically generated by po2tbl.sed from lrzsz.pot.  */
 -
@@ -5146,10 +5174,10 @@ diff -uprN clean/lrzsz-0.12.20/po/cat-id-tbl.c lrzsz-0.12.20/po/cat-id-tbl.c
 -};
 -
 -int _msg_tbl_length = 136;
-Binary files clean/lrzsz-0.12.20/po/de.gmo and lrzsz-0.12.20/po/de.gmo differ
-diff -uprN clean/lrzsz-0.12.20/po/de.po lrzsz-0.12.20/po/de.po
---- clean/lrzsz-0.12.20/po/de.po	1998-12-30 16:31:46.000000000 +0000
-+++ lrzsz-0.12.20/po/de.po	2019-11-26 11:42:07.000000000 +0000
+Index: lrzsz-0.12.20/po/de.po
+===================================================================
+--- lrzsz-0.12.20.orig/po/de.po
++++ lrzsz-0.12.20/po/de.po
 @@ -6,10 +6,12 @@
  msgid ""
  msgstr ""
@@ -5384,9 +5412,10 @@ diff -uprN clean/lrzsz-0.12.20/po/de.po lrzsz-0.12.20/po/de.po
  #: src/lrz.c:2079
  msgid "rzfile: reached stop time"
  msgstr "rzfile: Abbruchzeit erreicht"
-diff -uprN clean/lrzsz-0.12.20/po/lrzsz.pot lrzsz-0.12.20/po/lrzsz.pot
---- clean/lrzsz-0.12.20/po/lrzsz.pot	1998-12-30 07:50:00.000000000 +0000
-+++ lrzsz-0.12.20/po/lrzsz.pot	2019-11-26 11:39:12.000000000 +0000
+Index: lrzsz-0.12.20/po/lrzsz.pot
+===================================================================
+--- lrzsz-0.12.20.orig/po/lrzsz.pot
++++ lrzsz-0.12.20/po/lrzsz.pot
 @@ -1,24 +1,27 @@
  # SOME DESCRIPTIVE TITLE.
  # Copyright (C) YEAR Free Software Foundation, Inc.
@@ -5618,9 +5647,10 @@ diff -uprN clean/lrzsz-0.12.20/po/lrzsz.pot lrzsz-0.12.20/po/lrzsz.pot
  #: src/lrz.c:2079
  msgid "rzfile: reached stop time"
  msgstr ""
-diff -uprN clean/lrzsz-0.12.20/po/Makevars lrzsz-0.12.20/po/Makevars
---- clean/lrzsz-0.12.20/po/Makevars	1970-01-01 01:00:00.000000000 +0100
-+++ lrzsz-0.12.20/po/Makevars	2019-11-25 18:09:52.000000000 +0000
+Index: lrzsz-0.12.20/po/Makevars
+===================================================================
+--- /dev/null
++++ lrzsz-0.12.20/po/Makevars
 @@ -0,0 +1,78 @@
 +# Makefile variables for PO directory in any package using GNU gettext.
 +
@@ -5700,19 +5730,22 @@ diff -uprN clean/lrzsz-0.12.20/po/Makevars lrzsz-0.12.20/po/Makevars
 +# "no".  Set this to no if the POT file and PO files are maintained
 +# externally.
 +DIST_DEPENDS_ON_UPDATE_PO = yes
-diff -uprN clean/lrzsz-0.12.20/po/stamp-cat-id lrzsz-0.12.20/po/stamp-cat-id
---- clean/lrzsz-0.12.20/po/stamp-cat-id	1998-12-30 07:50:01.000000000 +0000
-+++ lrzsz-0.12.20/po/stamp-cat-id	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/po/stamp-cat-id
+===================================================================
+--- lrzsz-0.12.20.orig/po/stamp-cat-id
++++ /dev/null
 @@ -1 +0,0 @@
 -timestamp
-diff -uprN clean/lrzsz-0.12.20/po/stamp-po lrzsz-0.12.20/po/stamp-po
---- clean/lrzsz-0.12.20/po/stamp-po	1970-01-01 01:00:00.000000000 +0100
-+++ lrzsz-0.12.20/po/stamp-po	2019-11-26 11:42:09.000000000 +0000
+Index: lrzsz-0.12.20/po/stamp-po
+===================================================================
+--- /dev/null
++++ lrzsz-0.12.20/po/stamp-po
 @@ -0,0 +1 @@
 +timestamp
-diff -uprN clean/lrzsz-0.12.20/src/Makefile.am lrzsz-0.12.20/src/Makefile.am
---- clean/lrzsz-0.12.20/src/Makefile.am	1998-12-28 08:38:47.000000000 +0000
-+++ lrzsz-0.12.20/src/Makefile.am	2019-11-25 16:22:49.000000000 +0000
+Index: lrzsz-0.12.20/src/Makefile.am
+===================================================================
+--- lrzsz-0.12.20.orig/src/Makefile.am
++++ lrzsz-0.12.20/src/Makefile.am
 @@ -2,13 +2,11 @@ bin_PROGRAMS=lrz lsz
  lrz_SOURCES=lrz.c timing.c zperr.c zreadline.c crctab.c rbsb.c zm.c protname.c tcp.c lsyslog.c canit.c
  lsz_SOURCES=lsz.c timing.c zperr.c zreadline.c crctab.c rbsb.c zm.c protname.c tcp.c lsyslog.c canit.c
@@ -5729,9 +5762,10 @@ diff -uprN clean/lrzsz-0.12.20/src/Makefile.am lrzsz-0.12.20/src/Makefile.am
  EXTRA_DIST = ansi2knr.1 ansi2knr.c lrzszbug.in
  INCLUDES = -I.. -I$(srcdir) -I$(top_srcdir)/src -I../intl -I$(top_srcdir)/lib
  #DEFS = -DLOCALEDIR=\"$(localedir)\" -DOS=\"@host_os@\" -DCPU=\"@host_cpu@\"
-diff -uprN clean/lrzsz-0.12.20/src/zglobal.h lrzsz-0.12.20/src/zglobal.h
---- clean/lrzsz-0.12.20/src/zglobal.h	1998-12-29 12:34:59.000000000 +0000
-+++ lrzsz-0.12.20/src/zglobal.h	2019-11-25 16:32:42.000000000 +0000
+Index: lrzsz-0.12.20/src/zglobal.h
+===================================================================
+--- lrzsz-0.12.20.orig/src/zglobal.h
++++ lrzsz-0.12.20/src/zglobal.h
 @@ -180,9 +180,6 @@ struct termios;
  #if HAVE_LOCALE_H
  # include <locale.h>
@@ -5742,8 +5776,9 @@ diff -uprN clean/lrzsz-0.12.20/src/zglobal.h lrzsz-0.12.20/src/zglobal.h
  
  #if ENABLE_NLS
  # include <libintl.h>
-diff -uprN clean/lrzsz-0.12.20/stamp-h.in lrzsz-0.12.20/stamp-h.in
---- clean/lrzsz-0.12.20/stamp-h.in	1998-12-30 07:51:07.000000000 +0000
-+++ lrzsz-0.12.20/stamp-h.in	1970-01-01 01:00:00.000000000 +0100
+Index: lrzsz-0.12.20/stamp-h.in
+===================================================================
+--- lrzsz-0.12.20.orig/stamp-h.in
++++ /dev/null
 @@ -1 +0,0 @@
 -timestamp
-- 
2.27.0

