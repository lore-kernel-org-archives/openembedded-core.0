Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848A3C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 17:07:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.15388.1741712830068994407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 10:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KqoGHznU;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54998f865b8so3668428e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741712828; x=1742317628; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWb0IUt2rIkx3krFBRMolhJ8UTGWeJouo32930EC7QY=;
        b=KqoGHznU3lLj4quw1zSKIAyLBClr+lR0g4ISPkQoimuocYWcVvA6IXfYD6OZSJ+mte
         KAZWGm1QDjMg0uMg5ZjOCsdCIQTN0B4uNY7nJXA0OZ8+XQP49DgtVgIo0s3MfgMcoWi2
         VktmKLM8kS1Bn9S+M+4vnvXOg4Q1dFhJhCRxhzY1UkwNdrVU6DUzJ+xcmRVslID8Zk9U
         P7HsTuymciy+Ka1n0v66iK4ock1soAvHJbnVfuG4fzZTZ2OIIbN5uT1rlVVu0qMwqYSA
         D5tpWdZtgwklyrj1rW+K0zH0VJtARsRB/gsXQbi00TI8x2tWhyVmn9fcfI2iruWkx5h4
         0ZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741712828; x=1742317628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWb0IUt2rIkx3krFBRMolhJ8UTGWeJouo32930EC7QY=;
        b=TcjbJGc7yYf8070zb1Usx2geuZ7o8qgnRyy07a0PO59mxIhOo7OtmeUkRmlOlwAs2t
         HPjbs3ikzDA/qpjAl3/YcfT/1J2rCEOWqi8dgct1QFRuKl/1RAWX+akVQtgV0U6BH7Tv
         dEB9jKtlGYt2RJOp0pHnRDOX4eCDMewSq7Cha7OjpSIJP8FUPaZkAP3c6aPDGGmsUHG7
         17WSRuYYVw9aLC/2U8lVOyjg8nrkeLFg6hG+vhhfeoLFwBkdih3yW10YHKeNaDTVNvH/
         Sy5bPxrgPDp6oijkcwoBlbL2ldjCo8K7wdph3fmwIXp0Y7MmVqe/+shjKtg8rpWEH7Ii
         4SUQ==
X-Gm-Message-State: AOJu0Yx/8lY+i5vTrTdaayDKshaGC1+/DDQ+JmVGW130B8idDm7vE9mv
	J0hhGUpgWKq9C2o+I+cM/6jxLnyOoukK9uMvZ2K267LIGAMvfY4r9B49M6kUcvi1n/bWuI9AAvO
	ltLdJIUP1FWenXw9RFyKETCaAvfU=
X-Gm-Gg: ASbGncv4j4MxSNUNL2eEf7CE7IhcwWm64dS3BSiwpvoex/xydVwsSBh9Qvvy+60rpJD
	c+6PyK6LURtNGb5BqEaMrGhtvMOIic6GXauCGK8OQfgmwy/FgWXT0GW0mzQaUmnOpOcbPmjW/+A
	jU7hzvskdyWV86Gdbvw0WX7wlrMIzB
X-Google-Smtp-Source: AGHT+IEtWjPrySWRrNKAci6kCbOCb4voAEyvxYzMQfPELJ1gRVZnMSPNJpTaUPq8tAPe6tpQaBXXERNpzQWnb7B4A7A=
X-Received: by 2002:a05:6512:3d8f:b0:549:9044:94b3 with SMTP id
 2adb3069b0e04-54990e67285mr5844398e87.29.1741712827844; Tue, 11 Mar 2025
 10:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250311162532.1676284-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250311162532.1676284-1-Randy.MacLeod@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Mar 2025 18:06:55 +0100
X-Gm-Features: AQ5f1Jr36ORgfMF87spkNI0oFsfOcDDuAr5Y6-4ZhSZJUUDKwcPs8bZoqHZzTgM
Message-ID: <CA+chaQd7urrvOvB3K1hbh523xW+kYq+pr5=4Y9HgLOwxn6oS4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] tcmode-default: eliminate needless rust,
 cargo defaults
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 17:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212577

I know you want to eliminate this whole file, but I find RUSTVERSION
useful in situations where some layer wants to backport different
version of rust and related recipes and then the DISTRO can set just
the RUSTVERSION variable to choose between the versions available. Now
the layer with different rust recipes will probably need to provide
some .inc file with this, so that the users of this layer won't need
to know which 8 recipes need to have PREFERRED_VERSION set at the same
time.

Like it was with
https://github.com/meta-rust/meta-rust/commits/master/conf/distro/include/r=
ust_versions.inc
https://github.com/meta-rust/meta-rust/commit/9c0a1059be62417439615126ddd30=
44269406a66

otherwise the version from layer with higher priority will win and the
DISTRO won't be able to easily avoid that, other than adding all these
PREFERRED_VERSIONS or using BBMASK or preventing that layer to be
included in BBLAYERS.

Just my 2c

On Tue, Mar 11, 2025 at 5:25=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Manually setting preferred version is not required so remove
> that for rust and cargo.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 702fa4d75f..5cc93405f1 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -14,7 +14,6 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
>  BINUVERSION ?=3D "2.44%"
>  GLIBCVERSION ?=3D "2.41%"
>  LINUXLIBCVERSION ?=3D "6.12%"
> -RUSTVERSION ?=3D "1.83%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> @@ -44,15 +43,3 @@ PREFERRED_VERSION_glibc-mtrace             ?=3D "${GLI=
BCVERSION}"
>  PREFERRED_VERSION_glibc-scripts            ?=3D "${GLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-glibc          ?=3D "${GLIBCVERSION}"
>  PREFERRED_VERSION_cross-localedef-native   ?=3D "${GLIBCVERSION}"
> -
> -# Rust toolchain preferred versions:
> -
> -PREFERRED_VERSION_cargo ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_cargo-native ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_libstd-rs ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_rust ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_rust-llvm ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_rust-llvm-native ?=3D "${RUSTVERSION}"
> -PREFERRED_VERSION_rust-native ?=3D "${RUSTVERSION}"
> -
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212574): https://lists.openembedded.org/g/openembedde=
d-core/message/212574
> Mute This Topic: https://lists.openembedded.org/mt/111643200/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

