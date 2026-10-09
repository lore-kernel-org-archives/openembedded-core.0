Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE36CA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:47:29 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2873.1791571639753291869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eM/9KeKd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261009184717a379591b16000207ee-p_2drx@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261009184717a379591b16000207ee
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=S5UfHiw/PGjKL1/hhUnS7Qq29j1TOSZ4swmk5a/hUUo=;
 b=eM/9KeKdM0RM5n6Zmp514dAYbZiWmdgEzgxJYXNgD0HbHPMvbOb4F+QsMmHwbkSqi8advt
 xIfG+AcmRKtIEl+6M0kIyoWMBGloOe0iLsVOIvB+im/BaAeiWoE38+94IQWk2kBGBF41nqx8
 TURNB9A0uMfiJO3SADt2gIE7RIUe0oIHGN3S8MqYHFNPUfJbuIWDH3MKvyJrN67K0s53HcDD
 VAGNCz9Xy89PiS4egC7airDRIpvEhV6McvWbEgmEm0MbDWA9ZKH5BQTEFc4rqqbvnus8gdfN
 gZEXzne4DhSXuTbV+mWyt67b+yTdl3V1yO+0ghpB7qm3PsVwVdyFDd/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 5/8] libpcre2: patch CVE-2026-89160
Date: Fri,  9 Oct 2026 20:45:45 +0200
Message-ID: <20261009184548.2962197-5-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247480

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide it.

