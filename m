Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEACC77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:15:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.50298.1680254153236024035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aH7xTxcY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id n19so12494759wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680254151;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pq91ifgM81f/LjL1H0XWOmpim4xlKUwQEvPF/lXsiYU=;
        b=aH7xTxcYu6Z7PYyivtvlMf9/hAB+K1Y9OoaGSNoWDklb92MkdFa7RytQ6VX4ddGyc2
         xCT0M3LZJHDS2uQK0Uq6mn2xqARid3rrjfeg2PqggfBK2q5AEEoDUoci3DQsVTzdBpeE
         Zgcis7eK+Ee9xJUf9xynIys7snvmXc8/F60/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680254151;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pq91ifgM81f/LjL1H0XWOmpim4xlKUwQEvPF/lXsiYU=;
        b=WHF+l/0auYIj1M4hhMqJ+Mq1/1cv4f60PREj3mBzdNT6+pMmROd0DOo1gyNOHYYe7b
         8oPSmuBw6M2Konm/6UiEYdOpSysAdVtpA2Lp2LhQETQSC6P7r7pIck4qCO02lkR0K606
         ckma2lXLvTZ7ar61kamY/Ph9lKln2YzFRA/vZ8HvYL3deOt/Fuq1aCIn5hu30FmveqLf
         6q07yOqzQyKWhFVKPUxDJUXga+dNj/J78V/JwHpsDGz3RQGXKsQzFqKKN21B/4gSkG1e
         vMkbEhfpszrPm0kR7CYTPQV77vs0Ym4wePOJ+Bo3vg2kmd3a80Dwn8Q6F/Ic5ABInG/d
         dZPg==
X-Gm-Message-State: AO0yUKUCvueqYLnRHtIkECdX7WSHpbqgbcFG3OrNI1pzIGa1olIERJoY
	vvlk2H2D6OVsjURQa5nCaIod/Q==
X-Google-Smtp-Source: AK7set9EYMUAKbDfVmyaHIp0lOgkBancynIJnuiTzbKeKB7o8XGbRozQslsgTBu9U3FK/G6NFi76dg==
X-Received: by 2002:a7b:c850:0:b0:3ee:93c8:4a6f with SMTP id c16-20020a7bc850000000b003ee93c84a6fmr20280849wml.32.1680254151556;
        Fri, 31 Mar 2023 02:15:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id q3-20020a1ce903000000b003ed2987690dsm2030846wmc.26.2023.03.31.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 02:15:51 -0700 (PDT)
Message-ID: <5f816f4b5b77b10417949a507b4e35d0ad034b78.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Fix cve-check false negative
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Marta Rybczynska <rybczynska@gmail.com>
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>, 
 openembedded-core@lists.openembedded.org, Yoann CONGAL
 <yoann.congal@smile.fr>
Date: Fri, 31 Mar 2023 10:15:50 +0100
In-Reply-To: <20230331085949df4c2e33@mail.local>
References: <20230328102349.57990-1-geoffrey.giry@smile.fr>
	 <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com>
	 <CAGwXbzZN_FXowS4QvFKxEW-a3_voTT3J6HZDjjg1P=ZEASFKkw@mail.gmail.com>
	 <CAApg2=TfJT1g3EhEhGRXYXqVdS-0o25c_060ijhcmo73L9WSyQ@mail.gmail.com>
	 <20230331085949df4c2e33@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 09:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179405

On Fri, 2023-03-31 at 10:59 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello Marta,
>=20
> On 31/03/2023 09:48:27+0200, Marta Rybczynska wrote:
> > Hello Geoffrey,
> > Would it be possible to run it over the world build of oe-core and poss=
ibly
> > meta-oe ?
> >=20
>=20
> It has already run successfully and is already merged.

It has merged but I think Marta's question is a valid one.=C2=A0The
autobuilder doesn't test this.

I'd note that our patchmetrics do for OE-Core:

https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-master=
.txt

and those don't look worse as a result. That doesn't cover meta-oe
though.

Cheers,

Richard

