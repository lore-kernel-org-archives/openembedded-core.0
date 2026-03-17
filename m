Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255AEFD875B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 12:16:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74563.1773749798267947997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 05:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zn5Va2mC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso50568715e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773749796; x=1774354596; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I5zQzm8VPB8veQN0wP6nyFoEMlAat6aEfZH5rFGHyUs=;
        b=Zn5Va2mCUyZ2/xsZbTPq31HcI55ug4HPyn/OlMadhbKLMrhFabdUw2sCXlSHnG8/mF
         eYvgYDJ4RS7hJGyM+gdkiDVjFfWMT5hzNXzao46OtdSb2YVJ4iL0lKqjiRUZM9wO4d97
         PQ0f8xAE2R2tIfHFAwvSra4+tRTYr/vsf14TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749796; x=1774354596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5zQzm8VPB8veQN0wP6nyFoEMlAat6aEfZH5rFGHyUs=;
        b=ln9vRWKpjGo1I2bZAnq11gyyrQISDaiLNltYdrH8K46NrMgXlAR+7bb367HGZp3UnD
         oBKYgSkp4FctsTPR33U/ukWbs4hHxBcFE1vxCscFTitPI2haeaxdnfkHRXx7LkENzPRi
         7WQuKwFzdyNG+qhltOLjl2RA6tus9MeEI2o/Qi4MhEeSST5wtRp6CWgIvTyfDugxt+CQ
         0Bzycesnf+LCha7mXdj4OioLoH1U2dyc1nNc5pSsB4Owby248MijR6NHiMXq6UCoZbsZ
         b22aohSVOK2JYAVIG9O7496+p8uviAnh7PkVMQundz6eqvgKVS9O2Js0bJ1Qjaucxy4l
         P7iA==
X-Forwarded-Encrypted: i=1; AJvYcCX8+xo2KzUQmVc1T3pOURFV1kdpQbKXvQPUc8YYD/PdM9UUHe24rd+kE/za8VzGe6ogIiipzoOMcXb26HDM4dn9KA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKZaSHtbXlC9a024swqZMuh5zOGD64/SM1SZVsCydixmSvT5X2
	NbO0IeJHTLvi/yHLBtUelFY3wSU8OtcNeVbjOq/E33mmHaMXACPAkFmCA7wvnyssfA4=
X-Gm-Gg: ATEYQzwVB6skZvKOjFTkJvI9HhcWN/LrTWelwijaRbAcwKZWEGfHQCj1A1ocbO5MWC0
	rzHaoX8zBNr99KxFSXpHiOIaiYalBrn+2SXozaomR6HL7heTnmSMe3wSC6TTahjMwlb9ey6egFK
	L6yuwXhXwNKjktn4zTN8YMzJSftLhuySgrW7L5Vs7qlPAu+2g5cTsE17KcnmHH4pFwqeXDbGZVH
	xFYaoSS4DAfxOeIaShAfmLXyjFnrvxpY4tUa1tl6FG/hMjxj1JwNn165xdAMBtaJ0KInDrQt4fi
	q2+RBK6XOS0EhZvgLULD81TDX5mny6pWQJOUSdRlgPTfmaJRuSjgKTTpStPMCDVJvBmf4nwQ6q6
	TaW2CzTDW3omrUOtATN70/i1hHp9WO17ygT8R+p1z3N04WFSx//IxughES7gToepi7o0YbWfpe7
	sCKyiqrevhRXb8jc4F9RVyzP1PjtE7ZwTyhHoo3SStlBgmp4fCX3+ZAvbvZflwoUCl5xBiKDbCA
	B46oAkHdJiTQ2qUn5HSgXcmfw==
X-Received: by 2002:a05:600c:1e8c:b0:485:40c6:f526 with SMTP id 5b1f17b1804b1-4855670b6b5mr268716965e9.26.1773749796524;
        Tue, 17 Mar 2026 05:16:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:183c:b889:ee72:b492? ([2001:8b0:aba:5f3c:183c:b889:ee72:b492])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b419270efsm19941843f8f.16.2026.03.17.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:16:36 -0700 (PDT)
Message-ID: <55beda2c3e095bdbd466713ae23d25cb80fb95a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: condition hash equivalence warnings
 to when it is in use.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>, Jose Quaresma
	 <jose.quaresma@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 12:16:35 +0000
In-Reply-To: <20260317120859.317294-2-jose.quaresma@foundries.io>
References: <20260317120859.317294-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 12:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233322

On Tue, 2026-03-17 at 12:09 +0000, Jose Quaresma via lists.openembedded.org=
 wrote:
> From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
>=20
> The warnings about the hash equivalence are only valid when it the hash e=
quivalence
> signature is being used, and for that we have to check the BB_SIGNATURE_H=
ANDLER variable.
> We also have to consider the case where the variable BB_HASHSERVE is not =
defined.
>=20
> This fix the warning that is displayed when using the basic signature has=
h, OEBasicHash.
>=20
> > WARNING:
> > You are using a local hash equivalence server but have configured an ss=
tate mirror.
> > This will likely mean no sstate will match from the mirror.
> > You may wish to disable the hash equivalence use (BB_HASHSERVE),
> > or use a hash equivalence server alongside the sstate mirror.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
> =C2=A0meta/classes-global/sanity.bbclass | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index a170c3f5f5..e8eab1cdfe 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -1007,8 +1007,8 @@ def check_sanity_everybuild(status, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 check_symlink(mirror_base,=
 d)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Check sstate mirrors aren't being used with a =
local hash server and no remote
> -=C2=A0=C2=A0=C2=A0 hashserv =3D d.getVar("BB_HASHSERVE")
> -=C2=A0=C2=A0=C2=A0 if d.getVar("SSTATE_MIRRORS") and hashserv and hashse=
rv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
> +=C2=A0=C2=A0=C2=A0 hashserv =3D "" if d.getVar("BB_SIGNATURE_HANDLER") !=
=3D "OEEquivHash" else d.getVar("BB_HASHSERVE") or ""
> +=C2=A0=C2=A0=C2=A0 if d.getVar("SSTATE_MIRRORS") and hashserv.startswith=
("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn("You are using a=
 local hash equivalence server but have configured an sstate mirror. This w=
ill likely mean no sstate will match from the mirror. You may wish to disab=
le the hash equivalence use (BB_HASHSERVE), or use a hash equivalence serve=
r alongside the sstate mirror.")

Good catch, thanks.

Since we're in python, we don't need to make this all one line and I
suspect it might be more readable if you put the two conditions on
separate lines and add a level of indentation.

"" if d.getVar("BB_SIGNATURE_HANDLER") !=3D "OEEquivHash" else d.getVar("BB=
_HASHSERVE") or ""

isn't easily parsable.

Cheers,

Richard

