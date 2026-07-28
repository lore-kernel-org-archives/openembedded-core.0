Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FBAC54F98
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2699.1785277327924474457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q5LpasTB;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so8137785e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277326; x=1785882126; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoMtFwyJKRXi3ZVAsYGoeidbQte1M4RkxQ8enIPTVlM=;
        b=Q5LpasTBsuQikiS0GQ8Wp9GTfxklsdPqS2CmB6qd3EuRUpzxVEVUSy9Mt1zvnEjuND
         4PDgGP8yJdG4CBvN1cQ057cEJFy8AizRP4bNM7MS2VDWm9qUO53CgH5wSTYSi8DTNTGL
         ABPiKe4XkCA7IRBhZmskAVRHgOyCAH4VMlnwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277326; x=1785882126;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoMtFwyJKRXi3ZVAsYGoeidbQte1M4RkxQ8enIPTVlM=;
        b=QE2j8Q1fNeY9wGnJiMJ0QVuMSX+AVmOJIHOov3gjuZjBzRVRp4MMCcmMY/+QW6734w
         ICqKWQDmJ/65qPh/nmonSXVQXV1ZKlz7s8oMIof+ROsAbchUXhTaGkSH4efF3PAfriyz
         Gb8LnTbTfIk+MIZxGuFu1PV0odUPqtVyljmocOt29ueTN0hKyE4hsHAtV/W0eulpMqDa
         KVfR1thG2jZRiXTnNeNInPs5alKDh/GuTNOsLsUiT3rPR50dpCX1CyomzjZ/Z6z0Gh0i
         ksUQ7ppGRYo8sGOYplZikTA4K9ioBEbkGEaZemR0j5O/4mGiyXWMtzjK1LFcgRcpZzjQ
         ctQw==
X-Gm-Message-State: AOJu0YzjB/LKc6dwzawdaIf7ZcQz75E1Yp0SpOAIIV8rHcifK9GEm8Cj
	4mTLveHsADpEf8qfz1NqLQVK+djJQyIK5AQI3hIKykLFYHUo4LB9jAOtIp1/pWzaSmzUpbGi50z
	HLk7TYw8=
X-Gm-Gg: AR+sD1231f1Dg6W9AC+JS3QZdAd3meQtRp6PEiRKlml27QyC+sARLxE4BHkj+i6GWhe
	Ew4RJ56/ZegQm4JcAGDPLJEMdMRJuzaeLQiN8d5Qg4wgqSPWMB8hUmU/TYs0PujF5ws+62SThKq
	qljU2pLtuiZNRnxNoPrl6zIfC/pBfRhWvzSjiZ28ABuFWsyx5eQeuvI3jQQ82h6EjytpMawh4kc
	ATbHFHs9DYK1vaJVRKo0b/t5ax15oRNroCaQW77jEZTuZzrwTzoC0JKG6tvomFSPuTzdSuXkTol
	BWsbhRICk8f+ZNdh/8CELZEFeIr7r1c8hjXgZpueV/+EpIL3Z5D98vXDP9jvRGWNsgUg7pQHTJk
	KP86E89+5OiJmFvGcF9Cqw8kG/cw1WYQ7hb6XEjIXBDUhGKL9TNnlNGlvPo+yvMsLgkfIDi9mDL
	QLKcgguPh9QjNO2pA15eHDbEb5V0gGypodP1y+FXNNpno9CWEdqX0LoRSTfEI4Ej0YQhzB/8bM9
	rsVKWgPmUJoyh+Yf7T0dZETiCh2w/Q4MzdJY5cak9U7+9C82szMo6QJlkr2nGbG
X-Received: by 2002:a05:600c:3b26:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-496c65988f8mr47249185e9.19.1785277326084;
        Tue, 28 Jul 2026 15:22:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/19] gawk: Fix CVE-2026-40469
Date: Wed, 29 Jul 2026 00:21:40 +0200
Message-ID: <421a3d2166e922c5a8085be0aa9daab13920b613.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242208

