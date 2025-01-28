Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29928C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 13:49:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.17582.1738072143834130375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 05:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V97AaSES;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab633d9582aso1021415266b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 05:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738072142; x=1738676942; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=27Ycd1iR+orF3o8wzIlZJBgdNbjYX6anSEW4NhcmNps=;
        b=V97AaSESgGC/AEgFIVXwRBYVEvwcPAD4wy/UUxQ2GBzhy0lIiv6rblko4OIF2wIWvY
         /H8QFjegAPZuZ4t/BAN57rBV5wKriH4fHxIqWCCObdAPYk1prvjHJXxUqe6W05iYVQa+
         0+4rVlNZvkFCZWFL8m5+58Mcl/Nv+ok8YTn98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738072142; x=1738676942;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27Ycd1iR+orF3o8wzIlZJBgdNbjYX6anSEW4NhcmNps=;
        b=kqsmaXgRfoxSEqk3BOu3oNtrgDjiRTA/6hW4o3DYqJu230I2gMhAEK4nGMZ+Deyxq5
         sVbM5cRuKvH86wa6wczJuwzvE7DGCDjc0MIztzhu5AAqQMmx+tn7dDU9tO4YMQakbFyG
         JbfXGiiLIHdxr1JIdImyaykGU6uicBzvud+dVP5DSoErq9R22Cxxaoo5bVnZjFAtkeoi
         gRQ/FBbyIQDsGr5r1NVqrD/ikBc0fUr2pLHgJjO/Sorvm9H5mfmqnPtECcLexXB4thge
         3NqAiQxuSAgQP8+tm8cEniqugHF3Nh8LVvNF7fAa7khQFYr5zZ1VTnZw+ZhUeckAqza2
         1JdQ==
X-Gm-Message-State: AOJu0YyyJmfGHh/8nwOhpB4y89X0/YtithAPaKeyOLkISYSSPIqwLh3h
	WL0LjxT0IpEqL/EOYX0HqW1yUkniFzjgvPNGBjKhpA0bJMFIJPYXOzEgCPwsfe8=
X-Gm-Gg: ASbGnct/1qQz5ZqiPpmRoDyAOGbARGDt6cy2mS0ZdaQmIu55wSJdK9qw2VeMUPOACxD
	z61oK5CEMpmbRZfJnmv7T8FgU2xAdZ2C2rZeC7sTiY0JzyuXQfDkzi87M5ILolb5narQa+msMAj
	Ggbgpx1TXP9KoDphiwUihxofJQrpoQ9Eq8mM+cEiPFnEu9OBF6tkSSb8smiQ8t9lpOKhtWYKlyk
	RcVxp6ht2z43ief/ktzF/n02BW4syLvQIagAuMZ8fv5eKl2PXypZ97szGGXexKWJcWws013MFXU
	Yye2djpnG5MYlgPA4J19xOqEGgLUo7z7y0VrFjW2Hfs8FAAgm9bV7g==
X-Google-Smtp-Source: AGHT+IFDAZyFBy/7z+t/uIxC70U/diBP0s2zg9x/GnwRFpDxcbitbI47aBr847CYkECukzTnS05V+g==
X-Received: by 2002:a17:907:7fa6:b0:ab3:84b3:9a7c with SMTP id a640c23a62f3a-ab38af450f4mr4133096166b.0.1738072142039;
        Tue, 28 Jan 2025 05:49:02 -0800 (PST)
Received: from [172.27.244.220] ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6914e56a2sm563555866b.94.2025.01.28.05.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:49:01 -0800 (PST)
Message-ID: <ba9ffc9ade0e227bf9db0988e2877ddfef275207.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] testimage.bbclass: capture RuntimeError
 too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2025 13:49:00 +0000
In-Reply-To: <181EDCF7C1A1686B.17613@lists.openembedded.org>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
		 <20241111131604.364308-3-mikko.rapeli@linaro.org>
		 <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
		 <Zzr0Df_92qav6fWq@nuoska> <181EDCF7C1A1686B.17613@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 13:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210324

On Tue, 2025-01-28 at 13:04 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2024-11-18 at 10:00 +0200, Mikko Rapeli wrote:
> > On Tue, Nov 12, 2024 at 11:25:51AM +0000, Richard Purdie wrote:
> > > On Mon, 2024-11-11 at 13:16 +0000, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > runqemu can fail with RuntimeError exception. Non-cought
> > > > exception
> > > > causes cooker process leaks which bind to successive bitbake
> > > > command
> > > > line calls and that can cause really odd errors to users, e.g.
> > > > when
> > > > build/tmp is wiped and cooker processes expect files to be
> > > > there.
> > > >=20
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > > =C2=A0meta/classes-recipe/testimage.bbclass | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/classes-recipe/testimage.bbclass
> > > > b/meta/classes-recipe/testimage.bbclass
> > > > index 19075ce1f3..a9b031093a 100644
> > > > --- a/meta/classes-recipe/testimage.bbclass
> > > > +++ b/meta/classes-recipe/testimage.bbclass
> > > > @@ -371,7 +371,7 @@ def testimage_main(d):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete =3D True
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if results.hasAnyF=
ailingTest():
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 run_failed_tests_post_actions(d, tc)
> > > > -=C2=A0=C2=A0=C2=A0 except (KeyboardInterrupt, BlockingIOError) as =
err:
> > > > +=C2=A0=C2=A0=C2=A0 except (KeyboardInterrupt, BlockingIOError, Run=
timeError)
> > > > as err:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if isinstance(err,=
 KeyboardInterrupt):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bb.error('testimage interrupted, shutting
> > > > down...')
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > > >=20
> > >=20
> > > During review it is hard to understand what the real issue is
> > > from this
> > > description. I don't like the sound of processes leaking and if
> > > that is
> > > happening, adding another exception to this list doesn't feel
> > > correct.
> > > I was going to ask for a better explanation but looking at the
> > > code,
> > > perhaps this error handling path just needs rewriting/improving
> > > with
> > > more of the code in the finally, conditionally?
> > >=20
> > > I just want to make sure we fix the real bug here.
> >=20
> > Sorry for being unclear. I thought the backtrace would be too
> > verbose.
> >=20
> > The bug happens when runqemu startup fails:
> >=20
> > poky/meta/lib/oeqa/targetcontrol.py:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise
> > RuntimeError("%s - FAILED to start qemu - check the task log and
> > the boot log" % self.pn)
> >=20
> > cooker processes do leak when the exceptions are not cought.
> > Maybe these are not strictly related but it happens for me. It
> > can be that cleanup happens but just slowly, and when I run
> > other bitbake commands right after failure they connect to these
> > leaked cooker processes which then behave badly, for example when
> > build/tmp was already wiped.
> >=20
>=20
> Sorry for the delay in looking at this patch. I'm a bit worried about
> there being a leaked processes and wanted to understand if there was
> other cleanup we should be doing.
>=20
> Instead of this path, would it make sense to move the results.stop()
> inside the finally? I'm worried that other forms of exception would
> also leak processes.

I've looked more at this and I don't understand how this patch works.

By adding the exception to the exception clause, it will trigger a
bb.error() call. The results.stop() call won't happen as results isn't
set in this failure.

The only significant difference would therefore be the results =3D
tc.results assignment. Does that really stop processes? If so, should
we always be doing that?

I'd like to understand what we need to do to "fix" things so we can
handle other exceptions.

Cheers,

Richard


