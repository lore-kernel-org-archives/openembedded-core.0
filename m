Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id A2371791E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:24 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 8-v6so2530993oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cnstcpQ0M0ZlRYiwrQmPwD/8blyp8VC6rPxfvsHCJC0=;
	b=SHp9XtyzIlL8Y498vQzs+yst410/ppk7738DCS/QuFdkAERRohRLucHyUJ/MMhBvLy
	SouOH91LPF8Xb8sBrq9sllx23Ojpv0veLYuVnC09QaPEDf90owYGeEJoV60rxVdq+Ie2
	IWhtNMPhBXn3iqH1WtQOOTvqJSI478RK3t1LbJPvbQ5Qn0jsZUL22vwDf9lEBPVzl2Bi
	ImM6cEbbBAhl3lm5alrQ1gX1ChVn7TDE5zYdoSgdeV2vNLjsC2j4wTcwCGo33yMIxdbz
	FFYOl20LEAmXaamIdb3gC6buLgfKvHZ2/YizAIRZol+XQPINL7fLdJe8aY5giDtbImnO
	HVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cnstcpQ0M0ZlRYiwrQmPwD/8blyp8VC6rPxfvsHCJC0=;
	b=hkkO/xTuf0VAkLlwvzKxeT1VxIhFMbwkexhaFFryi9MwhPPkytv1+d6jkO4iTdgpg1
	KLsTmW0hbu0xq1fC/6SOoT9rRq2jLCuGh/w0lUfNBYw4VQkT2bTiKCGEeCtVNBGHurJY
	yGfwavIlD4svBI+wncx6Mi8CO6cULNqZlW0BrW+XmsBBDWGOKxNSpVZhfuuO3DImHmPj
	cC2R2wg3hjElDHgjuz+g967Lo7Q/eOaoqazB+YuOTNbu0Flu8DZefUdykGfMmP0F61QC
	Hy0GtxzqQtJZeMMa/1nd7Z9sc9OfFuRSAqe0omjOzqKZxlCvrBTysRiS5GcPe0YaRBgn
	2OZg==
X-Gm-Message-State: APzg51BbhPc4V8RQCoBGqL4baXxO7MwX9kP+oAujJbu5Sd90X+w3jM3Z
	gszq0i16rzgvRRaLwS12VdxlGGOiHb0=
X-Google-Smtp-Source: ANB0VdYUE29N0c/DkWah2ulKuEF7Uq6xGs4t8dkIZDk1NrBHjSKn7rUGicootz0NUK1zHiP8wd39wg==
X-Received: by 2002:aca:3a03:: with SMTP id
	h3-v6mr3380296oia.270.1534936645425; 
	Wed, 22 Aug 2018 04:17:25 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:25 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:41 +0530
Message-Id: <1534936615-11658-5-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 05/19] perl: CVE-2018-6798
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:24 -0000

From: Ferret on Shark <shark_admin@mvista.co>

* CVE-2018-6798-1
 The proximal cause is several instances in regexec.c of the code
 assuming that the input was valid UTF-8, whereas the input was too short
 for what the start byte claimed it would be.

 I grepped through the core for any other similar uses, and did not find
 any.

 (cherry picked from commit fe7d8ba0a1bf567af8fa8fea128e2b9f4c553e84)

* CVE-2018-6798-2
 The first patch for 132063 prevented the buffer read overflow when
 dumping the warning but didn't fix the underlying problem.

 The next change treats the supplied buffer correctly, preventing the
 non-UTF-8 SV from being treated as UTF-8, preventing the warning.

 (cherry picked from commit 1e8b61488f195e1396aa801c685340b156104f4f)

Affects perl >= 5.22 && perl <= 5.26

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../perl/perl/CVE-2018-6798-1.patch                | 130 +++++++++++++++++++++
 .../perl/perl/CVE-2018-6798-2.patch                |  37 ++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |   2 +
 3 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-6798-1.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-6798-2.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-6798-1.patch b/meta/recipes-devtools/perl/perl/CVE-2018-6798-1.patch
