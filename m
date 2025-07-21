Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695B1C83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:27:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.37170.1753093648914510423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 03:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eE8S6Hay;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so42969755e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 03:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753093647; x=1753698447; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Vji5SL25iPLO7geX/pbl8TEW96W6ptKXSAHiUjAaDs=;
        b=eE8S6Hay7/2fJJAPsvYKPpxgG03eJgCMcNmejZk7TpYDTpEHqez3BlV+UIWpN94t4/
         cxWcG8S2BPctCZjVMUCGmyVW4WAZZo2d+/4ks7hs/k8eg7bR49O7kiD2jbXLuzHvQcML
         HVRFnBvKhp2wWuzrs6+X7TP2tT7jYBomdgJRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753093647; x=1753698447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Vji5SL25iPLO7geX/pbl8TEW96W6ptKXSAHiUjAaDs=;
        b=nv3lQ59SmakrUT48AZJAA3IPiHC3y6vTAV9NZay2HpFbUHTYnllvvt1wi4I/frbyzX
         YA9aQHbWcymjAI9Prtr/fkO9aU6AypiY9fsQPhS63R/LSsvOuNdzhVbiX1WFBDPGqF2B
         VL7w/UXX0VzK2UIlbth5Kkz8/jdeSzDMIYlWSAduR99Zs3S2PvIIKHrwxloZQek2ed29
         b/DFGj6Yv9eDcxvrkIXHuIGakx1ZI5jjxu+H4hEp0cBEPBT/3G8kh7CkeJKG0wvmklHb
         aPxEml7VZImHKorj6M/qRYLfopgB9dNqOreP9ctFzWZ6gofTdPx/mtomauSBPs0r9Z89
         V6IQ==
X-Gm-Message-State: AOJu0YyQatwta5M2TFAMx1stb8GKltFzrj14cIFI1ypAG9RxhPNBz7N0
	y1ShIs27FDdsVDKCbnGW79IaJzcPPCpCm8vsUFtoXyzk6TGhhsHc3pwFZ9sNXkHcTLA=
X-Gm-Gg: ASbGncsZqBmOIa5P00xdrmV3Pfd4Z44lL9aGvO2+tEtu5EU3MVFzZigDUUV6zcnmYGr
	lU3Q3H0fF0JGyIL6ZdmAJ3eJ/E+n9GTIyGF6V5ko2TAt3lK2eAGUdpQVrGrpswH1DuOegXKnRWf
	0ostbv/Hawr17xNbKvbgQvzZsEhJ88T65vC8qKoZ6meQOGulaKKG55lk3QKfCHjQsviJnVSu3i4
	YQ5CORPKesYudpTWelJdzT7KkgOzoYYH6y5WwGwu8DFZ8MCSrKLtuZ6RKlXkaTwJvMXOWvbf9Ab
	+5hCoXRNBtArhtfjRS3MzsWe2/CGjZuBPuZ7uDRjfhWxwSzNhuPImkvxL7oCpd3OMJfOncwO9l+
	OcrYR7Q6qjL0FSNX+uX2l2wwoMOJD4mBV7+1Pvh6w5Xx7UofiqhwpIomnlA4UhM6cQoGR9jtocE
	8iVPdcNGF2kpc=
X-Google-Smtp-Source: AGHT+IF03vy6/pYwY5jMIPF8HdgQ3Eda1GK0yLtQi83aZik3TADiuvlo4s5v3oSIUoHpeMvHF0g41w==
X-Received: by 2002:a05:600c:3496:b0:456:1b8b:b8c6 with SMTP id 5b1f17b1804b1-4562edaa066mr188791965e9.14.1753093647100;
        Mon, 21 Jul 2025 03:27:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3115:2e86:f442:218d? ([2001:8b0:aba:5f3c:3115:2e86:f442:218d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48991sm9995559f8f.44.2025.07.21.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:27:26 -0700 (PDT)
Message-ID: <c5c7b6cb0ede0893d9c760ebeaaef042c248fcc1.camel@linuxfoundation.org>
Subject: Re: [OE-core] Yocto Project Status 1 July. 2025 (WW26)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2025 11:27:25 +0100
In-Reply-To: <CANNYZj9R79Um9BvKmZmOrCZLnVaDk3cfO1KHM8bu54mu3F-68Q@mail.gmail.com>
References: 
	<CAK5yBb_mX+D24LjOozpm=m_Y=5AhHSX=5OtNdbNHWg99mcuFNw@mail.gmail.com>
	 <CANNYZj9R79Um9BvKmZmOrCZLnVaDk3cfO1KHM8bu54mu3F-68Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 10:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220672

On Mon, 2025-07-07 at 09:02 +0200, Alexander Kanavin wrote:
> On Tue, 1 Jul 2025 at 16:44, Stephen Jolley via lists.openembedded.org
> <sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> wrote:
> > For M2, the following changes have been mentioned as possibilities:
> >=20
> > bitbake-setup
>=20
> This was discussed on the call; the next step would be to start using
> it on the autobuilder. That would significantly boost the credibility
> of the project, and validate it in a real, mission-critical setting :)
>=20
> Before that can happen, the tool still needs additional functionality:
>=20
> - nested bitbake configurations, that would be an equivalent of
> 'templates' in autobuilder's config.json. E.g. a top level base config
> that sets autobuilder-specific fragments for all builds, then an
> intemediate config that sets what images and other targets get build,
> then final configs that set target machines.

I've been looking into this a bit more. I don't think we need to
replace the template functionality in the autobuilder, at least not at
this time. What we need to do is just switch over to using bitbake-
setup to setup poky instead of needing the combo-layer derived repo.

> - ability to override git repo locations/revisions from the command
> line. E.g. the config file sets master branches for all repos, but one
> wants to build master-next.

There are two pieces to this. One is being able to select/override the
repo/branch/revision as you mention. Another key piece is being able to
point at a local cache of repositories. The tool may handle the latter,
I'm just struggling to page in the context.

> - ability to select a subset of bitbake configurations for
> initialization/update. An autobuilder config would specify dozens of
> configurations, but any particular worker machine would only work on
> one of them. There is no need to initialize every bitbake config, and
> it would only add delays and clutter.

When I did try the tool, I was a bit surprised to see the multiple
build directories being created. This also won't scale well.

I suspect the more user friendly workflow is going to be to create a
single build directory and then point the user at the configurations
available, i.e. the features (which include the machine/distro
selection).

This is going to be the part of the workflow which is going to make or
break the tool and it isn't quite right yet. We have all the underlying
pieces now, we just need to expose it to the user in the right way. As
it stands, it isn't feeling quite right yet.

> Once all of this in place, config.json could be gradually transitioned
> to defer to bitbake-setup:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "qemux86-64" : {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BBSET=
UP" : "qemux86-64",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>=20
> and the code would run that with appropriate build-specific
> parameters.

Or perhaps this just becomes a list of features...

>  Config.json also has custom local.conf tweaks all over the
> place which would need to be reviewed and converted to fragments.
> There's also nomenclature for targets
> (BBTARGETS/SANITYTARGETS/EXTRACMDS), multi-step builds, and possibly
> other things I haven't yet stumbled into, and that all needs to be
> carried over to bitbake-setup without loss of functionality.

I'm less worried about these pieces, they key piece is whether we still
need combo-layer.

Cheers,

Richard

