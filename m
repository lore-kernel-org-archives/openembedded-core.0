Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAF9C4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:08:26 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.834.1699726096227196477
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kWeGS9+v;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1f060e059a3so1880809fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 10:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699726095; x=1700330895; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkkUNoK5AQyMOGI0O24slQkSCalOt6PnDxPzCRTF++U=;
        b=kWeGS9+vcfojdf1eN7V41Mlt9Nl8P7GO5sYEb1x3ILKqF2A5jK7l+3zwMJHmFrVg5q
         8RgIwvgrW8tRBzM1ZmcTDmZ1Fv5mGuD5ocb+bcy5Y3qlsTSgqutEyKlKm1bkZMbaGiQW
         ShjQ6odEhPAhDxyA9UzfMfLb6CO+hOkO3uIKfWJAIXMh3IODPEoZuXABGpLJ05weImvL
         hSZZCmP5QanyZzj4UJbkPETP+eSLgCiPPWzLxXu4+V0VjldLCCidEnQ7X93Y93xGuCAA
         IhzQqpfcK11NF072oV0E0HJgeBPDyA/JdDHTjsIojStEiU9Li0MeAaLwRXyiEook2lKY
         8amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699726095; x=1700330895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkkUNoK5AQyMOGI0O24slQkSCalOt6PnDxPzCRTF++U=;
        b=hp+AWad0xz43xjXvwFEMhO2XKDZAcu6p/salCdV3d8LIXN1O/aAWrRFvWd+k6Vkt9l
         Uk9XBBvmMmveDmh/0DJkWRQO9kSxcaQgc5uaaTDtJccHeNLKhQr3ZEFsTf4YhHJIiU3e
         GagSSXFyUpYAPcRJCuuD42jVmXxzc4MBNfDFWdyNWkGE9qHw9LQrgbj0Bebf5kXh4fN9
         E12xIwJYlNPfXASejQGZMI87uohY/Ejtd6AH0yUxv4DxjdP8DLWYBnL77ail4D0yU0qm
         URcb1vhztWDvEj/6+kS7qrteRUex1lqyR/s0kGHezTfGI9beEowJGwEQUQBEZOg5lSBr
         M4VA==
X-Gm-Message-State: AOJu0YzNWltTpuOvF+gHVeXMsy5EWLDlyDFK+RkJTNzR4r1lBgP3nM6n
	R1gpu6WX8G+DXXXQ6RryNy5GYSO1NDdK7uPYc/Y=
X-Google-Smtp-Source: AGHT+IE8uKBBo4sLnXaKuhuBylXBp2I3QXsDALh+Hqzy21SZ0VFI4FK49cz363TnudoaLjFn+k9XgUwc8VuSHOczT1I=
X-Received: by 2002:a05:6871:a413:b0:1b7:4521:14b6 with SMTP id
 vz19-20020a056871a41300b001b7452114b6mr3476556oab.5.1699726095415; Sat, 11
 Nov 2023 10:08:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699714834.git.steve@sakoman.com> <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
 <98dcc905adef3d2d828af60abdaa40291abd458d.camel@linuxfoundation.org>
In-Reply-To: <98dcc905adef3d2d828af60abdaa40291abd458d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2023 10:07:49 -0800
Message-ID: <CAMKF1sqRD+yX+gFHSPhmrdY2nBHpLh24YYHv6HusfkSS5tmT5w@mail.gmail.com>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 18:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190435

On Sat, Nov 11, 2023 at 9:36=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > We are seeing reproducibility issues where gcc-cross sometimes defaults
> > to gnu11 and other times to gnu17.
>
> Why is gcc-cross doing that? It is supposed to be deterministic so we
> really need to get to the bottom of this :/.

I think the previous patch to enforce OE cflags is exposing this
problem. Now, it could be a
bug in how gcc is invoked or in gcc itself,  but there is one file
that shows up these c11 tags
in debug info segments.

>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190434): https://lists.openembedded.org/g/openembedde=
d-core/message/190434
> Mute This Topic: https://lists.openembedded.org/mt/102526884/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

