Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A73CC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:56:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.67081.1680519362633011455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d8Ic2wjo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id l12so28856162wrm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680519361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHyUaCSXGI4bt3IIWVnmHyGDU6sTVoEDcJuZ4lW9YPU=;
        b=d8Ic2wjopT8tVjgI0YnqywJGPgYlXsKSmQXcm10BwILvfnTV3kIY7A2UDLilGBpSc1
         ds5EHNO/xxe/5Jqy/ttC/IkV+4Z964A3Jx8m+TOoIfhKZVHkmN4mYO2RhULSQXFxR/31
         c9L0T0AGNpxbSghzpDKKexM4wHVenF90/iDgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680519361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHyUaCSXGI4bt3IIWVnmHyGDU6sTVoEDcJuZ4lW9YPU=;
        b=HmLlFs81n2KhjDpjINxgzi19krnvfjSccJ6fd427pOXAfmxWE1GVbjiwzMIqmG/GWw
         knI+5E5dyNdEMstxJVh/rrtL8+YDWWY/B3Kk3TzI8OKk+snEXaBvk5TsVfPhfWe1C35A
         uxXCW+4Z3J4pxoyEBebvgzxFElTi5yqbdC1NOGUoa9nqs9//6JSsVhh05dtk7TFINPHL
         ZGziID5vxwWv8/KPGfSM5AR4nqrTuM45x6f+0jkbaTdaQOVfsFwCaw+YsTapNsdKe9Du
         InP1Qno4Rmi5PDmfdaByw2ifE/HfA0XNZ+NFnLmOZmdEWZAkjKEp6DOLWrgGrWVzNKZH
         b7qA==
X-Gm-Message-State: AAQBX9eTKS5GjL/hyMEgcmJEKjYLujqqo5auYepWMMKIJibT2ZuYtj2m
	h4cUHu6WVqNELi5/fUJMTx827Q==
X-Google-Smtp-Source: AKy350Z/4Ur0lzRPhEvaCep4pu1kfNqKR6Fh6i+qG1CBTwIgx4jPajknb6jbQjFEUExy1m578qUipg==
X-Received: by 2002:a5d:4310:0:b0:2e4:abb1:3e7e with SMTP id h16-20020a5d4310000000b002e4abb13e7emr11042537wrq.4.1680519360836;
        Mon, 03 Apr 2023 03:56:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8? ([2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8])
        by smtp.gmail.com with ESMTPSA id s16-20020adfea90000000b002d21379bcabsm9381466wrm.110.2023.04.03.03.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 03:56:00 -0700 (PDT)
Message-ID: <c7232464074cb0c09b290262955b88b52578c5aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclase: Add ACLs and xattrs to
 perform_packagecopy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Apr 2023 11:55:59 +0100
In-Reply-To: <20230403104216.3058652-1-p.lobacz@welotec.com>
References: <20230403104216.3058652-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179614

On Mon, 2023-04-03 at 12:42 +0200, Piotr =C5=81obacz wrote:
> This is necessary in order to preserve all the extended attributes
> set in do_install also in PKGD directory, otherwise they are
> dropped and not stored in created package(s).
>=20
> For the momemnt it is only supported by OPKG package manager
> as it has support for libarchive and tar implementations, which
> supports ACLs and xattrs.
>=20
> Fixes: [YOCTO #9858]
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/classes/package.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 2950218145..b0334d9190 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -863,8 +863,8 @@ python perform_packagecopy () {
> =20
>      # Start by package population by taking a copy of the installed
>      # files to operate on
> -    # Preserve sparse files and hard links
> -    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -x=
f - -C %s' % (dest, dvar)
> +    # Preserve sparse files, hard links, ACLs and extended attributes
> +    cmd =3D 'tar --acls --xattrs --exclude=3D./sysroot-only -cf - -C %s =
-p -S . | tar --acls --xattrs -xf - -C %s' % (dest, dvar)
>      subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOU=
T)
> =20
>      # replace RPATHs for the nativesdk binaries, to make them relocatabl=
e

This patch looks to be against an older release as much of the
package.bbclass code is now in package.py. I'd definitely be interested
in this incremental improvement to the support of xattrs.=C2=A0

I also wondered if it causes any issues with existing recipes? I'm not
sure if any set xattrs which we'd now suddenly "see"?

I'm not sure we can claim it entirely fixes #9858 since it sounds like
it works for opkg but not deb or rpm packages? It is still great to
see=C2=A0the progress though!

The final question I had was around testing - should we add some
automated tests for this to ensure it doesn't regress again?

Cheers,

Richard

