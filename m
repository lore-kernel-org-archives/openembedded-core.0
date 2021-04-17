Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.4799.1618671714549986306
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 08:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fCBm6z6U;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id dp18so10241345qvb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Apr 2021 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T+4moY1d1q36Dbx8Mhk+Oob/s+cOvG7gOLktMmxmERw=;
        b=fCBm6z6UjUpivnROQL00GlRiiXRNP20Gd/IzQhCPKQL3YLTEErRSCV/8PGDoP1n31D
         WJnrnXp80y8RQyYWyuCUMqXfotmZFMSAS++TRStQWHMH2x97r/S68U+986hEzEl0weQX
         HWKgk4W+s/FpYz3HF8tlYjKIz7Bner4NSdR3CNcq5sc55g46UV0xLgXyd1joeG+sNSWH
         HDkUpwaQ3Ypq2SCUJI620raCOWkD6QDz8p6NIZR4KI5zuCc1jGhJkIMCbfzJqvoquE03
         AxnvLzMX2xTEBJRkCCQO7YarKvgYWfo4L4b5KKjgPkMNIlXiotkoV+AZmJ7Ku0EiHSdo
         jllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T+4moY1d1q36Dbx8Mhk+Oob/s+cOvG7gOLktMmxmERw=;
        b=n0mJmhmdQ/Vh0NAm2zr+eTr+ByyUa5OHvlBS9QXt8RwCbh/s5Q2uIgjWu4FMbRMIvv
         Y0hQKCYd7nlbpQ75UuEsJN8u4ZZiVtuMeUlVUPuIugBrPtFsAzU39/cV30D76qZFLHcu
         yoJe5JybPaTjoYE/+jqQvt6A0cxdcUs5FWsO4nV59NsoXGeyXptlD1Y42DJ4r3/Nat8p
         gkV8TyTZcdKDAvcuJKefTBc4OYb8MGBCX2TpfPE4B56sF0ALBovGisqLq6u250netk8P
         zCtaJsSIrp5J4e1awogqhmbOFT/U2I+fXVrPr/3uwPvbJPIJ+F2e1YyrnUMOfbYYwU+z
         xh7A==
X-Gm-Message-State: AOAM5330nBXK9lcqig1b/qdiWEIAo1Dp9g2C7tc8se6LE3rPeT3qp9os
	tnBrLkWQwlxf/wdNfAi0QJIM0klKQn6awmQNdzM=
X-Google-Smtp-Source: ABdhPJzCQ3xWRNMwGMK9fEyriKR8pIV2IUELzFkrISk1RzD05b2V3Fnsw18XXm6CqBkzkxCzOJWUtL4Z2fg65T4MNb0=
X-Received: by 2002:ad4:5bef:: with SMTP id k15mr12120555qvc.16.1618671713480;
 Sat, 17 Apr 2021 08:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210416222834.273394-1-paulo.zaneti@gmail.com>
In-Reply-To: <20210416222834.273394-1-paulo.zaneti@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 17 Apr 2021 08:01:26 -0700
Message-ID: <CAMKF1soMF+Ep-bgaFBmGcVsuNVrzoPixwtcW081JPvhNBovWGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: fix startperl configuration option for perl-native
To: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing failure in native recipes e.g. opkg-utils-native


| /usr/bin/env: =E2=80=98nativeperl-native/perl=E2=80=99: No such file or =
directory
| make: *** [Makefile:26: opkg-build.1] Error 127
| WARNING: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/opkg-utils-native=
/0.4.3-r0/temp/run.do_compil
e.2244982:187 exit 1 from 'exit 1'

On Fri, Apr 16, 2021 at 3:29 PM Paulo Cesar Zaneti
<paulo.zaneti@gmail.com> wrote:
>
> Unlike vanilla Perl "Configure" script, perl-cross "configure" does not
> derive "startperl" from "bin". It instead derives from "perlpath".
>
> This patch aims to fix "startperl" configuration option for perl-native =
by
> correctly setting "perlpath" on perl-cross "configure" script.
>
> Signed-off-by: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl_5.32.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-de=
vtools/perl/perl_5.32.1.bb
> index b28040c7fb..82c2922066 100644
> --- a/meta/recipes-devtools/perl/perl_5.32.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
> @@ -95,6 +95,7 @@ do_configure_class-nativesdk() {
>  do_configure_class-native() {
>      ./configure --prefix=3D${prefix} \
>      -Dbin=3D${bindir}/perl-native \
> +    -Dperlpath=3D${bindir}/perl-native/perl \
>      -Duseshrplib \
>      -Dsoname=3Dlibperl.so.5 \
>      -Dvendorprefix=3D${prefix} \
> --
> 2.25.1
>
>
>=20
>
