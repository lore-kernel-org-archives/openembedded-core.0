Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF904CA9EDF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23459.1791708099678164364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1t68sBC1;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48870973bddso533774f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708098; x=1792312898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A3DcDtqcC5qc1JDR4EqCY7a0FAIAb+d2++rTXC5PREw=;
        b=1t68sBC1Vj+CZdD9hNnAOtYMO3woH6plohSrsF7pUbOo7wVUqSLOaRFDA4HBBP1elp
         AX/6sCB6kLGuapdD3Df0MHFFYzz8pKfJ9Vy+4pOOR63Ar1IJ/iBEmd2JVcymcOeUllut
         qBVy07LQEFhnqK9Du1gmELvNaTP93CcqeBUoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708098; x=1792312898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A3DcDtqcC5qc1JDR4EqCY7a0FAIAb+d2++rTXC5PREw=;
        b=sWZrwuIfiI9UByOOrWz/F0po3Kv03KC3RSek9sYJAnNw0R0x0lY7rC3k6Gd6wB48u6
         zoRwEP7t+z++aQYlX9EEu2WF2F+dwzoi5yCwBOHDaGVpo/MrtrFCLfIJjShE7+V/Ncq/
         1SGdeQH078gHD83M7s8K1b/wkdTtHD0SeLnH+FC5zHQVUJIohKstpiX7r4rdKIpO5uv6
         VmtLZHVSSrZOn3cY4aEz0VTLNg2B9tR16zQmTYs9AXr9Cn6GTcUbranBOq0Ib/+kAro9
         9ZxL5EYlAL0a4gVDUMznkjXGs8PI9o29CZRe5/JPB7Dvwd9LwRCQpWFi35HXa044ILNX
         cGxA==
X-Gm-Message-State: AFq9FYKA2BP//PSbXaJzGT3+xO/AvHqHqLMXAKuQLbkSyQhfOEm1JIy0
	xHGeMHVyzcGt/NFvnZebujV47hyHDkRTKyEwFfFaBRxdCUXDzerR0b/Ur8ZY2pQTRQr1AHRcjqn
	MtK1eUlc=
X-Gm-Gg: AYBFou146yC3acq9tTDiiQsuOTrRDszHa4/ojv7Z8G5OskjHAG9SQtzVLxoxBrUTvnf
	vuGaK22vXVPQ/fTZdp2PeY1SmffwJ7JKLQazLb2JMulJ5YjgkLRcKuy4ifNe5NfwcPh725Aw/+u
	uwS9LvKXap7fLpPK3+O1p8HvveMvWRA6hbKA9RA8EQ5rfaoxMXfTiJSj0YTG76Ok2yu1z8nPDM9
	eBVLaJh0o7Gy61tc/Ot0FXtz2/8jbdtBRGgptLHYc790B2MyMJLN6KaVIL8mUU2K9CuZzgBxOaq
	A/bbNiaF8lU+il7cad3A/TP5DsTeBGcYMSbshT0kuna9/hz7F7ullm9k3wGy0yS0xdrpfbMNeYP
	G3Jl2Zg00OeXqvOakOPOO+u4qPiElwtPTuY0VDIPJgQ/04OCdOD3/SGQ4JOfLMHtW9+IVdvObu2
	2a4yt+YUeYrvBvcwZ6tiq5lcFbb2v0Xzx9NqmTOwTsNKaKub8k8wTi7++z2cFQwgCZKxlvHsVkH
	7q2XlI9UG1cWSbr471xGf4aWFZDutGTmEM2qLCd8Dlxc5z/L95tTYZLzYBv54VMVI0m9SQ+MA==
X-Received: by 2002:a5d:4d45:0:b0:48a:fe00:ad1 with SMTP id ffacd0b85a97d-48dba9e641amr9443966f8f.6.1791708097650;
        Sun, 11 Oct 2026 01:41:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 57/60] libpcre2: patch CVE-2026-89160
Date: Sun, 11 Oct 2026 10:40:30 +0200
Message-ID: <2e1cea675dfe766f31abbb42f6554852553ae14b.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247566

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide it.

[1] https://security-tracker.debian.org/tracker/CVE-2026-89160
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-9qww-pwc4-77qq

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/CVE-2026-89160.patch     | 225 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89160.patch
new file mode 100644
index 00000000000..bff6bc83efa
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
index bbe37573215..ef8274c9b16 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89161.patch \
            file://CVE-2026-89156.patch \
            file://CVE-2026-89157.patch \
+           file://CVE-2026-89160.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

