Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E1C25B6F
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 11:27:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.68194.1698319618724197031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ia5wNOUW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-313e742a787so446416f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698319617; x=1698924417; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A2GjMi+4Hf4kLGrWDURNJ+KoKC9zVdEcjoLuPBuupQM=;
        b=Ia5wNOUW9Qx4vbrVDt0JYyybFKjUSfuwihNGcu+GNqzehcEYhW+PE6DaUGGoBptHkt
         YfLJ1CyU3f5MUccbuvvbtWZRXJT7EKYNqByCdYaSn79J9NMcBFtVbJ42gWjUeQ/L8p1D
         vbC3YR+y9nA6gD2uf9YmQJuwGf6zJ0yKg6bnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319617; x=1698924417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2GjMi+4Hf4kLGrWDURNJ+KoKC9zVdEcjoLuPBuupQM=;
        b=GK2Z1FYWxYwLPQJwMPfAgaEVsCOrxaIxE/MMVKzpIlm0E3YHZvy3L3c+gOYd9YKd6Z
         x+/OkSLrKamcUPGR2XWvnJc1EYHL0ei7GAFRkfGqhfP6Thl4naCywlx+qqf8jpL88S1h
         C7XDr5He9r/ydn1O7ALDFrL9an8S98u3DKoD6a4bWQnZWxWuVV1WCUJm4brPxtFNAFiy
         rihDW0rnmHXWpI5SVCpf2UXZmbL6wlSVI9QN4dPo/HAps+SUXaDrmPj3VdXUkQ0dTvBG
         cJB2oCNm3r5xe+tBtP0IB8YQmS5OOU4ekqTRI010nbjgfjLFCFm4k2f/5DG4UUYc7Z/+
         5+/g==
X-Gm-Message-State: AOJu0YwHDXqv6tFBjK1qELGgFCe4+ZpA6IXc3+KYAcM9w4yi9FXIuEYM
	5KTwbJR6g4bCJDEBWBs406Tl6Q==
X-Google-Smtp-Source: AGHT+IGfzgAv3LwS/xrdJV7uLrtHFY3px3tBorUo+fGc+PzlydzeaXEBqB0QQCHSTP6naxQdMn7Qsw==
X-Received: by 2002:a05:6000:1545:b0:32d:a3f7:f0dd with SMTP id 5-20020a056000154500b0032da3f7f0ddmr2922469wry.25.1698319617105;
        Thu, 26 Oct 2023 04:26:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id a22-20020a05600c225600b004078d71be9csm2294442wmm.13.2023.10.26.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 04:26:56 -0700 (PDT)
Message-ID: <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Thu, 26 Oct 2023 12:26:56 +0100
In-Reply-To: <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
References: <20231023110618.3525311-1-alex@linutronix.de>
	 <20231023110618.3525311-3-alex@linutronix.de>
	 <20231024103345.306b9171@booty>
	 <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
	 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
	 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 11:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189721

On Thu, 2023-10-26 at 13:16 +0200, Alexander Kanavin wrote:
> On Thu, 26 Oct 2023 at 12:53, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Can we file a bug to look into that?
> >=20
> > I'm also a little puzzled as this does seem to work some of the time as
> > I managed green builds of this.
>=20
> Filed:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15253
>=20
> We need to think of ways to test/debug this that don't require running a-=
full.

We can create a separate target (builder) on the AB to just run the
test?

Cheers,

Richard

