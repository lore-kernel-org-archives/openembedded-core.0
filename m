Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E05CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.285045.1697644083542659073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UneRGJQj;
 spf=pass (domain: baylibre.com, ip: 209.85.208.52, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so16801655a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697644082; x=1698248882; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4mGCdkv9rcUFt3C0OVxdPPMm+BYJK1/QIY6bpVWjo0=;
        b=UneRGJQj/Vy+V5SZVYMsdLmpQ3LUf4J4xHDdxeY9LP6YWqRmYsXFI6q/DlRnggp4iO
         +ZFAMcRgwCDeSoyWGpI9c+0jgEQRQoxmxiIVya2PedVjDgpagXL3vYRExzFGJsX9z8wt
         HQjKQoaBc01ISF68B80meTXpr25SyEaTXmuOKN/+qXTVAROa7e8I74i6YsGNvGJkMLkG
         vTqUNTqZm/BYYVcqy4kYAWuaNym5G5MIsyx2oWtq1UjaMzDZqK+LjAkvOVNhroJUdGxo
         UBTbl7KVE0IBOQlDvV7Yhp+wuw6IxcpFiUWg4XSA9UGSWrjc2Ck+ZieWcZjB/eIyLbyV
         BMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644082; x=1698248882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4mGCdkv9rcUFt3C0OVxdPPMm+BYJK1/QIY6bpVWjo0=;
        b=Rnx/qfGhiWqfpueKligO4+xNCljmyk2UkRTjcuP/wTkkmv3sj5xD7fehnY9Vu2aJm2
         g1iYXbOBhiq6BJ+C76wKZtYN2yQ6TQV35KFgwe7Ex5EVEyl2pzSyhY/E6gRkhnDEvyFC
         5NLXI+jdKzo614l6Oj84EzwhHs1+6MwBgVGlZ5eY2d+3qQnGBwElaTw9F4kpRV1aHyc5
         yEAIlvjcyZH0g8lC22w287Sr5fW9kVXVUnPoBluhEhsKuaFI2YonWhnHbNNakKsRrSo6
         zVeNdI0OQszjIRsHpGjuZn/LJHh6tdBaR5BIeleBfa2vpyt7lZO1VZ3zaCefjPYu2fHG
         owEA==
X-Gm-Message-State: AOJu0Yx7mqpDt6XPY+TQXGG8Dgw4olQgPqBqWgqH3Fi+WO5zhW5qUWio
	N8HsX7DVFiaHl6K1BPws2VIFMBXjCUYsdXCwThPHcw==
X-Google-Smtp-Source: AGHT+IELPR/zpjt02mKBe17AEWDn3+fImr25A4leF8xk9HFyt3uwb9mtz46R09dYYhq3ZZRYOGTtSDHELaI53Wfdzik=
X-Received: by 2002:a05:6402:22ce:b0:52e:3ce8:e333 with SMTP id
 dm14-20020a05640222ce00b0052e3ce8e333mr5193114edb.18.1697644081332; Wed, 18
 Oct 2023 08:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
In-Reply-To: <ZS_r0pnGHqlEg5Ru@mcrowe.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 18 Oct 2023 17:47:50 +0200
Message-ID: <CAEHHSvYNpGQAE_jG2u__z9k3RrRLe2oeqXpb-bhZtrK-hG1srQ@mail.gmail.com>
Subject: Re: [OE-core] Using devtool without an absolute path to the workspace
 in bblayers.conf
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189398

Le mer. 18 oct. 2023 =C3=A0 16:29, Mike Crowe via lists.openembedded.org
<mac=3Dmcrowe.com@lists.openembedded.org> a =C3=A9crit :
>
> I'm trying to work out how we can make use of devtool to make our lives
> easier during development. In general it seems to work very well, but the
> way that it modifies bblayers.conf to add an absolute path to the workspa=
ce
> directory to BBLAYERS is incompatible with that file being held in a Git
> repository and shared by multiple users in multiple trees. There's a high
> risk that the file will accidentally be committed containing a path that'=
s
> only meaningful for a single user in a single source tree. All of our oth=
er
> paths in bblayers.conf are relative to a variable that contains the path =
to
> the top of the source tree.

Hi Mike,

I think it is a bad idea to version files under the build directory.

Maybe you have a specific use case that you can address in a different way?
You need to share bblayers.conf, I can see 2 options here:
- either you want your co-workers to fetch it only once, when setting
up their source tree
- or you need to frequently modify bblayer.conf because you are adding
or removing layers and want your coworkers to be up-to date

In the first case, TEMPLATECONF is the way to go! More information
here; https://docs.yoctoproject.org/ref-manual/variables.html#term-TEMPLATE=
CONF

In the second scenario, if this is something you *really* need, maybe
you can switch to some other tools such as 'kas'
(https://kas.readthedocs.io/en/latest/)  that should be useful here.

Maybe someone else will have another idea?

If you have a particular use case that is not described here, please
add more details :)

Cheers
Julien




>
> I can manually add ${TOPDIR}/workspace to BBLAYERS in bblayers.conf and
> commit that, but unfortunately devtool insists on continuing to add the
> absolute path since it doesn't know that's the same as ${TOPDIR}/workspac=
e.
>
> I can set "workspace_path =3D workspace" in devtool.conf to use a relativ=
e
> path, and that superficially works until externalsrc.bbclass gets upset
> that the EXTERNALSRC is not an absolute path.
>
> I've tried teaching devtool to prepend ${TOPDIR} if the workspace directo=
ry
> is not absolute when writing bblayers.conf, but it looks like I'd also ne=
ed
> to do so in many other places.
>
> My current workaround is just to add ${TOPDIR}/workspace to the committed
> bblayers.conf myself and nobble devtool's _enable_workspace_layer with an
> early return. This is ugly and we'd have to carry that change around
> forever.
>
> Since I'm clearly swimming against the tide I'm left wondering whether I'=
ve
> missed something. Is there a way to use devtool without having an absolut=
e
> path to the workspace in bblayers.conf?
>
> (At the moment I'm still using dunfell, but I looked at current master an=
d
> didn't spot anything that looked like it changed this behaviour.)
>
> Thanks.
>
> Mike.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189396): https://lists.openembedded.org/g/openembedde=
d-core/message/189396
> Mute This Topic: https://lists.openembedded.org/mt/102039990/4356723
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [js=
tephan@baylibre.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

