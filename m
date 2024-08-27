Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A5BC54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 19:51:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.6120.1724788289851198338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 12:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZW3Q0Hl6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42ab99fb45dso65445025e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724788288; x=1725393088; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mlr8YlNlKtkxL1JM/zEcxZ1P3Tgf/YLLy+9eUoCeXn4=;
        b=ZW3Q0Hl6xCXoDbSRFD/jT4gMhVSXqALzB/74FC/XGtFfOWyeXUp0iwNEqXwp7GwuBh
         e/qcUgX/sgeodWiAwQsiw5sHXktRGn0wgqXSt5oKoFL63dK4Qe0R7xE8pTXULn/uyZ2V
         FN3IS8PgJEul/B03xc3mcD0VjkYm5dh7G+9B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724788288; x=1725393088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mlr8YlNlKtkxL1JM/zEcxZ1P3Tgf/YLLy+9eUoCeXn4=;
        b=lf/OcAAdbiBuO2KLtXFjagNZxAfCqvJtF+yFbW3W0G8VXMQtrrNHjvQcTujCbqBxqB
         afqUOMB5o6N6SVKk0ZjwR/Tlai048Kk4gdRX6Aea6p2u6/QQD2i9uBEW+MAkjA4YiRE7
         Im5d7jjA4OTRDmFyefkShZtJkVWNjUk7Ye+7R/L3+c3tHfkSsY3FojwGiF8GjmPZbQ+Q
         WhIxhSdGY08hs1U2Okd6PajIFycUpGeFhYM9j5kXPVANrXKcqWKk9p8rRMdC7nf73FKB
         HwYVIcj0jOHrdNiJGXS6MBHkiUcIMVgNKWS0RFOvH3fVH5NldLEQ/ji5lfkFGY5s6OZs
         PJBg==
X-Forwarded-Encrypted: i=1; AJvYcCUg+29PYS4WVhPAD8RhPN9N2v9xDLsiYxGPTEJpmey660fo9VmviGtOsOZ9YRni5DONan5+MDvLPczWGuwlVVwpnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+sL/l4AAD2pL1L4jRAXuh9F/fy7RAgdPQDf3vYVKW/8sO9IDL
	gEorS+fEEIm3DxLZQLpuSwobYYjQPxWqKb0DVkAnc+dbSi3NOEMr98vqRnyk260=
X-Google-Smtp-Source: AGHT+IGCylGyVhuh9RkMOwJvFhvsR0XEqAxZaKnKbfBqTyBvcMnrqELcJdIO9REvGf5YcReZVpzgqg==
X-Received: by 2002:a05:600c:1f95:b0:426:6fd2:e14b with SMTP id 5b1f17b1804b1-42acd55e903mr110993665e9.11.1724788288085;
        Tue, 27 Aug 2024 12:51:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2440:b6ac:ba90:6483? ([2001:8b0:aba:5f3c:2440:b6ac:ba90:6483])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b8b9sm231408325e9.9.2024.08.27.12.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:51:27 -0700 (PDT)
Message-ID: <a16d7b2506544ee5ac1df57e98bd160126dcb4b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
 Sundeep.Kokkonda@windriver.com
Date: Tue, 27 Aug 2024 20:51:26 +0100
In-Reply-To: <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
	 <20240825170553.566798-2-Yash.Shinde@windriver.com>
	 <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
	 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
	 <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
	 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
	 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com>
	 <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
	 <17EFA275ACF95534.20373@lists.openembedded.org>
	 <17EFA28FD32C2C48.20373@lists.openembedded.org>
	 <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 19:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203859

On Tue, 2024-08-27 at 19:16 +0200, Alexander Kanavin wrote:
> On Tue, 27 Aug 2024 at 18:25, Alexander Kanavin via
> lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >=20
> > On Tue, 27 Aug 2024 at 18:23, Alexander Kanavin via
> > lists.openembedded.org
> > <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > > I just reproduced this on autobuilder's alma9 in a private build
> > > without sstate. I don't have any immediate ideas on where to
> > > start
> > > looking into it, but I left the build in place, so if any of you
> > > can
> > > suggest experiments or things to look at, I'd be glad to help.
> >=20
> > Oh, and I immediately got an idea after hitting 'send' :)
> >=20
> > [akanavin@alma9-ty-2 build]$ gcc --version
> > gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3)
> >=20
> > I'm going to try again, with buildtools-tarball. It may be that red
> > hat compiler is 'too old' anymore for rust.
>=20
> ... and this worked. So the easiest way out is to update alma9 config
> to use buildtools.

Shouldn't rust complain if it doesn't work with old compilers? Are the
compiler requirements for rust documented anywhere? I'm reluctant to
throw buildtools at anything that breaks. In theory we also would need
to change the sanity.bbclass compiler versions tests and so on too :/

Cheers,

Richard

