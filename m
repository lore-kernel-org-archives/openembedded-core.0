Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8EE79396
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:28 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id c190-v6so2490234oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=olDjmOb7J/WS7EY3FcxpZuHz51TGSvturhDazzAh/Ew=;
	b=X962HfZ7wE3KuUOh+oyLXilRdj0RPR+Te5aAay0a6HgENdFBbH7MZnmrsREcB4aOR/
	EfXF7WbCRmiAzpDpc0BqXdQ/CGDA7EROczklWGLseycpIbkbU07LWY6nh0NUwmkmqoni
	I6lHNjtRMl2tXkbhx044vn/q2T+9N6C0/9jIF8UpA9vTL0nffOCJs68tbr8Hw7QFKX8V
	5im4FCk9ZDVYYygzQVqiuewci58539X/71U0LpYOi6vGK1+PaOnA5AMYT2c0hn8I+NGv
	BI+3+Jre7kpK1RoHBG7fMFbC9LSlUIZnplq6yU9et0pJ0ffs4rA1qlKPbW60m7v5T7H2
	2nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=olDjmOb7J/WS7EY3FcxpZuHz51TGSvturhDazzAh/Ew=;
	b=aaLv0c9K8SelQaO2E+yoj3I4dk8rWIwEVE/4+AF/nxrQxwdsDBd802Wmd46//RYoqF
	ij10+J6PYDLeMnoc//xGf+HKN75xpOyjDn1hdzvrlKs12s0eTml5G82dtgE8Sfaz5BF4
	EhIfRYiGn93UOdixTpXF4C+11saNSEz1PwejrSCr2Oic6QaVBgFSwcd9uP8SKCpv6GtV
	sip/rSKCTO2hsdzy0Ft/Pix/CrQM2V+JcR2hhyKivnAy89pd/QkwOFc2BJuGn4YF7IWr
	6iJU1OVerOjWKG6joAo65z5ZYy7SmZXnUy9qO8s7vBGAullEf6ss8MN6oalhMJGEZmPU
	uH0Q==
X-Gm-Message-State: APzg51AHLqE0y9qkTWB22YkMbUxIEfkKjOn/Ievz879IgQ1KkhpAHXy2
	7MboiJsXxoCrZVPlBUBhdm6oE2l9eTw=
X-Google-Smtp-Source: ANB0VdboZ3L5cVryByLzP8caDylvjQjVRpkTcj3ctXwV8Gx2kM/cwIRFVUbqxEwpCSqkcsLzWkQnLw==
X-Received: by 2002:aca:b904:: with SMTP id j4-v6mr3590153oif.89.1534936768979;
	Wed, 22 Aug 2018 04:19:28 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:28 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:06 +0530
Message-Id: <1534936692-11736-28-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 28/34] perl: CVE-2018-6913
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:28 -0000

