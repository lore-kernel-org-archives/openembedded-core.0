Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7933C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 01:23:50 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.38696.1752715428786824509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 18:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7Qb7BIM;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7086dcab64bso3950727b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752715428; x=1753320228; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsqQbQ63Fq0qBreF1yzQLQ6Z9+awQltQgoFstZr9lAI=;
        b=e7Qb7BIMZ2ywGMtLsoppm4B0VPvJRYSgbIRP41daAV8d0oZRTwgG4163icluWX7t9/
         jmkdy93vkY8q23ednEbF0SwOs/Lw6hhddh6uUfJFvquoyRa5Sh1EX4oIGuWi+b0iFrXE
         F9by2B1yb4Vx0Kbpr9+emm79uN+jhPu2+nwym2O2o4i0Vz7Qcqld297H5GF291c/PSvW
         6L9SuKFH8YAns64xnFj1BGuCtbTwGgYwmdZ4kh+3alYBUH7YUjuIa7VM/2banrcw12fJ
         SozP9MRdSGWUFThiRornpAJccjdVraGXTF2cSk2dG79vAkn1Fo+HpLNlUDc5QZi1EYz3
         nqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752715428; x=1753320228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsqQbQ63Fq0qBreF1yzQLQ6Z9+awQltQgoFstZr9lAI=;
        b=I9o2oxbzxbRMT5Zn8npLDhRPkRMVlnUyS0Q38y6Mj39H5uaK7T0L4WvqawVcEbnlu7
         2qH61lmDeQt+IbxBcMSO/Xfryf+p6NFOtUJroPHY0c+sJWsaO2ymIOfI497R2GL6hDbZ
         Kp0TJgJvMM6jZnfmjrdu/w4UegMLFeqr0iZ0GOIFwTgZ98QvINadrOabFHma+Sk3NJTQ
         W7kqXVCv9B1ptT4M4qYzD2Y15PEXJfRZaLxY25OvaEbroSmO9f3yZW45dh5n7uTEIaNo
         r/yKgCnJ/W8YHJpQ4+sM2CSuboALDRtf1l+u540oEq4LNRjJMVMNFcg2ObN39KDSpJh+
         jWew==
X-Gm-Message-State: AOJu0Yx2tpZ09hfFSL3gA52JzBAQY4zlRFQnZaIRv1Gqynh/y21yLAJ2
	jBlN61jguWFgMBnRV6w4ILUGGSoOQn/y//SA+f36YVARI9/APsCywst59fyIqt3IOzJ4aFXW7tT
	Le3eX72230Ug/g0Zb4EeXZHlg3ApBJv8=
X-Gm-Gg: ASbGncsc9AD/a50YvdAIP5OabWmv30C7XBNZzpS5yAJPCEdRl9pRAi8hx89n3VMRPuB
	eK2KzW5ubZ9HqxeHrwJjQKhrwWLSql823BqDeM5phW0UrAOuEYpTyf4uhmXT9tTree5qVyk08tz
	2JUi/5DJTdnLlkgUAolfU5lgWyBLCb5AAeiGv1M6nd/t9uQpkNOdDYIQ0P6cNZe9Z0OQrivYpsx
	k8dgRZcLr3QnNqb
X-Google-Smtp-Source: AGHT+IGoNHC7pv+1+MgsblqWEmZyqaYN189mYgLLGMt3MY5wBFglB4vm4sj1m5GzYQ7e/nNeTvysOb85BCIwGuGZW18=
X-Received: by 2002:a05:690c:9:b0:70d:f3f9:1898 with SMTP id
 00721157ae682-718374a1941mr75409307b3.35.1752715427688; Wed, 16 Jul 2025
 18:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250716094954.866783-1-ross.burton@arm.com>
In-Reply-To: <20250716094954.866783-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 18:23:21 -0700
X-Gm-Features: Ac12FXw6niByi0SAYY9wGvqA7hkuQcCiLFx-LrUFIR_8Nr5ehyB8SRxgjpBOzs8
Message-ID: <CAMKF1srh8VDLOo_029px5CMMsWdoxo73t5-4PuVbNRVk6dFm0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ccache: move environment variables to the
 configuration file
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220479

On Wed, Jul 16, 2025 at 2:50=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Move some environment variables to the configuration file, so there's
> less happening in the class.
>
> Some changes were made as part of the move:
> - max_size was removed so that the per-recipe caches don't grown without
>   limit. The default cache is 5GB.
> - compiler_check was extended to check both the specs and the version,
>   so that a version change that doesn't affect the specs will still mean
>   a recompile.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/ccache.bbclass | 13 -------------
>  meta/conf/ccache.conf       | 15 +++++++++++++--
>  2 files changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 2d6a3ea7229..5ce23e50f34 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -42,23 +42,10 @@ CCACHE_NATIVE_RECIPES_ALLOWED ?=3D ""
>  # in different builds.
>  export CCACHE_BASEDIR ?=3D "${TMPDIR}"
>
> -# Used for sharing cache files after compiler is rebuilt
> -export CCACHE_COMPILERCHECK ?=3D "%compiler% -dumpspecs"
> -
>  export CCACHE_CONFIGPATH ?=3D "${COREBASE}/meta/conf/ccache.conf"
>
>  export CCACHE_DIR ?=3D "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
>
> -# Fixed errors:
> -# ccache: error: Failed to create directory /run/user/0/ccache-tmp: Perm=
ission denied
> -export CCACHE_TEMPDIR ?=3D "${CCACHE_DIR}/tmp"
> -
> -# We need to stop ccache considering the current directory or the
> -# debug-prefix-map target directory to be significant when calculating
> -# its hash. Without this the cache would be invalidated every time
> -# ${PV} or ${PR} change.
> -export CCACHE_NOHASHDIR ?=3D "1"
> -
>  python() {
>      """
>      Enable ccache for the recipe
> diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
> index 499e5327b8c..ea658708a1f 100644
> --- a/meta/conf/ccache.conf
> +++ b/meta/conf/ccache.conf
> @@ -1,7 +1,18 @@
> -max_size =3D 0
> -
>  # Avoid spurious cache misses caused by recipe sysroot creation: Creatin=
g a
>  # recipe sysroot hardlinks all dependent files into place. Hardlinking u=
pdates
>  # the file's ctime which in turn interferes with ccache's include_file_c=
time
>  # check.
>  sloppiness =3D include_file_ctime
> +
> +# Only rebuild if the compiler version or specs have changed, as we rebu=
ild
> +# compilers more than is usual.
> +compiler_check =3D %compiler% -dumpversion; %compiler% -dumpspecs

-dumpspecs is very gcc centric option and clang does not support it,
previously we overwrote CCACHE_COMPILERCHECK
in clang bbclass to something like %compiler% -v, how do we get
that parity with this approach ?

> +
> +# We need to stop ccache considering the current directory or the
> +# debug-prefix-map target directory to be significant when calculating
> +# its hash. Without this the cache would be invalidated every time
> +# ${PV} or ${PR} change.
> +hash_dir =3D false
> +
> +# If ccache runs under pseudo it will try to create files in /run/user/0=
/ccahe-tmp
> +temporary_dir =3D $CCACHE_DIR/tmp
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220443): https://lists.openembedded.org/g/openembedde=
d-core/message/220443
> Mute This Topic: https://lists.openembedded.org/mt/114182159/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

