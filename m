Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61774C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 14:08:49 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.174226.1719324526284109166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 07:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mc35VA9i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso4554566e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719324524; x=1719929324; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6B3iAuJKODwEV58DNeJf+AOVWE4rFxVRNSkJ/6Jajo=;
        b=Mc35VA9ijvKC5dC0qkg4HO0X0KKw2NPtiPV3phE0g3tze/Nd/9fKZxkVQ/EXmi5whn
         v94YYHpXmyoQPRNvLB+X9181O5KOPrxOoPPY44YEb0m4CD/G6tskzSdEgLp/gJz5iJ76
         Q3WzO7kPjMdfVhH97yGvM5QVA1/9IvNEBY0oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719324524; x=1719929324;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6B3iAuJKODwEV58DNeJf+AOVWE4rFxVRNSkJ/6Jajo=;
        b=SxJNscxIxcZPoe7YK4hU+ZA1yUJFzkehD/uV8uAybhdYI090lm/kvGuXOH3f9EIt2p
         0J4sNpp2iJfAX9L5YRSMl5foT6GafZOZc/U0kjSB1InKIJrDpmmo8QH9TZr309VPgbaU
         nAC7DGfgLzR0j+anh7D61X/nOfUl1NW8hGnNFO5Y3kW/5i/Ar6ha1wlXL2sVibDax2Qj
         TksBG89ZgjIeO0L4PiJINV7527v5zYCmBE5o/6bAkpXQa64SUV/NSM96LW1urXjDTVko
         0kiToTa1OEA4xLxQDqi6HDmuC51HTIOxjPTQLNSkS7/xkrRCfIbrToBiiq/mgccT6A0a
         qXWg==
X-Gm-Message-State: AOJu0YzTOXukApzx+UJyLb6Oz6gUD7yWA+rJAYBIsMgKOosuINcF8sbK
	wzTVp8UzIl2m6z0ws8luOR4UDoilsK/n2MMVuooJYmY9UYrLr+yyY9S2VAY6lPc=
X-Google-Smtp-Source: AGHT+IFHBktM1zIyS9POJkagm88LnF4ADFo85aihnal+AX0fYEAt9kKCR6f05X5Oe6+vETRqN97GEg==
X-Received: by 2002:ac2:456b:0:b0:52c:df6e:9517 with SMTP id 2adb3069b0e04-52cdf7e66dfmr5017708e87.11.1719324524079;
        Tue, 25 Jun 2024 07:08:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e? ([2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be9fasm215580215e9.16.2024.06.25.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:08:43 -0700 (PDT)
Message-ID: <1834097c92d0c43c71ac5d05ab4229a385506fcf.camel@linuxfoundation.org>
Subject: Re: [yocto-security] RFC: CVE check standalone (introducing
 yocto-vex-check)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>, ross.burton@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
 "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>, Samantha Jalabert
	 <samantha.jalabert@syslinbit.com>
Date: Tue, 25 Jun 2024 15:08:43 +0100
In-Reply-To: <CAApg2=RTTHOLFSKapCTbPy4_r_vc+GwiK6L706j2mORCT-+4pg@mail.gmail.com>
References: 
	<CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
	 <3067A608-B538-438F-B270-5A6F2234C800@arm.com>
	 <CAApg2=RTTHOLFSKapCTbPy4_r_vc+GwiK6L706j2mORCT-+4pg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 14:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201135

On Tue, 2024-06-25 at 14:41 +0200, Marta Rybczynska wrote:
> Applying ADP (we'll add support just after finishing the tests in
> progress now) requires modifying JSONs for each affected entry. The
> only ADP today is CISA and their entries have been merged in the
> cvelistV5 repo. For us becoming an ADP would likely take time. Adding
> ADP clauses separately requires you to modify the entry, so you need
> to keep it somewhere. I see two options: either fork and modify, or
> copy separate files and modify in place. I didn't go for the second
> solution, because entries do actually change, and copies would likely
> mean more work (for example, they have recently converted all entries
> automatically to the 5.1 schema). For now, the rebase is actually
> working well (had a few issues after the 5.1 update but that was my
> fault).

I think we should maintain a separate ADP json file even if we're not
an official ADP (we can consider that later if appropriate). One trick
we could use is to checksum the data in the original, then inform the
user we need to update the ADP entry if that original data checksum for
the parent entry changes?

I prefer the ADP since it makes it clear which data we're
supplementing. I'm hoping there is only minimal data we need to copy
into our supplement, which should make it clear which data we're
tweaking.

> What I haven't done yet is submitting fixes for old entries - the
> number of affected CNAs is quite small so maybe we can lower the
> backlog quite rapidly.

That sounds promising!

> BTW The CISA extension adds a notion of the exploitability of the
> vulnerability - this is additional information we can report. Unfixed
> CVE that is exploited vs not exploited, this is well a different
> class of useful information.

Yes, although I would like to get the basics working before we get to
that!

Cheers,

Richard

