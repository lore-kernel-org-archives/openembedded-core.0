Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77385C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 13:14:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.6953.1663852457521532762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LAMjcUf5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id n15so8574184wrq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=8L66GJ+dyjKurJ+68P6zn1RSnpz4buuF/inkGOEjnt4=;
        b=LAMjcUf5QiBBro8JpkG8lHb1fNwe/1DLdVaYPohy8tgtxhEKPh/2a+L+5EXVirFC9Y
         AOixFR5Nm15tN1Kgysl9O9u8JPx9Xh4kYB78XFbgoE/mSJJFrII0Kkn/2o0swcvQNhN/
         +do0rQYQVNfuitS9Mtg8HbyRxuQxJ6o5DbsMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=8L66GJ+dyjKurJ+68P6zn1RSnpz4buuF/inkGOEjnt4=;
        b=6Q08cHL+4zhENErJ3sR/vxfSPNWKpG+6wL/a4qlQibFxLoGntEaJi2P3nJe80WgTRn
         72DS+Y99/8LAIhsAYl7RefnS6miLHBOSzVaoy8Dc4f3rQ+xDQZH3mDfUq0Hbh70x4hS7
         4SMMA9V1ryqCclMdjYYcCQxSx/oPUivn2Fl7ZDlFFzazCMcadCyZ+tppt5/6K7DDY04m
         d780KSqxvNlSjVuok3yza4Z31L7Iinr+v+q3ArfBlbqhmEE/KFE6ipcUquxUoFzlR3j8
         n6/Pn0sx0Hn+FD8ZGs+5EscpAQVVX0WbHmBcVMoS2oHj8P1/nqfbo7vLOXOVtJI2FUYq
         IAGQ==
X-Gm-Message-State: ACrzQf231r8gLslRqEBAhob5soM78V5B//w6MkvmUzMV5haDcQ9zNbox
	gMG4IjyHVd6/7Cfc21a9Y0uS3A==
X-Google-Smtp-Source: 
 AMsMyM5TUlrV1SadnmhRoqiMixN0a5fMnaOwiGmE2cG0qZBMkc5GDR3lgh4dVFq92c0cr4Lm213ipw==
X-Received: by 2002:a05:6000:1251:b0:22a:e60f:c080 with SMTP id
 j17-20020a056000125100b0022ae60fc080mr1974206wrx.95.1663852455856;
        Thu, 22 Sep 2022 06:14:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f87:a0ac:e77:378?
 ([2001:8b0:aba:5f3c:6f87:a0ac:e77:378])
        by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4b84000000b0022b11a27e39sm5048943wrt.1.2022.09.22.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 06:14:15 -0700 (PDT)
Message-ID: 
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode
 invalid paths for templates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2022 14:14:14 +0100
In-Reply-To: <20220922124708.2218995-2-pkj@axis.com>
References: <20220922124708.2218995-1-pkj@axis.com>
	 <20220922124708.2218995-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 13:14:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170979

On Thu, 2022-09-22 at 14:47 +0200, Peter Kjellerstedt wrote:
> Previously, the paths "meta/conf" and "meta-poky/conf" were hardcoded
> as invalid paths for templates. However, this is suboptimal for other
> distros that are setup similarly to Poky. Instead, add support for a
> new variable INVALID_TEMPLATECONFS, which takes a list of invalid
> paths.  It is expected that this variable is set in the .templateconf
> file together with the default value for TEMPLATECONF, typically at
> the same time that TEMPLATECONF is updated to match the new
> requirements.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/oe-setup-builddir | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 225919be92..c1148daf4f 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -34,14 +34,19 @@ chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNI=
NG: unable to chmod $BUILDD
> =20
>  cd "$BUILDDIR" || die "Failed to change directory to $BUILDDIR!"
> =20
> -if [ -z "$TEMPLATECONF" ] && [ -f "$BUILDDIR/conf/templateconf.cfg" ]; t=
hen
> -    TEMPLATECONF=3D$(cat "$BUILDDIR/conf/templateconf.cfg")
> -    # The following two are no longer valid; unsetting them will automat=
ically get them replaced
> -    # with correct ones.
> -    if [ "$TEMPLATECONF" =3D meta/conf ] || [ "$TEMPLATECONF" =3D meta-p=
oky/conf ]; then
> -        unset TEMPLATECONF
> -        rm "$BUILDDIR/conf/templateconf.cfg"
> -    fi
> +TEMPLATECONF_CFG=3D"$BUILDDIR/conf/templateconf.cfg"
> +if [ -z "$TEMPLATECONF" ] && [ -f "$TEMPLATECONF_CFG" ]; then
> +    TEMPLATECONF=3D$(cat "$TEMPLATECONF_CFG")
> +    # Unset TEMPLATECONF if it is set to a known invalid value to have i=
t
> +    # automatically replaced with a correct one.
> +    for dir in $INVALID_TEMPLATECONFS; do
> +        if [ "$TEMPLATECONF" =3D "$dir" ]; then
> +           echo "WARNING: Removing $TEMPLATECONF_CFG as it contained the=
 invalid value '$TEMPLATECONF'"
> +           unset TEMPLATECONF
> +           rm "$TEMPLATECONF_CFG"
> +	   break;
> +        fi
> +    done
>  fi

I've been trying to keep out this discussion but I really don't like
piling in more complexity and more things we have to support because of
a legacy code path we're trying to obsolete.

I also suspect this is going to be used to "subvert" the move to try
and standardise and if that happens, we may as well not have bothered
making changes at all :(.

As such I'm worried about this direction.

Cheers,

Richard





