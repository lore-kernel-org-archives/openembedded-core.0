Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4910BC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:44:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.2273.1676364270893694655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VoRld4cE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a2so14810894wrd.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+8uKYit8h24IpPaqnnQaAbA/kBzNsCVPKjEiar/pcw=;
        b=VoRld4cErByj5Q9uz1Z0lmsIIHTWzZ3iBZEEdCdGxt+lvAUtaG7Jtm1GN1XNrhAdc+
         ZgR3C2ImyDdDD/Fqah1n+0mwWooVH6MKA7fWraJB/MvX2KOPFGv6VX1z1OOJJJRv7eWl
         P8KbYa+hc5JdNxLCZg7Dh1+r6OXhua2QOKw7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+8uKYit8h24IpPaqnnQaAbA/kBzNsCVPKjEiar/pcw=;
        b=xvjJ23Qo8wxIo9Ff2dzFbczHu0uhI+pM/FaqUDqN1Sc6D66cWicMKSAKGIXwFRMnWK
         ju8nc1dcM4p4eZWZ2RxuKEOVKCe/xj9C+c9Lmhpj9HhokmCt051ljM3J051KaLXQc+Q5
         uIKgJZjd4oADaMmmpd84VfuylZ0q7AnLqUIUmj1TvqvavwomCdgQK2T4N7Tvd1aAoNP4
         q4rTZX51Qm9W3/9Ps8srC91b8OXVAyxHpnjbrBdVCqMk3FZhnX6DHjmwAAoW9rwm9jA1
         hCtAysVFKnRHdlrYJNbVWP5NDxqx4MZwFmp4PiY/266P2RBJv1JgI3OTIxhnaVZl8pNh
         eChA==
X-Gm-Message-State: AO0yUKV3TcdKNz912vqpULSuM/JJ0pgIucZgeh8DD2rQJ2z72+fDdUnH
	m96hbpGkxdwbfsUL73QgfJsQGaieB5Uwbtk5
X-Google-Smtp-Source: AK7set+Z4OCBTNpRFbmoJs8AU8il4reHYxMoDp/njMI7RkVSMq+vM8OAA3dDDhV//p9iZBOwb+mVtg==
X-Received: by 2002:a5d:4207:0:b0:2c5:5c98:26c7 with SMTP id n7-20020a5d4207000000b002c55c9826c7mr1617084wrq.22.1676364269206;
        Tue, 14 Feb 2023 00:44:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:22a9:5449:456e:31b7? ([2001:8b0:aba:5f3c:22a9:5449:456e:31b7])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b002c53f6c7599sm11732957wrw.29.2023.02.14.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:44:28 -0800 (PST)
Message-ID: <ee78e0537a53ae57ee4c4cf8249b7cfa1124c8ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] base.bbclass: Fix dangling NATIVELSBSTRING
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2023 08:44:28 +0000
In-Reply-To: <8e3f56d34bb5941970bce8e43bfa43d38b2ba4b8.1676363155.git.liezhi.yang@windriver.com>
References: <cover.1676363155.git.liezhi.yang@windriver.com>
	 <8e3f56d34bb5941970bce8e43bfa43d38b2ba4b8.1676363155.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177129

On Tue, 2023-02-14 at 00:28 -0800, Robert Yang wrote:
> Fixed:
> $ rm -fr tmp; bitbake quilt-native -n
> Build Configuration:
> [snip]
> NATIVELSBSTRING      =3D "ubuntu-18.04"
> [snip]
>=20
> And when run bitbake again:
> $ bitbake quilt-native -n
> Build Configuration:
> NATIVELSBSTRING      =3D "universal"
>=20
> It has been changed from ubuntu-18.04 to universal on the same host and b=
uild
> directory, this is because it is overridded by NATIVELSBSTRING. This patc=
h
> makes it print the correct value.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes-global/base.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 64e805c947..cf42d9d4d2 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -226,7 +226,12 @@ BUILDCFG_FUNCS[type] =3D "list"
>  def buildcfg_vars(d):
>      statusvars =3D oe.data.typed_value('BUILDCFG_VARS', d)
>      for var in statusvars:
> -        value =3D d.getVar(var)
> +        # NATIVELSBSTRING var may have been overridden with "universal",=
 so
> +        # get actual host distribution id and version
> +        if var =3D=3D 'NATIVELSBSTRING':
> +            value =3D lsb_distro_identifier(d)
> +        else:
> +            value =3D d.getVar(var)
>          if value is not None:
>              yield '%-20s =3D "%s"' % (var, value)

The uninative code runs "late" and this is an known issue, there is an
open bug for it if I remember correctly.=C2=A0

I don't really want to put hacks into the BUILDCFG display code to work
around it since it is just going to make it less clear what is going on
and is also likely to break if we evern change the way NATIVELSBSTRING
is set. If you really don't like this, we should fix it properly some
other way rather than work around it.

Cheers,

Richard

