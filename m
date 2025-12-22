Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761C2E67803
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 16:59:53 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84081.1766422783555772773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 08:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZMn6WXKT;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787da30c50fso37119537b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 08:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766422783; x=1767027583; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK27yzo0AiyxUX3sbN/Cb8DbstRpFfNqHYN9pwGQhuk=;
        b=ZMn6WXKT2nLJ1jZRLcvyi7OZEEH3HCPdjpN335nlrW5ZmPWDyYUQgsMryOxKIVfsdG
         TPdtkWtfGpysvgdZH2KQMPxTIyLpxm0h7Y+ysxfJx3GMjhlopJkHa4QAKbfsZKT5r5Js
         wtgPEmUcCnZpN7wUoZXOuSCq7kpW5/WThPbK+zjvLHa06/pETXp97NThz0vsAevICPeG
         fB+ccV+tievk4BrcBAbnS073slOOLkXmDFNGOdMRdteu5egUXrd6luyjvAR1Lm+2fEqm
         g08AJ/H1it/S51Iq70f+Oe7Mdr6YH8+KKtCmwV3Xk2tw8goeEL0+6VyVdAk4ZC2IfpFU
         SKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422783; x=1767027583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HK27yzo0AiyxUX3sbN/Cb8DbstRpFfNqHYN9pwGQhuk=;
        b=DgOdT2NDLls8myYkkPjvswEwHcyDfPY3IT9vT6FGIG04scw3vv4+aC1iEDhMXcAcmC
         QINrKiUqmPfkyGIE+4vbFpEXbKryRrqdrwDPGQEmY4WvACph3NNPCOetwqoEP77vatGZ
         Z+iCOWgtA/qC+xA1mf7u6DMTnGlrBV5OTOg+fCi5kE49M3LzCkZB5EpK8B+dN95EKrp0
         oAtM+f6aevKhkDFTUHXNcUm4LUcftQtSHI/u4jXzByErLQd+IM4IhXwgAHlos2rbh7pr
         i449peDTUE87TZHlLzY7D/5l/uen4/gJ7MoJjwQkf7Or3IkE6aULvzsFiRI/tGf02P2+
         gQMw==
X-Gm-Message-State: AOJu0YytjMrHf7d7fx9jxZNEUryV3hfiytK6sGfd8saHJXaUo4/6G9AW
	L3ETV1ujjWIsSn3KuDhGFetO/HZ4w3MpXA7eBi8bEteGwcizaj2psFdPODPfe0LI4hFZtadKAXZ
	a0dE12ckCeRgp4eJ0fYX3vota2m0J80NoYUppok19c5R1K0crLx1uk3I=
X-Gm-Gg: AY/fxX6dL9yzXSHjlKITa87HWauMpoGnsWF8ckQvJgrr3F+4Y2kUrx4EzegDifvNAxf
	e5dCizMzLlnpWY7qLulD+xOPAsqus8QDw0Lv8wc2B7lKHVc+4XYk8j/Ma/sUpt64S/dl/3uqXtO
	vWzcQU+HPkIghrV55HdbclXnp+8wzeDAZ3siex641U4DmgqZUQFUrWVBLkEIaisFC7hZsSE+cTM
	+DTlBzO6NBngM/p9NAjBO6ucraBpo/jqOet63M+Sw1telSS7XyIYtTzu3XnY0NqCpISHwDIEjUw
	RDTlRrY4FKpnOJcvdepdGJ1UXTk=
X-Google-Smtp-Source: AGHT+IFsnaCeEYp8c087ZAawS4Pl408+bYDjVV8IUYSy956UqkZjRBJMJNLEd9h+sFo4xLAdThPX/Mjk3qOk1D4T87I=
X-Received: by 2002:a05:690c:d1b:b0:788:161c:7117 with SMTP id
 00721157ae682-78fb3f05395mr205417527b3.8.1766422782574; Mon, 22 Dec 2025
 08:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20251222043357.366484-1-Yash.Shinde@windriver.com>
In-Reply-To: <20251222043357.366484-1-Yash.Shinde@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 22 Dec 2025 08:59:30 -0800
X-Gm-Features: AQt7F2o5A_ONWc_LfBsVUx3GX3BKr9tYEMLuw4zN7zVfxJsO7r50pedzwsbwR-o
Message-ID: <CAOSpxdb+OGDWaZ=9b_dW51CDH8HVeL2wBZ_oWrh=ao6HC5bRLg@mail.gmail.com>
Subject: Re: [whinlatter][PATCH 1/2] binutils: fix CVE-2025-11839
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	sunilkumar.dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 16:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228311

This series doesn't apply to the current stable/whinlatter-nut branch:

~/Repos/openembedded-core (stable/whinlatter-nut) $ git am -3
~/Downloads/whinlatter-1-2-binutils-fix-CVE-2025-11839.patch
Applying: binutils: fix CVE-2025-11839
error: sha1 information is lacking or useless
(meta/recipes-devtools/binutils/binutils-2.45.inc).
error: could not build fake ancestor
Patch failed at 0001 binutils: fix CVE-2025-11839
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Steve

On Sun, Dec 21, 2025 at 8:34=E2=80=AFPM <Yash.Shinde@windriver.com> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> CVE-2025-11839
>
> PR 33448
> [BUG] Aborted in tg_tag_type at prdbg.c:2452
> Remove call to abort in the DGB debug format printing code, thus allowing
> the display of a fuzzed input file to complete without triggering an abor=
t.
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D33448
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3D12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../binutils/binutils-2.45.inc                |  1 +
>  .../binutils/0019-CVE-2025-11839.patch        | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025=
-11839.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 680ba82e86..2f61c9377b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -44,4 +44,5 @@ SRC_URI =3D "\
>       file://CVE-2025-11413.patch \
>       file://CVE-2025-11495.patch \
>       file://0018-CVE-2025-11494.patch \
> +     file://0019-CVE-2025-11839.patch \
>  "
> diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.=
patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
> new file mode 100644
> index 0000000000..7f2f6d553d
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
> @@ -0,0 +1,32 @@
> +From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Mon, 3 Nov 2025 11:49:02 +0000
> +Subject: [PATCH] Remove call to abort in the DGB debug format printing c=
ode,
> + thus allowing the display of a fuzzed input file to complete without
> + triggering an abort.
> +
> +PR 33448
> +---
> + binutils/prdbg.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3D12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
> +CVE: CVE-2025-11839
> +
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +
> +diff --git a/binutils/prdbg.c b/binutils/prdbg.c
> +index c239aeb1a79..5d405c48e3d 100644
> +--- a/binutils/prdbg.c
> ++++ b/binutils/prdbg.c
> +@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned i=
nt id,
> +       t =3D "union class ";
> +       break;
> +     default:
> +-      abort ();
> +       return false;
> +     }
> +
> +--
> +2.43.7
> +
> --
> 2.49.0
>

