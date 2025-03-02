Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA6FC19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 12:34:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.29299.1740918887675317947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 04:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYzsbJpK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439a331d981so32642805e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 04:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740918886; x=1741523686; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blTZvwq1WA8FKwAR33XNd0QBzyQzgHt7lUq06TmJZdo=;
        b=YYzsbJpKqCxCmPoIEB6kaGCRw1/+iXVBNMnPzbdyH2NnodnxMWdBEnWqUYDk5ADZzH
         LJGjmLThugtw2HUOn8Lx3qezT1GZgrVRXYYfR8Nmq2zIeUEiTs2etsZuOHmitR9GCZDN
         g4QenS3cv4c8qsrO0lGJfEnYjw0tjosRLBmkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918886; x=1741523686;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blTZvwq1WA8FKwAR33XNd0QBzyQzgHt7lUq06TmJZdo=;
        b=ej+5/xp2JfUxhfyNWTIsnlwcGECjO4zhrjoHPbuPdwRh7Cc5bqk0nsgziJtspwTtjm
         misfUEtoz018IS8lCz0sXRqIGXWFUQ5zYJMyDX7imEy4NMSc8VL5r8sLQEM6Kzj+6DG8
         gB8xh88WeTY/3IlTl9RbCYZNDjzeo5lsHXE0EuoIB4HxX16JlB2IqQl+IfNT9balURm9
         wS8WnAZwJ0dyJycC/6I8qpje1qSkvW3y7IrsEOFZPpIyJ9C5puAzs9Y6G8eSBealm2rQ
         op4Gt66eghK+Ny4RJSBIRmHu7F/QgrOZsCl7+MP5IAa2JtZKfttIraDOcZmHmB9R0lWj
         L8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmrD86RqQT9HMmiM+XAxlMoYYQpzw7JJyf/UKzGI/x53Lm0KyUbyRrBSYXEphZMYXsJIDrUUdjUlW3CBQD9E1fhg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYGmbGC+E4eAGrTqN7Xfe5mnDxJsluC9PX1uYww1xbq+Nru2S+
	UNbnxs/q/5YFJCixcLuqRtgtXKlTm42ssX41hhz6rzFo1wO0+gkgp7vN4mytEmI=
X-Gm-Gg: ASbGncu13d4KwsIeHFhq0cpngSwf2APk77MFs/zhOidIkYaINtXYvfnRyw+egVP8UzC
	ZmJ4dEGwnnzvJU6d1CnOLYcCyuGgfMaH9CxINbDBz0cywrztnHVlq7spcqweIlNfhEpQyz6YcrB
	Muypvz0j/WvkQ6mFiTFp9/S7VSFpCTPMbF1OUI7rR8IOKPkkqKbPVG+J/iHL1ZjJggIjsKVWuuC
	DTQ6VjU0FfkJ2WPKENCz0jWtYVfPiOfBifg6JwdhKRtEVimF36u6bRxCwrJ6KNKuiL9/t+CUXdo
	hVdGGoJ75rR+aBfhEnd7iS62gvIZ0pKd277tfFBdusv3XvszKrcsP/ArFd7Bs/cjzKKqnduspLH
	V6b6G5JrzxHPaVUEdzH5iP0r68lof3Yo=
X-Google-Smtp-Source: AGHT+IFqvbAe4sCSuoqVvOMTK/usrVA3A5JsksGJ2mkJ1buCnicx0Zu2jYV9z5/vFS429tT6ZMtvpg==
X-Received: by 2002:a05:600c:5252:b0:439:88bb:d02f with SMTP id 5b1f17b1804b1-43ba66e264emr86356285e9.5.1740918885756;
        Sun, 02 Mar 2025 04:34:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e0f8:a3b1:7fc:a90a? ([2001:8b0:aba:5f3c:e0f8:a3b1:7fc:a90a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b97bsm152181845e9.8.2025.03.02.04.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 04:34:45 -0800 (PST)
Message-ID: <169badfc1a6ee7e24975610a4166c58353a81667.camel@linuxfoundation.org>
Subject: Re: [OE-Core] boost: Use PN/BPN for naming of packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 02 Mar 2025 12:34:44 +0000
In-Reply-To: <20250302074334.1775-1-alex.kiernan@gmail.com>
References: <20250302074334.1775-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 12:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212192

On Sun, 2025-03-02 at 07:43 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> boost-test and boost-serialization were hardcoded, switch to the ${PN} fo=
rm.
> Also lookup ${BPN} when generating split package names. With these change=
s,
> generating an explicitly versioned boost package (e.g. "boost-1.82") alon=
gside
> the main boost package ("boost") can be done by copying/renaming the olde=
r
> recipe. This is useful when upstream code hasn't yet been ported to newer
> boost and an older version is required.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> =C2=A0meta/recipes-support/boost/boost.inc | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
> index 77105aa1fa13..458dfa9ac2fb 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -69,7 +69,7 @@ python __anonymous () {
> =C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLPREFIX")
> =C2=A0=C2=A0=C2=A0=C2=A0 for lib in d.getVar('BOOST_LIBS').split():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extras.append("--with-%s=
" % lib)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg =3D "boost-%s" % (lib.rep=
lace("_", "-"))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg =3D "%s-%s" % (d.getVar("=
BPN"), lib.replace("_", "-"))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "-native" in pn:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
pkg =3D pkg + "-native"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packages.append(mlprefix=
 + pkg)
> @@ -86,9 +86,9 @@ python __anonymous () {
> =C2=A0FILES:${PN}-graph_parallel =3D "${libdir}/libboost_graph_parallel.s=
o.*"
> =C2=A0FILES:${PN}-locale =3D "${libdir}/libboost_locale.so.*"
> =C2=A0FILES:${PN}-mpi =3D "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
> -FILES:boost-serialization =3D "${libdir}/libboost_serialization*.so.* \
> +FILES:${PN}-serialization =3D "${libdir}/libboost_serialization*.so.* \
> =C2=A0	${libdir}/libboost_wserialization*.so.*"
> -FILES:boost-test =3D "${libdir}/libboost_prg_exec_monitor*.so.* \
> +FILES:${PN}-test =3D "${libdir}/libboost_prg_exec_monitor*.so.* \
> =C2=A0	${libdir}/libboost_unit_test_framework*.so.*"
> =C2=A0
> =C2=A0# -dev last to pick up the remaining stuff
>=20

Sounds like a reasonable idea but:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1097
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1025
https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1097

Cheers,

Richard

