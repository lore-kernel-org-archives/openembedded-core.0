Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E01CD6115
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 17:29:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.69009.1696872562660244242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 10:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m6QtqSt8;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99c3c8adb27so811281466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696872561; x=1697477361; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFSa3MTn6GsSPb2SUl1SB0vza7ZzeG2kLcfwxunA6Go=;
        b=m6QtqSt8W+6ZKjpKaw2C340O10dG9b+gDaB9W9xD0UfwnVqGgo4h+Esn+LxfgOQ2Sz
         iSbKlmAJpK9l5n/f99rKb4RPFrORg80kqhWH0Wk1UMqJRJWBjcaGu/JkrFOyikdMsPLa
         Pi4c6W8/AJHi0jjCURZFj7O1RNX2+9Sbs6ykbwAsX9y97lyfPp0aF8xAl0vdfEbXw7Rd
         dOvH6PljXJEFjliMXymwvah6/xPApw5haNmuQrkS1p1J/rGj5nA2WC9xwEoXyeyJjJNd
         YSDEMgKQgQ9wzPEphCBdH/jIXrzlZUto5bdUIYm6hO7RcBtYLC8ohYU/X1nWqIKCv07z
         HYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872561; x=1697477361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFSa3MTn6GsSPb2SUl1SB0vza7ZzeG2kLcfwxunA6Go=;
        b=u54MQbYYHCelZnS4Fa2QHxGhdMGammsxnVaY4Lxy3xr/6YLRyrdHqNTwL0IMx9EowT
         ZNMTmwwah/hcvt/brf9qnjVxrSQS/THIBK2ewh3QSTZI7L6gmB9LFSJD45Da+0vIDmwV
         U842Ewwh8ssiVfbbyUEG9dccqf82gTNMoYk8ZUiImC3t9adyuJrSJ+MdCzVMXd144OWU
         pZ96XXAyLg5DG6k8U9r7BvFwMLuQ7fRwYZBoozVTWGTVTNy6rdFoOntSSsDFOmiOkxGt
         0CVhX84K+S0Ylm6qK93iMXwGV61r4nX4b8NnAeXh1siboTDAnj2Ha9KfxvLMUcQ35/8l
         gWJA==
X-Gm-Message-State: AOJu0YwhO4/cf5iiuQlxPJRtiDYjsLYc9+kLXzHW/LBGTLad7p253l12
	3SwY7pQfBuvjFNzdjVXFMkkvjjoR9CU+yjWiG5gG8A==
X-Google-Smtp-Source: AGHT+IEVdYilpfvCrE3UddkjUC5wWlwb017WYz3RmIylfDUiH4pR1p+jHtOZfMZ5qHi9S3gQZ5E/cOu33CXFmvZX6wE=
X-Received: by 2002:a17:906:9c9:b0:9b2:ccd8:2d42 with SMTP id
 r9-20020a17090609c900b009b2ccd82d42mr12817819eje.32.1696872560799; Mon, 09
 Oct 2023 10:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231009162700.94188-1-marex@denx.de>
In-Reply-To: <20231009162700.94188-1-marex@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 9 Oct 2023 07:29:09 -1000
Message-ID: <CAOSpxdY7SXb=Xak8KQKkbjM4VHj38n0cDHjQ7mOG1DEm4O1jSQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH] gawk: Backport CVE-2023-4156 fix
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 17:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188859

On Mon, Oct 9, 2023 at 6:27=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Pick fix for CVE-2023-4156 from ubuntu 20.04
>
> A heap out-of-bounds read flaw was found in builtin.c in the gawk
> package. This issue may lead to a crash and could be used to read
> sensitive information.
>
> https://nvd.nist.gov/vuln/detail/CVE-2023-4156
>
> https://packages.ubuntu.com/source/focal/gawk
> gawk_5.0.1+dfsg-1ubuntu0.1.debian.tar.xz / 12.9 kB / 12d878acc04cd6328b79=
3455547c870f
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  .../gawk/gawk/CVE-2023-4156.patch             | 26 +++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.0.1.bb      |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
>
> diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/r=
ecipes-extended/gawk/gawk/CVE-2023-4156.patch
> new file mode 100644
> index 0000000000..ecfd974af0
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
> @@ -0,0 +1,26 @@
> +From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 2001
> +From: "Arnold D. Robbins" <arnold@skeeve.com>
> +Date: Wed, 3 Aug 2022 13:00:54 +0300
> +Subject: [PATCH] Smal bug fix in builtin.c.
> +
> +CVE: CVE-2023-4156

Missing Upstream-Status.  Note that ubuntu isn't upstream so please
link to upstream gawk commit.

Thanks!

Steve


> +Signed-off-by: Marek Vasut <marex@denx.de>
> +---
> + ChangeLog | 6 ++++++
> + builtin.c | 5 ++++-
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +--- gawk-5.1.0.orig/builtin.c
> ++++ gawk-5.1.0/builtin.c
> +@@ -957,7 +957,10 @@ check_pos:
> +                                       s1++;
> +                                       n0--;
> +                               }
> +-                              if (val >=3D num_args) {
> ++                              // val could be less than zero if someone=
 provides a field width
> ++                              // so large that it causes integer overfl=
ow. Mainly fuzzers do this,
> ++                              // but let's try to be good anyway.
> ++                              if (val < 0 || val >=3D num_args) {
> +                                       toofew =3D true;
> +                                       break;
> +                               }
> diff --git a/meta/recipes-extended/gawk/gawk_5.0.1.bb b/meta/recipes-exte=
nded/gawk/gawk_5.0.1.bb
> index 1b29ec3113..7ca4cb77e4 100644
> --- a/meta/recipes-extended/gawk/gawk_5.0.1.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.0.1.bb
> @@ -17,6 +17,7 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mp=
fr"
>
>  SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://remove-sensitive-tests.patch \
> +           file://CVE-2023-4156.patch \
>             file://run-ptest \
>  "
>
> --
> 2.40.1
>

