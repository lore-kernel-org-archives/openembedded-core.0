Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E678910AB822
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:13:59 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57340.1774556032546431785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 13:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oLEfrXXf;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fc4425b6bso14849897b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774556032; cv=none;
        d=google.com; s=arc-20240605;
        b=JZwjLy+L/EPlUSUcyK+JuJqs21WlcmD0E3PCyelKje2MNQWQiv5vi7Bp01i5u2/mmR
         UNdCJpyGEneYZ1UiCLf1A1RpUa5egUDKihjrjar6Hjr62g4Yxa+73SrVYLMd0+f5q4x8
         0Y8YUZ8ayQbIAxs0vr+uoYcEorKNlnEHOz9g3rCkIsgfBNNhupkfo38pPqs5T4ebjph0
         LlsaJG9/EDVOWDYSLZDIt4sPQ90YrYLBS8iID3VqW9ynbNrSJdIqOgRH2cEBWJ+w3A7d
         zOJN+JJz2zDK8njpLd6NF9VGHXj2xGZzGAgRZCwuNkPtRbecJehH/CzxoMNfsjElz6T8
         NPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdh5QDhbClMHdgvhOQ8xzYP5cTSDQm4dbH6onU0rn4Q=;
        fh=XL+ydw4zRzqZKs8yhWIx30/frJay1bXF2X1wuGsnf7M=;
        b=BKnfxFqSc+s9gEJI1dN7+uC8bM+XrufHO0yjoxySBOu9Uw7FvyjR9hSRqJbWbstGRA
         AXx6YT51EiaDcWxgjsjcwhesApU/554uRq3ZUCZtOCjRneEptGcBMzGtg0rytU/fnui1
         rjlzOOYXuLb4/YfqfcXQY3jqtBkZKVZnpDeNzRAHe+MVnsRUD2T5X3SN1PKX8Gp803vz
         qotPc32jnR/c6qiU5xprYrnV09AEuYt9NWNUhPXCNUySw9FhY5DRJXhtQ4yhLMYfvIuY
         H7NQBZiAOvw08FLMlfE9ABG/NybmR704E2+joRwSaHjfqSDwF3a21veUZlyvrX1qW7ZW
         tn7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774556031; x=1775160831; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdh5QDhbClMHdgvhOQ8xzYP5cTSDQm4dbH6onU0rn4Q=;
        b=oLEfrXXfwk5MmjrBw850S/5xaBnXw29u4XWtEWWzxHpaPbIQzpNW2vmguAkeOjniAz
         1cG+t78lrisFaI3JyWgcr367MLhZ4VaC+nbHQAR1Bdectw84jOYLn2CVPNzN72SMShkS
         wbeFGe6gyk1kFKDPlg+TBuu7vMMG0cq5SfjrqYFUymDKFFdwyKzLNNYiTDdhsDhu9YtI
         iafmBLhVx9X/TkYJVMv7N/ZvggjUcaxHaLNcFNK0WpQcrHvGfc2ISKi1/Cv4SYuyhYor
         ljkU5fRF2/9hEWEh5d5OO8imlj3ZgMKpqvjWOOt89S5+6jjMdgBESmBAuyMeYc9gjP0Y
         fn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774556032; x=1775160832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kdh5QDhbClMHdgvhOQ8xzYP5cTSDQm4dbH6onU0rn4Q=;
        b=GR14t8XGA9bX5Fp5a1QjyE1aG7UsqDyj+pxpYzePQNPYRWOCNZ6vWzFwOuHOqxc4Wl
         CBEgjQxYE60YdowQnY8Cls8/VaeGW/l3pQRbPseB63QQFFVfhv3I0jk2UkFMjO4z2kPg
         KKX9OyJJlmcy53M9aPU9FCnzU3p0ia2nTj3xUfeUivj2kJyjso7RDbEbHbU94WN48nn5
         V3B1cdnrPjdUHND4Z2ZZ7RkJq87MWJ+xbEJ78XRWvHsyARJWc2N3LEncSBLDcTgjwiT+
         4OWNHwJ5hc55/v2jmQzt2y7WCan1Lsq8BoYVyZMuikS9HwyksnfMUwpZBZnvEuFQVHYM
         0OrA==
X-Gm-Message-State: AOJu0YwIvEZP68edqFOLVTnn9gkD37JfOsp7GqLY1SJsniMHJgZlZt3k
	5bhm4L16xYAKC3RmqhAPXEmWgFiThmzgSF7yP5bR+XR9tVo0gQT/M9pV77x4Uz49up+9IDcoGcj
	MXI5rYx0PcobZs+itk8k6XPKwe4QHwDQ=
X-Gm-Gg: ATEYQzxDEiR06txERJV5v/IoME4FvQt0wNUdFPf+t+PqkBBOCbAIu10OAL5jlxHJMFo
	Bx+dqjXlSLy312KHuf0suS3gIubkxHzRfAb5Aryc5j/R/1HHyoteXf3M5y2qWdkT1BiY+1H1aKd
	ARhnwxBERrslB2cokK+w6LSAPC8bX6uqt4kN5Hdhla/rS7RzmBMwbg0YqbnH+ZD/diF9vIoJI7J
	jSOGo4Z57vBcv7vVoomOfJyXCXR6N9yMP/oIrfIM87Hn33aE00OC09hqNiofZwEiXt7G/rwQXiq
	JFwyahPewpGftgxEMGa95w==
