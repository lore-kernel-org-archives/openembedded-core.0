Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F21C54F4E
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43790.1785192966191847742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tk4UBlZD;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so3377365e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192964; x=1785797764; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o577EwGe+r5EVVD8sOs4TV9AMcYS4ezs/+Hanb2FAXM=;
        b=Tk4UBlZDkThp8CncUsppaXbFKRyZPSCd6P16ZZ1x/QbrsPcxqXkVq0IE4PK6H5RxEh
         /7m9QOlK9Tx4wThnjamLrvUJ8Rk2qagYWhqYgp+22XTuoMjb7mIMrCJ+0VidTbZhKmmg
         pk4ulVrJdxlLfhTtjbjrlXUA1GputSxEEBElc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192964; x=1785797764;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o577EwGe+r5EVVD8sOs4TV9AMcYS4ezs/+Hanb2FAXM=;
        b=MGQy4q2GNAOLdhYEkRE1EovnMb3zRv00JGTCo4fP3KBBJ2US/np4/NkgVATjntCDYK
         IT78/C7Q/se6tdzobDf8InRbbAccKyPw2X3qNJqaasfFanU5tg4ZKtY59s7GeRFWWzKy
         0JHk++LKy1ADIaN1HK/1nsH8izD3eVK9wejEfMEnyX0CrKgQzClamjewqTuJLcTLfQex
         uRHM7PU/4uIE4fEOVi/ZR6RcfN0BAU8d0WJ2eodebXwrhYGwZZGQqFmp5Kfokff+Qmg+
         L0OHsXiN9jgTPrx+I5zSYroB0gWMB3G0R2DK43Ahm51ZmNxIZU2f4IiD1Gk9yxhBb4v/
         yxjw==
X-Gm-Message-State: AOJu0YyaRq3XHjriiG0VPDOflj45B6cAAos/gWGYCgCA6aNIdKG43hb3
	5qhfqFZBCugoDIhiGvq/u4MdQbfWoBMmSlBpJZW/VZsa0Nn2XLnE9SXbPNZTP7CVkIwc0N0VeOD
	CG4OPq5I=
X-Gm-Gg: AR+sD121cqI5vuo4qVK/1VTLR2wnWrMqfzsomL+mHxmBcR4fRN0o57d1ZovnC69AnD6
	9NLI8Vq5aBw4wnPZ5HHVe4gd4HM96dlAP8kkmAwwbYNUb2qv2bgL9KbujiaYreTgPOUTMz+ksHE
	sVWhhFdzZ2NY/aaWSDkz/LASI5DRTt2Juo6lXixasofbC+49+EFnIZGgaKJaAUHlhjiJvYchB9a
	ok85W95rMYsaWHrY1kgmdKaXOiRAlMI/Dj6iW8x+/lcbcYrT5TjD7jEcZboCOZ5GqWRauSBPTq9
	3Bg1xZTXLlqRrPHbQQlxEzQsW1inkXEO1l99PBzdYzlso4Y2st6VCUKX2H8IQAW+Mei4ifJ+Cm5
	2FTPHnsklBd3f3RC7dUTl5d9OcO5/itgwRFZJ0X35ZrmoAyW64fhJomiHEJ20eA6uHUhKflo2gK
	S2JZcKOKHJhUsig1iIrGa8AAhLSWMMy94gGg2+pV/HmDwlr8Ul8/pfLa6P/oUs2wsgq0Ye+K307
	c2V5A==
X-Received: by 2002:a05:600c:3b19:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-496c5690ca5mr5107635e9.19.1785192964367;
        Mon, 27 Jul 2026 15:56:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/36] gawk: Fix CVE-2026-40467
Date: Tue, 28 Jul 2026 00:55:16 +0200
Message-ID: <842d8b7d53be67209bb78750d833e73bc6bb4e66.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242110

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=a2d18c74109e41bec29a23098eba2e00057286d8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40467

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40467.patch            | 62 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
new file mode 100644
index 00000000000..772172c3737
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
@@ -0,0 +1,62 @@
+From 194a2884f21a6fc02c446ca4e2dc9107298832db Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 3 Apr 2026 12:02:11 +0300
+Subject: [PATCH] Small memory management fix in io.c.
+
+CVE: CVE-2026-40467
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=a2d18c74109e41bec29a23098eba2e00057286d8]
+
+(cherry picked from commit a2d18c74109e41bec29a23098eba2e00057286d8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 6 ++++++
+ io.c      | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index a714ca1a..517aba91 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* io.c (do_getline_redir): Don't DEREF redir_exp too early.
++	Thanks to Michał Majchrowicz <mmajchrowicz@afine.com>
++	for the report.
++
+ 2026-02-22         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.4.0: Release tar ball made.
+diff --git a/io.c b/io.c
+index a3b877c4..7a547aa1 100644
+--- a/io.c
++++ b/io.c
+@@ -2853,21 +2853,24 @@ do_getline_redir(int into_variable, enum redirval redirtype)
+ 	redir_exp = TOP();
+ 	redir_exp = elem_new_to_scalar(redir_exp);
+ 	rp = redirect(redir_exp, redirtype, & redir_error, false);
+-	DEREF(redir_exp);
+ 	decr_sp();
+ 	if (rp == NULL) {
+ 		if (redir_error) { /* failed redirect */
+ 			update_ERRNO_int(redir_error);
+ 		}
++		DEREF(redir_exp);
+ 		return make_number((AWKNUM) -1.0);
+ 	} else if ((rp->flag & RED_TWOWAY) != 0 && rp->iop == NULL) {
+ 		if (is_non_fatal_redirect(redir_exp->stptr, redir_exp->stlen)) {
+ 			update_ERRNO_int(EBADF);
++			DEREF(redir_exp);
+ 			return make_number((AWKNUM) -1.0);
+ 		}
+ 		(void) close_rp(rp, CLOSE_ALL);
++		DEREF(redir_exp);	// we're about to die, but what the heck, release it anyway
+ 		fatal(_("getline: attempt to read from closed read end of two-way pipe"));
+ 	}
++	DEREF(redir_exp);
+ 	iop = rp->iop;
+ 	if (iop == NULL)		/* end of input */
+ 		return make_number((AWKNUM) 0.0);
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index d7211f28f33..59c4cb2536f 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
+           file://CVE-2026-40467.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"