From: Darsh Kelaiya <dkelaiya@cisco.com>

NVD [3] identifies upstream merge commit [2] as the fix. The
CVE-specific change is its second parent [1], which adds 32-bit
overflow checking in do_sub().

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=aa7272a6e1184cdd21ab8f89200219abd8053eda
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=ae1b2d508f46913269a9e62aceda3636afe8147b
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40469

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40469.patch            | 90 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
new file mode 100644
index 00000000000..49b6a23b012
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
@@ -0,0 +1,90 @@
+From f907980a3e7a58006b796308021c8410a24e0f3c Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Mon, 6 Apr 2026 10:56:38 +0300
+Subject: [PATCH] Add overflow checking in do_sub for 32 bit systems.
+
+CVE: CVE-2026-40469
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=aa7272a6e1184cdd21ab8f89200219abd8053eda]
+
+(cherry picked from commit aa7272a6e1184cdd21ab8f89200219abd8053eda)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog |  9 +++++++++
+ builtin.c | 25 ++++++++++++++++++++-----
+ 2 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index e691b241..74eea81f 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,12 @@
++2026-04-06         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* builtin.c (do_sub): Check for overflow in calculation of size
++	of result buffer by doing the math in 64 bits. This provides
++	a fatal message on 32 bit systems if overflow happens instead
++	of letting dynamic memory get corrupted and likely causing
++	a core dump. Thanks to Michał Majchrowicz <mmajchrowicz@afine.com>
++	for the report and fix.
++
+ 2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* builtin.c (do_sub): Make `sofar' be size_t to avoid
+diff --git a/builtin.c b/builtin.c
+index 80ab6069..d63cf47b 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -2998,11 +2998,13 @@ do_sub(int nargs, unsigned int flags)
+ 	long current;
+ 	bool lastmatchnonzero;
+ 	char *mb_indices = NULL;
++	const char *fname = NULL;	// for fatal message, below
+ 
+ 	if ((flags & GENSUB) != 0) {
+ 		double d;
+ 		NODE *glob_flag;
+ 
++		fname = "gensub";
+ 		check_exact_args(nargs, "gensub", 4);
+ 
+ 		tmp = PEEK(3);
+@@ -3033,11 +3035,9 @@ do_sub(int nargs, unsigned int flags)
+ 		}
+ 		DEREF(glob_flag);
+ 	} else {
+-		if ((flags & GSUB) != 0) {
+-			check_exact_args(nargs, "gsub", 3);
+-		} else {
+-			check_exact_args(nargs, "sub", 3);
+-		}
++		fname = ((flags & GSUB) != 0) ? "gsub" : "sub";
++
++		check_exact_args(nargs, fname, 3);
+ 
+ 		/* take care of regexp early, in case re_update is fatal */
+ 
+@@ -3153,6 +3153,21 @@ do_sub(int nargs, unsigned int flags)
+ 		 * vary since ampersand is actual text of regexp match.
+ 		 */
+ 
++		// 4/2026: This overflow check simply provides a fatal
++		// message instead of letting realloc() die later after
++		// a buffer overrun.  It simply makes the user experience better,
++		// but does not prevent gawk from dying miserably.  I suppose
++		// it's worth the trouble, but just barely.
++
++		/* uint64_t so the product is 64-bit even on 32-bit ILP32 builds */
++		uint64_t repl_contribution =
++			(uint64_t)(unsigned int)ampersands
++			* (uint64_t)(uintptr_t)(matchend - matchstart);
++		if (repl_contribution > (uint64_t)SIZE_MAX
++		    || repl_contribution > (uint64_t)SIZE_MAX - (size_t)(matchend - text)
++						- repllen - 1)
++			fatal(_("%s: replacement expansion too large"), fname);
++
+ 		/*
+ 		 * add 1 to len to handle "empty" case where
+ 		 * matchend == matchstart and we force a match on a single
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index d79b0222a67..7bd34a3ff81 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-Fix-some-C23-compilatio-issues.patch \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
+           file://CVE-2026-40469.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"

