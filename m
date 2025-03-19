Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89ADC35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:30:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9144.1742394619038132331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FEYuxEro;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so31172265e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742394617; x=1742999417; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x3RBwnHeTwvdyW4RpIiDKXb39Ivp2LZkCYy5HNwihFQ=;
        b=FEYuxEroSUd+O7PqopaRqWaHxEiAoBy87K0ViwKXpztjEQLbhgpRnLto3eNKvYies4
         h0+6wjApGryYMFo8dPrt7UCFoKydiEgIgRFd70OkfjQb/dIojYA1a9I17+Zfmic/TfuY
         MsOK0SB2PZyk9LIQjP/nFseeiy9qLXnucByqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742394617; x=1742999417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3RBwnHeTwvdyW4RpIiDKXb39Ivp2LZkCYy5HNwihFQ=;
        b=CYkOMQUriQFMLcTI0GJkQf4p1lGSGwPj8PEHw2GpTU+aalLHAlfPAzhsc87tDdncet
         gzXC88VvEIzaVXo0aY9mXNaE5d/0iGCany0qLRXiuS343ygC+5dPRv7BjsTDQZ7lx3+x
         HikHv4F4nTanD3tc9J+WCo+SJBaeTZQ23qRSchfUIWqoPQjMBK9WZW2iUELv1fLIsGcK
         dRv6xqkJo3ZzJ/bMWpfEnmbOCkqtnaM2gcV4Zga71L+0yMXyteo7Vq3Mpywau5Uq0iIF
         medY3cloE8AOFfd6jIgx04Ow8Wgd6HZN5aAwwL/sr1EqDKzLoFMLR+zIzNZudcHBMpph
         Zv0Q==
X-Gm-Message-State: AOJu0Yzi0UKxMWxmrYHnpfKiV/cg65z6gpQlyde9OLj4qIUZOZI3ojG4
	XlZSMw4HdgbnpK3pzRixlDOUfTunq68kNiFan/ksxMMPFy9piLsILvgsJjvPR4Q=
X-Gm-Gg: ASbGncu3AFttmbuJkaj2rhTIhTnIjjyAbXF1EsF95nMTvE+MqR5kc8VEYphESjpWeyI
	plOZBSjd3zkb25jRgT5+gNxvQ5lWYxL+hGb75lfKqvFJkCy/+CLq8o++Zkyajug6T42jECfBRx3
	772USfOy4UaNxeDfTXlonZcS762FdOrOHc+kYygzO9CZpueEvChFSbJXhLXLy5Gh3vbvZcLvLMV
	GvuedFPAfDcM2hJLntUptfXQrkWewd9YZ4vFBwbd1NPW/wSrwQPj8Qv6eaabXpPXrMZDaXajYU9
	ZuzZdvji0ARrUg/mXrx+RdPB96CpfOfJS8X9fJywqWjAVsh88LzUo4SBh/eUglTiSq29xaOWNrT
	W3At1jiDEykZ0QFrigdaUP5JISG1VRI8=
X-Google-Smtp-Source: AGHT+IFjMPHJVZvnyrnKCzd5KiDuSeWOzx3DDU/fYOMxj/79hd8J8oOXWtp/DWVh4Uqm/a0VoLRtYA==
X-Received: by 2002:a5d:5e0c:0:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-39973b0287emr3064317f8f.39.1742394617247;
        Wed, 19 Mar 2025 07:30:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39972df9b9esm2527195f8f.18.2025.03.19.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:30:16 -0700 (PDT)
Message-ID: <271d41d9097964481005f6b26ec301beb1bb945e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] mesa: correct download location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 19 Mar 2025 14:30:15 +0000
In-Reply-To: <CANNYZj9E9-w-S+ELyuvutKoAQzy7gst=vJ9pmweORVE+v9c3Yg@mail.gmail.com>
References: <20250319100959.4102512-1-alex.kanavin@gmail.com>
	 <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
	 <CANNYZj_9RmwiA4=PDE1BR-njjX0y0FrCto8H9DTSROJwUjpZCA@mail.gmail.com>
	 <d5992c2c2013bf7ff5ce2d76b1b223f020764d03.camel@linuxfoundation.org>
	 <182E2DB6117AAA9A.9767@lists.openembedded.org>
	 <CANNYZj9E9-w-S+ELyuvutKoAQzy7gst=vJ9pmweORVE+v9c3Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213340

On Wed, 2025-03-19 at 15:04 +0100, Alexander Kanavin wrote:
> On Wed, 19 Mar 2025 at 11:32, Alexander Kanavin via
> lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > > I think we may need to wait for the dust to settle on the
> > > freedesktop.org changes before we update urls...
> >=20
> > The new location is officially documented though:
> > https://docs.mesa3d.org/download.html
>=20
> And the new location was documented already two years ago:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/67b77d8adeb1132ff99b68f=
8719f8de341e38ee2
>=20
> Existing freedesktop link has been a redirect to the new location,
> and that link has now vanished.

Fair enough, thanks!

Cheers,

Richard

