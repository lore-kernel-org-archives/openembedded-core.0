Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8522BCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:44:50 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.26732.1697719488230644237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LPtxGwhm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so106884421fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697719486; x=1698324286; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pHBdIuP1DGlWp+mstvBddC8ixj1HKpdOPf8ag5yR5eI=;
        b=LPtxGwhm+KVaPlB1dYSzvRIcXmEsYPHBZM546IpbPClhU934e9I3Xd+TO8duvcjfPI
         jAAr6wBFY0IZ7sMQi9ROQ1O2ubqyJhkMGaFxGo1BBXWAssyQKt0GZeBmPVN0YLBPm2pY
         4VH6mlNjfRDBcqdMK2RmGWTBCarnXhanzVpy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719486; x=1698324286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHBdIuP1DGlWp+mstvBddC8ixj1HKpdOPf8ag5yR5eI=;
        b=tgZrEv82FqoMAcDJWgDNhptk0YiEgnOkO0kvdC/VgCvm3x7Cd6HaVYoSdWl1ul2BFE
         FRAR82aEAXeT9+sp3h1YsMJaQ0gDJc9jxEhUQMEDLudRYxtcafizA11f3qtWrQzkhmbc
         2VfroKmHIclos6+D9gUbwyU4pOjSdE4NDqXOQHXlXKQqMAfB75WAEOmMu1ONKwtAkQSr
         2u57JoqCC57KJZdxGziLn0nC7TJ4+BckpINt/8UwwsEB/7H0p+nefSE1dYaHyOTPtFfz
         ClaeTYj9tjRgXd8nfWOguPN7K6JUWM82yY2EqkwwXsnLbY4pr/bu/WfCZLezFi0rCG9o
         Fn4Q==
X-Gm-Message-State: AOJu0YxAYuBJX2QK49krjZZRQCTBe/sQoKevAypeM6jOyGhCmDPMVJqn
	tVO7AKibfkjcxJ0gLjOEhmWmOQ==
X-Google-Smtp-Source: AGHT+IF4SVds6MfF3atPXOzZ24FSCTebfcYwZjjSSnSndkW8AX8VG1Rktvgor5zH5aQSd8DsoIC1JQ==
X-Received: by 2002:a2e:700f:0:b0:2b6:e958:5700 with SMTP id l15-20020a2e700f000000b002b6e9585700mr1315910ljc.4.1697719486396;
        Thu, 19 Oct 2023 05:44:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d66c1000000b0032dbf99bf4fsm4393808wrw.89.2023.10.19.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:44:46 -0700 (PDT)
Message-ID: <fcb228e46230621e156c85ef41f6f006a5b913a4.camel@linuxfoundation.org>
Subject: Re: Kernel 6.5 ttyS1 hang with qemu (was Re: [OE-core] Summary of
 the remaining 6.5 kernel serial issue (and 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
 openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
 Ashfield <bruce.ashfield@gmail.com>, Randy MacLeod
 <randy.macleod@windriver.com>,  Paul Gortmaker
 <paul.gortmaker@windriver.com>
Date: Thu, 19 Oct 2023 13:44:45 +0100
In-Reply-To: <20231018052822.GP27774@atomide.com>
References: <178DF50519C11C84.8679@lists.openembedded.org>
	 <b208c9c6b72be4ef0f2aadb7bed103280bff60a0.camel@linuxfoundation.org>
	 <2023101516-unmolded-otter-e3e0@gregkh>
	 <214757eca7f4cd639a7a8d9a822476c1ec30f01c.camel@linuxfoundation.org>
	 <20231016063501.GL27774@atomide.com> <ZSzjNgdCH_wmB4u2@nuoska>
	 <20231016072352.GM27774@atomide.com>
	 <0d86deae37877258f46322d4d727903fca12ad21.camel@linuxfoundation.org>
	 <20231017065616.GN27774@atomide.com>
	 <87cdf04bfd7997465dad157d9d81fc14ca7d122f.camel@linuxfoundation.org>
	 <20231018052822.GP27774@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189454

On Wed, 2023-10-18 at 08:28 +0300, Tony Lindgren wrote:
> * Richard Purdie <richard.purdie@linuxfoundation.org> [231017 22:15]:
> > On Tue, 2023-10-17 at 09:56 +0300, Tony Lindgren wrote:
> > > * Richard Purdie <richard.purdie@linuxfoundation.org> [231016 08:10]:
> > > > The port sometimes doesn't come up properly at boot.
> > > >=20
> > > > To be clear, the "\n\n" from the qemu side into the port doesn't se=
em
> > > > to help. The "echo helloB > /dev/ttyS1" inside the image does seem =
to
> > > > wake it up.=20
> > >=20
> > > So if I understand correctly, this issue still happens with kernel pa=
tched
> > > with commit 81a61051e0ce ("serial: core: Fix checks for tx runtime PM
> > > state"), and the issue now only happens sometimes.
> >=20
> > The issue has always been intermittent and it appeared to happen less
> > frequently with 81a61051e0ce added but it was hard to know if I was
> > imagining that.
>=20
> Oh OK.
>=20
> > > I wonder if the following additional change might help?
> >=20
> > I've added it into testing and have not reproduced the failure with it
> > applied yet, locally or on our autobuilder. We need to sort some
> > release pieces which have been delayed by these issues and we're going
> > with a workaround for that. Once that is built I can get back to
> > testing this change more extensively, see if we can still provoke the
> > issue or not. It may take a day or two of testing before we know with
> > any certainty if the issue is resolved or not.
>=20
> Thanks for the update, let's wait a few days and see then.

Our release build failed with our workaround, probably as this piece is
missing.=C2=A0

I've not seen the failure occur in any build with it applied so far. As
such I think we'll move over to this patch as it seems to be better.
Whether it is fixed or not I'm still not 100% sure but it is looking
more likely. Thanks for the patch/fix!

Cheers,

Richard

