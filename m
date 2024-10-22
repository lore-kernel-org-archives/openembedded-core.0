Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519DED2C54C
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:00:05 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.17572.1729601996000193568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 05:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NTThgQ7I;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso5436211276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729601995; x=1730206795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUFqKkBq+1I+qhfJtjUUZDa3n0a1YKsvMpxIkUhPvjY=;
        b=NTThgQ7IYbTnqBPjddKlGzgEYbwGkWXImvqCXw5gVJnCNMAgSQrCFeBrUyU1hSYnbz
         Ah7KfDqs2yJCOfsNXAw2Ey+zA4qA7urHtzsRQryc7rfSGBucHq4mby1684B6ovo7NHE7
         n4dulesq9tmHrWKhfjTEdzIo6gmLh8yzff+KxR7jmEqlIwuynCVPsor4vWWQSBxpTYU7
         1K3uqamEwhUdrKblHFQrqBv+8yYHlCl21kTHx2Auaq58ULYHp/jOwhdlpZ9gzkAzechz
         diK524UbwtLv/aa2Q+aninYA6XR9Izh6EHhzLAyoMzDfxX6wGIQa8XtahzxAeC6rXfHv
         LdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729601995; x=1730206795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUFqKkBq+1I+qhfJtjUUZDa3n0a1YKsvMpxIkUhPvjY=;
        b=bETjeFDtUKw9Y8I3UTLrypF2j2tZPNgQMayByQAk/arQ+slVEDBRDeLotkuBWdNA27
         5nlGys+buoDmG5v7ZrPtadbLwNzDiCe28CV5v709YJvK+flo37Si+g5BMWG08aZambT3
         Oiy6Lz6woOdDCrxNvW0bywJRDpZe5ld1TOw0u9cvWMvzzvA9+uO3qijyh7y2jait2FMx
         AOcUfOaFUMPZ3ITgvKEoFWAxJGDozL5JYOU+EE84zIORyqv8c1isAFl+P6TRq7zzjBE5
         7Pw4C06QLkkusSSOD5Ggg6T4zPN3FUrKOeYScd88Hy/+e+k2d6vbKq9C/AgzD14ouxHM
         V/FA==
X-Forwarded-Encrypted: i=1; AJvYcCWxKLrJrSWh6qtlgzOPojbTUhbSyRQGBAIVvvYfyKSl0FDTTM9T6+I98CtabbRJBmVpS4NoyYI3/cJVXcZI4vI0AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfZEUToY0T/p84sGgdhRgNn4Prl4wJMGG6RW/ET+8Lq/59tkUs
	XuCSGyA1a456p5Iz/zcNkxld+vFDeEKwaQFPv8d9eC2wLeiLPWy3ByCLhO9BJU0VbkCCWrC5FUP
	rU6vWIyFnzDQSeLzjV1GD8fMSpDEpp3FlCQ/NMA==
X-Google-Smtp-Source: AGHT+IFegReqIcptrzwW1QeCBszQKV6j1awZ+Ae1a8CPciFi/33vy9dN4dCzcUYl7EfaxSPSrMqaD1SNIyK8Q5ninEU=
X-Received: by 2002:a05:6902:70c:b0:e25:ca37:b669 with SMTP id
 3f1490d57ef6-e2bb1317893mr14728249276.24.1729601995114; Tue, 22 Oct 2024
 05:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723636705.git.steve@sakoman.com> <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com> <17EB9EED917D6CD6.10903@lists.openembedded.org>
In-Reply-To: <17EB9EED917D6CD6.10903@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 22 Oct 2024 05:59:44 -0700
Message-ID: <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 13:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206151

Hi Marta,

We are still getting database errors on scarthgap (and occasionally on
kirkstone if memory serves), so I think we need to reconsider
backporting this patch.

Can you suggest changes that would make it acceptable to you?

Steve

On Wed, Aug 14, 2024 at 7:33=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Thanks for reviewing Marta!
>
> I'll drop this backported patch for both scarthgap and kirkstone and
> wait for appropriate versions of the patch to be submitted.
>
> Steve
>
> On Wed, Aug 14, 2024 at 7:25=E2=80=AFAM Marta Rybczynska <rybczynska@gmai=
l.com> wrote:
> >
> >
> >
> > On Wed, Aug 14, 2024 at 2:02=E2=80=AFPM Steve Sakoman via lists.openemb=
edded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote:
> >>
> >> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> Rtaher than trying to use a sqlite database over NFS from DL_DIR, work=
 from
> >> a local copy in STAGING DIR after fetching.
> >>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> (cherry picked from commit 03596904392d257572a905a182b92c780d636744)
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >
> >
> >
> > This patch is changing the ABI (well... variables). I think we should c=
ome back to the old naming
> > for the downloaded copy before backporting.
> >
> > Regards,
> > Marta
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203323): https://lists.openembedded.org/g/openembedde=
d-core/message/203323
> Mute This Topic: https://lists.openembedded.org/mt/107893246/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

