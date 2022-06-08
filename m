Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1D0C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:27:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.5654.1654691264568456274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HBYjNHD8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id m26so16729414wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=5GL7bFCf0gmF8UjXeagCxtKi9hMYCq7RpM30I1cTcNQ=;
        b=HBYjNHD8wbUfr5/BY7fKPlPBbIL3nGShqsIMc2NU+heRJGHgzB93ufAmlwiCzgQl+d
         UHtghxhZi1IV+0uFAnZbxOcciHqQTD4zFnvdp8+I+1dOyP21CN+o4GkJhurLomFRrj4z
         VGMo9RLVuvsqQRWQa8BWIH8jp22lKIhnmidWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=5GL7bFCf0gmF8UjXeagCxtKi9hMYCq7RpM30I1cTcNQ=;
        b=uJm+7Wv/TirXRIR4WKQC9sSU+1pvrs8fvIN0g0cTwZ6AD+E6mSObhKcZX93DoiTw9S
         ngYYslvpNIxSbzVv6IVvmqcDDlc+fJMDFSdibnyn/kBt6qBIM2mPPI+HVWJLzom4GcRE
         ilZd3ZYsCptFtaw6QPK9OkZlp0IViuzzg9fwu/xrkOlzzIiz3fq2Brq18jb6KvshyFIp
         0k/TU7IhOPfAoX3hVPpKeTTZrjWEmVjyUmsG/re8hEF3tT7/Cktiz+B9D/zOxTUDrrkh
         2ZV9s8NbHyrbMbocM673Vpr7LJC/IzF5/yjtAUWDLWWeoOEKxwbLIUb8D3JgMwksxXWS
         tUXg==
X-Gm-Message-State: AOAM5321iCNW/mOIBkFYQbKIdOEwbmrKiiLJFUO9Epl4Uc65nZ/l13GX
	BxaYzzpX44MQQQ48CMyqN2fYEA==
X-Google-Smtp-Source: 
 ABdhPJy11imEJPE7fUcwOyau3LLpPyhWtb5+Izc/CkyON8JgiAI6vvdCGKdUJtgikT6oGm6wn6NysA==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr33165897wri.83.1654691263041;
        Wed, 08 Jun 2022 05:27:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2793:ec22:da5d:8e52?
 ([2001:8b0:aba:5f3c:2793:ec22:da5d:8e52])
        by smtp.gmail.com with ESMTPSA id
 z14-20020adfd0ce000000b00215bd1680a8sm13947974wrh.79.2022.06.08.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:27:42 -0700 (PDT)
Message-ID: 
 <c5b9a6abb9186aa26790082740f913b8c5a56f93.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check: move update_symlinks to a library
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>, pavel@zhukoff.net
Cc: Ernst =?ISO-8859-1?Q?Sj=F6strand?= <ernstp@gmail.com>, Marta Rybczynska
	 <marta.rybczynska@huawei.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Jun 2022 13:27:41 +0100
In-Reply-To: 
 <CAApg2=Q+2weQLezA040uC=OR1_9ROXYT1iEzwk4Xt1Xf91yLHQ@mail.gmail.com>
References: <20220603085827.2214734-1-rybczynska@gmail.com>
	 <87k09u2ujv.fsf@gentoo.zhukoff.net>
	 <CAApg2=Q+2weQLezA040uC=OR1_9ROXYT1iEzwk4Xt1Xf91yLHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 12:27:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166703

On Wed, 2022-06-08 at 09:51 +0200, Marta Rybczynska wrote:
> On Mon, Jun 6, 2022 at 8:08 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
> >=20
> >=20
> > Looks like update_symplinks is widely used accros OE. Quick grepping ga=
ve me this:
> > [1]. I'm sure there're more occurences.
> > This should be somewhere in more accesible place (oe-core libraries).
> >=20
> >=20
>=20
> This is a valid point Pavel and Ernst. The patch has landed in master
> so I will do a followup.
> It seems that this could avoid a number of bugs (see the latest fix
> from Davide).

Thanks, I was meaning to say that I merged it since it does
incrementally improve things but I'd be happy to see this handled in
other places more centrally too. We have see a few similar bugs
recently.

Further incremental improvements very welcome!

Cheers,

Richard

