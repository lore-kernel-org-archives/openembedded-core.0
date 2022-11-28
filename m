Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F95C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 10:15:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.114380.1669630519978391182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 02:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xl9Q//Pl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id o5so6956763wrm.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 02:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aFJWsEwbSoda12Mt+FYIVRwYjRCp5c2N9gwp/Xeqaqs=;
        b=Xl9Q//PlhqXL6lmv4/CvKWpK/xIuX6p30IX33+LkuAPmXimAfEsIjIalFcd1/x1o1m
         oDvlpecFwtkyK/jPR0F9miPZ69mPFMWIGN03InzYjSe0iwrba2WpXMcMQt6oYjy/Z+2u
         1NQRRs+W8wvo3RZ5R8m/bOrXcOkE59pLSmgrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFJWsEwbSoda12Mt+FYIVRwYjRCp5c2N9gwp/Xeqaqs=;
        b=OkZl8BXy7dboJJU5HcrFW5Jp8WpjGtnzutZ1J8EC+27eQ/Ls0fBKlveK0wOXICz5le
         3it+ROLWu2JCSaKwZOInCiIKnm5WWxaLrpakuuv9lgJy8s7GFP0SYfRTA5I2dxDjj5bU
         cARAXyXSAAaJLyzvbMvY+hrA14+FQFxMk+2Sl1xuXb+G4YgOLNYtrJf1a9pHWTw5Q5aA
         UBBxTEgBEhyJ7J17RUvEITMh+pWeQrBcOdWeYUr62C1cWtrozMWxgqh6eP2mTKGmrML+
         uKTtN6uRvM4fWOHlHOHec7rX+jsdw617hNaEcSo26pjKsaO9dV1utsbN6niL7rtNTGWc
         ro1A==
X-Gm-Message-State: ANoB5pl1WcucMEzyBAVRzXhTj9UM6hhA3pW7j9fPZ5I9RGZbg/odLLcB
	Pj3H4N1wOJxnI0TYSTNjnExRfw==
X-Google-Smtp-Source: AA0mqf66tXE4Z+w25Ey+zZ62Ekh3XnpdW1QjsJu3MMnroifzp6Ly/9yxgkE/sSC1iy4tKjc3CuyHRg==
X-Received: by 2002:a5d:4b49:0:b0:241:b6d0:cf61 with SMTP id w9-20020a5d4b49000000b00241b6d0cf61mr30629129wrs.195.1669630518110;
        Mon, 28 Nov 2022 02:15:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1da4:7286:b644:a924? ([2001:8b0:aba:5f3c:1da4:7286:b644:a924])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm24105695wmq.36.2022.11.28.02.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:15:17 -0800 (PST)
Message-ID: <663777d20ad38687483dbb193b52f95e84698a4a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] qemu-helper: depend on unfs3 and pseudo
 directly
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 28 Nov 2022 10:15:16 +0000
In-Reply-To: <CANNYZj_pM6M3pBCZDyfcJoq9WbkZSX3bRtHoATeWCNCsUzeWzw@mail.gmail.com>
References: <20221125211558.20985-1-alex@linutronix.de>
	 <458025bf556060dc1e3ef56bafd564d4b998c2fb.camel@linuxfoundation.org>
	 <CANNYZj_pM6M3pBCZDyfcJoq9WbkZSX3bRtHoATeWCNCsUzeWzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173900

On Mon, 2022-11-28 at 10:54 +0100, Alexander Kanavin wrote:
> On Mon, 28 Nov 2022 at 00:58, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > NFS isn't really a dependency of qemu though. The thinking here was
> > that you could boot a real board onto an NFS mount from your local
> > system for development purposes. That is why it was being included as
> > an SDK tool.
> >=20
> > Perhaps we should just add it to qemu helper as well to simplify the
> > runqemu case?
>=20
> I'm fine with that, just want to point out that commit history does
> not have this justification - meta-* additions of nfs server
> dependency specifically talk about qemu only, and sdk packagegroup
> commit [1] does not describe the use case.

Some of our older commits don't have the right information in sadly, it
is something we've had to work on and still don't always get right. I
did think I was likely going to be at fault until I looked! :) That is
partly why I'm adding some context around it.

>  I don't think there's a BSP
> where this way of booting is officially supported and documented.

Maybe not but I have done it myself before, admittedly a long time ago.
The key question is whether it is a useful capability and worth
maintaining. I'd say that yes, in this case it is, particularly if we
can raise the profile of the feature and make sure it continues to work
(which the tests you're enabling help massively with).

Cheers,

Richard



