Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CE9C3ABA9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 16:42:47 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.449.1746031364916395022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 09:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N4nddVAF;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f7f7b70aebso72748b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746031364; x=1746636164; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShNE1xzJ98+koN6+Jj07M2vpDcFhSWefXsop05Ub7s0=;
        b=N4nddVAFw9X21goPj2JYOKjC735gFtadQdaDiUVKS24UMO0S1u+6NQf0qbjlV00NMY
         z113WvlClmrPkaKDEEiaiJxL6c351Aum6ZS8kiX3QQK4earnC7I723W0rVjrksQvq3Cm
         m4T9fs/spVhJLKaYxgQuheKCyV2d9IVV6+WjLzRdQbpqQN8sMvAF43pQM3LxSvjly3UR
         sN6ND9rPZWaXWmizJegCY1TdOU54XDqhGGtwgkXAVsGM+uo0iZY7+RFoWowASKl6Ws50
         ywWzHpuSawc0eHDtp5O8gmadF4Ei5XO85I2JGcEKwNFapBnMr20+lOOgoNRI3AgFbwPi
         TZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031364; x=1746636164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShNE1xzJ98+koN6+Jj07M2vpDcFhSWefXsop05Ub7s0=;
        b=VGJje/R/b18NcLoldUAB2o11wQcXjvXmydxb2ucDfqiFyiLwRPwqLB705HqkQenQ84
         LvwC0qciZHe6OWRjs5H8I3fnMfnDCAnO8vtvTNtj+EIRSvQqOCfSsDACyY5Cc0RIzi8Q
         L2J9oU9f/CmKuCoVFuFIvyTdTbLtquZ/fhJTckDwhxeqKtSGIEwm98iia452i5y30aE3
         YA85vC/x39rQmY8f+rAsEyUOwZPON5oMs9KAjc4QGb3cq6Jut9xuf4sFjzARxzP/ze/h
         1DJZJZSz/dfrt6SxBgFSpUbKIf5z8yhtnPNmbWUB8fVSAF+ztfdJ35awrmRN2YhdwnL2
         25/A==
X-Forwarded-Encrypted: i=1; AJvYcCXH2E9HKCk/niUD+Tt2RisC/GBvay9WMACPaj1XAm5bnnV67tCdnHGNts4oEr+g1586+pbNG4+czxrDt52L3cYu0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfzVywT+naDA7fqMsae1lXNG5EKQd4NOZSgwZqW9f3f6RmzuwE
	181tB1zs+mrICJcOV9MWNPJXNOlTHbwpg+y4rSa2dyTUtEucOwdaillQxD1PNuf2b4pCUVSx+uy
	viMingj4hGgI/Tmuo4dFAGCXq+gU=
X-Gm-Gg: ASbGncuWGU/Lsefep4zlQ4K4HR8BrVKv3odXvGNMnM+KM6AqMH0SZOGroRaGFa4od3X
	05Ov9nSgW0QKafjtOijjng83zmaYLf1ZY7nT6+oDiPvjoKCo/vdSmsCitTmF1HHP61/h2v3BBe+
	5urjv59XEF7xTeTeOZH5phtw==
X-Google-Smtp-Source: AGHT+IF39qWH0HPmO5GbvqcwuFxTm9wSXqX4xHGKzyRtAvslMpe4yumhDZa7eNjGzrW3AKOVghp53Zgo0llRYdA0MdM=
X-Received: by 2002:a05:6808:3a13:b0:3f8:150b:f55a with SMTP id
 5614622812f47-4024390f58cmr2341498b6e.20.1746031364131; Wed, 30 Apr 2025
 09:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250428174416.379821-1-tgamblin@baylibre.com>
 <20250428174416.379821-3-tgamblin@baylibre.com> <DFBD12CD-630F-4D62-9655-1F262813F9E6@arm.com>
 <CANNYZj8SECgw5Qoef2iqaOb9mtyOK2C4Gub8NjF6qXPDAWQ=3w@mail.gmail.com>
In-Reply-To: <CANNYZj8SECgw5Qoef2iqaOb9mtyOK2C4Gub8NjF6qXPDAWQ=3w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Apr 2025 09:42:18 -0700
X-Gm-Features: ATxdqUEe-gbGyHssQ1TQgZtd-wClD3K121z6akVJQZKvyQru0K8DrHjjQLVFYqU
Message-ID: <CAMKF1sqngjgECPd1eQUZz=7a3=oy3L5L=9XdwukewDJQfFqvaA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2 v4] python3-numpy: fix ptests
To: alex.kanavin@gmail.com
Cc: ross.burton@arm.com, "tgamblin@baylibre.com" <tgamblin@baylibre.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 16:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215754

On Wed, Apr 30, 2025 at 2:54=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 29 Apr 2025 at 14:57, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > On 28 Apr 2025, at 18:44, Trevor Gamblin via lists.openembedded.org <tg=
amblin=3Dbaylibre.com@lists.openembedded.org> wrote:
> > > - Add gcc and meson as ptest RDEPENDS in the recipe;
> >
> > Personally I=E2=80=99d prefer to skip a few tests than pull in GCC and =
Meson=E2=80=A6
>
> That ship has sailed. Gcc is required in many other ptests, and so
> building it is pretty much inevitable when they are enabled.
>
that is right, when ptest distro feature is enabled, gcc gets in the
dependency chain, IIRC it was some perl tool which does that.

> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215736): https://lists.openembedded.org/g/openembedde=
d-core/message/215736
> Mute This Topic: https://lists.openembedded.org/mt/112504707/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

