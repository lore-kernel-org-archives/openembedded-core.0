Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA23D1BDCC
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 16:59:36 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.592.1730739570191997913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 08:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kk/dJsY7;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so50095711fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 08:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730739568; x=1731344368; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YO0zcu5XDzxUfm/n6gDvs6U7xd4fKhv5ku2iAZyjdE=;
        b=Kk/dJsY7fa9FPqVJo6ce8DDZ6srhgINsOlJbZ+Gb8o+JwKQ68dTpzzHMRvrvAb+E4a
         KI3JFV+tSP5mLkX3qxSi5itF2fK1NNsFYdU4+52fIOT1cL/7W9zWreEeu1ipaEfNEykH
         /969dxGTiaK4SNKvTbc6SYJwqgFXUt2i6V9gnnVWq1s664Fnbo2Xr+1G5V1JW2hODeMA
         lWBzVPs4d/7IQfHdjN29ITYebQnPuTciEN1Oe3qWp5cYteRUueHsmA6cfJT27VCf+DbB
         EysFXsoZFWl06YoOiS038kKdObjV2h0j7KM8Lyj/AaJh64mhGWHatZz2p/2Iw2VizfHE
         bEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739568; x=1731344368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YO0zcu5XDzxUfm/n6gDvs6U7xd4fKhv5ku2iAZyjdE=;
        b=K3Do/rhzA3VjrWqJLuoaxoIqL0LsvO7MiMdJR9Pruw5O2gGpuJfmRmP728uI7NBeKv
         oMoDv5BU2ToeR/VVcoQryqTSMxaWLhJHuUQXnMRxeFay8SzxYhdjYCfUPIcegJOAcnZv
         g+ajMJPkA/aTzF62ah89IpxRO5J3JX4LjPOYyLvzJDc95pkOaU9jwOVb+Y73P2AygZ0M
         3Sdj3yuz9zLDa4RgWxuyX6f84gva8HM1U2lq4GopT8LJjfjw//Iu/SkbuDjbjFpacEIE
         6qLvwWJpZ6Vx8A582skDmh/LDJUk/Ok7SPA4fKj7rc9m0MbCzHygErJQTjkhqmGEN+iG
         TOGw==
X-Forwarded-Encrypted: i=1; AJvYcCUCvs4GRvwQi0m1f02YLlhKJCiFqYvOPkkiwurWcVRB0MNxSX4VivZ41BwKJcdk2mqAkEOIeWQWALTEqAnXcSIYPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJ+PSW8KXGL8L7/Xvb2cBO/6bLsMHUIR90qPhRDtlIfmN21sXN
	JPIiFqYssS7R+0CTBGi/KDz9HOX8G0s95gxa1uDUDJnZtp/Pzo2NEt1iFG1hSii7muaF+UyS8iY
	WV0r0nQdx/cczSckUr5URhGk7Rc8=
X-Google-Smtp-Source: AGHT+IHgzIX1g0EJ4szLSAhjgzT/Q9XBEi4DDyTJVdjEIekVANp14thDliBxOjObu7yb6keCWKmKX6JjR843d+Ffloo=
X-Received: by 2002:a2e:a584:0:b0:2fb:dfc:587a with SMTP id
 38308e7fff4ca-2fdef2a6e02mr46923901fa.17.1730739567944; Mon, 04 Nov 2024
 08:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
 <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org> <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Nov 2024 17:59:16 +0100
Message-ID: <CANNYZj9=5=wDNjBW1sC+d0L2YSGPvpjvGH8MtmsiYejxd2S5nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH support
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 16:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206691

On Mon, 4 Nov 2024 at 15:56, chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:
> Internally, my experience has been that users do not notice the 'devtool'=
 branch has been checked out. They go to push their changes and end up crea=
ting a bizarre 'devtool' branch on the remote, which obviously doesn=E2=80=
=99t get picked up by our build.
>
> In the case of AUTOREV without any local patches, I'd argue that by defau=
lt 'devtool modify' should checkout the branch from SRC_URI. We could add a=
 flag to override that behavior (e.g. -d), or alternatively hint to the use=
r they can pass '--branch devtool'.
>
> Would we be OK with this? If we're worried about it breaking backwards co=
mpatibility, then I would prefer to have an escape hatch (like DEVTOOL_PREF=
ER_BRANCH) that I can use to opt-in to the new behavior.

I'm not worried about that at all. A command line flag that would
mimic the previous behavior is fine. We're pushing against new 'opt
in' variables in general, if the new behaviour is an improvement on
the previous behavior, then it should be the default, and people are
expected to adjust. Bleeding edge sometimes bleeds.

Alex

