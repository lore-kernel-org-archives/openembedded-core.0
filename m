Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B314E92716
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 15:47:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.18926.1696520841838653243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 08:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YnwRU0Ft;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405524e6768so10896795e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696520840; x=1697125640; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aqFv2Hxi8/SIF+1ENChDTjOm5khxDopMXTRSb73ZnD0=;
        b=YnwRU0FtIEWVUzgfWlJREs54nmSRfXxkd1/pDi/0TG3bWijeYShwcZaBXsz5duiN4Y
         xdTrwJvILrSHrGYpCbykrn4yxpbVW90P2OYe+JvvF/uzqLHm5Q8fu2W64/olghUr4aWo
         lvF99xbl2VX4FiD6YG6W8uMKmC7rjYG39ipYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696520840; x=1697125640;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqFv2Hxi8/SIF+1ENChDTjOm5khxDopMXTRSb73ZnD0=;
        b=Uwg9FAYhu63xrZlveyMC3BPtZZ47CqISfAzl0V8l5D4J1/dq34oSngf97MBR+9kvNR
         ejxlMy8f3+1Yxwhlcc51KAi4sJIAOcb8kELWgdmsauDYDgu9vMLwcuVO1IO861MzCt7b
         1WJ5z7YutYraseXdPXCDvxVygRCWGZxxbR72l+anS8XuMfJD91H0cJi3Lmf9okwv3C5S
         0B2COthPXV93yC38fQngTJHPryBghCheIT9Z7Z4JLtVArXDDOgN8XR8pSXDeakBbELk1
         qQF/dk58wyCJKqPQ25mD8aQRZh6eFZt6hAlGN+TrL4I6JMlpS/KxMWIk7Pppwj7WRa2X
         3cSw==
X-Gm-Message-State: AOJu0YxICHsg4dllYalNcHk7IC9G6hQZg0gj3kOO/defKNVKuxmmxlsg
	kfrtcHHAa/XRmE5zsWLqwqXHXA==
X-Google-Smtp-Source: AGHT+IHXxv3izUZLiw3b3oN05PuJBsdPUYx6JBJUdV6gPC4Nv5jYt0Rh2h5ajw9bgr/fiPwPcWas3A==
X-Received: by 2002:a7b:cbcf:0:b0:406:545a:f8fe with SMTP id n15-20020a7bcbcf000000b00406545af8femr5538904wmi.29.1696520840211;
        Thu, 05 Oct 2023 08:47:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd34:260d:44d4:25bf? ([2001:8b0:aba:5f3c:bd34:260d:44d4:25bf])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b003247d3e5d99sm2058834wrx.55.2023.10.05.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:47:19 -0700 (PDT)
Message-ID: <b421bff99d46507ec63d9b1e8d0db4c6f5d38a3f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 05 Oct 2023 16:47:16 +0100
In-Reply-To: <ZR7V9ogs9aV7Pqux@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
	 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
	 <ZR1jk6AlAXCswWJw@nuoska>
	 <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
	 <ZR2+Of26qhx9vRnv@nuoska>
	 <d8836f8a7338be3a8653be54319e21133cb125d3.camel@linuxfoundation.org>
	 <ZR7V9ogs9aV7Pqux@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 15:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188726

On Thu, 2023-10-05 at 18:27 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Wed, Oct 04, 2023 at 09:35:20PM +0100, Richard Purdie wrote:
> > On Wed, 2023-10-04 at 22:34 +0300, Mikko Rapeli wrote:
> > > Hi,
> > >=20
> > > On Wed, Oct 04, 2023 at 02:29:40PM +0100, Richard Purdie wrote:
> > > > On Wed, 2023-10-04 at 16:07 +0300, Mikko Rapeli wrote:
> > > > > Hi,
> > > > >=20
> > > > > Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > >=20
> > > > > for the full series. I hope our discussion over #yocto irc channe=
l
> > > > > helped resolve these and the test failures seen with master-next.
> > > >=20
> > > > Yes, thanks! It was useful to have someone to talk the issues throu=
gh
> > > > with and much appreciated.
> > > >=20
> > > > Sadly I don't think we've found all the issues yet.
> > > >=20
> > > > On the build N-1 we have a selftest failure on debian12-ty-1:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5=
803/steps/14/logs/stdio
> > >=20
> > > Can I get from this test run stdio to the more detailed task, qemurun=
ner or qemu boot logs somehow?
> > > Or do you have to dig into the system manually to capture them, like =
in the example below?
> > >=20
> > > I would like to check into the detailed logs from both passing and fa=
iling test runs.
> > > Of course kernel dmesg would need to be there so maybe after your pat=
ch to the runqemu
> > > side at least.
> > >=20
> > > If there is a regression in kernel to the serial device detection and=
 numbering,
> > > then we need some way to see e.g. 8250 uart/tty0/ttyAMA0 related dmes=
g messages.
> >=20
> > I can't capture everything in time in each case but I did grab:
> >=20
> > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/e/
> >=20
> > which is from
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7863/=
steps/21/logs/stdio
> >=20
> > which has this threads patches applied.
> >=20
> > I've put two sets of logs there from the same builds, one success, one
> > is missing the getty on one log.
> >=20
> >=20
> > I also have the logs from:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5848/=
steps/14/logs/stdio
> >=20
> > which I've saved here:
> >=20
> > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/
> >=20
> > noting that:=C2=A0
> >=20
> > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/qemu=
_boot_log.20231004134427
> >=20
> > is 3 bytes in size.
>=20
> All this is very confusing indeed. I sent another version of the detect l=
ogin prompt without
> utf-8 conversion, with some luck that could help. At least on some of the=
 logs the login prompt
> is there but with lots of garbage around it. Serial port core got refacto=
red in 6.5 and diff to
> 6.4 is quite large so there could be bugs there, and those could be trigg=
ering new
> errors visible to userspace too.

With the changes I've made to the logging and the raw log files we have
without any utf-8 conversion, I'm now 99% certain this isn't any utf
conversion issue since the login prompts are not in the raw binary
files and those are written with no conversion. It is much more likely
the getty isn't running or isn't communicating somehow.

I'm trying to work out how to add some further debug/testing when this
fails in a way it will help us debug.

Cheers,

Richard





