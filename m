Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDA5E81DE9
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 12:37:49 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.11588.1696595861698181118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 05:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jhu9e8iK;
 spf=pass (domain: baylibre.com, ip: 209.85.208.52, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso1031028a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696595859; x=1697200659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w9rvmFvll3NzXEzXHgsRlIEJRcb89SOgW/g+i2wGl8=;
        b=jhu9e8iKa3XhOFqI4/UcAWqgyW+aJo59nlLdfORwVw922bnu07CBdCuCC+CK0DCPaZ
         g31071uEqW9Ba5mD9oatewmrb9NfXVdMNek99BbvpLWbiqgpltNTONc7x56uiNSsaBqE
         si0uscgpU0mYtrMBX+llGJd7eIJWvJjj44PfT2Wk1TeVvWYG1aTDJ4y+yX+UyUZkCOT7
         7bDlBwChVOpmKc1fkNZGcKPILt8XCKzo3lC1RTIFTmMWV24l6T4x+ASPBbKf9O5HAjij
         0Z+Ca3+7JxBM91IX0T/03u4guhQx9geefOBUYzlYDzVPO17eTWzT7EKw4egcuy3joGam
         yfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696595859; x=1697200659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w9rvmFvll3NzXEzXHgsRlIEJRcb89SOgW/g+i2wGl8=;
        b=XlKuMRMRWyxh7spsf6xR+kvlTbpXExj0mTwMxEyUtTPDisbXxK5UlkJF3Ef9X58b9l
         0lllThuLiftE0WqJ7wEiRRw83qOTNR4XtiIe24Fvp8QqwbK1xLWtYCVjPOdkRLwGKdD+
         WQp93susb05k6AWFQaIY1qcgG+9X1UD/0shaEvOLRPgM37bOhq7F9AAbu4hn1TYZFtMU
         FnSRnBfeNvkL5wu0YOdmLwXX7BY6jWZg6oEzNOH1k1Aj3Ja9Ia3oUJaHseGjdYp0fGUB
         pXDhAPy1qlaZivJNO78zNgKvL+jO3GuOhfMSs/2REBWmZ9gHNnnasepMD1zt06PzFz8s
         9zow==
X-Gm-Message-State: AOJu0Yw7ORE9I/9LOaFzBY80vjHBse3ey4pYWb1ehCZ8pWUjvGpRbuSY
	DqBg8oKqYqnOKpUgFomRGlbOYdlaB70DVc5dfbPfrw==
X-Google-Smtp-Source: AGHT+IFsPYqDnJ6AsaZRJiOwG84fWcmFT7zCrtGCUigt0Aa8FnnZWhVI20jN+dv09VzZotXZ140LRYuKj0FYaZFWkHI=
X-Received: by 2002:a05:6402:22a2:b0:52f:86a1:3861 with SMTP id
 cx2-20020a05640222a200b0052f86a13861mr5045221edb.7.1696595859737; Fri, 06 Oct
 2023 05:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local> <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
 <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com>
 <CANPvuR=nx1dQcshoXU6m6NATHsSvQmAYc9=WS8+qv5u_8OBTdw@mail.gmail.com>
 <CAEHHSvbZUi4Awcv9+d3KkdbURD5DM6aGUOKa_F-7Le-PEoemRQ@mail.gmail.com>
 <2023100610560712ef25f4@mail.local> <70686480d7fd09e2a6f78f99d2f15199892d0d8c.camel@linuxfoundation.org>
In-Reply-To: <70686480d7fd09e2a6f78f99d2f15199892d0d8c.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 6 Oct 2023 14:37:27 +0200
Message-ID: <CAEHHSvYff48S1dADOZis-P-kGgfO1RXBruF0OKAjjd5poGeNZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 12:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188764

Le ven. 6 oct. 2023 =C3=A0 12:59, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Fri, 2023-10-06 at 12:56 +0200, Alexandre Belloni wrote:
> > I started an oe-selftest that passed, I'm going to carry that in my
> > branch to see whether there are other issues.
>
> I've had a couple of runs in my branch and not seen any issue from that
> as yet FWIW.
>
> I am leaning towards merging this at this point.
>
> Cheers,
>
> Richard

Hi Richard and Alexandre,

That is very good news :)

Cheers

Julien

