Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCAA7BDBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:52 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id p6so4910250lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BfRcqF9KIC9ymETBjguJZ+bgbtfusKlJhzqKCpLw0yg=;
	b=O436ITrKnyO7W9MZkjkIyutelqK0ab//lsMQqpUUDAglHFjvhh7ZT0686ipjYvbhpj
	k9Y+u4trHtSbJwv/RLkSsn3e7b2fvnNxpPh0vbD2uDb1YKW5uBXjiGDwBpo/6NjH7w1q
	0XKqRP90JbmxFG9HNM+NlCQvmAxAeIZtDT+lPI/al8cyNNMiMmFyJOIXX3sdbSkH2slA
	WXNVsdPbjX/dwdR/8dqQ1tQjrooxCyZt/cMorf9ACakfAbsnbjWxAlMukaPKSl/5PX+w
	QhFQP7s5QP+fg7tvB0Tyhg9qkdsYOWEQVBDQUhcHVbuZjsxao7hu2OG4Nz8Re3MV/9JD
	Nqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BfRcqF9KIC9ymETBjguJZ+bgbtfusKlJhzqKCpLw0yg=;
	b=eIXLRLAuE0L+7R6GSkA7cshZttkpfqwYySjgUvrbunHehpIOGZFBpI6RRadNfASBfo
	Pk+z9S2Lq4+++IlHzMyDp7v3QAMR5avXFt9juhDcBIqrb6NZ9ouRWRe7y8JcKjLMtHif
	NoURlmaoSpfHJjtUI0VKiVTSd53YVMC0emp19Am+f/bEV1JC00qmWNjc38ptUJdd4FF3
	oX7RkUD035pLxlf4e1negdcNludMU3b7kBQ6c+KJNYLWX0X+QriTaGeb0ijj00JCGs4M
	XpL/Fvkx7EHvoKKAzAoifULFV9gspADwyWvwQzhWurkuEGpScXH4CqP1a/91QyW9lFc+
	qibw==
X-Gm-Message-State: AA+aEWYoAGKzKsztqOyz8EdJjFytr+RSjB063HC8/Uaki+op0QlRq6Wd
	SlVzgCPZFYL3zPMIQQ/eARrGMjFg
X-Google-Smtp-Source: AFSGD/VLAIqOzf5AHOJOadNYNEQmNvvbXYSvBazenZxDHqkrJXQpcH11IUaUU7UGP3siBThGiKByjw==
X-Received: by 2002:a19:4948:: with SMTP id l8mr2463287lfj.156.1544810153293; 
	Fri, 14 Dec 2018 09:55:53 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:52 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:39 +0200
Message-Id: <1544810082-22164-11-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 10/13] gcc: Fix preprocessor redefines for header pathes
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:53 -0000

When building for powerpc64 using musl as C library we get preprocessor
macro redefinition errors since gcc-configure-common.inc adds #define
of STANDARD_STARTFILE_PREFIX_1 and STANDARD_STARTFILE_PREFIX_2 to
gcc/defaults.h after ones added by a patch that ensures target gcc
headers included.

Since gcc-configure-common.inc included in every gcc recipe either
directly or indirectly, do_configure task is not disabled/deleted for
any of them (except gcc-source.inc) and there is no precondition that
skips gcc/defaults.h patching in
gcc-configure-common.inc::do_configure_prepend() we can just remove
conflicting parts of mentioned above patch to have single place where
start files prefixes defined in do_configure() task.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 ...Ensure-target-gcc-headers-can-be-included.patch | 36 ----------------------
 ...Ensure-target-gcc-headers-can-be-included.patch | 36 ----------------------
 2 files changed, 72 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
index 568ba95..c6ecce9 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
@@ -57,42 +57,6 @@ index 10b96eca0a7..c8da0884872 100644
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
      { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
-diff --git a/gcc/defaults.h b/gcc/defaults.h
-index 7ad92d920f8..39848cc9c0e 100644
---- a/gcc/defaults.h
-+++ b/gcc/defaults.h
-@@ -1475,4 +1475,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
- #endif
- 
-+/* Default prefixes to attach to command names.  */
-+
-+#ifndef STANDARD_STARTFILE_PREFIX_1
-+#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
-+#endif
-+#ifndef STANDARD_STARTFILE_PREFIX_2
-+#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
-+#endif
-+
- #endif  /* ! GCC_DEFAULTS_H */
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index c73d4023987..b27245dbf77 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1472,13 +1472,6 @@ static const char *gcc_libexec_prefix;
- 
- /* Default prefixes to attach to command names.  */
- 
--#ifndef STANDARD_STARTFILE_PREFIX_1
--#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
--#endif
--#ifndef STANDARD_STARTFILE_PREFIX_2
--#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
--#endif
--
- #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
- #undef MD_EXEC_PREFIX
- #undef MD_STARTFILE_PREFIX
 -- 
 2.12.2
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
index 4d4da1a..73db3e6 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
@@ -57,42 +57,6 @@ index b36a979d5ba..e2e187dedaf 100644
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
      { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
-diff --git a/gcc/defaults.h b/gcc/defaults.h
-index 78a08a33f12..c8851277674 100644
---- a/gcc/defaults.h
-+++ b/gcc/defaults.h
-@@ -1451,4 +1451,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
- #endif
- 
-+/* Default prefixes to attach to command names.  */
-+
-+#ifndef STANDARD_STARTFILE_PREFIX_1
-+#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
-+#endif
-+#ifndef STANDARD_STARTFILE_PREFIX_2
-+#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
-+#endif
-+
- #endif  /* ! GCC_DEFAULTS_H */
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 570cdc00034..3fb64d453f1 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1464,13 +1464,6 @@ static const char *gcc_libexec_prefix;
- 
- /* Default prefixes to attach to command names.  */
- 
--#ifndef STANDARD_STARTFILE_PREFIX_1
--#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
--#endif
--#ifndef STANDARD_STARTFILE_PREFIX_2
--#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
--#endif
--
- #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
- #undef MD_EXEC_PREFIX
- #undef MD_STARTFILE_PREFIX
 -- 
 2.17.0
 
-- 
2.7.4


