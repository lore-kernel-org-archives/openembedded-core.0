Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4DDC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:20:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.667.1685481642904160125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 14:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=b+x/Wwo8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so37014955e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685481641; x=1688073641;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6TB4EvuJmSW9ZKZnbV4Eroif2BVVmT6Ym+XMxZU7d9E=;
        b=b+x/Wwo8mll1HN00zZzRw52KD+5xmNoQ7IONgByYh6KgamH9J4UMzS9AQeJ3vZcpLa
         ggB/8LSDrTlSw4pz+/RfBghvNRWB9OpD/oTFscOY+0+KO5yrhbHOdeRu/qzd6+BRArVc
         OigncJGUH9OfKHoArdgsm7VOP5E981q9ukxu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685481641; x=1688073641;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TB4EvuJmSW9ZKZnbV4Eroif2BVVmT6Ym+XMxZU7d9E=;
        b=HpP5mkGtVFZnGUvKXLHt5eG1OsjmSc+4Ul2iHk/oL86JPn32mlDzttdv3J1z52xLRo
         MiszJC1/HVJhV2j7+GTB0DP70wNlmWwWFze8U+SJVtJSc73vaXEoi4P2m5akiW06dU0M
         BuJfwj/Pg74slRp9PTTRBdd9kJ2EZja+uNqtJnLm2bQ0uqwYCIJBlXsynuBBE0b5vn4b
         WUIc6EP/aYd50Fm5pYi1q8bIfKDwCi7I88WzktNUArRi0G8SCQYu2EYqf0dDERz51C18
         k6QWbNPeDw8AZtCqnDAqpKa5tyv+4R24bTDpKta2IV9BX3t4nsYy89pz36181/BgDz3i
         8ObQ==
X-Gm-Message-State: AC+VfDzxLULfim8axOFln33v6TsyhItCzE1b9iwAYDgVOWayAmzd1mEl
	4Sry8WbhBI7lIx+5jV/Kk1BdrA==
X-Google-Smtp-Source: ACHHUZ6vvezl9jcwGxuMOvfbE8f3/5nr8VXGMbac1QPL+0nxgaBL38vXVNpyenLQLTEZGqrINRsmug==
X-Received: by 2002:a05:600c:da:b0:3f6:c7b:d3b7 with SMTP id u26-20020a05600c00da00b003f60c7bd3b7mr2658930wmm.37.1685481641198;
        Tue, 30 May 2023 14:20:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422? ([2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422])
        by smtp.gmail.com with ESMTPSA id l22-20020a1c7916000000b003f607875e5csm22128815wme.24.2023.05.30.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 14:20:40 -0700 (PDT)
Message-ID: <1cbd8aaaa38757e875876fa903df75321beef321.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	=?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons
	 <frederic.martinsons@gmail.com>
Cc: Yash Shinde <yashinde145@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Umesh.Kallapa@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Date: Tue, 30 May 2023 22:20:39 +0100
In-Reply-To: <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
	 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
	 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
	 <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
	 <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
	 <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 21:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181952

On Tue, 2023-05-30 at 14:28 -0400, Randy MacLeod wrote:
> >=20
> > I did put this into a build for testing on the autobuilder. It
> > hasn't
> > been running long and I can already see build failures such as:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184
> >=20
> > and there will likely be more.
> >=20
> > I'm finding this rather frustrating and am not sure how this was
> > tested.
> =C2=A0
> That's probably my fault. I've been asking Yash to keep pushing and
> suggesting that I could help him with testing but the bad news is
> that we (Wind River) have the tail end of a product release cycle
> happening now.=20
> =C2=A0
> I'd like to help out with this, but it'll have to wait for at least 2
> months and=C2=A0that puts us close to the end of M3 so we might have to
> wait for the beginning of the fail development cycle.
> =C2=A0
> Let me talk with Yashe and Sundeep and reply with info on what to
> expect.

Let me try a different request on the public list too. We're clearly
struggling to get this patch over the line. I have a finite amount of
time and haven't really been able to dive into this properly, I have
tried to guide Yash and Sundeep on some of the rust issues as best I
can but I'm struggling.

Is anyone else able to help out with some of the rust issues? The two
pressing ones are the ptests (this patch) and the reproducibility
issue. If anyone is able to help look into these, help is welcome,
please talk to Randy and I.

Cheers,

Richard





