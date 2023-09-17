Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AC7CD13DD
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.27146.1694943560136148410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kOUku9J2;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a9d6b98845so1014903666b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943558; x=1695548358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3PVbFTI1PRTnHlCVGxsuzDSfECaiW8HH0Egx6I3MYg=;
        b=kOUku9J2JaRFCn7uNpswX+R2BMGikaIlXOJx8dNHxsYXm8+/dZ4N41vx/AD946rtwE
         wG0+JLDw/N3ZBpsskGuoEiteNmsl2WyZALkq6cDui04+5KDM1XCLDkFAgMWx95FESL/c
         8lphWdXjcQ41+sTM+XKMY6HYMG7Czw+RbueB/Dy5k5hYlANr0okMUHCGZEK6UJqxTI72
         fA238T2WyoZeCyBPgw3czvDbKf7D9ZsIJQbzeIkVlJwA4ZFC3c2Z9fLoUTOeYZypaN2q
         lYcR8+VfTd+2KlN0n7mPntw01YLKX6pav79UovcIvG0dkPCz7NZwufmCB9xYR5S51DWI
         fMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943558; x=1695548358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3PVbFTI1PRTnHlCVGxsuzDSfECaiW8HH0Egx6I3MYg=;
        b=gNDC/Oq/1oIJDIB5fPErjuhOKxYM5PpzAuSPfvUHkcFGPVCR4Ps9GwejyPVUrd+4R9
         p7vf2OPWM+J+BdkYSAOMYizOMlo+x0VMBjoWpk+b/sh4Kfwrg7y4M1HzCMGNxh6KmYLX
         OtaiUDlRK/tRtzLHXLi/M6g4DqFLJKovXGN3lbH3VNM3H+wzj5rRnPiLtdVZL3H4uDnR
         4sdUjLVJ9tjnG9vVaedqZ4EClZiYN01UMWLOY5OPb0cucPrwquVTqMw0JP2gdYgZaGxW
         +YvQ0sIDGmM4ZYN6AVILeVEpKDfkvjqTufPAsfI2k7bDEsO/GWESCFBj/fXBouINdBo4
         W9IQ==
X-Gm-Message-State: AOJu0Yz+TdrHRrrOSizPSihUshP1krIdBWGzlPrj5oSOTO3N0INcsyNX
	17h4g5TGddyJE0OFLyPTQRBD1Xxregs=
X-Google-Smtp-Source: AGHT+IG3BIxqVRrSklaMM0JH8xbvGLAPPKg0aWky49sSFXXuUWjALw5kuWp7cJ0UdFNXlbGRluG5/Q==
X-Received: by 2002:a17:906:794f:b0:9a5:962c:cb6c with SMTP id l15-20020a170906794f00b009a5962ccb6cmr13932216ejo.31.1694943558566;
        Sun, 17 Sep 2023 02:39:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/29] procps: update 4.0.3 -> 4.0.4
Date: Sun, 17 Sep 2023 11:38:55 +0200
Message-Id: <20230917093901.428214-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187796

Drop patches as all issues resolved upstream; one of them is a CVE backport.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-address-failures-with-gettext-0.22.patch | 37 ----------
 .../procps/0001-src-w.c-use-utmp.h-only.patch | 65 -----------------
 .../procps/procps/CVE-2023-4016.patch         | 73 -------------------
 .../{procps_4.0.3.bb => procps_4.0.4.bb}      |  5 +-
 4 files changed, 1 insertion(+), 179 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch
 delete mode 100644 meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch
 delete mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch
 rename meta/recipes-extended/procps/{procps_4.0.3.bb => procps_4.0.4.bb} (94%)