new file mode 100644
index 0000000..3477162
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-6798-1.patch
@@ -0,0 +1,130 @@
+From 0abf1e8d89aecd32dbdabda5da4d52a2d57a7cff Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Tue, 6 Feb 2018 14:50:48 -0700
+Subject: [PATCH] [perl #132063]: Heap buffer overflow
+
+The proximal cause is several instances in regexec.c of the code
+assuming that the input was valid UTF-8, whereas the input was too short
+for what the start byte claimed it would be.
+
+I grepped through the core for any other similar uses, and did not find
+any.
+
+(cherry picked from commit fe7d8ba0a1bf567af8fa8fea128e2b9f4c553e84)
+
+CVE: CVE-2018-6798
+Upstream-Status: Backport [https://perl5.git.perl.org/perl.git/patch/0abf1e8d89aecd32dbdabda5da4d52a2d57a7cff]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ regexec.c              | 29 ++++++++++++++++-------------
+ t/lib/warnings/regexec |  7 +++++++
+ 2 files changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/regexec.c b/regexec.c
+index 5735b997fd..ea432c39d3 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -1466,7 +1466,9 @@ Perl_re_intuit_start(pTHX_
+                                            ? trie_utf8_fold                         \
+                                            :   trie_latin_utf8_fold)))
+ 
+-#define REXEC_TRIE_READ_CHAR(trie_type, trie, widecharmap, uc, uscan, len, uvc, charid, foldlen, foldbuf, uniflags) \
++/* 'uscan' is set to foldbuf, and incremented, so below the end of uscan is
++ * 'foldbuf+sizeof(foldbuf)' */
++#define REXEC_TRIE_READ_CHAR(trie_type, trie, widecharmap, uc, uc_end, uscan, len, uvc, charid, foldlen, foldbuf, uniflags) \
+ STMT_START {                                                                        \
+     STRLEN skiplen;                                                                 \
+     U8 flags = FOLD_FLAGS_FULL;                                                     \
+@@ -1474,7 +1476,7 @@ STMT_START {
+     case trie_flu8:                                                                 \
+         _CHECK_AND_WARN_PROBLEMATIC_LOCALE;                                         \
+         if (utf8_target && UTF8_IS_ABOVE_LATIN1(*uc)) {                             \
+-            _CHECK_AND_OUTPUT_WIDE_LOCALE_UTF8_MSG(uc, uc + UTF8SKIP(uc));          \
++            _CHECK_AND_OUTPUT_WIDE_LOCALE_UTF8_MSG(uc, uc_end - uc);                \
+         }                                                                           \
+         goto do_trie_utf8_fold;                                                     \
+     case trie_utf8_exactfa_fold:                                                    \
+@@ -1483,7 +1485,7 @@ STMT_START {
+     case trie_utf8_fold:                                                            \
+       do_trie_utf8_fold:                                                            \
+         if ( foldlen>0 ) {                                                          \
+-            uvc = utf8n_to_uvchr( (const U8*) uscan, UTF8_MAXLEN, &len, uniflags ); \
++            uvc = utf8n_to_uvchr( (const U8*) uscan, foldlen, &len, uniflags );     \
+             foldlen -= len;                                                         \
+             uscan += len;                                                           \
+             len=0;                                                                  \
+@@ -1500,7 +1502,7 @@ STMT_START {
+         /* FALLTHROUGH */                                                           \
+     case trie_latin_utf8_fold:                                                      \
+         if ( foldlen>0 ) {                                                          \
+-            uvc = utf8n_to_uvchr( (const U8*) uscan, UTF8_MAXLEN, &len, uniflags ); \
++            uvc = utf8n_to_uvchr( (const U8*) uscan, foldlen, &len, uniflags );     \
+             foldlen -= len;                                                         \
+             uscan += len;                                                           \
+             len=0;                                                                  \
+@@ -1519,7 +1521,7 @@ STMT_START {
+         }                                                                           \
+         /* FALLTHROUGH */                                                           \
+     case trie_utf8:                                                                 \
+-        uvc = utf8n_to_uvchr( (const U8*) uc, UTF8_MAXLEN, &len, uniflags );        \
++        uvc = utf8n_to_uvchr( (const U8*) uc, uc_end - uc, &len, uniflags );        \
+         break;                                                                      \
+     case trie_plain:                                                                \
+         uvc = (UV)*uc;                                                              \
+@@ -2599,10 +2601,10 @@ S_find_byclass(pTHX_ regexp * prog, const regnode *c, char *s,
+                     }
+                     points[pointpos++ % maxlen]= uc;
+                     if (foldlen || uc < (U8*)strend) {
+-                        REXEC_TRIE_READ_CHAR(trie_type, trie,
+-                                         widecharmap, uc,
+-                                         uscan, len, uvc, charid, foldlen,
+-                                         foldbuf, uniflags);
++                        REXEC_TRIE_READ_CHAR(trie_type, trie, widecharmap, uc,
++                                             (U8 *) strend, uscan, len, uvc,
++                                             charid, foldlen, foldbuf,
++                                             uniflags);
+                         DEBUG_TRIE_EXECUTE_r({
+                             dump_exec_pos( (char *)uc, c, strend,
+                                         real_start, s, utf8_target, 0);
+@@ -5511,8 +5513,9 @@ S_regmatch(pTHX_ regmatch_info *reginfo, char *startpos, regnode *prog)
+ 		    if ( base && (foldlen || uc < (U8*)(reginfo->strend))) {
+ 			I32 offset;
+ 			REXEC_TRIE_READ_CHAR(trie_type, trie, widecharmap, uc,
+-					     uscan, len, uvc, charid, foldlen,
+-					     foldbuf, uniflags);
++                                             (U8 *) reginfo->strend, uscan,
++                                             len, uvc, charid, foldlen,
++                                             foldbuf, uniflags);
+ 			charcount++;
+ 			if (foldlen>0)
+ 			    ST.longfold = TRUE;
+@@ -5642,8 +5645,8 @@ S_regmatch(pTHX_ regmatch_info *reginfo, char *startpos, regnode *prog)
+ 			while (foldlen) {
+ 			    if (!--chars)
+ 				break;
+-			    uvc = utf8n_to_uvchr(uscan, UTF8_MAXLEN, &len,
+-					    uniflags);
++			    uvc = utf8n_to_uvchr(uscan, foldlen, &len,
++                                                 uniflags);
+ 			    uscan += len;
+ 			    foldlen -= len;
+ 			}
+diff --git a/t/lib/warnings/regexec b/t/lib/warnings/regexec
+index 900dd6ee7f..6635142dea 100644
+--- a/t/lib/warnings/regexec
++++ b/t/lib/warnings/regexec
+@@ -260,3 +260,10 @@ setlocale(&POSIX::LC_CTYPE, $utf8_locale);
+ "k" =~ /(?[ \N{KELVIN SIGN} ])/i;
+ ":" =~ /(?[ \: ])/;
+ EXPECT
++########
++# NAME perl #132063, read beyond buffer end
++# OPTION fatal
++"\xff" =~ /(?il)\x{100}|\x{100}/;
++EXPECT
++Malformed UTF-8 character: \xff (too short; 1 byte available, need 13) in pattern match (m//) at - line 2.
++Malformed UTF-8 character (fatal) at - line 2.
+-- 
+2.15.1-424-g9478a660812
+
diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-6798-2.patch b/meta/recipes-devtools/perl/perl/CVE-2018-6798-2.patch
new file mode 100644
index 0000000..fb9b41a
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-6798-2.patch
@@ -0,0 +1,37 @@
+From f65da1ca2eee74696d9c120e9d69af37b4fa1920 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Mon, 19 Feb 2018 15:11:42 +1100
+Subject: [PATCH] (perl #132063) we should no longer warn for this code
+
+The first patch for 132063 prevented the buffer read overflow when
+dumping the warning but didn't fix the underlying problem.
+
+The next change treats the supplied buffer correctly, preventing the
+non-UTF-8 SV from being treated as UTF-8, preventing the warning.
+
+(cherry picked from commit 1e8b61488f195e1396aa801c685340b156104f4f)
+
+CVE: CVE-2018-6798
+Upstream-Status: Backport [https://perl5.git.perl.org/perl.git/commitdiff/f65da1ca2eee74696d9c120e9d69af37b4fa1920]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ t/lib/warnings/regexec | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/t/lib/warnings/regexec b/t/lib/warnings/regexec
+index 6635142dea..c370ddc3c7 100644
+--- a/t/lib/warnings/regexec
++++ b/t/lib/warnings/regexec
+@@ -262,8 +262,5 @@ setlocale(&POSIX::LC_CTYPE, $utf8_locale);
+ EXPECT
+ ########
+ # NAME perl #132063, read beyond buffer end
+-# OPTION fatal
+ "\xff" =~ /(?il)\x{100}|\x{100}/;
+ EXPECT
+-Malformed UTF-8 character: \xff (too short; 1 byte available, need 13) in pattern match (m//) at - line 2.
+-Malformed UTF-8 character (fatal) at - line 2.
+-- 
+2.15.1-424-g9478a660812
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 91f310d..311df40 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -66,6 +66,8 @@ SRC_URI += " \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
         file://CVE-2017-12883.patch \
         file://CVE-2017-12837.patch \
+        file://CVE-2018-6798-1.patch \
+        file://CVE-2018-6798-2.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


