Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52533E6F06A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 08:17:42 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97230.1766477853087261891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 00:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AjDS+TBj;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b935df7bfso40688721fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 00:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766477851; x=1767082651; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3Jx4D2S0fg7R30yWFUCJqdOCPQ1lX8BdOTMy1JfUGk=;
        b=AjDS+TBjBS9lvKhFdYfdnRshNr8NYBAMaZYKXhCEis9EWeZtn1gXx6NW+AM052u8ef
         MGTiAX2y76RclflpE0Rxp8pFHx/egjUVRG4ulTJEgmKSYb7CXiBsqwIZmFXOwXZBIjeC
         iruJg0dpuWamzIFqJX7bppPIlOeXUTzsebxTLn5kB+j7XjWI719YCIFUaR5qHW+B92J1
         PeRQPjTfj/xBtUHquOkbc1MWZyS2KXp7d/JxIKWsygchJQ/7CSUO0XhO+zcS9RfF2orr
         uneSsp7gogBDv+4ZX+PhJt7F+7g+rk13RJNh1lUFc5OTZnGtMa70nRGH0MO7noofUyqr
         +JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766477851; x=1767082651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3Jx4D2S0fg7R30yWFUCJqdOCPQ1lX8BdOTMy1JfUGk=;
        b=tBMDbekuQTQbK0azYsS904FEpLLG4rdFxSW1clpZ7hnzOdJx4JSJajwr+dMzqh1o3p
         AhDl9HqfPX8mHYMRSQkoiyaFHNyEHnG7JmvG7mHA5Z4ARaNRPPb+TrH55LGN3ZETRlTU
         iiYYBzZQPAD6tjD4VP0MdOP/RvMQLhyBRG5hnRfETdq34O0fywokDGw1/5YtOJ9oTzOq
         jB9frnhVeYPhkRu78iliHXH+20kGRmLbPrgE6CWHMUd8wDFbdcFHcmIZA0CiSVX8Z9OJ
         jYK3iz00LACYf2kertHCrR6MbzSBD47QpnRHXBaGymg4vrn+hwNwFTw2WeGJDxIKb5K9
         EbgA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+X7ydsrroDu4H6jDCrNbm0pwYIjtYV05RleSf2lLIYlFVJ4ZFjCGevpJOzYPd8Vct1R/f4y30ya7B3I52i63Rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMuwyivio0la19n1f6T1zWbJWvSOBleuzqp3LPTs7uAyJI6nE/
	FnzJMhlao9O2VTchmwMsIpVnO9Jhy/DnegKnu0151GQW2s3Nw+2LgIqdO6MRbf42Zk0=
X-Gm-Gg: AY/fxX63KKRmUE906hZfGBPPmFkn6MDBLU3qjiNFY+6fhRPwYl+n1jPzU85r60lnIje
	FRtDZRRbd1H3p5p7gMuE3UW4BUQPLlo0nxanUBIHI8Z86qxRhRHReiTk2ey+x24Gv7y/5VzWwwy
	RgknyiphCSEKTcQh2KEW94dfuxylSLjv0SAbMv+rMT+5bS5W7t8Tb5Tns8odBiEoKA5Cfe9vtTz
	hMo2odz2Mso9Sdb7x7kwCV9rHHkN+RcrPS9SWavu798RcJJyB/FSvhYFzSVQPv9QNZHrnOvZCQc
	XosvCTDajFsMNlWw4eiqqKf6yDWIEsZvRMtQqn0u3nqtFoGllNJBYAzuEgWYGgRA2DyeLr0vXRA
	ktrBEiPOouzeIcBw5sZJMUUFfsQdlEGLrQCJR5IPn+0eEXOwg5TcIpMEWuSl9RPeiOAUlWyOqPp
	v8jc8QG5bkz8wT6LHwDcRBClZPpqD+l/k8FE/P+pqzibvu
X-Google-Smtp-Source: AGHT+IEeWag8eZzS5Q794GWpzNp9Fhp/DwO5uQtK6J/E6RU4jEQkWaRdN8vHEdBNOGfvU8QT2fdPLg==
X-Received: by 2002:a05:6512:3e0d:b0:594:2f1a:6ff0 with SMTP id 2adb3069b0e04-59a17d1816bmr4125399e87.9.1766477850741;
        Tue, 23 Dec 2025 00:17:30 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ddb06sm3950021e87.33.2025.12.23.00.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:17:30 -0800 (PST)
Date: Tue, 23 Dec 2025 10:17:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/21] linux-yocto: combined and consolidated
 pull request