diff --git a/meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch b/meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch
deleted file mode 100644
index 805517900de..00000000000
--- a/meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1d685477c254e5b10a81e32c87786e0f001b70f1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 24 Jul 2023 18:06:51 +0200
-Subject: [PATCH] po/fr.po: address failures with gettext 0.22
-
-Specifically:
-| fr.1po:3027: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In the directive number 4, the argument size specifier is invalid.
-| fr.1po:3820: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In the directive number 1, the argument size specifier is invalid.
-
-Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/199]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- po/fr.po | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/po/fr.po b/po/fr.po
-index 715c2b69..700834e1 100644
---- a/po/fr.po
-+++ b/po/fr.po
-@@ -3800,7 +3800,7 @@ msgid ""
- "Type 'q' or <Esc> to continue "
- msgstr ""
- "Aide pour les commandes interactives~2 - %s\n"
--"Fenêtre ~1%s~6: ~1Mode cumulatif ~3%s~2.  ~1Système~6: ~1Délai ~3%.1lf "
-+"Fenêtre ~1%s~6: ~1Mode cumulatif ~3%s~2.  ~1Système~6: ~1Délai ~3%.1f "
- "secs~2; ~1Mode sûr ~3%s~2.\n"
- "\n"
- "  Z~5,~1B~5,E,e   Global: «~1Z~2» couleurs; «~1B~2» gras; «~1E~2»/«~1e~2» "
-@@ -4723,7 +4723,7 @@ msgstr " -v, --version  affiche les informations de version et sort\n"
- #: src/watch.c:486
- #, c-format
- msgid "Every %.1fs: "
--msgstr "Toutes les %.1lfs: "
-+msgstr "Toutes les %.1fs: "
- 
- #: src/watch.c:487
- #, c-format
diff --git a/meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch b/meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch
deleted file mode 100644
index 23c91ec7751..00000000000
--- a/meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c41b3be62fbb78e0939fddaebad519360cbd8702 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 6 Mar 2023 09:27:57 +0100
-Subject: [PATCH] src/w.c: use only utmpx
-
-Nowadays this works both on musl and glibc systems, however on musl
-utmp.h is also needed to avoid the following failure:
-
-| ../git/src/w.c: In function 'print_from':
-| ../git/src/w.c:73:28: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
-|    73 | #       define UT_HOSTSIZE __UT_HOSTSIZE
-|       |                            ^~~~~~~~~~~~~
-| ../git/src/w.c:233:64: note: in expansion of macro 'UT_HOSTSIZE'
-|   233 |                         print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
-|       |                                                                ^~~~~~~~~~~
-|
-
-It is caused by including utmpx.h, but not utmp.h, which (on musl)
-lacks the needed definitions.
-
-I have verified that both musl and glibc based builds continue to work.
-
-Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/171]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- src/w.c | 17 ++---------------
- 1 file changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/src/w.c b/src/w.c
-index 5e878f04..912c5df3 100644
---- a/src/w.c
-+++ b/src/w.c
-@@ -46,11 +46,8 @@
- #include <termios.h>
- #include <time.h>
- #include <unistd.h>
--#ifdef HAVE_UTMPX_H
--#	include <utmpx.h>
--#else
--#	include <utmp.h>
--#endif
-+#include <utmp.h>
-+#include <utmpx.h>
- #include <arpa/inet.h>
- 
- #include "c.h"
-@@ -63,17 +60,7 @@
- static int ignoreuser = 0;	/* for '-u' */
- static int oldstyle = 0;	/* for '-o' */
- 
--#ifdef HAVE_UTMPX_H
- typedef struct utmpx utmp_t;
--#else
--typedef struct utmp utmp_t;
--#endif
--
--#if !defined(UT_HOSTSIZE) || defined(__UT_HOSTSIZE)
--#	define UT_HOSTSIZE __UT_HOSTSIZE
--#	define UT_LINESIZE __UT_LINESIZE
--#	define UT_NAMESIZE __UT_NAMESIZE
--#endif
- 
- #ifdef W_SHOWFROM
- # define FROM_STRING "on"
diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
deleted file mode 100644
index 202fea91f1d..00000000000
--- a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 2c933ecba3bb1d3041a5a7a53a7b4078a6003413 Mon Sep 17 00:00:00 2001
-From: Craig Small <csmall@dropbear.xyz>
-Date: Thu, 10 Aug 2023 21:18:38 +1000
-Subject: [PATCH] ps: Fix possible buffer overflow in -C option
-
-ps allocates memory using malloc(length of arg * len of struct).
-In certain strange circumstances, the arg length could be very large
-and the multiplecation will overflow, allocating a small amount of
-memory.
-
-Subsequent strncpy() will then write into unallocated memory.
-The fix is to use calloc. It's slower but this is a one-time
-allocation. Other malloc(x * y) calls have also been replaced
-by calloc(x, y)
-
-References:
- https://www.freelists.org/post/procps/ps-buffer-overflow-CVE-20234016
- https://nvd.nist.gov/vuln/detail/CVE-2023-4016
- https://gitlab.com/procps-ng/procps/-/issues/297
- https://bugs.debian.org/1042887
-
-Signed-off-by: Craig Small <csmall@dropbear.xyz>
-
-CVE: CVE-2023-4016
-Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/2c933ecba3bb1d3041a5a7a53a7b4078a6003413]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- NEWS            | 1 +
- src/ps/parser.c | 8 ++++----
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/src/ps/parser.c b/src/ps/parser.c
-index 248aa741..15873dfa 100644
---- a/src/ps/parser.c
-+++ b/src/ps/parser.c
-@@ -189,7 +189,6 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
-   const char *err;       /* error code that could or did happen */
-   /*** prepare to operate ***/
-   node = xmalloc(sizeof(selection_node));
--  node->u = xmalloc(strlen(arg)*sizeof(sel_union)); /* waste is insignificant */
-   node->n = 0;
-   buf = strdup(arg);
-   /*** sanity check and count items ***/
-@@ -210,6 +209,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
-   } while (*++walk);
-   if(need_item) goto parse_error;
-   node->n = items;
-+  node->u = xcalloc(items, sizeof(sel_union));
-   /*** actually parse the list ***/
-   walk = buf;
-   while(items--){
-@@ -1050,15 +1050,15 @@ static const char *parse_trailing_pids(void){
-   thisarg = ps_argc - 1;   /* we must be at the end now */
- 
-   pidnode = xmalloc(sizeof(selection_node));
--  pidnode->u = xmalloc(i*sizeof(sel_union)); /* waste is insignificant */
-+  pidnode->u = xcalloc(i, sizeof(sel_union)); /* waste is insignificant */
-   pidnode->n = 0;
- 
-   grpnode = xmalloc(sizeof(selection_node));
--  grpnode->u = xmalloc(i*sizeof(sel_union)); /* waste is insignificant */
-+  grpnode->u = xcalloc(i,sizeof(sel_union)); /* waste is insignificant */
-   grpnode->n = 0;
- 
-   sidnode = xmalloc(sizeof(selection_node));
--  sidnode->u = xmalloc(i*sizeof(sel_union)); /* waste is insignificant */
-+  sidnode->u = xcalloc(i, sizeof(sel_union)); /* waste is insignificant */
-   sidnode->n = 0;
- 
-   while(i--){
--- 
-GitLab
-
diff --git a/meta/recipes-extended/procps/procps_4.0.3.bb b/meta/recipes-extended/procps/procps_4.0.4.bb
similarity index 94%
rename from meta/recipes-extended/procps/procps_4.0.3.bb
rename to meta/recipes-extended/procps/procps_4.0.4.bb
index 9ef679c6bd8..800384f22f7 100644
--- a/meta/recipes-extended/procps/procps_4.0.3.bb
+++ b/meta/recipes-extended/procps/procps_4.0.4.bb
@@ -14,11 +14,8 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
-           file://0001-src-w.c-use-utmp.h-only.patch \
-           file://0001-po-fr.po-address-failures-with-gettext-0.22.patch \
-           file://CVE-2023-4016.patch \
            "
-SRCREV = "806eb270f217ff7e1e745c7bda2b002b5be74be4"
+SRCREV = "4ddcef2fd843170c8e2d59a83042978f41037a2b"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


