Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943C1C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:16:54 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.8.1667927813967802081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 09:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=hUYy2qMX;
 spf=pass (domain: google.com, ip: 209.85.219.48, mailfrom: wltu@google.com)
Received: by mail-qv1-f48.google.com with SMTP id x15so10683617qvp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pqIr8v5ntwJN+JWuA2T8bjBCvAKb5wEZ6ldLv7gDddM=;
        b=hUYy2qMXH/PXcvWFSxwN5Tc4UK7Ts9rf2XazNPGQXTwNHDLiwkoWyuPs3NDE6YIFxd
         TCdg7NNgGa/KCeBvhxLhNNh7LheByswzVDKIS8gC3G6Mt0TH7tnMVvCalKZxE7eVq7nM
         6ja8fmUwj9maQame8xGucwuJzAoG6op9sj+8V4lDK0Zs6hmxg2XMKAjrqHj2Czqv0U1P
         Wm+SVGggOecilhjthnd0DHx0DLlYepA+pbvsQ4G1AMPZacEcF68KyjwKVVR8HTdCNpma
         Cw/8h2ifkftUjFHv5OpmSYMEevF82/7h//gMtLc7TJvVp9IgGof7n5HEhpJejXxokfWx
         cZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqIr8v5ntwJN+JWuA2T8bjBCvAKb5wEZ6ldLv7gDddM=;
        b=KrSZUabIHHVv0txdIcZWcLNx7r1Gl4JTG0bQChrA4zKaNirQO96QgFnP2D+LFgmEOq
         IssFxCfxtwSsm3GBFPMglEcYKFcyYEd/pHp2hLbFP4OvtiaKlYL1If76FwmuijoPXvwc
         i48IL0pLtsOZ7GUwqr/rGNQed6/S2UM5N+mopHLmFQAofu8/mwjhRKWkvaE0MlnJG+59
         hH4EVRbyTw80COOO8MafQkb0I4cZC7cCnnThuKL0NA4CV7WTZHF0j/uPOYfQRu04/+Hy
         YxiSR4zPJL55vGfIu1asU+QWHsk5QT6pLqNrA/PXiYJtmUH5r96vHdAS1sMOjl/LnG2O
         BSlw==
X-Gm-Message-State: ACrzQf2lFJTS0M8FomhDUrMZiWLIS540Rat/q0MXcgxakiXcheF20b81
	3YI6l/9HLu+fC7QLA//st8jHGuiV+Tl7pCd9Rvdw9w==
X-Google-Smtp-Source: AMsMyM6dDYHFnpzUbAgfSbo/E3qyqTuvIyGUjd8dvX+qEY9uDtWl6SFnu4OZY1FvDtzPUe9JuLfbZSq6/lTb3TPIO7U=
X-Received: by 2002:a05:6214:20e6:b0:4bc:26a6:b6b7 with SMTP id
 6-20020a05621420e600b004bc26a6b6b7mr31181570qvk.79.1667927813002; Tue, 08 Nov
 2022 09:16:53 -0800 (PST)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
 <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com> <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
 <CABC0sH3LFm48+buev6gFFAAoDT2SLqR-r-rndSjx+eU54H5=1w@mail.gmail.com>
 <17210CE2C7C78501.808@lists.openembedded.org> <17211049B04D4148.10479@lists.openembedded.org>
 <172331B40D5EBCA0.9941@lists.openembedded.org> <CAHwn2XmaTHGGUZXn9bC=SBj51zL6eo6rhWPR4SPP_UN0js9-8g@mail.gmail.com>
 <CANNYZj8o_GjiqwADQQp5KM_mnQTi+mw6nVh2E1GWVsfi9o3ZKg@mail.gmail.com>
 <CAHwn2Xmaqn+OAPJ-PH2eYr+w8J1OWkDVMQLgkZ3V7ughLYY9oA@mail.gmail.com> <CANNYZj-AEZ0LheXd2ZLfC4Q=V+iq=T-Lvhutwe5_kt_SaHiHZg@mail.gmail.com>
In-Reply-To: <CANNYZj-AEZ0LheXd2ZLfC4Q=V+iq=T-Lvhutwe5_kt_SaHiHZg@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 8 Nov 2022 09:16:42 -0800
Message-ID: <CAHwn2Xn+n5ArRRH3u=x+wA+y+AaEyBOZd1JQB45FQH6rme02wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tristan Lelong <tlelong@google.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 17:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172984

I think they are fine with the hack here. oops. Ok, I'll work with
them to get the fix without this change.

Thanks for the feedback.

Willy Tu


On Tue, Nov 8, 2022 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 8 Nov 2022 at 18:08, Willy Tu <wltu@google.com> wrote:
> >
> > Thanks Alexander for the feedback,
> >
> > We had some discussion internally with one of the OpenSSH maintainers
> > and they are fine with it. I'll try to see if there is a public forum
> > where we can share the discussion.
>
> If they are fine with it, then you need to submit a patch to openssh
> that installs the needed pieces (perhaps subject to a configure
> switch), get it accepted, and then add a backport to oe-core, in that
> order. No do_install_append hacks please.
>
> Alex

