Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6CAF01826
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 10:29:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66358.1772792969302401042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 02:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z01lQX53;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so57124775e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 02:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772792968; x=1773397768; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQBI1HADC5mHj9m2UDW5LW9VUv8nT8jJu4oC/tSWZU=;
        b=Z01lQX53l5yklRZdDXgWuh/IP1biPjdwCy1Gual0EOAjhQtLBEaU7ARRvRp2e2Toeq
         xWXo1aJ4YDPNkxDFJLKhjYyvxqg22Lq/EgXFkzP3xS7Q2YaCeNsKJj0RA1kMX7Tn2kJd
         qeTaX6MbuENGHXrLlc9Oae76+NTrfHw96u74I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792968; x=1773397768;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUQBI1HADC5mHj9m2UDW5LW9VUv8nT8jJu4oC/tSWZU=;
        b=YyPKHewzb76Dydw/84h8q5Ku0YwxfdIpJ1EpHeilb3b4TsfLmBrgdecX87TvLLnjwg
         XC1emcEbw/H/ZTRr6t3y515lbhIvFdDOoiILbrmtZhSUGqihq84vc3netnBSGA8doPKK
         9hGr6b+7VFU9oeL5UJFYI7kN4famlvWy8VV1Rb4GlSqtPzuHbrAAfXAynFzQi5qZQG9z
         ri8X0yfNpp0ym42NxNXHn+grBHL4Bu1b+Pcf/0qJ00hYFdNbib/7eYlKwJ6Tii7nXWNb
         GFMAFgbCvCx51ol7MLdC0mzFWXMu80BYpMKmouYe0VMw8LjMEeJptDhLNRn4LzhQmldd
         /v+A==
X-Forwarded-Encrypted: i=1; AJvYcCVvtZf5VyvZw44Bqiu/I/ZRr2Xa9ORq7WzpAFw8FWOPVWB+W3E5B/kTAGeXMLeo08bd19lc47H0ovln2Y4rmpl10w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxAAZ7sAdjXqkOwW8qLGdKnmjsn7eA6vnBZJddbX0rkP/DyqhN6
	6P61QMGhopSCNLydQZKZTztYR99o5qTB4e0H4KsTOSQOUWBBolGBIccADf33ecFrkbI=
X-Gm-Gg: ATEYQzxTHn22fOdsFO/RsFsVXj5/Bno3olbqFbDzNgKpSLkUPpiMEcm256c6KY3ICp/
	o0S3HtEp243Jdhn0AeEya8ghufTz2SLcic79bFJRTtgYrctKDcBtsJFwKoz009yCwO1idwLEQai
	NIiebqKoyAFGqOqITeYBBS81s5z6Nle0IbSYJKeS+J7lTHu1+cMu2FnzTFTEvqMhkYikZxo0XvC
	17zc2vaQFzW4N1fJpGilG3s6ritTm58aO5ykt8LP8k7boOKD7Xil+uTolM2qsOKvhn13cpbmyr/
	6kwr5iFqBlQSYBtgQMiWvr+OmJppYU4aNFYWijlM3s6XKyquZ07ABjx+7y+1rG8Q9O6LdrxEepv
	iH+e15LsNJ7Uxsq92kFgu/F8529KUz7smYspXsv5SjLqlVWiyzTub6/B9Z5J2yNUVzAeXHOBg49
	QvkhJIrC6aRgLZ2xlEuYOAb7DpH9pxtJkX/sLsOswfZfUrkL9g184PNmUGajIOMST/Uq0/Nhpj8
	wwLbx3wIlmaYDpP
X-Received: by 2002:a05:600c:3ba7:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48526958748mr24157085e9.22.1772792967602;
        Fri, 06 Mar 2026 02:29:27 -0800 (PST)
Received: from localhost (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bbafsm2982496f8f.18.2026.03.06.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:29:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:29:26 +0100
Message-Id: <DGVMNPT5SAC8.MO37XH41TOW8@smile.fr>
Subject: Re: Recipes which should always be upgraded on stable branches
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
In-Reply-To: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232562

On Wed Feb 25, 2026 at 6:44 PM CET, Paul Barker wrote:
> Hi all,
>
> I've been briefly discussing stable branch update policy with Yoann.
> There's a few recipes in openembedded-core which I would like to propose
> that we always update to the latest version on LTS and stable branches.
> These are recipes typically providing data that is expected to change
> over time, with little or no code.
>
> You could say ca-certificates is already covered by the fact that
> security fixes are acceptable for example, but a clearer policy would be
> better.
>
> Any policy change will go to the TSC for approval, the goal here is to
> get some review and input so that a concrete proposal can be put
> forward.
>
> The recipes that come to my mind are:
>
> - ca-certificates: To allow access to HTTPS resources we need to keep
>   these up-to-date.
>
>     - Keeping this up-to-date is common practice in other distros.
>
> - tzdata: To stay up to date with timezone or daylight savings changes.
>
>     - Debian takes upgrades to this on stable branches
>       (see https://tracker.debian.org/pkg/tzdata).
>
> - mobile-broadband-provider-info: To stay up to date with provider
>   changes.
>
>     - The README file for this project says "The Package contains only
>       informational files so it's safe for distributions to grab updates
>       even during feature freeze and maintenance stages."
>
> What opinions do other folks have?
>
> Are there any other recipes we should include in this list?
>
> Best regards,

Hello all,

A quick update on this:
The YP TSC discussed and agreed that:
* ca-certificates,
* tzdata,
* wireless-regdb and=20
* mobile-broadband-provider-info
can be regularly upgraded on stable branches.

So I'll gladly accept those upgrades.

Note that (as Paul noticed) the tzdata 2026a release announcement says
"It also has significant changes to code and to the build procedure.".
So some care will have to taken there...

Regards,
--=20
Yoann Congal
Smile ECS


