Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B388D7308A
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 02:36:59 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3662.1775183811741830750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 19:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tsv6Lnig;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c56aa62931so3381270eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 19:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775183811; x=1775788611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZdLi4VwBerSAFnTr1bcigR2unw91kry1nT5yguTlKU=;
        b=Tsv6LnigfS4PLjKbfnrsefa9mwJFbq8PvbtWxgtJVAfxzaz7y6Sab2+Etg9yBo8dbW
         kA7hE3c9+FeMP4wMGTXS+eEOkgXx/sFw5Bu0tE+e7bH5TjdZpiLE/Hl6W5BHA0fDCkVL
         Or3lPoMn87fWQ4Dlo/8jCSB+IkDs9ypM90rQTnuS2z/siCnxGSsDAGR2RNcJzBybdySQ
         o9Bqk4zukxdWj5Ui4NfIaqUhov77oGbn91iYhieMwal55T4aMaI2pggeRD+kQ5oiT5AM
         EFH60oYNapPflh9EJLiZS4a/BOvaJa+g/cA0wRS1ZKroaPimcOdIQ/eCwAnOIUBhSVxk
         +FxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775183811; x=1775788611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZdLi4VwBerSAFnTr1bcigR2unw91kry1nT5yguTlKU=;
        b=JiGEMf1jpXro3El0wE/OHjlvdOknZB/p0GZmUhi/c8+A9ljwXMgZVa+ypX/e/sDBzZ
         7I8P1GhwqP/BFnjhV8yXex6gqc5Ciq5Ph4avqLUjSYDyaEvBGptgQNqz2ctfaqm2zPO0
         asKS0mTpboU1ci/QIQt9wQWS5QwMgxtYoiox00Z16Mg2c6wJOi9XOAksHbfcikSiiE4i
         qGpPWuYhleP/YsCpaRo7fmZfdqN1bu1xmPrnYyI1QUO12AKUeePVX6nM7SFTww13vkUy
         59V51nUCMs9zC9Ripj2DD77tLe53z2xJ8nr498+Xx0Ku8LGGlmdUTqdP564doKdgCDLR
         7Ipw==
X-Gm-Message-State: AOJu0YwuRSrqXKTbVHb46NtwyOa3j/fRwQvzyV3/bVsYJ2pj5Ar79fzO
	4RSBa1bEBwiAAfN0NP+tFeGf8MwYbirOMXGjc+ChwOKgvhRcRqYqDH6s4SOLSQ==
X-Gm-Gg: AeBDieuQh8JFG8MZe5Fzts+UwpCCAtGFa7fvZsYobh6r53Zmo/fk7jrNwOEINCgbgjX
	tperRgvgCyqDIK5r+KPyYZRceAQtUMH9OodZKpAbOQ8308MUvfGLO61RhBBx3eS4ZQaegsKxh3o
	auvZJQtapfqID8KQgj2f0SGtTSgfm8jZuoJ92J3way2bwcDKDNc8D+saIOZ6esXjrE2m8PSNOI0
	MRUuKYFh02AK8ulsMbu/xlpxZqlr1H6dCFsJOpeyqwdC/vEGQp2J5vBk4kEhwwOsLU13yoDOt2g
	YkigEGOWVkoMrTwUs3ZNzrRyh/ZE7IkSteJAdLFp0FXf+i3ZoYua8iqa46G/BjBChzn7IcIQApJ
	QbyVdipyn01TNFPkw6Hu6Ttr6uQxxTou0ddhlzM5xX5krGYDX5h6KCWfrRxBsPwiW6vjXI6TaRp
	sphVnEUxt5ws2dBKXMMlnvEUlcVh8I3SxzjIQ+2Pr65yDfRIB1Ao/KMcfsbKFnE16gR3THDT6oi
	RMFDN2D4iFMm+Egbs5PX13KWbvEiSR9v/GzZYlVJ9IJJYgaKTfnHSxdtRqK
X-Received: by 2002:a05:7300:6d07:b0:2c4:ec89:be7 with SMTP id 5a478bee46e88-2cbfc07386emr831795eec.23.1775183810545;
        Thu, 02 Apr 2026 19:36:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc6e17e0bdsm139548eec.31.2026.04.02.19.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:36:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] inetutils: Disable format-security warning as error with clang
Date: Thu,  2 Apr 2026 19:36:47 -0700
Message-ID: <20260403023647.1190673-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 02:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234553

From: Khem Raj <raj.khem@gmail.com>

GCC treats returns from _() as special since they are checked by
msgfmt-c and it knows this can be ignored, clang however does
not have this construct [1] and with latest clang-22 finds more
warnings and since in OE we turn these warnings into errors the
build fails.

Given that this is an addressed case, let clang not treat these
warnings as errors, we still see the diagnostic we just don't
break the build.

[1] https://lists.gnu.org/archive/html/bug-gnulib/2026-01/msg00093.html

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-connectivity/inetutils/inetutils_2.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index 716174e299..e555e318a8 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -50,6 +50,8 @@ EXTRA_OECONF:append:libc-musl = " --with-path-utmpx=/dev/null/utmpx --with-path-
 EXTRA_OECONF:append = " --disable-rsh --disable-rshd --disable-rcp \
         --disable-rlogin --disable-rlogind --disable-rexec --disable-rexecd"
 
+SECURITY_STRINGFORMAT:remove:toolchain-clang = "-Werror=format-security"
+
 # The configure script guesses many paths in cross builds, check for this happening
 do_configure_cross_check() {
     if grep "may be incorrect because of cross-compilation" ${B}/config.log; then

