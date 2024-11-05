Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAF3D31778
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:10:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.27091.1730830237300032970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqWzmCem;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so41779521fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730830235; x=1731435035; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR0MuV+/SHXsCWVgplddHzxAKl+0rJIe8HGLO/39VbQ=;
        b=OqWzmCemYUCK/ox4aY6j4f6932Ydpu14n27NiU/EDBGTSILvbdG6g4SE0iX8zAlqO1
         4porHxgBTz5RqC2tlRUEHSfgWN1tL+uixqdNJiXinu14ReVHxlgQp9Q4Zfv6qicHZRgD
         F8hRN3qKnU0mEWtjBJ1hIglDNRfvBY7tAkF62b/BkdFczTt9lChcAJqy9EuRx+0SYu7M
         8A7Ro+qOuezAxM7FC5yO6pEkoU4Bw9KPGbnT4ihYYw/jzJAtNN6vCws96hfX6hgt4EAZ
         iITE3pRX3DtEifTB5NhZeLnIFc3VHRjStV5YfGZcIEUEKkzjsF4UrcbAzTUMXad++yIU
         1ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730830235; x=1731435035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rR0MuV+/SHXsCWVgplddHzxAKl+0rJIe8HGLO/39VbQ=;
        b=muv0n3ptKsG0dlegf2MGQMtLemIVEL0BRDGj6+Uu1+97syXPOWXWwXqokQdDtsU9t9
         dqQAChItoTFbKj5+66LAsi0dwmHCiWKBBe8A04UrFaPRBVVtMRmSVTFj+W9Rnq9X2IhM
         aSlGyJK6J3k510aWtE/5z3mko8+yWuydJMt9f01djaXQaBzz1luis7t7T7WDvon63AgW
         YjY6g+FBEw5XtiMwCqWF99aFQYaETKOp8DcS8S1AHVn5XxT1bHaHE53grpkko64kKEei
         ojKcsJs0o87ArvGdfKHMrRR0THQfFSCZqDu1AJaoeZj7LOfRCWmJ3d8tW5J5Zw7YJPbU
         JfaQ==
X-Gm-Message-State: AOJu0Yz+hT4c7wbtpMHz/9acn5Xa6qqlgahYNPZ2iMKrCHq3bG4YYoRB
	+TGqxiWtfhqNWzQngsUw8+6DaaCnaLtVZ6N75OSDmko2wz2UG7TV//+5tE+UJloSEPDv+CAMZJb
	22oEboGNmSRX6Q3feZ45eBCRVR5U=
X-Google-Smtp-Source: AGHT+IHCTXyVGOjPt6+1lg1PuH+DqZJlQIw7XlXf/wvu5DDRoMEzHf5y81KcEclVh3jFb+k/+IXlXwQpb3b9igOJf80=
X-Received: by 2002:a2e:510a:0:b0:2fb:5ac6:90ef with SMTP id
 38308e7fff4ca-2fcbdf7d71dmr142735901fa.11.1730830234976; Tue, 05 Nov 2024
 10:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20241031101556.1913400-1-alex.kanavin@gmail.com>
 <CAMKF1spGp5xPKbVv85dKoC_E9Vk28C_r0vc3a48z2m+f1HnXjw@mail.gmail.com>
 <CANNYZj8pwm0wgV8Dzz_Z07v=OOnssxEibhtYHTqL8Uvq-jTmRg@mail.gmail.com>
 <CAMKF1srvd=CGhG97bGPWttum4MFd5MtoBf1QQc3e-6ruSEkL3Q@mail.gmail.com>
 <CANNYZj-pJ8rWJY_a=GMkBTeTHBosdSjxmvQ=_1nJFTo+ULGKAw@mail.gmail.com> <CAMKF1soY3+YTpYeFEHRA=CtcfGGEpbiBRQzfebW42RmD9gG0Cw@mail.gmail.com>
In-Reply-To: <CAMKF1soY3+YTpYeFEHRA=CtcfGGEpbiBRQzfebW42RmD9gG0Cw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Nov 2024 19:10:23 +0100
Message-ID: <CANNYZj9toUVNH8012YNNJmzNZgXp7br=S=H0hHDwL1RUE8XFAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206727

On Tue, 5 Nov 2024 at 19:05, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 5, 2024 at 1:37=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
> >
> > There's an issue in tcl 9 recipe (tclsh is incorrectly symlinked to
> > tclsh8), so I'll send another respin. Postgresql was hit by this.
>
> Thats only part of the problem for postgres, they expect the APIs to be r=
eworked
> and tested to work with tcl9.x

We can also disable tcl support in postgresql. I have a hunch it's not
used much, and it's not on us to fix it.

> I think, we have to keep tcl8 version around for both tck and tk,
> these kits are used
> for packages which are stable and not as actively developed and might
> take a while
> for them to start using tcl/tk 9.x. Looking at other distributions
> e.g. freebsd thats what
> they have done too.

That's what my patchset is doing, isn't it? I specifically
re-introduced tcl8 to support expect, which a) has been unmaintained
for years; b) is needed by GNU toolchain testsuite.

Alex

