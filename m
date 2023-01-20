Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AACCC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 23:00:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.89983.1674255641269793440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 15:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I0biggbU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o17-20020a05600c511100b003db021ef437so4712046wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 15:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rFINlzyQK5rhpzKR4WtuAb/h0YMNP/x5QSKzQHj7ePU=;
        b=I0biggbU4GrTIkwv9BitKfHiCck5gUJO5DKKEYjXH1U6pTxgLbeiFM1KGq1XxSiyVg
         KNmd1G7wncpVqvW+UcBcGuvtsL7FqbA/x2ZWnIO7Fz3WVjM0WSn0YPOZpqkrMFXt1Bg7
         a/BbDUMTNk0nj9bGy1z+ovO0y7qnANgkCjJ8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFINlzyQK5rhpzKR4WtuAb/h0YMNP/x5QSKzQHj7ePU=;
        b=aPl6w7Z5AP6QN0NUxHHuyaHh8qLvxcni1eMrCKon5m+BmsKFcKEOGT2yNBvPbonAe8
         tRkNYewnHU6SMszeozy2s3GPlAeA2UOn16iEl008rLXqvbJfrA/dEam9uCd9qigowoXl
         GNkIwadcejSjYirMtDZG1pq8i6kfXClDXQFudcRrq3ZC8YCSs18ejWXjIWqAoNMWHwz6
         qHob5buKx4n4NkfYVUm/Nq3PJ60Z2F5renFZFga2QfucRrQuLNzLSlExs5lriVyXQkFS
         ZBqXKmP2L07MCkZpB+c7Vnos4QvkvOKFF/pNR8DDlS5DmFlCDWad/QjMC3dpQhYT/dMf
         ePJA==
X-Gm-Message-State: AFqh2krtbbCBjRAy66ZxvAwrEqNimWQINddNKCTnhhVtMvhSPCtvo8UY
	dY6Z52V27XUGWP5kYkOqPUoORA==
X-Google-Smtp-Source: AMrXdXvewM8qS+Bd8VmR6S0d2dFu7WbCjKw/ZXdnTNeNgY9D6PmTTKrsn1QzeBWU9tLmy/ytmeqc/g==
X-Received: by 2002:a05:600c:444b:b0:3da:fd06:a6f1 with SMTP id v11-20020a05600c444b00b003dafd06a6f1mr15414940wmn.31.1674255639156;
        Fri, 20 Jan 2023 15:00:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:830f:88df:e0:3ddd? ([2001:8b0:aba:5f3c:830f:88df:e0:3ddd])
        by smtp.gmail.com with ESMTPSA id f22-20020a1cc916000000b003cfa81e2eb4sm3456731wmb.38.2023.01.20.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 15:00:38 -0800 (PST)
Message-ID: <3b311ccc982ae39cc72c428ddc97386fe8d653e7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jan 2023 23:00:37 +0000
In-Reply-To: <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230119102423.3493565d@booty>
	 <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
	 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
	 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
	 <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
	 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
	 <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
	 <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 23:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176252

On Fri, 2023-01-20 at 20:38 +0100, Alexander Kanavin wrote:
> On Fri, 20 Jan 2023 at 20:29, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> > Because I'm simply not going to insist on it in all the patches. I
> > need all the contributions I can get, and I'm not going to
> > pedantically insist on that.
> >=20
> > meta-virt is not oe-core, I do the lifting. Therefore, if bitbake
> > errors, I have to fix it.
>=20
> But you do not need to insist on the needed metadata or fix it after
> the fact. Bitbake will do the insisting for you, when contributors
> test the change locally *before* they send it to you. If bitbake
> errors on your side, this means they never built their contribution,
> and you should raise a concern for that reason, and not for the
> missing metadata.

It isn't that simple since this is a configurable QA warning, all it
takes is one layer/distro to disable it and it is disabled for all
layers that user works on.

This is why "core" is a separate config to "noncore" but we can't have
a config for every layer and even if we did, people would still turn it
off.

If it is turned off, it means people send patches and Bruce has to fix
them, or ask them to resubmit which is extra overhead to the
maintainer.

I've been thinking about this and if I do make it the default, it will
mean warnings show up on other CI systems and layer maintainers will
get patches or complaints about the warnings. I'm not sure I really
want to get into this.

I do think it is something the project should be doing but I don't want
to burn out our existing maintainers. Since there isn't wide community
buy in, I suspect I should just drop the idea.

Cheers,

Richard



