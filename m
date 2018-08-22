Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 97739792A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:42 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b15-v6so2458785oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ottu2vJCfxqGEpLnOozyDkmr4ynItCK05+Wp007J3ow=;
	b=NfU3vyi2rwWbDWXP3UBQeNh7I32c9sSX3nV7SuMayacL87oVWYaImYmId7OTOlt5Rk
	7AinmMw5V4sJtfCtWN2F1cnwe13A8NGa6MXKs3X9gM77pg3n2H58yjLehTVLokaLg5ja
	Zes3TjHZxyDvttHxC8tZIwihPJzhuiTiLN+5P+fg4vLf6sinbg3Xy/U6XmwEjsucenU1
	me72lt9ZAvwHMmJvvSXdJe56CeHi7z7QoeEzxOMvc4qjqVXEY8Igovz+P2uYa0I/DzhO
	jsEEv4NY6PY1y2DAoD28vmBbcGqtGKaALP6gJMG1PZBeZO88ZOsN/+rhV9Zcn0jdskTV
	JXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ottu2vJCfxqGEpLnOozyDkmr4ynItCK05+Wp007J3ow=;
	b=khlUTIMzMh+BXODtjD6j506KgbCvnAcif6pfTvbsEUPPTPK1r2TDvr+1vq1KP5OT9J
	e1/Y72acI+eJ1M85Ozsnqa98lOkmfut4NQWbUkR4OhQCqR1690Rk7zuApAQoe55kCzJX
	Hb2FgKXrTD/eUdEi4ftayps6SBYyH140l7WYzu1ls9cbLya4KFtJK+757h4EWghKQIy9
	AUgJHk4gCCW94q+d0LalWUDvadyW/Jvma64AC+gMR68jDwuEHBGWJMjGRTbYYeD7Gmfg
	CQhyWEvS3gvuJIhkN3rN36dMMG7tQ8gs4MTTUtejRlp2rK27U2w69E1jQOC3Q5eRzJKk
	0x7A==
X-Gm-Message-State: APzg51BM3/avS7hqod+yUjIS/MYJM/aDyuGlbUtrZlNXay2903dBz6ba
	VL1Xn9UNnutqZkkJyG4y1fveM90inUo=
X-Google-Smtp-Source: ANB0VdZxx15QC2RIDtCoAncSdgjxEAeewcXCR0pOCEN0x5Bsmij3Hj0vd0SxflHLKd8DHZsBbEmsOg==
X-Received: by 2002:aca:f383:: with SMTP id
	r125-v6mr3614125oih.6.1534936723562; 
	Wed, 22 Aug 2018 04:18:43 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:43 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:48 +0530
Message-Id: <1534936692-11736-10-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 10/34] perl: CVE-2018-6798
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:43 -0000

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
index ac78dda..e696910 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -68,6 +68,8 @@ SRC_URI += " \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
         file://CVE-2017-12883.patch \
         file://CVE-2017-12837.patch \
+        file://CVE-2018-6798-1.patch \
+        file://CVE-2018-6798-2.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


