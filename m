Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CE4FC9EF9
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 10:49:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7040.1772880540019257695
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 02:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UJZZERh9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so4051008f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 02:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772880538; x=1773485338; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m3jR3C4vDJ8YhURDkFwIKmm4ZlzF0+nCeL/+0TyYTFY=;
        b=UJZZERh9m6eEcGusfsaE2jOxpRNqzKdJflOu2x3vggw7w1C1pQctjqQq92HzB/lFsj
         1ly4unbFRACbIihTkEBZFeWwm3oSSU1RIg2MkC+a94LS+T7+cT7Ev5/BzKAHU3xXwJ37
         rwOBpVYP6B+2FVzNHWFvR3ShqeriSL3ozN0ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772880538; x=1773485338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3jR3C4vDJ8YhURDkFwIKmm4ZlzF0+nCeL/+0TyYTFY=;
        b=j1y2oHsDVA1TKWDlQ6gRYQT2aUAU6ut546gR+YtyxK4WSkZx0WFOuisvpaEWOJOZvV
         SsOu6CHXEIxNkP4tw67FkVT6Yh1Xzy0puHcH0L5fumkP0Qg5B29uaOifNCAAwbvWZXTX
         whzi5MzTq8qXfbm1Blg2Vl/6KoGHyuAT+9oiXM8Gk5+tYe5snk2grDXTnrnzosA8Taev
         +oLjHUGIyGzfpWgR7zfqXg+NAwwmEF0CccCu/6IjrW/2WKo9AiWwm7HiIVZhDWF73B5u
         yomiq6peKTwayHvTJ5L4Tr4Mnwrn6WsCS7yfVAV5+6voy5dJN51+pq630T4ndXSCavLU
         5twA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+P331n/1KN9HyGK5GzHFf64Whzhj4HFkutQMvUzi7nXUwr71j4uvKbDP/hoMG15Zlo+ntEYEbUPQ9nza4GvgDg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLKaj61I9spK6pE+ewLkjqatZZfJhrzqfQEfpqdMYxIyrpS/Dp
	x1PLxJZTmnYpxPbRMCahHQwhRy+up1Y/e6gHnsDVuBom/WPMIkqV4skMdu2md6IuJWMxUPfdrhP
	XM+ulPyA=
X-Gm-Gg: ATEYQzzdtwJfhkQ3y67X3pEgpHgn6mZQKIZwXTXBr38ETETbcccmxN8j0+gq16sbttJ
	xUJeH6cs50sER6jqY9umIvnBrABlgP+Ad9V4I/YQu/nM/VOxN3nrgHcVPOkInHsfR8TK1r9LEPc
	nR4+RUTYt5LckRzKyjUtAMzSRLAn+lpKcNLM+RsVJntCjtjj9BeejL0yOA8OolWHBsHuK53Bvq0
	Yk6ESebjP+UNrmtVrubV0iUsRk+w9mowvPogIIQJOd5HeW8sFpIwZsJcR8ljjHnM6LVY8mFrwCa
	zX0UwibxSHipfq0vaHM5zUGV+r7yX5Vz+Cq5F1ofotUDYUb0LriFP/ziJJuHkfYxJL1VwSK30iu
	fvy6iKKxsYC2vzI1KykDaHND7K1cS8+23oTknK81NEuKu9vyVAe0pn4ItclN2dCssZ0Ybame98Y
	XBA4+n29dVIRIDeDVSAMqk+MpuEINfChfnGwZOEgTnC7RA7Q/RkbDzW5L/BL9LznNCqRcWwoLra
	Fb5mlWuINYZmSI=
X-Received: by 2002:a05:6000:2dc7:b0:439:cc5e:a6d5 with SMTP id ffacd0b85a97d-439cfd76d47mr15722770f8f.23.1772880538339;
        Sat, 07 Mar 2026 02:48:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72? ([2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm11536007f8f.28.2026.03.07.02.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:48:57 -0800 (PST)
Message-ID: <0042c15cb84a0fcb67403e2b70253831724720fb.camel@linuxfoundation.org>
Subject: Re: [yocto] Clarification on ptest/selftest backports for stable
 branches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org, yoann.congal@smile.fr, OE-Core ML
	 <openembedded-core@lists.openembedded.org>, OE-architecture ML
	 <openembedded-architecture@lists.openembedded.org>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, Shaik Moin <moins@kpit.com>, 
 Pratik Farkase <pratik.farkase@est.tech>, Naman Jain <namanj1@kpit.com>
Date: Sat, 07 Mar 2026 10:48:56 +0000
In-Reply-To: <DGVX4XQ6VLWT.1HOMXA78ZXLBG@smile.fr>
References: <DGVX4XQ6VLWT.1HOMXA78ZXLBG@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 10:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232610

On Fri, 2026-03-06 at 19:42 +0100, Yoann Congal via lists.yoctoproject.org =
wrote:
> Following recent discussions regarding merging ptests in stable branches,=
 we
> are clarifying the policy for backporting ptests and selftests to stable
> branches.
>=20
> (I'm transcribing the Yocto project TSC decision)
>=20
> Moving forward, we will apply the following criteria:
> * Backporting new tests is acceptable only when they accompany a
> =C2=A0 corresponding bugfix.
> * No standalone tests: If a test case is submitted on its own without
> =C2=A0 fixing a specific regression, it will be rejected by default.
>=20
> The rationale is twofold:
> 1. New tests on stable branches add limited value if they aren't targetin=
g a
> =C2=A0=C2=A0 known, occurring issue.
> 2. AB-INT: We cannot afford additional intermittent failures.=C2=A0 We ne=
ed to
> =C2=A0=C2=A0 minimize the risk of introducing noise into the build result=
s.

Just to add, the TSC realises there is a balance here. We do want to
encourage new additional tests and improve our testing over time.
Allowing backporting of ptests would encourage that.

However, it is also clear we as a project are struggling with the
existing set of tests and "intermittent" issues on the autobuilder. It
is near impossible to know which of the new tests are going to cause
such issues.

It is also unclear how much testing many of the submitted and then
"instantly backported" tests have against master.

For those reasons the TSC is being cautious. If the autobuilder were in
a better state, we would perhaps think differently but it isn't.

It is still possible to request exceptions if there is a clear
justification for adding specific tests to the stable series.

Cheers,

Richard


