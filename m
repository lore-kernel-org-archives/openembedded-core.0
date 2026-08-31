Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0933C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:24:27 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7176.1788211458146222130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 14:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DCot9ERb;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9371bcf1f8fso279556085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211457; x=1788816257; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bNvLFASgmxAfkEVGG/1+LFK/EyjMKl9PuTSBA8Nl+M=;
        b=DCot9ERb6/asFnv6z+gaL0Jh5MeorVNlnbQ+sNecSD06dFMRTlPvI75+aCZmVUDttK
         87uI1PqaTNFOWSjK1fEsLUAK5G8fPThY6xBi+PFeYdL8tf/k1tcA0HaOg1LqKPHRMRLI
         4GuNepMlQYWNpfD91epCZZzMAWwqITENoZueTwkmlibYB6XrGiNr+D2xxJ/H9o3H2lyx
         v91PAzrBrNPZIIuKQ2rWwWpA32N4oud+a/OcoN7zkMBDBeDJx5hDz5QBbMP6fxfdMEny
         37LZq7u1OaKTVW8vTEGPhTEsKRhJMTVC5ivDx6zU5IyhO7y1Vm49Z5bo9dAuJkipT1bQ
         p75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211457; x=1788816257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8bNvLFASgmxAfkEVGG/1+LFK/EyjMKl9PuTSBA8Nl+M=;
        b=dHa5ivnzMIgHZyCEbaCJrOEFpj2IgnSou75ck5G0qRYZn5JUtgR+PcRxA3IczC7JZ/
         wu58g3SR5YZ3+mP2VGirSn+/R/CZA3+3PUFYETlyYP/kTnoPnxXH6h2EBYfPF1YG2Jbg
         Lxj1dYLN1J+MUL6UPtUN6p5p3mCBeQB1IFQ9xdBvvQOKr5UhTzLpA1xdiA8a1Vkf8Lbe
         agkVY/kQYccodDKn9zbrqdsw3nHwl4tlbh8j7LbTd/rShQpo2kale7aLGOCKuxkLNG0r
         FzPZakmzMIM9jZ/oQQw9PbCBud4yw1kEQVfI3JZ82HF3FOXrjiQUt4exqQvewb7WxzGx
         sbfg==
X-Gm-Message-State: AFuF++lSDdgs9wqGSSY+0LAmqOz6efM++2dsQUQrixmRKI4gfF1XB2M9
	fi4Z8Oqxb+l30c00xcNITxKTjTXdHlKMnuYUHbkdiPVTtsDUNKwOn/qR
X-Gm-Gg: AR+sD13H6dYgXJFAf5oqDeoGjvz0HjQAH99GgH92c8cFEBFNDKMA30Vp8dIlllNb2ui
	U0/b0qe28jn4hwCAMNDVYqbIRkrl159PjqqJRFXecKJ0J5Mq/d8h7CI884SczoBVsRDbdOJ6N+q
	vgL33ZArWrhKgwro5AKzFhjgh6zSWi6mE6ZDQ/PXS/hIPbYUpUeEGpwUaVx+URDnkjZUzPo/TyR
	jtMRD05cjuVXgOFaOYIvZRlD9mGXOlHCOfmj65Ea5cUnZFc6Sy23Lf+DxM3AUcFeXbTx+9ZRU37
	ZTwP4Cd9juHbxHQbCRguzRHEplwe/xSbEz/B0oRAMpK5Mf0wpAsh72ERLwOx425OD6yzV+FxF7A
	VV/dGT+CnnDnURigLid6W+XLrjYAAyZ3r85i3Nnb/rDNQyMxM/P+hFvkMjxzh62CEYKDrDZ+iCG
	lZ/NBtVH0gN+95LjL9P4IFNaZjxTDBNjnwEIdkxiaCcAJgysZecJkfuRtTOow7iuQSxwKQBlcfW
	2zvclgBzMWpcahHeiB5kXcNDKldzvy7aS72JLQl
X-Received: by 2002:a05:620a:284e:b0:914:e3dd:17ea with SMTP id af79cd13be357-939137986f2mr3517595785a.12.1788211457030;
        Mon, 31 Aug 2026 14:24:17 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740a307sm544003885a.42.2026.08.31.14.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:24:15 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:24:13 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] oeqa/sdk: run the SDK's own copy of a host
 tool
Message-ID: <apXw_Qomr1X6fpeH@localhost.localdomain>
References: <20260830183616.4026354-1-twoerner@gmail.com>
 <65375fb1c8ad8758f22fdbac330577bf8cda81fb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65375fb1c8ad8758f22fdbac330577bf8cda81fb.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244778

On Mon 2026-08-31 @ 08:44:50 PM, Richard Purdie wrote:
> On Sun, 2026-08-30 at 14:36 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > ensure_host_package() decides whether a test can run by looking for a
> > package name in the SDK's host manifest, which establishes neither that
> > the package is present nor that the command the test runs is the SDK's
> > own. On an extensible SDK the manifest lists what the shipped sstate
> > could provide, so a case can pass the check and then run a command that
> > is not there, or one belonging to the build host.
> > 
> > Ask the SDK for the command instead. An eSDK ships sstate for more than
> > it installs, so when the command is missing devtool installs the recipe
> > and the lookup runs again. A command that resolves outside the SDK now
> > fails rather than reporting a result about the build host.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/lib/oeqa/sdk/case.py | 96 ++++++++++++++++++++++++++++-----------
> >  1 file changed, 69 insertions(+), 27 deletions(-)
> 
> I'll be honest, this feels/looks wrong. In order to say why, I need to
> spend a lot of time looking into the problem more, trying to work out
> the right way to solve it and so on.
> 
> If I keep doing this, people will just keep feeding me patches like
> this and expecting me to give that level of feedback which I simply
> can't do, it isn't easy.
> 
> So no, this isn't right and no, I don't feel it appropriate to merge
> it, sorry.

Understood, thank you for the feedback.

> Cheers,
> 
> Richard

