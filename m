Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143F8EB8FDE
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 12:04:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.10991.1694088256298731879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 05:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NE0q5CkS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31c63cd4ec2so873364f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694088255; x=1694693055; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PcAsJb5KwDupEPhnR0RaT94uAQAAme2U7PqBQ57js+0=;
        b=NE0q5CkSD7vRlBXAgizwWW2nNTpu/vX+O0m0NH6ZMurJHRxNfs4nJMQI37gfBYB2Fv
         niG0TGRztIiRHGchpX4H1e26Df6cAUBdGE+lTvw8i5o9DbE9q7juHkQ72R6QNw/hBeyE
         xhNnoQ7/eao7CSxrH49fvHicMKgiZ355G+FAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694088255; x=1694693055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PcAsJb5KwDupEPhnR0RaT94uAQAAme2U7PqBQ57js+0=;
        b=I0rlXibTgUJpq/Cad/TIF2+qupkPaClW+dajrg98nOnwxw1FNcvVOPHIPWpduYNUDL
         uLpPPI2LnW5L9m8lLgEP34Yt51Shg56V67TXk4CutMBRNsRoEY2XdQn/8MRzMgDPFEBq
         C+lViO17onAbkyLuJU2Xp++ZVA5rtwMd0sDbGSZJGObgYazfw3GI1ksfhCL3Va3JQy+W
         8msPdk/hAjxy2vwollFaug0JOt5OFDlQ4x1wUNCaWKSJ+olGrZRDLOsqFN+KhVWjbb58
         NUh/r1z5y27EeyBJutNyE4d+tUn0o6wl0yS+IWaj/sk0HHzNN9d3Bl/ua46ce3oTI2jR
         Wu/A==
X-Gm-Message-State: AOJu0YxThEzZ2O1+k7cP+i4MrGGkolsSUXxVL4JFZUssEt7UIf3qucwV
	syRCBuuRszotzY/l9FtGezLnSg==
X-Google-Smtp-Source: AGHT+IFBDzzxrQkX0peaFk+vDu39v/M3oNIxfkTSabu35JaI1EvHQ5AVWQTm92XbN7j+uNL+b6ve9w==
X-Received: by 2002:a5d:4e88:0:b0:31a:d78f:1b0b with SMTP id e8-20020a5d4e88000000b0031ad78f1b0bmr4367884wru.18.1694088254644;
        Thu, 07 Sep 2023 05:04:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id q12-20020adffecc000000b00316eb7770b8sm23393093wrs.5.2023.09.07.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 05:04:14 -0700 (PDT)
Message-ID: <e1e5f66bf13da82c0a8d06a3479f4881bbbef7ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 07 Sep 2023 13:04:11 +0100
In-Reply-To: <CANNYZj8PfsZdgYjwUXEm2vy2wEqO2bksNSvDb02smLvMxiAoLw@mail.gmail.com>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
	 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
	 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
	 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
	 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
	 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
	 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
	 <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
	 <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com>
	 <e4706c56b8faab51081682ec06f1de645306f82a.camel@linuxfoundation.org>
	 <CANNYZj8PfsZdgYjwUXEm2vy2wEqO2bksNSvDb02smLvMxiAoLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 12:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187383

On Thu, 2023-09-07 at 13:45 +0200, Alexander Kanavin wrote:
> On Thu, 7 Sept 2023 at 13:18, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Crazy idea - can we statically link the shadow-native binaries?
>=20
> Not impossible, but needs a bit of work - libbsd, libattr and libmd
> all need to be made available in static versions (via resetting
> DISABLE_STATIC), and shadow convinced to use them by injecting -static
> into the linker flags at appropriate places. There's no precedent for
> this in core that I've seen.

See meta/conf/distro/include/no-static-libs.inc which does things like:

meta/conf/distro/include/no-static-libs.inc:DISABLE_STATIC:pn-openssl-nativ=
e =3D ""
meta/conf/distro/include/no-static-libs.inc:DISABLE_STATIC:pn-nativesdk-ope=
nssl =3D ""

I wasn't sure how easy the shadow patch would be, that is hopefully the
main tricky part. sqlite-native used to be built allowing static for
pseudo iirc but I don't think we need to do that there any more.

Cheers,

Richard


