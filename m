Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45360D0C611
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 13:50:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.12454.1729864202567820353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 06:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h74Vf/CZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43159c9f617so20145425e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729864201; x=1730469001; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V9KWXjplMFSeMZahvgJN69AnyeLGujUr7zXlywhcPQ=;
        b=h74Vf/CZBsTlE4vvJ8O/nMZtVxBNB6HwDuNrY86pAVv8bWQJTWMPgUjALKZwzi/s0O
         HKdftzPhG845/5kUI9Hvwt1jVmLVYbCVKAtnqFbwKiKx20xsnG6yxCEErIugNlDnEmK9
         YvEti9pMBQ2rBqK2y8h+ioN4I6PZAZDG1QLx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864201; x=1730469001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0V9KWXjplMFSeMZahvgJN69AnyeLGujUr7zXlywhcPQ=;
        b=C46xXsM9e/qrypxLxp5tUak7yOEmpnrHlJnJknAAb5a/+Xo31Y7YC4VFJIAtP4zyQS
         4Mmh9O36VsNYTi2Dht+Ro7Z2Tsf5Xj+ScZneWsn9158wz8FCiGTMcHTedV7q+zqljztc
         yjfh8SOHC7oTnwypyCbaGx/jQG8uS6UQN8A/lDdLcIQDofUtNMXswU/qdfXt2qfMhlYL
         a3MtNibvU3id7RusONs7dCNmtdexWXcb+1c/gOBROX4C8fgAgezrydOhUrg55EvAVvbF
         3SXeMz03axaSSJmWNcjvhRYobHvsKwAvgrd0Sotb5id//ww+qT1ZzGm+EPmZ3fjhY4/8
         /iQw==
X-Forwarded-Encrypted: i=1; AJvYcCVBnFVOaf327+WMZVTe5rDpQHOywjQNbrr51vu2DfJK7duNYMO+KmOmAGMmMnmb6L80m9jEXdx854tCop4WL4Ya4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFNoMl8B9gzNqMslwT9m6fjpWOKjjUEIu3zh8+uB9qxGvpEcT+
	LwgB7UhPymp8akvhfX7e9RGQKhGj5IV5/h6kKTLLWowimOe4VW09pPgokfoWHfI=
X-Google-Smtp-Source: AGHT+IGbtfQAdkIm5BEiK838V7IJV8JzHHWnkyO+VeI0jOz29FTZkvu73XZlIEFE3N+1zeRHGHDTJg==
X-Received: by 2002:adf:f80f:0:b0:37d:4956:b0c2 with SMTP id ffacd0b85a97d-380458f2712mr3697667f8f.58.1729864200691;
        Fri, 25 Oct 2024 06:50:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e58:696f:3954:9f3f? ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm1570109f8f.30.2024.10.25.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:50:00 -0700 (PDT)
Message-ID: <f4905d79f5ff5ecb62b3d65c82b660222ddda9f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/package: scan B first when populating
 -src package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2024 14:49:59 +0100
In-Reply-To: <20241024172506.473232-1-ross.burton@arm.com>
References: <20241024172506.473232-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 13:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206351

On Thu, 2024-10-24 at 18:25 +0100, Ross Burton via lists.openembedded.org w=
rote:
> There's an interesting reproducibility problem triggered when a recipe
> has a file in $S that is manipulated and then written into $B.=C2=A0 As a
> concrete example, zlib has zconf.h in the source tree which is then
> processed by configure to create zconf.h in the build tree.
>=20
> When we populate the zlib-src package we have to work from the mapped
> source paths in the binaries (of the form /usr/src/BP) and try to
> identify where the file came from. To do this we iterate through the
> mapping paths looking for files, and using cpio in a loop we end up with
> the newest file with the name we're after in the -src package, which
> tends to be the right thing to do.
>=20
> However, when building zlib from scratch we create the -src package by
> hard linking files from the source and build trees. Then as the final
> act of do_package the sstate archive is created, and this clamps the
> file timestamps to SOURCE_DATE_EPOCH (see fixtimestamp in sstate.bbclass)=
.
>=20
> The fundamental problem is that we clamp the mtimes in sstate_package in
> a way that changes the source files. There are several paths through the
> code:
>=20
> 1. Full build from clean
> In this case B/zconf.h is freshly generated and has a current timestamp,
> and the final zlib-src package in sstate has the correct file.
>=20
> 2. Repackage from existing tree
> If we need to repackage but there is an existing build tree then we've
> previously clamped the timestamp of zconf.h. When iterating the map paths
> for files we first copy from $S and then $B, but as the file in $M has
> an identical timestamp it isn't used. This results in the wrong file in
> the final zlib-src package in sstate.
>=20
> 3. Repackage from sstate
> Depending on whether the sstate has the correct or incorrect file, the
> output will have the same contents.
>=20
> The long-term fix to this is to not clamp the actual files but instead
> to clamp then when writing the tarballs, but this isn't trivial as you
> need to handle the sstate and non-sstate paths separately.=C2=A0 What I t=
hink
> is an acceptable workaround is to reorder the prefix map list and move
> ${B} to the front, on the assumption that generated files should be
> preferred over non-generated. This results in ${B}/zconf.h having priorit=
y
> over ${S}/zconf.h when they both have identical timestamps.
>=20
> [ YOCTO #15491 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/lib/oe/package.py | 10 +++++++++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index c213a9a3ca6..8ec00b96b69 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1010,7 +1010,15 @@ def copydebugsources(debugsrcdir, sources, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(basep=
ath)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpath.updatecache(basepa=
th)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pmap in prefixmap:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Re-order the prefix list so=
 that we sweep ${B} first, as the sstate creation will
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # clamp mtimes of hardlinks i=
n the -src package, and that will change the source.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # (see #15491)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b =3D d.getVar("B")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixmap_keys =3D list(prefi=
xmap)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixmap_keys.remove(b)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixmap_keys.insert(0, b)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pmap in prefixmap_keys:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# Ignore files from the recipe sysroots (target and native)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cmd =3D=C2=A0 "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<internal>|<bu=
ilt-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# We need to ignore files that are not actually ours

I've sent out a change for do_package which stops the messing with the
timestamps. It breaks reproducibility of the do_package sstate but that
is probably the right compromise. See what you think...

Does that mean we don't need to this patch (since this feels like a bit
of a hack)?

Cheers,

Richard




