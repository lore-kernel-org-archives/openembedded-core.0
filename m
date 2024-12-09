Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5101E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:22:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.107495.1733764963890977792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QEF/JLoF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434f30ba149so10514475e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733764962; x=1734369762; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFHI1Mv4XUnRAIbmEPmPsGFnpDV+yksgQ4k4Trl5rg8=;
        b=QEF/JLoFBLYhGe3VeSO9zMNn6J4B6A0gy4IQoa8/xusXeVOhs+TYTdFccoa7HcBpWR
         Ovbuy+znNtoDjnFJ3jQAweSv18VVDPN5OCTcxUIeQjCNFrpK+w/lPkvR/DfgifJU0Mvm
         SlOFHCmWiP3IuKNurrP2kXHDXU7e9psjLWVVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733764962; x=1734369762;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFHI1Mv4XUnRAIbmEPmPsGFnpDV+yksgQ4k4Trl5rg8=;
        b=xRk3coBJkpK0k7Q/yxDDfkR+GJQjIJrYVPO13oBJGsUgJ5M6XEgZATUoakJuJJiY6D
         aa5rz3IxVFWa7RvUxG/tIM5qsSj6U/h2XOuZr8kNn8Cw39915VwdJxOHo6l2GX1po0mh
         hetC68OvChyM2Ux5gFx7jj9abAa0Ep8SMXU/CcumPoNXNzElrdEPakxGIzEaWMyA/QKo
         0TyEefzqdRJlYCrn6tA+sxo4Fecig5Hp193/4rJYScekR3YRosABT4CLy7rskksD/RX/
         ABHAtvJEOJHGxRWBMVcNqAjp+py2M6fSZkmgVekOsbPy9LMsT3iDIwG8CTRdhxF6kQmd
         9E5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAx9WplfFuBf2wHdV8FkbX/UpiHZVzk1wNjAVvzCQ6E5801C/S1LhrR+Si16yjuz2JuvDniej1QVlDamMVPJ8EWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaTB9oZvROqUDWdpxsU59s40TJXUi0OFKI2bXCzMlKnp+Ni2PJ
	oJLD3N5qigFQDSVLjyAIM0ZcmI58gRee9zrCK6y1UvRxGG15IkL13+M9LJQM8ls=
X-Gm-Gg: ASbGncsAPCD8iBLbsfHH9wciJlLBb4Q3z7xWlLu2SSqOaiz8TgwZB9igY1elpW4kTH7
	8ioT7T1vU7vCb0JbrDNXleYa0gPI159xw7dw4Bbew7Tg4O5K1ZTCLdcUh1Gcfa1nE3Yk9cU7AOI
	lJVwhRtuA+YK+d3DYkMZcCHcFMr1/ZgttoSRY97N0EtGVxEsG/zpBqiZrMaHjnTQBu20Jjd+RGr
	w8g1de70ceBmjJjS+jjxy/Ewcs3UyVfOTgNOZ3e20dwV//andeqFhMF/yCnr4t+d85b6xvpkfIj
	x+1kUoOGc213FGJgXdyN1hviFh3XarZFhArokGg=
X-Google-Smtp-Source: AGHT+IE2pLHFUPgMw2TOIxDfvQIX4vrKI/smHAnpsnDPGuL3b/Zf+UytRHJY/r6UYmshl1rpsGNF+Q==
X-Received: by 2002:a05:600c:4ec6:b0:434:f270:a4f0 with SMTP id 5b1f17b1804b1-434fffa2a6cmr11093755e9.21.1733764962070;
        Mon, 09 Dec 2024 09:22:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed? ([2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386220b01c5sm13553536f8f.94.2024.12.09.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:22:41 -0800 (PST)
Message-ID: <adafac15e09bcfcd220cddcf0e059a109eedf390.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icecc: fix PN 'no-pn' handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: m.felsch@pengutronix.de, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de
Date: Mon, 09 Dec 2024 17:22:40 +0000
In-Reply-To: <20241209164608.3595821-1-m.felsch@pengutronix.de>
References: <20241209164608.3595821-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 17:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208491

On Mon, 2024-12-09 at 17:46 +0100, Marco Felsch via lists.openembedded.org =
wrote:
> Since bitbake commit f24bbaaddb36 ("data: Add support for new
> BB_HASH_CODEPARSER_VALS for cache optimisation") the
> BB_HASH_CODEPARSER_VALS are passed during the bb.build_dependencies()
> step.
>=20
> With PN set to 'no-pn' and the icecc_version() running during
> bb.build_dependencies() (due to the 'vardepsexclude') the bb.fatal() is
> triggered while parsing target-sdk-provides-dummy.bb albeit it was
> already disabled via ICECC_RECIPE_DISABLE.
>=20
> To fix this use_icecc() need to verify if PN is set to 'no-pn' which
> indicates the early bb.build_dependencies() task and return 'no' in that
> case.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi,
>=20
> this patch should fix the reoprted ICECC bug:
>=20
> https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/1034297=
14
>=20
> Regards,
> =C2=A0 Marco
>=20
> =C2=A0meta/classes/icecc.bbclass | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 159cae20f8ca..df73e31e9514 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -159,6 +159,12 @@ def use_icecc(bb,d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.debug(1, "%s: bbclass %s found in disable, disable icecc" % (pn, bbclass=
))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return "no"
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 # PN set to 'no-pn' indicates that bitbake is at the =
early
> +=C2=A0=C2=A0=C2=A0 # bb.build_dependencies() stage and it's not possible=
 to use the value to
> +=C2=A0=C2=A0=C2=A0 # decide if icecc can be used.
> +=C2=A0=C2=A0=C2=A0 if pn =3D=3D "no-pn":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "no"
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 disabled_recipes =3D (d.getVar('ICECC_RECIPE_DIS=
ABLE') or "").split()
> =C2=A0=C2=A0=C2=A0=C2=A0 enabled_recipes =3D (d.getVar('ICECC_RECIPE_ENAB=
LE') or "").split()
> =C2=A0

I'm not sure the patch description is quite right and I'm also not sure
this is a safe way to solve the issue here.

Bitbake is trying to work out the dependencies of the various
functions. The reasoning was that setting some dummy values for that
code would stop it spiralling off and analysing multiple pieces of code
that were effectively functionally identical where for example a
version string just changes.

This gets messy with shell function, for example with the shell
function:

set_icecc_env() {
    if [ "${@use_icecc(bb, d)}" =3D "no" ]
    then
        return
    fi
}

it has to run use_icecc() to expand that in case it turned into a block
of code.

If we take a patch like this, I would like the comment above and the
commit message to be correct. "bb.build_dependencies" doesn't exist and
the early stage you refer to is misleading as it doesn't work like
that.

If we're hitting the "NULL prefix" code in icecc_version(), wouldn't it
be better to special case pn =3D=3D "no-pn" there, note that it is at
dependency parse time and return a dummy "parse-time-dummy-
icetarball.tgz" value?

Cheers,

Richard