(perl #131844) fix various space calculation issues in
 pp_pack.c

- for the originally reported case, if the start/cur pointer is in the
  top 75% of the address space the add (cur) + glen addition would
  overflow, resulting in the condition failing incorrectly.

- the addition of the existing space used to the space needed could
  overflow, resulting in too small an allocation and a buffer overflow.

- the scaling for UTF8 could overflow.

- the multiply to calculate the space needed for many items could
  overflow.

For the first case, do a space calculation without making new pointers.

For the other cases, detect the overflow and croak if there's an
overflow.

Originally this used Size_t_MAX as the maximum size of a memory
allocation, but for -DDEBUGGING builds realloc() throws a panic for
allocations over half the address space in size, changing the error
reported for the allocation.

For non-DEBUGGING builds the Size_t_MAX limit has the small chance
of finding a system that has 3GB of contiguous space available, and
allocating that space, which could be a denial of servce in some cases.

Unfortunately changing the limit to half the address space means that
the exact case with the original issue can no longer occur, so the
test is no longer testing against the address + length issue that
caused the original problem, since the allocation is failing earlier.

One option would be to change the test so the size request by pack is
just under 2GB, but this has a higher (but still low) probability that
the system has the address space available, and will actually try to
allocate the memory, so let's not do that.

Note: changed
plan tests => 14713;
to
plan tests => 14712;
in a/t/op/pack.t
to apply this patch on perl 5.24.1.

Affects perl < 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/perl/perl/CVE-2018-6913.patch | 153 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-6913.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-6913.patch b/meta/recipes-devtools/perl/perl/CVE-2018-6913.patch
new file mode 100644
index 0000000..5df47dc
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-6913.patch
@@ -0,0 +1,153 @@
+From f17fed5006177dce8ac48229c424a2da0d6ba492 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 8 Aug 2017 09:32:58 +1000
+Subject: [PATCH] (perl #131844) fix various space calculation issues in
+ pp_pack.c
+
+- for the originally reported case, if the start/cur pointer is in the
+  top 75% of the address space the add (cur) + glen addition would
+  overflow, resulting in the condition failing incorrectly.
+
+- the addition of the existing space used to the space needed could
+  overflow, resulting in too small an allocation and a buffer overflow.
+
+- the scaling for UTF8 could overflow.
+
+- the multiply to calculate the space needed for many items could
+  overflow.
+
+For the first case, do a space calculation without making new pointers.
+
+For the other cases, detect the overflow and croak if there's an
+overflow.
+
+Originally this used Size_t_MAX as the maximum size of a memory
+allocation, but for -DDEBUGGING builds realloc() throws a panic for
+allocations over half the address space in size, changing the error
+reported for the allocation.
+
+For non-DEBUGGING builds the Size_t_MAX limit has the small chance
+of finding a system that has 3GB of contiguous space available, and
+allocating that space, which could be a denial of servce in some cases.
+
+Unfortunately changing the limit to half the address space means that
+the exact case with the original issue can no longer occur, so the
+test is no longer testing against the address + length issue that
+caused the original problem, since the allocation is failing earlier.
+
+One option would be to change the test so the size request by pack is
+just under 2GB, but this has a higher (but still low) probability that
+the system has the address space available, and will actually try to
+allocate the memory, so let's not do that.
+
+Note: changed 
+plan tests => 14713;
+to 
+plan tests => 14712;
+in a/t/op/pack.t
+to apply this patch on perl 5.24.1.
+
+CVE: CVE-2018-6913
+Upstream-Status: Backport [https://perl5.git.perl.org/perl.git/commitdiff/f17fed5006177dce8ac48229c424a2da0d6ba492]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ pp_pack.c   | 25 +++++++++++++++++++++----
+ t/op/pack.t | 24 +++++++++++++++++++++++-
+ 2 files changed, 44 insertions(+), 5 deletions(-)
+
+diff --git a/pp_pack.c b/pp_pack.c
+index 8937d6d715..5e9cc64301 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -357,11 +357,28 @@ STMT_START {							\
+     }								\
+ } STMT_END
+ 
++#define SAFE_UTF8_EXPAND(var)	\
++STMT_START {				\
++    if ((var) > SSize_t_MAX / UTF8_EXPAND) \
++        Perl_croak(aTHX_ "%s", "Out of memory during pack()"); \
++    (var) = (var) * UTF8_EXPAND; \
++} STMT_END
++
++#define GROWING2(utf8, cat, start, cur, item_size, item_count)	\
++STMT_START {							\
++    if (SSize_t_MAX / (item_size) < (item_count))		\
++        Perl_croak(aTHX_ "%s", "Out of memory during pack()");	\
++    GROWING((utf8), (cat), (start), (cur), (item_size) * (item_count)); \
++} STMT_END
++
+ #define GROWING(utf8, cat, start, cur, in_len)	\
+ STMT_START {					\
+     STRLEN glen = (in_len);			\
+-    if (utf8) glen *= UTF8_EXPAND;		\
+-    if ((cur) + glen >= (start) + SvLEN(cat)) {	\
++    STRLEN catcur = (STRLEN)((cur) - (start));	\
++    if (utf8) SAFE_UTF8_EXPAND(glen);		\
++    if (SSize_t_MAX - glen < catcur)		\
++        Perl_croak(aTHX_ "%s", "Out of memory during pack()"); \
++    if (catcur + glen >= SvLEN(cat)) {	\
+ 	(start) = sv_exp_grow(cat, glen);	\
+ 	(cur) = (start) + SvCUR(cat);		\
+     }						\
+@@ -371,7 +388,7 @@ STMT_START {					\
+ STMT_START {					\
+     const STRLEN glen = (in_len);		\
+     STRLEN gl = glen;				\
+-    if (utf8) gl *= UTF8_EXPAND;		\
++    if (utf8) SAFE_UTF8_EXPAND(gl);		\
+     if ((cur) + gl >= (start) + SvLEN(cat)) {	\
+         *cur = '\0';				\
+         SvCUR_set((cat), (cur) - (start));	\
+@@ -2131,7 +2148,7 @@ S_pack_rec(pTHX_ SV *cat, tempsym_t* symptr, SV **beglist, SV **endlist )
+ 	    if (props && !(props & PACK_SIZE_UNPREDICTABLE)) {
+ 		/* We can process this letter. */
+ 		STRLEN size = props & PACK_SIZE_MASK;
+-		GROWING(utf8, cat, start, cur, (STRLEN) len * size);
++		GROWING2(utf8, cat, start, cur, size, (STRLEN)len);
+ 	    }
+         }
+ 
+diff --git a/t/op/pack.t b/t/op/pack.t
+index 664aaaf1b0..cf0e286509 100644
+--- a/t/op/pack.t
++++ b/t/op/pack.t
+@@ -12,7 +12,7 @@ my $no_endianness = $] > 5.009 ? '' :
+ my $no_signedness = $] > 5.009 ? '' :
+   "Signed/unsigned pack modifiers not available on this perl";
+ 
+-plan tests => 14712;
++plan tests => 14717;
+ 
+ use strict;
+ use warnings qw(FATAL all);
+@@ -2059,3 +2059,25 @@ print pack("ucW", "0000", 0, 140737488355327) eq "\$,#`P,```\n\0\x{7fffffffffff}
+  ? "ok\n" : "not ok\n";
+ EOS
+ }
++
++SKIP:
++{
++  # [perl #131844] pointer addition overflow
++    $Config{ptrsize} == 4
++      or skip "[perl #131844] need 32-bit build for this test", 4;
++    # prevent ASAN just crashing on the allocation failure
++    local $ENV{ASAN_OPTIONS} = $ENV{ASAN_OPTIONS};
++    $ENV{ASAN_OPTIONS} .= ",allocator_may_return_null=1";
++    fresh_perl_like('pack "f999999999"', qr/Out of memory during pack/, { stderr => 1 },
++		    "pointer addition overflow");
++
++    # integer (STRLEN) overflow from addition of glen to current length
++    fresh_perl_like('pack "c10f1073741823"', qr/Out of memory during pack/, { stderr => 1 },
++		    "integer overflow calculating allocation (addition)");
++
++    fresh_perl_like('pack "W10f536870913", 256', qr/Out of memory during pack/, { stderr => 1 },
++		    "integer overflow calculating allocation (utf8)");
++
++    fresh_perl_like('pack "c10f1073741824"', qr/Out of memory during pack/, { stderr => 1 },
++		    "integer overflow calculating allocation (multiply)");
++}
+-- 
+2.15.1-424-g9478a660812
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index dafd268..aec30c8 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -71,6 +71,7 @@ SRC_URI += " \
         file://CVE-2018-6798-1.patch \
         file://CVE-2018-6798-2.patch \
         file://CVE-2018-6797.patch \
+        file://CVE-2018-6913.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


