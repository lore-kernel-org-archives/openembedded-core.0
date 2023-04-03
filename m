Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3633DC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 13:32:45 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.70436.1680528761327973721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 06:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ajCWZ8Ca;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id m8so6217363wmq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680528760;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+qY+gKKYHcIXIheUTLLQHOaIPwuMZ5XbSiOZCH3vjk=;
        b=ajCWZ8Ca6SvYXawTMZVAZoRpZXTdMKtKPymrj6EH/wavomYA430s46Y0TaSSiZKHEn
         fol6rNXxmDY2L6nwTN6tbtdDWL9nyQXmhg3ZhiFP/HTpbYTkZgdBdEhESk3V4ffVmV1Z
         JzwK/ProOCTOgsweMY68esd8ZXOQGe8YY+kGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528760;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+qY+gKKYHcIXIheUTLLQHOaIPwuMZ5XbSiOZCH3vjk=;
        b=K3J4Af0p2qDhMUGlhTICO9ZcAKPbwIb5ku0jJoVUP4eH73s7ZsU0NWbccR9FciBELf
         T+pqq/WIN9EBfk8fn610zqNvUAY7PmPD4TtBOpWTAFGE3zpV7df0IJLRyLHBZtIcHvSW
         cIUPfCll7wpck6GcusFkhviABOoPp2KSCFuCKcWwvjvDwSLCcVeasl8aIxUMvpSArS0g
         Q1w2+Jjk6ncl99w+1cvMnyLDdR0aGINKECgqzWeRhwdHUuYxxCz4r5Woyuan2f3OMZPC
         K4V57usSqtBm+iL2T7TK7gjNMLSFC4ZAKPFjHT+l3V8KsqCbBlhNxp4SZJZNIAvrqcWn
         Mmww==
X-Gm-Message-State: AO0yUKUCFzu0nbRwlfJnJlapu/CFqfpO5x1v7isrVAFG+/SZ9+vxteJL
	7SAA0TTLpITllhdT7pf4ytmebw==
X-Google-Smtp-Source: AK7set8a2FPmmnX2ga8NiSo86qDKcR9mnIGrRek6kA0EgHvJxS3jYyk6Wf2v7NzC+JPh6FaPrcsqKA==
X-Received: by 2002:a7b:c7d1:0:b0:3ed:8bef:6a04 with SMTP id z17-20020a7bc7d1000000b003ed8bef6a04mr27150029wmk.27.1680528759710;
        Mon, 03 Apr 2023 06:32:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8? ([2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bcb91000000b003ed1ff06faasm12081072wmi.19.2023.04.03.06.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:32:39 -0700 (PDT)
Message-ID: <43c087d5c5c1fd9dac596fef9227640524e8775a.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone][PATCH v2 1/4] package.bbclase: Add ACLs
 and xattrs to perform_packagecopy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Apr 2023 14:32:38 +0100
In-Reply-To: <20230403122409.3067997-1-p.lobacz@welotec.com>
References: <20230403122409.3067997-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 13:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179632

On Mon, 2023-04-03 at 14:24 +0200, Piotr =C5=81obacz wrote:
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

Just to be clear, new feature development work happens on master, not
on our LTS stable release branches. That means these can't merge for
kirkstone and they don't apply to master so whilst I appreciate you
sharing them, they're unlikely to move forward without someone picking
them up and working on master with them.

Cheers,

Richard


