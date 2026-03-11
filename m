Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422F3112589B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:34:27 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6256.1773261264698043614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jFau7g51;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79495b1aaa7so3239327b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773261264; cv=none;
        d=google.com; s=arc-20240605;
        b=kkRqLB1DsWTSFTvNq1ziMxK5aIBJPusTZyZSqXDMs/Dg0H+9dL7pop6BpI/AUx5nAz
         DsFrxFqkm9/ziFN/8w39B9ZZ9LAxeFe5SEL3NRPpwTtGohjVao+3MntFT+eP+zIEEOE1
         NEvlTOUn+u7JeMGuQVDimm0A8rNUwUGmgH3z6voygBFXEeu82f0A2I9+gOUpEz23GUsH
         L6yPl/QeGBQOvLEnYzh6i0YKKo2aO3dYz8z1zUvBf49sHC/t7GEUJ22IbybiFdVjeH6W
         i6e3J21PovSAmJK3MsvXJpDXsgiAeX5sZN1MPDQcSVtdZsDahymRr7NG5HQK+oXMWUwq
         WT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YHHr2oCOPVH75pfAWXhNBRYFcYwCnxlhXjko158cSvc=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=aZQiAIt4pFDkkwyquTIs2bFOCWdGJK7rAkMJL74a5hCqF6a8d95KGQAsHgUWn55UhY
         iDyIkjCCm3Pu/4bC1Mq5JFmxaq8KMtqW3ApcEAlI0aUFfHNvwgMl1XlrLi7wi8zFOzrw
         TJKRqTYx9K71anw5DzNt4pAoQn9Vvp0DygRdNPBxcZ7TieE28eHHvvfSAd03d6rsu8I9
         Mm/CGJeqNH0BCWgArTBP4HdjJUVmVeYY2KwgqaDobWy9dm4yK4HJBVfRELPwDmayvDGu
         CvPsJX/LlP/HIuqxdlc88H6PuZqX82AUYtcZw7HS4/SCXVoSvlofcYtNMW1y6iBzgYoP
         WMjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773261264; x=1773866064; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHHr2oCOPVH75pfAWXhNBRYFcYwCnxlhXjko158cSvc=;
        b=jFau7g51x61/LsMTezPkegb5jcgOe9HRJ3/JbHBOdWQcRondUP1WpbKSc33pzXbmJb
         bmDkxVJPHLtVeyPdPoeiImUmSKXrhhpiTCUiiyvcjvj3ORJKdy3VOLeZ63O1P7nTwnAV
         aKeh/Pg0osRFZINI6299eSug2efJl18uX5Yb9UR0YdvfkRq0lZb9ejap3V96gP4LZYT1
         4EFyoSIvlHQiFgmjvNLM4IAxe3T482wH5Gi0pJvWyONnT0+6AMUhQnSe2IXiqNFkvaFa
         qXmRlWPlkuScW3h9ZuMaxOB2H76/lmaLE8jLpuS/bZBLPmAeXrWWN1hxLHDHnaPcq111
         gUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773261264; x=1773866064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YHHr2oCOPVH75pfAWXhNBRYFcYwCnxlhXjko158cSvc=;
        b=D5GJ/Zp44Z2vfDfBvDRtjUJ5EBVevVqgQXZ2dLVvOm8q2nEqvYW3A2Ua9EDz0k9EBt
         a5dSBVkb2HSuXm8/fK761FZ1Wy/pv6iPSFCTfVyc6V9WbEx6gQxxG8hXygpA3rAZhrMb
         KcEepdPmsmAjbk4F/MpA1K9yfV2MYEoxYFk/+uur5ZlD9S4AKx5GXTixp0Qes1j1uLGx
         QueYEK01CGaYItfrxYUSBWBmh+6InjmPP2+45lti3J87dYYAIORjuVMhZj9Ea3/wDwta
         cT+bcyPn9aJFJqNbofXYWqu+zPGvIHz8kprFdx/6TmTN0fM4or+uL3TZdX0BiUnuQwWo
         KMTg==
X-Gm-Message-State: AOJu0YzTmnc2FL33W49bdqNgEIqkelP1mgBMegaotei2gGNBcbsbxyEH
	mgwByY8jeANkl2TP+JiC5FRa+G+tht37I6lpodEj6WHOMD8KupdncHU6ntLNa0Ye33pHCNXSp7n
	y2ZTqpa066rp2+AuTFQapLzdTfm5KToQ=
