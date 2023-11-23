Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE366C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 16:23:08 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.94959.1700756578878735247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 08:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cubF3W1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso12608681fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 08:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700756577; x=1701361377; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTk7U1NgJLgI5H0ZkIzmZ4pEl8ObGHKI7SX5p6gnNqE=;
        b=cubF3W1JqiPXmt1GBsm1dPhOH0EKGBo3/aD2xospl0MNUYSg7QX0vOJe8d5xuX/hQh
         DycjCC+Ujn3tQMTZvK/68HWahm2ixNIO4EOMp38v5CEXX8LG3M5hDkfjt110LZ4RcE5r
         LM1jrIT/2xuoAO95lJe4SeH5r30YcaaHPpH8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756577; x=1701361377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTk7U1NgJLgI5H0ZkIzmZ4pEl8ObGHKI7SX5p6gnNqE=;
        b=PA4DmLnVtPMHLXB/jzCuyRWWYsHnCpVFAzgSljw//S9Sw63C+OcYqkQa5nzbQfIblo
         9zIRfbyQahWA1CXUjzLkNd6bYaoIQnl3Dv55Wbt04BIuiYsqyIjWJiqO7FhA/Gf+m1aD
         kfPmTSv3K28/52S7tZqNuWzs9oChatoQKxjl14QYSmf0cUyakMYHMV9CGj/MKtVN/00S
         SOepjkYGchGDXDRyQlLeuj0cMVk5g/k84XvsCGnbJsta62x+cQSxwVh+IFyV3R8CeUlo
         hKftuWJqqKwNEPAi+PVutlGoVRhnzjXr42pKtu21rlbauOKw1j5vwcMIy3WbfvIpeAp9
         FlAQ==
X-Gm-Message-State: AOJu0Yw55jnIl/Qn2gjkePU4OSMX5yRji9KG11w4UsP/EqE6nkWiWqt+
	p8z44/is4jFolRVBBAG45Nhn7A==
X-Google-Smtp-Source: AGHT+IGfArG6uKWe+azaAL9Q6y6v8SX17dKdMKAgpmfQsJvxKR19TryxyDeDvq8PFW/Y0ntjH1JnEA==
X-Received: by 2002:a2e:8095:0:b0:2c2:c450:c2d0 with SMTP id i21-20020a2e8095000000b002c2c450c2d0mr4207541ljg.24.1700756576845;
        Thu, 23 Nov 2023 08:22:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id g21-20020a05600c311500b0040b3645a7c2sm2480394wmo.40.2023.11.23.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:22:56 -0800 (PST)
Message-ID: <03948bceae63cacd1cf235f94b291660bddfb2e4.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and
 users in wheel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 16:22:55 +0000
In-Reply-To: <SM2L4S.0RPFX8B9ALQ@t-online.de>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
	 <aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
	 <7NWK4S.WL0GC9LYMOPE3@t-online.de>
	 <46771525c2282f66edbf766d3b9c7dd8abbc2147.camel@linuxfoundation.org>
	 <SM2L4S.0RPFX8B9ALQ@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191171

On Thu, 2023-11-23 at 16:49 +0100, f_l_k@t-online.de wrote:
> On Thu, Nov 23 2023 at 03:03:39 PM +00:00:00, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I'm guessing lpadmin is removed as it is unneeded but it does mean
> > you
> > lose the ability to control printers separately from complete wheel
> > access.
> >=20
> > Could we not allow wheel access to lpadmin instead?
>=20
>=20
> The Cups documentation states: The default contains "admin",
> "lpadmin", "root", "sys" and/or "system".
> https://www.cups.org/doc/man-cups-files.conf.html#:~:text=3DSystemGroup
>=20
> sys and root should be included by default, I assume? Additionally, I
> looked at the cups-files.conf from my Fedora install and it includes
> root, sys, wheel, so that seemed like a good setting to me and
> immediately solved the permissions problem. Adding wheel made quite a
> bit of sense to me as it is widely used as a prioritized group. Not
> only sudo, but also flatpak and iwd, for example, use wheel as a
> prioritized group by default.
>=20
> Probably shouldn't be a problem to add the lpadmin group as a system
> group in addition to the others, so as not to lose the ability to
> control printers separately from wheel or root. I can run some tests,
> but that will take some time. It's a busy week.
>=20
> I just figured, that in the interest of simplicity, =C2=A0because it
> hasn't been used before either and because fedora did the same, the
> lpadmin group wouldn't be missed . =C2=A0And in case of a system that has
> polkit support cups can be configured with fine-grained privileges
> using cups-pk-helper

It does make a lot more sense when you describe it, please put the
details in the commit message as it does help a lot! :)

I do think a test on whether keeping lpadmin works would be helpful as
there could easily be people depending on that behaviour.

Cheers,

Richard