X-Received: by 2002:a05:690c:6983:b0:79a:dae4:5848 with SMTP id
 00721157ae682-79adae47146mr72833137b3.20.1774556031594; Thu, 26 Mar 2026
 13:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260324132958.2316491-1-stondo@gmail.com> <20260324171502.689012-4-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260324171502.689012-4-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 26 Mar 2026 14:13:40 -0600
X-Gm-Features: AQROBzCcwBZdaiMjKIyeKxAT5jGjSeAo2XYbjvkQnJdBPZkuCZgu5zsWICJ36M4
Message-ID: <CAJdd5GZaSibMjCiTCy9mpESQpY5KrGKU82HxMBxnbaDhH25q0w@mail.gmail.com>
Subject: Re: [PATCH v16 3/5] spdx30: Add ecosystem PURLs for recipe classes
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234049

On Tue, Mar 24, 2026 at 11:15=E2=80=AFAM Stefano Tondo <stondo@gmail.com> w=
rote:
>
> Add SPDX_PACKAGE_URLS to recipe classes to generate ecosystem-specific
> Package URLs for SPDX 3.0 SBOMs. This enables proper package
> identification across different packaging ecosystems.
>
> Classes updated:
> - cargo_common.bbclass: pkg:cargo PURLs for Rust crates
> - cpan.bbclass: pkg:cpan PURLs for Perl modules (with name normalization)
> - go-mod.bbclass: pkg:golang PURLs for Go modules
> - npm.bbclass: pkg:npm PURLs for Node.js packages (with name normalizatio=
n)
> - pypi.bbclass: pkg:pypi PURLs for Python packages (with name normalizati=
on)
>
> The SPDX_PACKAGE_URLS variable is a space-separated list which
> create-spdx-3.0 already reads via set_purls() to populate
> software_packageUrl and externalIdentifier on recipe packages.
>

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes-recipe/cargo_common.bbclass |  3 +++
>  meta/classes-recipe/cpan.bbclass         | 11 +++++++++++
>  meta/classes-recipe/go-mod.bbclass       |  3 +++
>  meta/classes-recipe/npm.bbclass          |  7 +++++++
>  meta/classes-recipe/pypi.bbclass         |  3 +++
>  5 files changed, 27 insertions(+)
>
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index bc44ad7918..0d3edfe4a7 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
>  # https://github.com/rust-lang/libc/issues/3223
>  # https://github.com/rust-lang/libc/pull/3175
>  INSANE_SKIP:append =3D " 32bit-time"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:cargo/${BPN}@${PV} "
> diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.=
bbclass
> index bb76a5b326..dbf44da9d2 100644
> --- a/meta/classes-recipe/cpan.bbclass
> +++ b/meta/classes-recipe/cpan.bbclass
> @@ -68,4 +68,15 @@ cpan_do_install () {
>         done
>  }
>
> +# Generate ecosystem-specific Package URL for SPDX
> +def cpan_spdx_name(d):
> +    bpn =3D d.getVar('BPN')
> +    if bpn.startswith('perl-'):
> +        return bpn[5:]
> +    elif bpn.startswith('libperl-'):
> +        return bpn[8:]
> +    return bpn
> +
> +SPDX_PACKAGE_URLS =3D+ "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
> +
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
> index a15dda8f0e..0f5835f26e 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -32,3 +32,6 @@ do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
>  # Make go install unpack the module zip files in the module cache direct=
ory
>  # before the license directory is polulated with license files.
>  addtask do_compile before do_populate_lic
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:golang/${GO_IMPORT}@${PV} "
> diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bb=
class
> index 344e8b4bec..7bb791d543 100644
> --- a/meta/classes-recipe/npm.bbclass
> +++ b/meta/classes-recipe/npm.bbclass
> @@ -354,4 +354,11 @@ FILES:${PN} +=3D " \
>      ${nonarch_libdir} \
>  "
>
> +# Generate ecosystem-specific Package URL for SPDX
> +def npm_spdx_name(d):
> +    bpn =3D d.getVar('BPN')
> +    return bpn[5:] if bpn.startswith('node-') else bpn
> +
> +SPDX_PACKAGE_URLS =3D+ "pkg:npm/${@npm_spdx_name(d)}@${PV} "
> +
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
> index 9d46c035f6..bd21557c60 100644
> --- a/meta/classes-recipe/pypi.bbclass
> +++ b/meta/classes-recipe/pypi.bbclass
> @@ -54,3 +54,6 @@ UPSTREAM_CHECK_URI ?=3D "https://pypi.org/simple/${@pyp=
i_normalize(d)}/"
>  UPSTREAM_CHECK_REGEX ?=3D "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[=
\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
>
>  CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS =3D+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "
> --
> 2.53.0
>

