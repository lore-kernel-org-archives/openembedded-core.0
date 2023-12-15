Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFA9C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:24:45 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.68496.1702661082135126218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K93B3fme;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b9dd6886e2so434890b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 09:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702661081; x=1703265881; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNMV3NG6rKWle0V6hUdAajb1tPTXPYO8/ozF4g1Agk8=;
        b=K93B3fmeVfNL+SMYsQhF6VdL8/dms8/Jjm8u3nfgeaY5MQMLErJrHi2VYrq8Z9GMlD
         e/ZmNSYCteXXYeOUtyoFtt1T9qUqnmVjdSJmyVL+4cPLo7/KMY6qmYsbdTu096mq/n4W
         tzOJqyl3pj94Qk37SUnW7y827frp/nSyg2T9Dp3pW68gbTbX5rL2VVYQitfo3fsKxOvW
         VRKmWiKl/ao6HjBzFJSGLFRVrgboJ0LLwqpI3IVruUp84fF/ovImnVe7jqkruVTg45dz
         ie9JwKV1POHjCdfGUlzBSz49UHRNGfw8o9UOcZCL7lKkUvV28+To8XkDzoqf18yfDARX
         e8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702661081; x=1703265881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNMV3NG6rKWle0V6hUdAajb1tPTXPYO8/ozF4g1Agk8=;
        b=P/YCtxJQavYXHO8zt2+zt7Mo4anOQ2EHgeLBK2e+3G/t8XtFHc/V/ZsZuTie23CHi3
         qaieug8z44USHLqgS7468FJ1VAH/tGX+n9VvanDSpIW1k+/iSfvwyB2ptTVIz05GoTLP
         ivS68ewIhTjydHKoZbIe0Kz5ciHedfxUA7oxfwS+qGCzIZDQbIRdYrlh0Wc4CxpbwN3S
         lxBVSCNhFvgbODV6adL/nEcqSL2eaa5oJ0R9OVFEHb/7+43ziMEMmXgpVuSw6QgpEU95
         Gz0OEqbOyH3VAPVXQu27OOsS2cvs/PmnJd8CoMSJJLdfTwd97wNVbiUUKMUXWCzANV+S
         kthQ==
X-Gm-Message-State: AOJu0YzVhkhxNjIGlRhOlQexlvwzRgPh/TtcTWATDRxl7LGokytj4smM
	CAm3/il/AB7V/7a3bhRt+Zsg2Ajg2It/RtJMsyY=
X-Google-Smtp-Source: AGHT+IGgIqaIutERfwEl1SECnsM37+vXTPuKgdBNl6BNRcC7qoQxBpCX3DeQ7ppxqCLTiCG0rz5ozqsxmq6VyQmR2V8=
X-Received: by 2002:a05:6808:1416:b0:3b9:cf78:5aa0 with SMTP id
 w22-20020a056808141600b003b9cf785aa0mr9740762oiv.38.1702661081388; Fri, 15
 Dec 2023 09:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20231213094113.3981-1-alex.kiernan@gmail.com> <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
 <E29D8825-5868-4FB2-A0ED-B01299BBBF4E@arm.com> <CAO5Uq5TZfbe5HaEuV69T94WC0F6gytTkp-RCpaTKwtO1SoHKrg@mail.gmail.com>
In-Reply-To: <CAO5Uq5TZfbe5HaEuV69T94WC0F6gytTkp-RCpaTKwtO1SoHKrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Dec 2023 09:24:15 -0800
Message-ID: <CAMKF1sqoiM_dTGO2_J7za+OnsCX4F7i=rzUBbnhZQ2rRBFYyKA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192538

On Fri, Dec 15, 2023 at 4:41=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> On Thu, Dec 14, 2023 at 10:28=E2=80=AFAM Ross Burton <Ross.Burton@arm.com=
> wrote:
> >
> > On 13 Dec 2023, at 14:06, Richard Purdie via lists.openembedded.org <ri=
chard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > I've run this with this patch included:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/40=
82
> >
> > Same failure:
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231213-s1=
3b67oz/packages/diff-html/
> >
> > Ross
>
> Thanks both.
>
> It does look like its just filename churn, but I cannot find where
> those names actually get generated :| Suspect this will be a report
> upstream and hope someone helps.
>

I think its the cmdline options passed to compiler-builtins crate. So
looking closely at this crates build log can reveal the problem. If
somewhere we have builds
done in two different folders I can take a look


> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192430): https://lists.openembedded.org/g/openembedde=
d-core/message/192430
> Mute This Topic: https://lists.openembedded.org/mt/103146651/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

