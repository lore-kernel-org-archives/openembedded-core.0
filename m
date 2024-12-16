Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA8EE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 16:58:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.61467.1734368327541538512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 08:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aa/hDUr1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so2359221f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 08:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734368326; x=1734973126; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zSqIl3Kkt+1VM8PqEW7QIN4cjQAuKSJiwGoAe6Tjf2E=;
        b=aa/hDUr1hpMNFm42v4F0pJY1giX/thWDXf78H39SWFq85kkW2bXTeojMgnHT7EcDrv
         nddgY3wK/iyCzsMdz0LoWpmsqu5aYJ9c+4Vk3eHLj7WBZ20xtBuWYYwZUHOamiRXxMQd
         tIsvq73Bm4YaEvxXTqdL3AY1S21j4ihgj5LFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368326; x=1734973126;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zSqIl3Kkt+1VM8PqEW7QIN4cjQAuKSJiwGoAe6Tjf2E=;
        b=ilDCJYxkc+SHCFj7pEhDth8YekNKxJeg0xNXt2fGKj/0JHgn8Lv40dkuVGghUqesTf
         qXvDm6n/qDvitk/+O54S1MaQeUqrK8Hw9WpKmt40UCpfw/4b4gfD482qNHIW+MrIO231
         5SCSCwHIr/stxvH2bexe90fli/eLfW/ogcJ2ByZAavRbZoml8oz+Oy68P4+ni2G3iPKC
         nzaeBdc2bhBefZpijFjAz6QyJey2+73Fjrgg3lACm6y/KKJm/fsvbzc2vN9uIW4y/js9
         ra+79zEehTFlZr97RgTpXAg91iyoaoPRyDcieGmTkRC5nB9/S7yWr+TXPH2QSGh1ks9I
         cGsA==
X-Gm-Message-State: AOJu0YxhbWe2ePQppMRvVkQu1nwNHwUBceSCnl9mbD2ADgoweumKKgRs
	/yMDE9bKjX7kRTzJf1aAMm2BJHPf0BmOjVQBtfEJHNxMIvCB+wFaTqeG/e2AETg=
X-Gm-Gg: ASbGncsFw/PyPgv/kqEKGMVMkxHXi7KUj84rN13Oyan9pUuuanX74HFCVsOH4zWoN+M
	HDvIIllUQKc/9Y4iYIHy9eeoeiUGWmG90WXEMOAfT1+FndvMnnlU7hlkvA4qqF74Ql7yednj/Ms
	9UVLrUasNdZRlG14dQ6tGmsUYGWkng1WCpvy7lVdpkfWKZjdlN4FVTBj+Am3N6L+8F6llyikpzW
	q2CebV63+ZJcKjKf85VoRSLyoTUnBQ776uiQyE1HfY2VTsC8CQnW6qIx1ZruT2bwLWTdWgA8sRu
	E9AWyopNa9pZPVloXJkUwlYmxpdcumwA62DQRmQFwuxk+g==
X-Google-Smtp-Source: AGHT+IH+V0HwAwHMoYiSLkUYIOtZicGRN0kyBv1meAdfzPexnur9sMp81UDTtSKilAHzgs3oQUFHgg==
X-Received: by 2002:a5d:59a3:0:b0:385:fb56:fb73 with SMTP id ffacd0b85a97d-388da3942c1mr247703f8f.15.1734368325853;
        Mon, 16 Dec 2024 08:58:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7? ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060566sm8553419f8f.102.2024.12.16.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:58:45 -0800 (PST)
Message-ID: <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 16 Dec 2024 16:58:44 +0000
In-Reply-To: <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
	 <20241118162643.1423409-3-alex.kanavin@gmail.com>
	 <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
	 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
	 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
	 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 16:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208780

On Wed, 2024-12-11 at 12:24 +0100, Alexander Kanavin wrote:
> On Tue, 10 Dec 2024 at 16:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > > If we start going down this path, we might as well write an
> > > interactive curses UI, and keep the command line output 'flat'
> > > like it
> > > is now. I'm also not sure what is the best approach, we'd need to
> > > take
> > > fragments into practical use and accumulate a sizable amount of
> > > them
> > > perhaps. Such things can be easily tweaked from experience.
> >=20
> > Having experimented with curses UIs, they're a pain and don't
> > really do
> > what you hope/think they would.
>=20
> We might be thinking of different things: my suggestion is that
> interactive 'kernel menuconfig' type UI is worth exploring for
> fragments (or bitbake-setup, for that matter).

We were talking about different things. I agree, I think something
kconfig like for some of this would be much appreciated by some users.

Cheers,

Richard