Message-ID: <aUpQGC3mcaeaQAoi@nuoska>
References: <cover.1766087617.bruce.ashfield@gmail.com>
 <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
 <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com>
 <1883C7B7E16A04B1.1614991@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1883C7B7E16A04B1.1614991@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 08:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228458

Hi,

On Tue, Dec 23, 2025 at 09:31:06AM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> On Mon, Dec 22, 2025 at 10:34:14PM -0500, Bruce Ashfield via lists.openembedded.org wrote:
> > On Mon, Dec 22, 2025 at 9:13 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Bruce,
> > >
> > > On Thu, 2025-12-18 at 15:22 -0500, bruce.ashfield@gmail.com wrote:
> > > > As discussed in the weekly engineering call, I'm sending this as
> > > > single series even though it crossed boundaries of the repositories.
> > > >
> > > > I don't have access to meta-yocto-contrib yet, so I haven't pushed
> > > > the component parts to contrib branches yet, but will do that for
> > > > future pull requests.
> > > >
> > > > I'm using this as a first run through some things I've cooked up
> > > > to coordinate the patches across the repos. The formatting is my
> > > > own, so apologies if it isn't clear .. and we'll see if it all
> > > >
> > > > Now to the series for OE-core:
> > > >
> > > >  - We have stable updates to 6.12
> > > >  - A kern-tools fix
> > > >  - Updates to 6.17
> > > >  - Removal of 6.17
> > > >  - Introduction of 6.18
> > > >  - Bump to libc-headers to 6.18
> > > >
> > > > I've built and booted what I can locally, and I know that the
> > > > major architectures work, and are functional with respect to
> > > > core features.
> > > >
> > > > I have more libc-headers testing running against meta-oe and
> > > > muslc, so there may be some breakage there and I'll help deal
> > > > with that if it happens.
> > > >
> > > > The update and then removal of 6.17 is on purpose. In case any
> > > > one was using it, they should get the latest tested before it
> > > > starts to be removed.
> > > >
> > > > For meta-yocto:
> > > >
> > > >   - removal of any remaining 6.17 references
> > > >   - introduction of 6.18
> > > >
> > > > The meta-yocto default changes are obviously REALLY RFC/RFT
> > > > there will be issues, but I've provided them anyway to make it
> > > > clear that we are going to 6.18 as the new default for all the
> > > > variants.
> > > >
> > > > Once we get 6.18 fully green and the h/w references udpated,
> > > > I'll remove 6.12 and 6.16 from master. That isn't in this series
> > > > by design.
> > >
> > > I ran this through some testing and it isn't straight forward.
> > >
> > 
> > Back online after a 10 hour drive!
> > 
> > > We need a newer strace with the newer kernel so I queued that patch
> > > from Robert. That caused ptest failures so I disabled the failing bpf
> > > strace ptests.
> > 
> > ok. I'll ignore strace and assume that bump will handle it.
> > 
> > >
> > > ltp failed to compile so I backported a patch to fix that.
> > >
> > 
> > ack'd
> > 
> > > We still have a cryptodev-module failure:
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2922
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2897
> > > (all world builds I think)
> > 
> > I can handle this one, it'll be.a day or so, but I also haven't checked
> > the  autoupdate list yet to see if this is in it. I'll check the lists before
> > I start and see if anyone else has an update in flight.
> > 
> > >
> > > and an initramfs module space problem:
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2931
> > 
> > And a config warning (easy for me to fix).'
> > 
> > For the space. Is it only genericarm64 that we do this test on ?  It
> > could either e normal kernel size increases, or it could be all the work
> > that has been done in genericarm64's config that has causes this.
> > 
> > If it is normal kernel, then I can have a look for something obvious,
> > and then we can increase the size. If it is only genericarm64, then
> > we should get Mikko's opinion on what might be options we could
> > tweak to reduce the size.
> 
> This is normal. More drivers as modules, dependencies to firmware and slight
> increase in kernel size hitting the limit again. I think increasing the limit
> is the way to go now. I've been hitting this limit locally with 6.17 kernel too
> after some more arm64 drivers are enabled.

I see Richard added a patch in meta-yocto master-next to update genericarm64
INITRAMFS_MAXSIZE to 280 Mb. This is fine for me.

A lot of the kernel drivers and firmware blobs are strictly not needed in initramfs
to mount the rootfs, but we can't separate them at the moment without full manual
control of the initramfs package contents.

Cheers,

-Mikko

