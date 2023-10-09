Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBC0CD613A
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 21:16:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.75438.1696886173217637788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 14:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qKObxcVD;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9b2cee55056so908348066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696886171; x=1697490971; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeiODYD0kaMx3x+6QJi5X19xCBy9YbAVV4QvmjzfiFA=;
        b=qKObxcVD0B1LN0bsIhrABVIb+dCY1nlafa83B8R2Tm/w7xlLj35HP+XGLxibGuCN5h
         8gL5R5Y3YfNconWZNuDwN5YtwnVD82qwc2k/AcLYtOUJUE0ervUlFh+hVVzvAK9Vz0S8
         1qnnTPlonZ4V7hBXZppgPSd936pmFPZTDMk1AdVCKdLJKQ56/Sno8JBjsFxeH7yD5ASW
         s7nT9hvLpu/kf72N08SWT0Z+GVa3TqOWSM+lzHxCxya16AyVT53LptIRZ2LEJhuOi3Xu
         7ul7XYVgpWoawO5nwnid8TFPRIM6hCKCHIYWbbas8U8/egjL90lbhdOZ774RquBJiV31
         WFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696886171; x=1697490971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeiODYD0kaMx3x+6QJi5X19xCBy9YbAVV4QvmjzfiFA=;
        b=WdnbOYW1Am5cxa8mUe+X2aJxBFbfq7Gm6MX6oeacjQUw1NC92MJvT0XTfmH+qY4tFz
         JjIzd9+Q7umQCHGrLb4AYjEXVnZjriXmrShHfzsMQcLYgyAPH/uFsXvWH14+O4OD0QWU
         7nlyzqrIcOEkEDYrBnSciL/fXRW7mJmDGpCXlIZuXv/qb2vkzrQM/KxuFolW0o2UFGwJ
         KuvE+WSgIQV529bEtOOjHpo5GkpF+3yOkINyAK1U6/78QZwNcu9tgtl3YQUXCTVpi6zD
         EfUJTLCFbnV/F0x7zmRKErlHlDyi1bo+VU7hKzcC/Q4bLa5En7d3ZXuCHqySMGsEUAx6
         YmnA==
X-Gm-Message-State: AOJu0YxERjjA8hF2vUUZEyP2pUhsQ5zoIHGgADn3l0QyKgn3m5gm1fB9
	5qXpPRgfGApOi8uiag2nw18C+drtlUYEmNUv+KutSg==
X-Google-Smtp-Source: AGHT+IEl2U4jcpcakSIOfjRTUdqXHhTERBvwC9QVukFAasEwLnC/NijxjoTSTHo4KypQbbByyz8Zluoi5QlZ4uJtkg4=
X-Received: by 2002:a17:906:1011:b0:9ae:513d:47bd with SMTP id
 17-20020a170906101100b009ae513d47bdmr16420054ejm.26.1696886170966; Mon, 09
 Oct 2023 14:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231009191935.202467-1-marex@denx.de>
In-Reply-To: <20231009191935.202467-1-marex@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 9 Oct 2023 11:15:59 -1000
Message-ID: <CAOSpxdY8FfeUh-6Nj8AmyTVbRkN6_vX7eJrpFhtq2ZHt-seYYg@mail.gmail.com>
Subject: Re: [dunfell][PATCH v2] gawk: Backport CVE-2023-4156 fix
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 21:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188868

Sorry I didn't catch this earlier, but I stopped reviewing after
noticing the Signed-off-by omission.

There was already a patch submitted for this CVE:

https://lists.openembedded.org/g/openembedded-core/message/188624

Steve

On Mon, Oct 9, 2023 at 9:19=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Pick fix for CVE-2023-4156 from ubuntu 20.04
>
> A heap out-of-bounds read flaw was found in builtin.c in the gawk
> package. This issue may lead to a crash and could be used to read
> sensitive information.
>
> https://nvd.nist.gov/vuln/detail/CVE-2023-4156
>
> Upstream commit:
> https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=3De709eb829448ce040=
087a3fc5481db6bfcaae212
>
> https://packages.ubuntu.com/source/focal/gawk
> gawk_5.0.1+dfsg-1ubuntu0.1.debian.tar.xz / 12.9 kB / 12d878acc04cd6328b79=
3455547c870f
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> V2: Add Upstream-Status for
>     https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=3De709eb829448c=
e040087a3fc5481db6bfcaae212
> ---
>  .../gawk/gawk/CVE-2023-4156.patch             | 27 +++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.0.1.bb      |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
>
> diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/r=
ecipes-extended/gawk/gawk/CVE-2023-4156.patch
> new file mode 100644
> index 0000000000..8c88b93795
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
> @@ -0,0 +1,27 @@
> +From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 2001
> +From: "Arnold D. Robbins" <arnold@skeeve.com>
> +Date: Wed, 3 Aug 2022 13:00:54 +0300
> +Subject: [PATCH] Smal bug fix in builtin.c.
> +
> +CVE: CVE-2023-4156
> +Upstream-Status: Backport [e709eb829448ce040087a3fc5481db6bfcaae212]
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

