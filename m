Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE3FC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 22:54:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.34113.1658184857023348579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 15:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cdfIS67p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id bk26so19100568wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 15:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=OyDrorNBRIOOKjIYHrPPY1IIHQTr6wlospgO9X2sSow=;
        b=cdfIS67pbUF14rqTfdqorn2mtDWQvoYn9GZhH35UinWECdLI3djz7rOQw3GGNihyq5
         JESmJXshY4UjL8SjXZpX36zpozwqH4QPK+ib5m+TCBeAiRZkB994ady4pjgyD4t1k2ra
         9CeRJS/v+UACE9V/QHm64Kt8V7dWgg8OYcrGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=OyDrorNBRIOOKjIYHrPPY1IIHQTr6wlospgO9X2sSow=;
        b=t22YgXLjgc9u4g+Onth11KQDXs+3pfpVuRKATUw3BTRbHZ/4wVAsplw26MSim+LtSk
         qnMCwk3RcSuQxaYYAPAP4eFKTBTXlxOO1m4BQbt8vdoKYOF/igOtSX12TsOhznRL64u2
         8SZbrYo/RQyhaOgSxEx1/gix1SjQssIuUHDWn/0J5+c001+HGBeY2kGKiSVKd9dZPWfo
         AmZ/61TgIsPLVj+lEeXGiWXxpVuKAEyRhbN541OmJYefOZNnbLPqqoWYgV1qkloKjUpu
         GNevkKVwD9fn1czrryZFcg/yM4YxH1WZzWl3l8KXAyvk0vT9Kq1Q3jquiOnZoJiQUE5t
         9gfw==
X-Gm-Message-State: AJIora+Oy2qw1vtt8LCC5KfeetcfPjf8mZKeqEwpbj/95k9naAfd0VjN
	sFs/4D+isbSgAyp+u9YidvaLkg==
X-Google-Smtp-Source: 
 AGRyM1s1rulUxZnoyM6dp8HeuU1GGMJyi7fio8B7tdbdLNxMgQbmguh1u007PrxQYEK+Zx+ysa7/Lw==
X-Received: by 2002:a05:6000:2c6:b0:21d:be55:d311 with SMTP id
 o6-20020a05600002c600b0021dbe55d311mr22964156wry.154.1658184855347;
        Mon, 18 Jul 2022 15:54:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22db:3f70:c684:113a?
 ([2001:8b0:aba:5f3c:22db:3f70:c684:113a])
        by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b0039ee391a024sm21758404wms.14.2022.07.18.15.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:54:14 -0700 (PDT)
Message-ID: 
 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador
 <otavio@ossystems.com.br>,  Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2022 23:54:13 +0100
In-Reply-To: 
 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
	 <20220710164300.953098-2-otavio@ossystems.com.br>
	 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
	 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
	 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
	 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
	 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
	 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 22:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168262

On Mon, 2022-07-18 at 18:41 -0300, Otavio Salvador wrote:
> Em seg., 18 de jul. de 2022 =C3=A0s 18:18, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > > It does, indeed, but it doesn't seem related to this PR.=C2=A0
> > >=20
> > > Do you know if this has worked?
> > >=20
> > > I am asking as I did all development and testing using=C2=A0SDKMACHIN=
E
> > > ?=3D
> > > 'x86_64' and even=C2=A0MACHINE ?=3D 'qemuarm64' worked just fine.
> > > However,
> > > looking at some of the logs above, it seems it is using an
> > > SDKMACHINE
> > > as i686, so this appears as a different issue for me.
> > >=20
> >=20
> > rust-cross-canadian hasn't officially worked properly or been
> > supported. In assessing whether a patch is better or worse, it is
> > useful to know which cases regress and which improve. I had hoped
> > this
> > list of failures would be smaller. I will admit I don't know
> > whether
> > this is better or worse than before so I guess that is the next
> > thing I
> > need to determine.
> >=20
>=20
>=20
> I told you. I tried SDKMACHINE as x86_64 on a x86_64 host and this
> worked.
>=20
> > What we don't know right now is which combinations work and which
> > don't
> > so we can't even tell people what is expected to work and what
> > isn't/doesn't :(
> >=20
>=20
>=20
> See above.
> =C2=A0
> > I mentioned this report in case someone can work out the pattern,
> > or
> > even better, understand what a fix looks like...
> >=20
>=20
>=20
> I am not familiar enough to Rust boostrap=C2=A0to help here but we spent =
a
> lot of time to get the SDK working and I think this is a step on the
> right direction, at least.

Thanks, I do appreciate the patches. I think we've talked cross
purposes as I did report my aarch64 test case issue previously and I
thought this series was to attempt to fix things so the recipe did work
generically.

If I merge this to fix x86_64, I think people will then just ignore the
other cases and things will remain broken there which worries me a lot
and means we can't generically enable rust SDKs for the project and
gain autobuilder testing to spot future regressions.

Obviously you want your use case fixed though. I will try and evaluate
things a bit more tomorrow. What I don't want to do is merge a fix
which then makes it harder to get things correctly done in future
though, particularly when I know there will be an instant backport
request to an LTS as soon as I accept it for master.

We never should have accepted these rust cross-canadian recipes at all
as they are just broken :(.

Cheers,

Richard




