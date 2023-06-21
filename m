Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E1EEB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 17:13:23 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.4506.1687367601953249310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 10:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hAyEIpAn;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so5149926e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687367600; x=1689959600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrS55U15JhoOQNoVL8h8nfUY6X9/frYyP9nZYmjd8dc=;
        b=hAyEIpAnyiMj26GWE2xWBeBs8AU6LFMpzWLygHDTbLVgp8mMqG1PxJgkO55Lna4+IA
         vtxZBof+8SeBWQPOvgvxqnHY3vcdkan0OjqHfojUxUEpEXCI/no6et59L5sNcprL6Azt
         P8QsE48YJXFqSl4TmrfB+4+p9X1in16hrklJx1tTMfpFdOm8tcrw+1pfAX+iRtJqI6mO
         I6Mu4TYeZBomACfXFfn4LFwnyIKw+z4za36FHzm+PcL8+Npci4kucaet0G3RAi+NxX6Q
         pV73oknZ3asBkrd9wix1/lViPifF9jl31xCLx6y8ATTolFjP+Rs4Dulh46/0g5bf7c8Q
         j+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687367600; x=1689959600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrS55U15JhoOQNoVL8h8nfUY6X9/frYyP9nZYmjd8dc=;
        b=XbL1xpxCR1kxA9qvWxs35cRuDbtaWK8LeMkbfi850gZXQT19Vyh34VsguL5TlckSYM
         4pm3ojTCtI6OF9XgAWU15xYwl4XPGfjnFNtBIAqobHSAGWnQwzePc0M0nhtKISe+fJIb
         DD3uPvUAydvKnIWioFK+/pqsqFnH+0FNBGc9PeV5O7WIV6NRGSKAsE6GFP4RadBJZ9tc
         tjLywtLKkQilou/cgFO2O17igEcBVsAXHUTUg8U/1Beb4ltIGPmVYVt5G1bsgRWtG2ts
         n4Kw1OKjR9DLf0+Z6x1cQ/crS5+I0DVBZQOCzen/Sls5N2v7k9Zq+q7HzPEM3r7+9HMP
         nguQ==
X-Gm-Message-State: AC+VfDyFcHcFO6LO6RE7Z94QAcv7L+OIyr+NmwtVY6V456rw+u4APyb+
	dhALcM/0qglfXcaNB2RldRp5c+PEEkxvp+5g+aI=
X-Google-Smtp-Source: ACHHUZ4UdPNkXQH4oCFh9E21uhPZkXZ1TXZJgz9BagjXMsWJEF8JQ7F+5yOAwFWF5cq2gYgbCMnhdchJjTDqmyG69nI=
X-Received: by 2002:ac2:5b4d:0:b0:4f9:59da:b1e4 with SMTP id
 i13-20020ac25b4d000000b004f959dab1e4mr1817635lfp.36.1687367599845; Wed, 21
 Jun 2023 10:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com> <CAMKF1srpvsvaQGZrnUhNi-=1R5SLtWxVq5cxirCjPJCOaxmZjQ@mail.gmail.com>
 <7f54a675-add4-54a8-1b22-227841244e17@ni.com> <CAMKF1sr6hzNfFPd1trrx6kAeRf+Eqh2BTjCd-itCcXo++W30zA@mail.gmail.com>
In-Reply-To: <CAMKF1sr6hzNfFPd1trrx6kAeRf+Eqh2BTjCd-itCcXo++W30zA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 Jun 2023 19:13:08 +0200
Message-ID: <CANNYZj93VVfmsAMgHvytGTkXwKvGzBMWLh+USVcreXJjWyOkhA@mail.gmail.com>
Subject: Re: [OE-core] Building SDK from Feeds
To: Khem Raj <raj.khem@gmail.com>
Cc: Charlie Johnston <charlie.johnston@ni.com>, openembedded-core@lists.openembedded.org, 
	alex.stewart@ni.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 17:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183196

Just to note, there's now an additional option of setting up an SDK
environment from sstate cache using bitbake, added about a year ago.
No need to build and distributed gigantic shell archives, or maintain
package feeds.

Alex

On Wed, 21 Jun 2023 at 19:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jun 21, 2023 at 9:58=E2=80=AFAM Charlie Johnston
> <charlie.johnston@ni.com> wrote:
> >
> > On 6/21/23 11:52, Khem Raj wrote:
> > > On Wed, Jun 21, 2023 at 9:47=E2=80=AFAM Charlie Johnston
> > > <charlie.johnston@ni.com> wrote:
> > >>
> > >> Hello,
> > >>
> > >> I'm trying to build an SDK (or even just meta-toolchain) from feeds.=
 For context, there are some dev packages in our feeds that aren't in our O=
penEmbedded build that I'd like to include in the SDK. The normal process I=
 use for building an image from feeds is to build the packages from OE loca=
lly, build a package index, and then build the image using those feeds and =
our internal feed server.
> > >
> > > How do you do that? do you have a customized image builder ?
> >
> > We use BUILD_IMAGES_FROM_FEEDS and IPK_FEED_URIS.
>
> Do you have some documentation on how you do it ?
>
> I see. I think you need nativesdk packages in feeds as well to start
> with. It will also need
> dev and staticdev packages
>
> >
> > >
> > >  I'm having trouble figuring out all the architectures and packages
> > > that need built to do the same for the SDK.
> > >>
> > >> Trial and error got me to a few of the dummysdk architectures and pa=
ckages, but is there any documentation on the required packages to build th=
e SDK that I would need to include in a feed? Has anyone tried to do this b=
efore?
> > >>
> > >> Thanks,
> > >> Charlie Johnston
> > >> e. charlie.johnston@ni.com
> > >>
> > >>
> > >>
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183195): https://lists.openembedded.org/g/openembedde=
d-core/message/183195
> Mute This Topic: https://lists.openembedded.org/mt/99680369/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