[1] https://security-tracker.debian.org/tracker/CVE-2026-89160
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-9qww-pwc4-77qq

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-89160.patch     | 225 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch
new file mode 100644
index 0000000000..bff6bc83ef
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch
@@ -0,0 +1,225 @@
+From 4889caf31a4c5a6b3c051f0031bf2dbd78f2c287 Mon Sep 17 00:00:00 2001
+From: Nicholas Wilson <nicholas@nicholaswilson.me.uk>
+Date: Thu, 27 Aug 2026 16:52:16 +0100
+Subject: [PATCH] Fix invalid UTF backwards-scan reads; see GHSA-9qww-pwc4-77qq
+ for details
+
+CVE: CVE-2026-89160
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/4889caf31a4c5a6b3c051f0031bf2dbd78f2c287]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_extuni.c       | 10 +++++-----
+ src/pcre2_match.c        | 10 +++++-----
+ testdata/testinput10     | 10 ++++++++++
+ testdata/testinput12     | 10 ++++++++++
+ testdata/testoutput10    | 12 ++++++++++++
+ testdata/testoutput12-16 | 12 ++++++++++++
+ testdata/testoutput12-32 | 12 ++++++++++++
+ 7 files changed, 66 insertions(+), 10 deletions(-)
+
+diff --git a/src/pcre2_extuni.c b/src/pcre2_extuni.c
+index 1b7f04b4..fea098a7 100644
+--- a/src/pcre2_extuni.c
++++ b/src/pcre2_extuni.c
+@@ -54,12 +54,12 @@ support, because some compilers do not like functionless source files. */
+ 
+ #ifndef SUPPORT_UNICODE
+ PCRE2_SPTR
+-PRIV(extuni)(uint32_t c, PCRE2_SPTR eptr, PCRE2_SPTR start_subject,
++PRIV(extuni)(uint32_t c, PCRE2_SPTR eptr, PCRE2_SPTR check_subject,
+   PCRE2_SPTR end_subject, BOOL utf, int *xcount)
+ {
+ (void)c;
+ (void)eptr;
+-(void)start_subject;
++(void)check_subject;
+ (void)end_subject;
+ (void)utf;
+ (void)xcount;
+@@ -80,7 +80,7 @@ same behaviour.
+ Arguments:
+   c              the first character
+   eptr           pointer to next character
+-  start_subject  pointer to start of subject
++  check_subject  pointer to start of validated subject
+   end_subject    pointer to end of subject
+   utf            TRUE if in UTF mode
+   xcount         pointer to count of additional characters,
+@@ -90,7 +90,7 @@ Returns:         pointer after the end of the sequence
+ */
+ 
+ PCRE2_SPTR
+-PRIV(extuni)(uint32_t c, PCRE2_SPTR eptr, PCRE2_SPTR start_subject,
++PRIV(extuni)(uint32_t c, PCRE2_SPTR eptr, PCRE2_SPTR check_subject,
+   PCRE2_SPTR end_subject, BOOL utf, int *xcount)
+ {
+ BOOL was_ep_ZWJ = FALSE;
+@@ -121,7 +121,7 @@ while (eptr < end_subject)
+ 
+     /* bptr is pointing to the left-hand character */
+ 
+-    while (bptr > start_subject)
++    while (bptr > check_subject)
+       {
+       bptr--;
+       if (utf)
+diff --git a/src/pcre2_match.c b/src/pcre2_match.c
+index a5a8421f..966576e1 100644
+--- a/src/pcre2_match.c
++++ b/src/pcre2_match.c
+@@ -2893,7 +2893,7 @@ fprintf(stderr, "++ %2ld op=%3d %s\n", Fecode - mb->start_code, *Fecode,
+     else
+       {
+       GETCHARINCTEST(fc, Feptr);
+-      Feptr = PRIV(extuni)(fc, Feptr, mb->start_subject, mb->end_subject, utf,
++      Feptr = PRIV(extuni)(fc, Feptr, mb->check_subject, mb->end_subject, utf,
+         NULL);
+       }
+     CHECK_PARTIAL();
+@@ -3244,7 +3244,7 @@ fprintf(stderr, "++ %2ld op=%3d %s\n", Fecode - mb->start_code, *Fecode,
+           else
+             {
+             GETCHARINCTEST(fc, Feptr);
+-            Feptr = PRIV(extuni)(fc, Feptr, mb->start_subject,
++            Feptr = PRIV(extuni)(fc, Feptr, mb->check_subject,
+               mb->end_subject, utf, NULL);
+             }
+           CHECK_PARTIAL();
+@@ -4069,7 +4069,7 @@ fprintf(stderr, "++ %2ld op=%3d %s\n", Fecode - mb->start_code, *Fecode,
+           else
+             {
+             GETCHARINCTEST(fc, Feptr);
+-            Feptr = PRIV(extuni)(fc, Feptr, mb->start_subject, mb->end_subject,
++            Feptr = PRIV(extuni)(fc, Feptr, mb->check_subject, mb->end_subject,
+               utf, NULL);
+             }
+           CHECK_PARTIAL();
+@@ -4658,7 +4658,7 @@ fprintf(stderr, "++ %2ld op=%3d %s\n", Fecode - mb->start_code, *Fecode,
+           else
+             {
+             GETCHARINCTEST(fc, Feptr);
+-            Feptr = PRIV(extuni)(fc, Feptr, mb->start_subject, mb->end_subject,
++            Feptr = PRIV(extuni)(fc, Feptr, mb->check_subject, mb->end_subject,
+               utf, NULL);
+             }
+           CHECK_PARTIAL();
+@@ -6233,7 +6233,7 @@ fprintf(stderr, "++ %2ld op=%3d %s\n", Fecode - mb->start_code, *Fecode,
+       {
+       for (i = 0; i < Lmax; i++)
+         {
+-        if (Feptr == mb->start_subject)
++        if (Feptr <= mb->check_subject)
+           {
+           if (i < Lmin) RRETURN(MATCH_NOMATCH);
+           Lmax = i;
+diff --git a/testdata/testinput10 b/testdata/testinput10
+index d9e6ba8c..bfa9dad8 100644
+--- a/testdata/testinput10
++++ b/testdata/testinput10
+@@ -585,6 +585,16 @@
+     AAA\x80BXYZ 
+     AAA\x80BBXYZ 
+ 
++# Backward scans must not enter the invalid prefix before check_subject.
++
++/(?<=a{1,2})X/utf,match_invalid_utf
++\= Expect no match
++    \x80X
++
++/\X\X/utf,match_invalid_utf
++\= Expect no match
++    \x80\x{1f1e6}\x{1f1e7}
++
+ # -------------------------------------
+ 
+ /(*UTF)(?=\x{123})/I
+diff --git a/testdata/testinput12 b/testdata/testinput12
+index 01cc76a4..c4a89a26 100644
+--- a/testdata/testinput12
++++ b/testdata/testinput12
+@@ -498,6 +498,16 @@
+ /(..)(*scs:(1)ab$)/match_invalid_utf
+     ab\x{df00}cde         
+ 
++# Backward scans must not enter the invalid prefix before check_subject.
++
++/(?<=a{1,2})X/utf,match_invalid_utf
++\= Expect no match
++    \x{dc00}X
++
++/\X\X/utf,match_invalid_utf
++\= Expect no match
++    \x{dc00}\x{1f1e6}\x{1f1e7}
++
+ # ---------------------------------------------------- 
+ 
+ /(*UTF)(?=\x{123})/I
+diff --git a/testdata/testoutput10 b/testdata/testoutput10
+index 393ac207..9e124e2b 100644
+--- a/testdata/testoutput10
++++ b/testdata/testoutput10
+@@ -1779,6 +1779,18 @@ No match
+     AAA\x80BBXYZ 
+ No match
+ 
++# Backward scans must not enter the invalid prefix before check_subject.
++
++/(?<=a{1,2})X/utf,match_invalid_utf
++\= Expect no match
++    \x80X
++No match
++
++/\X\X/utf,match_invalid_utf
++\= Expect no match
++    \x80\x{1f1e6}\x{1f1e7}
++No match
++
+ # -------------------------------------
+ 
+ /(*UTF)(?=\x{123})/I
+diff --git a/testdata/testoutput12-16 b/testdata/testoutput12-16
+index d235c11f..b0676a19 100644
+--- a/testdata/testoutput12-16
++++ b/testdata/testoutput12-16
+@@ -1659,6 +1659,18 @@ No match
+  0: ab
+  1: ab
+ 
++# Backward scans must not enter the invalid prefix before check_subject.
++
++/(?<=a{1,2})X/utf,match_invalid_utf
++\= Expect no match
++    \x{dc00}X
++No match
++
++/\X\X/utf,match_invalid_utf
++\= Expect no match
++    \x{dc00}\x{1f1e6}\x{1f1e7}
++No match
++
+ # ---------------------------------------------------- 
+ 
+ /(*UTF)(?=\x{123})/I
+diff --git a/testdata/testoutput12-32 b/testdata/testoutput12-32
+index 725cb274..a97051a6 100644
+--- a/testdata/testoutput12-32
++++ b/testdata/testoutput12-32
+@@ -1658,6 +1658,18 @@ No match
+  0: ab
+  1: ab
+ 
++# Backward scans must not enter the invalid prefix before check_subject.
++
++/(?<=a{1,2})X/utf,match_invalid_utf
++\= Expect no match
++    \x{dc00}X
++No match
++
++/\X\X/utf,match_invalid_utf
++\= Expect no match
++    \x{dc00}\x{1f1e6}\x{1f1e7}
++No match
++
+ # ---------------------------------------------------- 
+ 
+ /(*UTF)(?=\x{123})/I
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index bbe3757321..ef8274c9b1 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89161.patch \
            file://CVE-2026-89156.patch \
            file://CVE-2026-89157.patch \
+           file://CVE-2026-89160.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

