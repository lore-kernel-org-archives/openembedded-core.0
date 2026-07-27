Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845FEC54F50
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43740.1785192970970965307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yhr0OJ8e;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956242332dso28391295e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192969; x=1785797769; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2bAa9S4jF6WgQWgv64Eqb8Pcbg06N/yF1o+mUqDKQw=;
        b=yhr0OJ8epTemXDPfhkKSX7RkQiVoP9C7PDBms78/BWU30DFF3msg08sMyty3zgyMnb
         wcBiT77krmwMXJG0uT0/XfWxPi1s9rt87zUZrDao7lt5QFCfNQ/Zf00JH4XGEhdAMOIX
         LEZaaPSlOvqGFYzV2It9jiTFrZKfvwhzABnok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192969; x=1785797769;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2bAa9S4jF6WgQWgv64Eqb8Pcbg06N/yF1o+mUqDKQw=;
        b=ID7fPRFanLS2Zzt9qM76Jxtnw4HUBxwt4ncv41dsWnCluC6Z+0Vkg7pJtKvpCtz1tP
         2r15YXgCEuktHG9e3KDAUS1lMYt0F+GAZTzuUYxkMclFoPqXHQviYQM5+t/m/unx+ZB6
         4Oibp6StPT4W+0CQGsajXSQAh//9lNoiTiwZxTVzLTXagVc7PWTIu/5eYyFWXyRiUU6S
         cbDzCCMvD5gACnbYsK/Zs6orFVseKaJq9IiG704VqwUqvCS6w+Y3uS27JXWjnWO2sFPO
         URwxbXmuouctQF/GYY2ZEFZqTx0pDd1B8RamUKnbcHonv32a+Nf+Q4+WYKwBGSRj9biC
         SMNQ==
X-Gm-Message-State: AOJu0Yz3zF3PzebT637w0/hw8a4X41dllC3Lgpzgr885YH5QG4414tWN
	LQFIHLtZD5SS9BxzgG+xXNpp+2/TvwxiM0ZsB4/5rGEYO0OQXfZGTlIJmG2uhN9O7MD9zbzi4PP
	5FmLobVQ=
X-Gm-Gg: AR+sD11OP9EzSH0/fTpm2JVnLdsLz/gHSsvK0XWyT+yiVu5j/Nz8jq0toF1GVx+3Dn4
	zvywH9Elb+RhdEHesx9LKFVjnkaTiJG4gwDnB1sk34L9jbulBX8FLXnCF4eaZ3DqTI3FFaXfJtq
	aQMmQ76N0WABs94/gdB33IxnCigB9R9IdBy/io63AkY5Z9T5VwTDkPErus8jxxxzkyYvQle4HFM
	bTDovjd76sbNGszNXi6q4fn2E/Ksi/qrhVn0SY8m5Sa5qz1VsnyAjgJ++3OiAiMtVW0/e2YjCQL
	MJS0sllh18FWKBz/PWd5bnR6F5kJqSWMh7oDlSo9BjisDVm1Do0rMZhNqpQe7DBebAPH4NE5uvP
	iS5sajtCUxfHJ/cgqh508byDJV0577emNcdxHLQyR+nMNOTOIKm3Nea0EJ8ZzfmsNGO8M2jzbbc
	hy0VQnq3HAXhRXi6juVRER79VE58vIzOI0i9QAn1/WLWCzaw+flD9TktcN6E6MEvYyuKZ9TcKTW
	/B4Hg==
X-Received: by 2002:a05:600c:4eca:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-496b563fd7emr137183435e9.0.1785192969059;
        Mon, 27 Jul 2026 15:56:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/36] gawk: Fix CVE-2026-40469
Date: Tue, 28 Jul 2026 00:55:18 +0200
Message-ID: <c1756cdc2d8815bae5bec76e0c54d18c12b80065.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242112

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
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
new file mode 100644
index 00000000000..73cda824a73
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
@@ -0,0 +1,90 @@
+From 436584a4302b1c6da55080c0a0408a98e551ea7e Mon Sep 17 00:00:00 2001
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
+index 8cdf90f6..c1b2e7f4 100644
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
+index d0e083da..3906d507 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -1820,11 +1820,13 @@ do_sub(int nargs, unsigned int flags)
+ 	bool lastmatchnonzero;
+ 	char *mb_indices = NULL;
+ 	int searchflags = RE_NEED_START;
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
+@@ -1856,11 +1858,9 @@ do_sub(int nargs, unsigned int flags)
+ 		DEREF(glob_flag);
+ 		searchflags |= RE_NEED_SUB;
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
+@@ -1976,6 +1976,21 @@ do_sub(int nargs, unsigned int flags)
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
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index 345103a7f0a..a7c88224ddf 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
+           file://CVE-2026-40469.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"

