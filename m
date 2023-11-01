Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29398C4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:20:39 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.13590.1698859233564257056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 10:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EhiTPuU3;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso95830161fa.3;
        Wed, 01 Nov 2023 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698859232; x=1699464032; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3apYzcELdhDW7KuHyNF+vVUbj/EO39aV0Wx7rTG1Vk=;
        b=EhiTPuU3Jx6DdsehLnKsBR5+KZQMZwNFDfYvnN5393eIGOx8qQbZxnoGX4zt6ZaGPE
         SL6C8tFQl7vwDMEjyn2U5XoJ3tUxPR5kaLg9xffoEH01jgj+LLVcyzNnW9ZO8NGn5YHy
         xaEF4HjCEQVznOY57JwTd0JkUunppvTRLeCwm/QAQnPcwvYCKWaizShztU/FOGdK7rFf
         Vcq+gKn74EcMSbOt3jyIRSso0xHRVRdSzhnTuS9UvM5tJdaEe7dpRSwiacYrdB7PKryc
         O7ehbzql5621qb8IkAPNMtcAX5MleyZXamFXsUTL4w4/IjhoKvNlqTIZceLS/h0PLP0W
         OBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698859232; x=1699464032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3apYzcELdhDW7KuHyNF+vVUbj/EO39aV0Wx7rTG1Vk=;
        b=DR4qsEZl+/uBfHE9L16+dVyaz5+ytY2jgvsNSSkI4kb3yWLD+6Bsbf28fsHntxXsxt
         NHPeKllTzya69mTfqSJ5RfNehMmPgY4XaaDk4cLA1Rrns9Z8vj+9A8dQkAhgL4GKG7+H
         fZ3xKY9tI5XtMmeecO1/DKsUopvF48qMYCoXEgnan4YPTMXfT+32WU4xWLh1YML+1vVT
         cz2ymRZoNnVP3t6fvI69fP0ymww5scheHajKinbH2Dbn8M0z0RdyEL58/6/bFKpkGvdl
         h4h/5pt+WkSD4tb1Aqq+xvgk2MCnnoh+etrrZq32ic4X6D9D59CVsfti4LXHhci96gFs
         UpnQ==
X-Gm-Message-State: AOJu0Ywi3FFfbdlUU3m2yBTCvxVfnWHlS4sW/2tMj2UmWfzPHNVjxwGT
	V8DeEbAG0zhZMN3CeH4uHno=
X-Google-Smtp-Source: AGHT+IE3h5nGZ2mxkqcBDDaADJ9UQIezmS6TCAIvjWt1taUmYiGxMNCUpkhh5dRNBMD6yfRzxCY+eA==
X-Received: by 2002:a2e:86c4:0:b0:2b9:f27f:e491 with SMTP id n4-20020a2e86c4000000b002b9f27fe491mr13202563ljj.42.1698859231493;
        Wed, 01 Nov 2023 10:20:31 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id l26-20020a05600c1d1a00b004063cd8105csm356044wms.22.2023.11.01.10.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 10:20:31 -0700 (PDT)
Message-ID: <2533733992a9f836d224b063e2b4b0ea3700ddb2.camel@gmail.com>
Subject: Re: [Openembedded-architecture] [OE-core] Core workflow: sstate for
 all, bblock/bbunlock, tools for why is sstate not being reused?
From: adrian.freihofer@gmail.com
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>,  Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>, Peter Marko <Peter.Marko@siemens.com>
Date: Wed, 01 Nov 2023 18:20:30 +0100
In-Reply-To: <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
	 <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
	 <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 17:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190043

On Wed, 2023-11-01 at 16:19 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Wed, 1 Nov 2023 at 15:18, <adrian.freihofer@gmail.com> wrote:
> > We are currently experimenting with replacing the eSDK installer
> > with
> > the bitbake build environment for our users. Part of this
> > transformation is, of course, the shared sstate-cache, for which
> > this
> > discussion seems quite relevant. The workflow we are aiming for is
> > as
> > follows:
> >=20
> > =C2=A0=C2=A0 1. Setup the layers and build config (out of scope here)
> > =C2=A0=C2=A0 2. Download the sstate for a particular recipe (usually an=
 image
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipe).
>=20
> I'm not sure I understand the case for downloading the complete set
> of
> cache objects up front. What's wrong with 'lazy' downloading, e.g.
> only when the objects are actually needed in a build?
>=20
> Even then, does --setscene-only do just that, or am I completely
> confused?

If I remember correctly, when configuring a SSTATE_MIRROR, the server
is queried when a Setcene task is executed. This is not ideal for
several reasons:
 * Bitbake Setcene tasks run in the context of a recipe, which means
   that thousands of connections are opened against the mirror server.
   Many servers treat this behavior as a denial of service attack. With
   a separate download tool, this can be handled with a reasonable
   number of parallel connections. With bitbake's architecture, this is
   a barely solvable issue.
 * Especially with an SDK, setcene tasks can run much more frequently
   than do_fetch tasks. So the same artifact is downloaded multiple
   times, which is not efficient.
 * SDK users may be located in different places in the world. This
   results in poor performance depending on the location.
 * With a separate download, you can download on a fast network and
   then switch to a slower network or even work offline.
 * Of course, supporting downloading in advance does not mean that a
   SSTATE_MIRROR should not be supported.

Adrian

>=20
> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1821):
> https://lists.openembedded.org/g/openembedded-architecture/message/1821
> Mute This Topic: https://lists.openembedded.org/mt/102320110/3616858
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-architecture/unsub=C2=A0[
> adrian.freihofer@siemens.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


