Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C56E80AAD
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:01:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.17899.1695823277817608464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AxzLQtvl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so10732203f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695823276; x=1696428076; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qYUKqzRFLsHR848Zjx2RVqBUQlvyTFgpAWgRcJx/Yg=;
        b=AxzLQtvlzDNV3I4VMpsHasC8EXT6UAjQtrSP2GPPuP1mYZm1ORAv/PRlsiFCrpK+hj
         3l6u7udHH1ig5AWtgNKCaeBzKfH9dHAa4WoMPlJvp0Z+uw43qOnVHku8chmuR3aRVC58
         MdTLR8xiBllJ5UebcTMznm4zEt/9JPxWeKOsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823276; x=1696428076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qYUKqzRFLsHR848Zjx2RVqBUQlvyTFgpAWgRcJx/Yg=;
        b=v79HXpWm0Sb+0EG2guWbV3Y1+2/XKCZx5fZnyIxj06iUInJ4fjia/5k+lhMmsK2n+z
         LVXmJBGr4498K6po9txvGsSn+iiKzV40ZDk5mLIwPNRHeBHgm0yq5rIfkaggVz7q0N3E
         SX7HF7ds2QcY2BhQ0sc6Jaw3JPBcsOOifLbaVTmYEW2+8zWcS2bnDfZJmp+meIweqKZ7
         YICbhECXYupShMsWyGiXFM5ediu4LgXSWzN1BFZ0dVH8asZCR7iQwvoO0r7651g1fku1
         FlKQRzFqBdW719s6rpxYu6wN2U1WaJQQLIYbc51urdVXjSbdQtifTPti7hJ/QhkIjEZ1
         +w2g==
X-Gm-Message-State: AOJu0YxwtaIwgAci0qEEnXsFaMOc3GwsvPloBO8+48+DoI/yMbEhJDz5
	qL15YBiQfvl5bFmZSbkDV1sVvY+nevOoWazIufE=
X-Google-Smtp-Source: AGHT+IGp/rAWMknK9hx0wJfoIvvB7oIBRVXe2CfzDy8AwQsUWJYcKDGooH5br11xKkz/zok1tN2hwQ==
X-Received: by 2002:adf:ee49:0:b0:319:790e:3bc5 with SMTP id w9-20020adfee49000000b00319790e3bc5mr1868102wro.41.1695823275974;
        Wed, 27 Sep 2023 07:01:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab67:eb18:db89:ef9a? ([2001:8b0:aba:5f3c:ab67:eb18:db89:ef9a])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d610b000000b0031435731dfasm17146070wrt.35.2023.09.27.07.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:01:15 -0700 (PDT)
Message-ID: <4e91e1a677bf0e5e2799a982501d7b4cb81a485f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] distcc: Fix groupname gid change warning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JD Schroeder <sweng5080@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2023 15:01:14 +0100
In-Reply-To: <15368.1695820030017039130@lists.openembedded.org>
References: <D7F71619-5603-498D-AF15-8AB767ED150F@arm.com>
	 <15368.1695820030017039130@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188325

On Wed, 2023-09-27 at 06:07 -0700, JD Schroeder wrote:
> On Tue, Sep 12, 2023 at 06:03 AM, Ross Burton wrote:
> > On 1 Sep 2023, at 11:03, Alexandre Belloni via
> > lists.openembedded.org
> > <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> > >=20
> > > Hello,
> > >=20
> > > This fails on the autobuilders:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/34=
49/steps/12/logs/stdio
> > >=20
> > > ERROR: Nothing RPROVIDES 'distcc' (but /home/pokybuild/yocto-
> > > worker/reproducible/build/meta/recipes-
> > > core/packagegroups/packagegroup-self-hosted.bb,
> > > /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-
> > > devtools/devel-config/distcc-config.bb RDEPENDS on or otherwise
> > > requires it)
> > > distcc was skipped: Recipe distcc, package distcc-server: system
> > > groupname "nogroup" does not have a static ID defined. Add
> > > nogroup to one of these files: /home/pokybuild/yocto-
> > > worker/reproducible/build/build-st/meta-selftest/files/static-
> > > group
> > The same problem would hit the ppp-dialin but that recipe doesn=E2=80=
=99t
> > get built in the AB in an environment that has static IPs.
> >=20
> > Ross
> I'm seeing the the warnings being generated in a multi-config Yocto
> build environment. Is there another way to address and fix the
> warnings I am having with the distcc and ppp-dialin recipes (possibly
> during parsing) even if they aren't being built in the AB with static
> IPs?

It might help if you could describe how to reproduce the problem you're
seeing?

"nogroup" should already exist in the underlying base-passwd file so we
really need to understand why that isn't working. The patch appears
just to mask the real problem.

Cheers,

Richard