X-Gm-Gg: ATEYQzyQ2+PKYQQWoylpi+n5tSsZNEgV/OyPt+XGb6y1rahG7KaaK04/3+gMSj96l3S
	8VY/dKzudlN+w35443rSUjg95zn5Jq9scJrTxGZuyeqHmKu1LHScxNpvc+2zA8mb2QvyQPGkI50
	BbbfVUDkwQ+b98TXUgvW4h6eRGt3cJe+ZT0sShbJoNJktCAQnzGIIRnzPo4svvPvIuUv4IXCJqL
	7hcsWrbYX0KE4xrEece4JHLhxIZi2TszD1Y8SxbwS2xHdBPviY5lsnpqMwbP6rNRfmqCYyGFlaD
	sYMvAwh9cigz0O4o5TXHQw==
X-Received: by 2002:a05:690c:6e85:b0:78e:6176:2c8b with SMTP id
 00721157ae682-79917fbf5c2mr36724117b3.49.1773261263707; Wed, 11 Mar 2026
 13:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-4-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-4-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 14:34:12 -0600
X-Gm-Features: AaiRm538J0OQpP6c8wSLR3ksR5gwSW5J35RYPXq3WTtrlid_7MZhhrHX5h9Bd0s
Message-ID: <CAJdd5GbO1EF1yar=3HGz6khomcF3wLYCSVxSbtVAvprxTrwNpQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 3/7] spdx30: Add ecosystem-specific PURL
 generation via bbclasses
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232909

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Have each ecosystem bbclass set its own Package URL by prepending to
> SPDX_PACKAGE_URLS, rather than detecting inherited classes from the
> SPDX code. This follows the principle that each class should know how
> to describe itself.

Much better! Except for something I noticed below....

>
> The following bbclasses now generate ecosystem PURLs:
>   - pypi.bbclass:         pkg:pypi/<normalized-name>@PV
>   - npm.bbclass:          pkg:npm/<name>@PV
>   - cargo_common.bbclass: pkg:cargo/<name>@PV
>   - go-mod.bbclass:       pkg:golang/<GO_IMPORT>@PV
>   - cpan.bbclass:         pkg:cpan/<name>@PV
>
> Additional ecosystems (nuget, maven, dotnet) can follow the same
> pattern in their respective layers.
>
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
> index bc44ad7918..e884b344ef 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
>  # https://github.com/rust-lang/libc/issues/3223
>  # https://github.com/rust-lang/libc/pull/3175
>  INSANE_SKIP:append =3D " 32bit-time"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS:prepend =3D "pkg:cargo/${BPN}@${PV} "
> diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.=
bbclass
> index bb76a5b326..355e7e6adf 100644
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
> +SPDX_PACKAGE_URLS:prepend =3D "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
> +
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
> index a15dda8f0e..344712b193 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -32,3 +32,6 @@ do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
>  # Make go install unpack the module zip files in the module cache direct=
ory
>  # before the license directory is polulated with license files.
>  addtask do_compile before do_populate_lic
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS:prepend =3D "pkg:golang/${GO_IMPORT}@${PV} "
> diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bb=
class
> index 344e8b4bec..aec69ebfd3 100644
> --- a/meta/classes-recipe/npm.bbclass
> +++ b/meta/classes-recipe/npm.bbclass
> @@ -354,4 +354,11 @@ FILES:${PN} +=3D " \
>      ${nonarch_libdir} \
>  "
>
> +# Generate ecosystem-specific Package URL for SPDX
> +def npm_spdx_name(d):
> +    bpn =3D d.getVar('BPN')
> +    return bpn[4:] if bpn.startswith('node-') else bpn

return bpn[5:] ...

otherwise the "-" is kept.

> +
> +SPDX_PACKAGE_URLS:prepend =3D "pkg:npm/${@npm_spdx_name(d)}@${PV} "
> +
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
> index 1372d85e8d..fd5cd7af95 100644
> --- a/meta/classes-recipe/pypi.bbclass
> +++ b/meta/classes-recipe/pypi.bbclass
> @@ -55,3 +55,6 @@ UPSTREAM_CHECK_URI ?=3D "https://pypi.org/simple/${@pyp=
i_normalize(d)}/"
>  UPSTREAM_CHECK_REGEX ?=3D "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[=
\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
>
>  CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
> +
> +# Generate ecosystem-specific Package URL for SPDX
> +SPDX_PACKAGE_URLS:prepend =3D "pkg:pypi/${@pypi_normalize(d)}@${PV} "
> --
> 2.53.0
>

