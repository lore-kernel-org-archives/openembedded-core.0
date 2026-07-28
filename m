Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC0BC54FCC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2803.1785277326493339454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hj6mXgDH;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1961705e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277325; x=1785882125; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wgm6zDEnIcrvtFRU0zsVfZwzF+OQoueyIvkrqKs0K6U=;
        b=Hj6mXgDHoMFXAk2yPxTp5T9CDky+CW+8iV0Ex+5sy5wF1M3DROywqxgOysASFw5osY
         Ii/K8g8ngQyzlOjFwFbyDr3d0+B99TGQ/C3eXb8cXy4pUNGdmMegiESyM/XFGRBFi3E+
         oCFYMnxquu9d5rMlqQfzOd+GYPELIo9tSGHtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277325; x=1785882125;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgm6zDEnIcrvtFRU0zsVfZwzF+OQoueyIvkrqKs0K6U=;
        b=Cegsbm4Ne875fvMHG3fTYWCm98Sx0nSnXoVzyX5WgjQvW8VTwyras5FXHKQ2GGYaBk
         moTvPzo2amSYIwQAy4VwKAMKaSJ7wqXUGArz+0GYA8W5G/LmLfcvFFLYdv4v+TpI2i94
         odWIP3Fdt7VgU8Hn6bXdVNILkM015jheAJ8cR0yHVr4wjhRjJSKylfLW6iBf1uTYEdco
         NNe5cWhUnx9A01U/Fahx3yZLzFqPrQXqIMJmS9e+pxoNOByggR8U2J/p7dlvPsxaRr/m
         YpDGvX1e9N4FLOHbZeKiarU0YYUAZlVCVbS09dfMiP43qurRPN6G8ew74ZmCI32cPQGL
         Jukg==
X-Gm-Message-State: AOJu0Yz/7k2WPSBfqNvVsEye6QL47W36tueBzUBRmUfXtxeaeap4dLe8
	6xUgwB+NwsYyVoz5sn/kOTWhVim1cilXgMRECgP4vH5K98upuSMyn7NAs8mL7ZJDcCug5CnrL6r
	2q70lIjk=
X-Gm-Gg: AR+sD11D5zsJwJvySTPetstpCODumBg0oUu9bbOg/7cbO5gnBUrGe1E1L6q51JvuhKJ
	A758H/i4dKsCG5dq0NSxdUK7rQFMXEJjXN0PChspUZ0k3eLE1+MGq+tjY2oCLIIjc4ilFs0LPVv
	8VXx4xieEe5fWKQQrd2WhdNX//7xZp46IHIn/ThA945D9OYdWUOpW9Rl5/8QCsS92UpfTkDfYNX
	3BC3HyjhOYNatLCLDgMvHyf2BJ94A/hvnOk4sDoSBcuPs+heEUUnA8J6APLU4/kx9xNfDq7K2nX
	B3pIVRMNXoR0qhddEmwILnrupaA8sZbvBJVJO28g7xSA0AqKIq1fvcvyxcOst3RlwCTRQy3nmQ/
	Yclc+S3KRcoithtHS7a4UI1flGY+Vny2FuAhGBZ8f9GpLqUeFsp8sB277LR2cUPUV+cvhDjBObV
	A+jU/YrhcHwg3equ5pQW5kQzoADUGUfbPvuq1NdGK+NOdUXG3gZQqJyM/mKx4fa8sXUvLszEtLE
	AaSIQoFW6yYOsxH/toTyRs55KHtqgIoI9715J6aemzpMS2nAv8O7NtjrZugU68u
X-Received: by 2002:a05:600c:4e8c:b0:495:4730:15b2 with SMTP id 5b1f17b1804b1-496c6571ea4mr42379995e9.31.1785277324784;
        Tue, 28 Jul 2026 15:22:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/19] gawk: Fix CVE-2026-40467
Date: Wed, 29 Jul 2026 00:21:38 +0200
Message-ID: <157c0642e924dc5f53064322ad8b8143a3621d6b.1785277157.git.yoann.congal@smile.fr>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242206

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=a2d18c74109e41bec29a23098eba2e00057286d8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40467

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gawk/gawk/CVE-2026-40467.patch            | 63 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
new file mode 100644
index 00000000000..d813db5f8b0
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
@@ -0,0 +1,63 @@
+From 22fd9e360251f70b34e9b46635b6d75bce49202f Mon Sep 17 00:00:00 2001
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
+index 2fa8b2f0..6bc88ebb 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* io.c (do_getline_redir): Don't DEREF redir_exp too early.
++	Thanks to Michał Majchrowicz <mmajchrowicz@afine.com>
++	for the report.
++
+ 2023-11-02         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.3.0: Release tar ball made.
+diff --git a/io.c b/io.c
+index 44671ebd..4db4b21d 100644
+--- a/io.c
++++ b/io.c
+@@ -2836,22 +2836,25 @@ do_getline_redir(int into_variable, enum redirval redirtype)
+ 	assert(redirtype != redirect_none);
+ 	redir_exp = TOP();
+ 	rp = redirect(redir_exp, redirtype, & redir_error, false);
+-	DEREF(redir_exp);
+ 	decr_sp();
+ 	if (rp == NULL) {
+ 		if (redir_error) { /* failed redirect */
+ 			if (! do_traditional)
+ 				update_ERRNO_int(redir_error);
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
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index b1d1fe7ae47..56d7d7f76af 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            file://0001-Fix-some-C23-compilatio-issues.patch \
+           file://CVE-2026-40467.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"

