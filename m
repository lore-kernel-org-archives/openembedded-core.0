Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937EDC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 13:10:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.51476.1748351453787004584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 06:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B3DoTmn3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36748920cso3409085f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748351452; x=1748956252; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0WfxRu4QK9P0WEsBY4CE/Bx4bTkcMjP279ddWbhSQc=;
        b=B3DoTmn3YwH+hfODjPimPPsz5g/Wvh+7BEgoZw9sFaj7K46ERffYOr3KyjayFZPNev
         UHgoe8yuUQt62ikObPRWIok7xEwPYI3bWEq3EDUGg542n0jVElTypihDxcdNIjMQ3UBN
         ckWkEHzmmFifIYIoJwHA6uoHSI616Bw3XO6kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351452; x=1748956252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0WfxRu4QK9P0WEsBY4CE/Bx4bTkcMjP279ddWbhSQc=;
        b=Ai6QwO5w5QQWeLp7aEHqDRtfLpNoTG9EDtXsowHWbSKorCp0rDGjwAw4GBN3XseS3Y
         zso4rAbEoAsK0nuAmIEVlVWELPwylon/FdwLijuiVNXhi2r17Onzvl79vD9JdrvYT0/u
         rjzBYbsyOjEMzDJZ7B/XslQwl7pEE/mVpBnP7bawr6j1gUcndlqegcYrV8gSQtcvBe5W
         3+PLoXfA2vQ4EmZI7VqYCeLyoZJfRKI3s0RWmIu88AZRMP8K5+Jlns7Wxqe4d+9QYX/U
         igId0FtIu0Y5BiLzNwCAm10h7PWo7K3Iz4xQj2qK5dW6C2OSwrAPpOy8dMZ77kSINlQf
         SqZA==
X-Forwarded-Encrypted: i=1; AJvYcCVrcBNCvhzP8OjkuUtQu+SnkBnHgA/jaftcf5Dl2HiPGUZF08vFav2bqv52l3sN51EUDXl52IhZV2AfV37IfmV8Ug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVjPFqZXljsJYVrEteSyA+Q72YEg0GD79mJ/aD2xZq6kcgkRb+
	K/beLOy0WzAh+VpswgbAhZuyDDsthXi2fadLzt8RlwIj1RaXZMheprseuQLr0W8OqYM=
X-Gm-Gg: ASbGncuS1To6ktXcj5WiPiwm9v8xpUvL+REY7UhBm5m9CYivZovfl5GmGpPnh3iwcGy
	LHNAO0MZH8FYtkvKEK2/hb7ajbFD1hahh3LnGH02LNj1gff+6aR/sfvRtoomtQAK6irrKx4rt3Z
	kX8fXOdTVWjpXTvmkQtkFnPw+9lJMrAfyVMfsBkou1bn71zTMLulYpQLX6WSWwVty/sLnkNGici
	rASgewNVBz1GzRwr3oiGrJdPls8DY7A+YgfeX/0A7k3H1WOud8X9HEqUuJDvNqi3l7cGQjy5yv9
	pHEJfm+Z7gkMMp8vd2srAeTT480an55AdVxWT6x8M/4KT0RFAFC29JMnEdGacEXoRAs0XVbiHuR
	ATMw80LDPc2IU/ySgV7jNbOFw33k0PZi5wwIljz0X4K7LxHeKf5Y=
X-Google-Smtp-Source: AGHT+IEKn7BFUiXsAv4HKqg88L6omXA6DoU7XzNBK4tpGgKXn1qylcxRUYDwv8ssoPTvqS8U3SNy8A==
X-Received: by 2002:a05:6000:18a2:b0:3a4:e4ee:4c82 with SMTP id ffacd0b85a97d-3a4e4ee5076mr1300200f8f.52.1748351451875;
        Tue, 27 May 2025 06:10:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6923:f643:8186:933b? ([2001:8b0:aba:5f3c:6923:f643:8186:933b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca9417dsm37658548f8f.101.2025.05.27.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:10:51 -0700 (PDT)
Message-ID: <5b20d775f1e183305d21e1daee8338311e9cb141.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/3] package: change location of
 debugsources to PKGDESTWORK
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Date: Tue, 27 May 2025 14:10:50 +0100
In-Reply-To: <20250521134400.1733473-2-daniel.turull@ericsson.com>
References: <20250521134400.1733473-1-daniel.turull@ericsson.com>
	 <20250521134400.1733473-2-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 13:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217302

On Wed, 2025-05-21 at 15:43 +0200, Daniel Turull via lists.openembedded.org=
 wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Storing file generated doing packaging in WORKDIR,
> doesn't get cached in sstate and task depending on them fail
> to find them.
>=20
> Store it instead in pkgdata/debugsources.
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> =C2=A0meta/lib/oe/package.py | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 0bcc04ea54..6fcd001db1 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -972,7 +972,10 @@ def copydebugsources(debugsrcdir, sources, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 cpath =3D oe.cachedpath.CachedPath()
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if debugsrcdir and sources:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sourcefile =3D d.expand("${WO=
RKDIR}/debugsources.list")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sourcefile =3D d.expand("${PK=
GDESTWORK}/debugsources/${PN}-debugsources.list")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugdir =3D os.path.dirname(=
sourcefile)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.isdir(debugdir=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.ut=
ils.mkdirhier(debugdir)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.remove(sourcefi=
le)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # filenames are null-sep=
arated - this is an artefact of the previous use

This needs a little bit more explanation/justification in the commit
message as this change is a fairly big deal. I can guess why you're
doing that based on the other patches but the commit should stand alone
with information.

Effectively by moving the file, you're taking it from being internal
API to an external API which can be used outside of do_package. When we
do that, we need to be really clear about it and also be 100% sure that
what we're exposing is the right information in the right form.

There are other implications such as increasing the size of the sstate
objects too.

This file is a null separated list, is that a good format to export it
in for wider use? It is certainly different to any other file in
pkgdata.

Also, the file just contains a list of all sources referenced by all
files in the output. Do we need to include more information, such as
which files have which dependencies?

I'm asking these questions as I'm worried about future implications for
this data. Changing the format later is hard.

Cheers,

Richard

