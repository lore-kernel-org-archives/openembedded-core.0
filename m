Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF00EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 08:46:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.8315.1690879615396455831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 01:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bE3NAYzX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3178dd771ceso3923754f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690879614; x=1691484414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WwD9GBXNArCxOnoIEYFIsyl4+G1FzJu6/sXrW9ngffg=;
        b=bE3NAYzXQ+E61DXC+eIYbw0sqbjzHg+Yf9P3hml5zDXnbX1umXo0TS34mcpxYpwxeL
         p1j+j/WwQ1n+C2iS8SYZ6jqrl2tch24WjsqPD2wJRT2s53zhgTIuAkNU2AZbni8lmQt2
         gTmaXB7szwsGzaPKGvnCp7cEy6lbJd7ynt9m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690879614; x=1691484414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwD9GBXNArCxOnoIEYFIsyl4+G1FzJu6/sXrW9ngffg=;
        b=HtmE11KLsdkeYWXby+3qi+XclvZXwVPmB1F/PP86kwL0ixNZqye+bro0iEOiIJRT0Y
         15sU5G7QI+gnGE2nlw3h8LDrjeHkmq8+ORflRiFL1Y41LRjarnWA9uavyx80VRHyJ3H5
         l4pymThu7EPqSfEyh3bn2RaJBy30PcAyBHPPwAQDd6R8LHIMcQgpM/cxF5KBTu3wG2BH
         W0r0kbFLATRuMkWYcJCSDKT4m/FbnWnZSXG8L9D3VcHpPx6adaECOtYMSrIKDClH61up
         hwVst0wP3coigdQvYuFoq29BsoaCHTryeAZCbMy7I1gbQVm6zBuo11tTidhfvOvIhjkh
         1anQ==
X-Gm-Message-State: ABy/qLawiFnM3e6R0s+/C+Mcp72/vijq4H3dA7X+5c6m/J1sW4brymIf
	AqE1ShH3YuTUimHo47Q+o9xTi02K8/MRcZy0ifs=
X-Google-Smtp-Source: APBJJlEI/1lvwMKJOmsuzyUCjn2bnWuPt4zy3FxvpcS+kLxbI0o2Tv8vt7h+J3xLWhciMR8MsWw4Jw==
X-Received: by 2002:a5d:595b:0:b0:316:f3cf:6f12 with SMTP id e27-20020a5d595b000000b00316f3cf6f12mr1726831wri.48.1690879613869;
        Tue, 01 Aug 2023 01:46:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0031779a6b451sm15412630wro.83.2023.08.01.01.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 01:46:53 -0700 (PDT)
Message-ID: <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use
 --offline instead of --frozen
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Date: Tue, 01 Aug 2023 09:46:52 +0100
In-Reply-To: <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
	 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 08:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185214

On Mon, 2023-07-31 at 11:44 +0200, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> And use that for rust-hello-world recipe that did not ship
> a Cargo.lock file.
>=20
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes-recipe/cargo.bbclass                          | 4 +++-
>  meta/classes-recipe/cargo_common.bbclass                   | 3 +++
>  meta/recipes-extended/rust-example/rust-hello-world_git.bb | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)

Could you send a patch to the manual please adding the new variable
CARGO_NO_FROZEN?

I'm torn on this one as we could have simpler code which did:

CARGO_FREEZE_OPTION =3D "--frozen"

and then have the hello-world recipe:

CARGO_FREEZE_OPTION =3D "--offline"

but I'm torn on whether that is better or not...

Cheers,

Richard

