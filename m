Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.10848.1586180915321618134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 06:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6kADo2t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id y20so3990407wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=639HmEBNTBhlN9BylfsaoREmiv7y6pCOuv99yPiVm6s=;
        b=b6kADo2tkHQeThfY8QvNlv37UjMC7qlIG1Jrf34jiKSC9QF8wCwukXitw+FuddajUd
         S0fGqzYXzXiJ3bY2+c0iW9uA114jd3wjhZ0Y6C0l6gYMbBEeFxT2TmPKYKemzVPMn0nr
         +clw5D/N3edLF0Z7O2I5CHcFvtdA6rjPkidtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=639HmEBNTBhlN9BylfsaoREmiv7y6pCOuv99yPiVm6s=;
        b=kvVza40wIWQvP6/INY6/IDCVWPDE3sVtWjymcGVt1QBUCuUe7Q8P4TH3/Wq3LOX9sM
         f5TmPWy3zY0I5yU1x7gUHc0aY0XdKJNusBC6Mb3wCgBhZNZ9juvwsfZhWOrgh4GQ2/WZ
         IMGhjIP1VVLaCbczmzK8gwOLl1ew1oC8r4IZ2N8jTJLH8ydY2+KtIoHJZZiIZWGiU9Hn
         Op4Oe0yCux3u80vwt4QXR0EjGnTa69aMdT+7N4O/R4G2+hZahOc7t6UtW4VmJA81Vks3
         xAr5WuJukFqGjxCxovQZ0O0goZCstAPWP4V8mBLyPcVsn4SjZoDo3fYPOnK3z5VVuX2k
         xHOQ==
X-Gm-Message-State: AGi0PubihMjzgYaB+Oc/UL/AQTK6jEMGg1OkcvcQNFLqOSVIoW7zQEF7
	Vvh5gMSlh+8t3rTQm47vUOMSxA==
X-Google-Smtp-Source: APiQypLvZsiEW6LmRaUHUJW0nVHe2jD29fShCgzMp2g8flgXGT77eOW+EVfGSUec3xCmGnasGuZSFw==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr13610093wmh.186.1586180913815;
        Mon, 06 Apr 2020 06:48:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id m8sm24377193wmc.28.2020.04.06.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 06:48:33 -0700 (PDT)
Message-ID: <ad2a389307f7d92370680e85e4db88aed23f3e25.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	jpewhacker@gmail.com, Paul Barker <pbarker@konsulko.com>
Date: Mon, 06 Apr 2020 14:48:31 +0100
In-Reply-To: <CAPybu_3Jf7Q_T-Zwcm8wPJebAw7e6sTz4bi6s4burMu=xFWnLA@mail.gmail.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	 <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
	 <1602DB74B6717A3F.2403@lists.openembedded.org>
	 <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
	 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
	 <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
	 <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
	 <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
	 <CAPybu_1ULyzXSJzYAHGRh7FeM9i0PX7g0N-v=XqeFPKJ8k0hzg@mail.gmail.com>
	 <0d818b09b16f9a1156643217599f6b774d1ebc17.camel@linuxfoundation.org>
	 <16032F9D180FD5D7.1684@lists.openembedded.org>
	 <CAPybu_3Jf7Q_T-Zwcm8wPJebAw7e6sTz4bi6s4burMu=xFWnLA@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-06 at 11:21 +0200, Ricardo Ribalda Delgado wrote:
> Hi
> 
> On Mon, Apr 6, 2020 at 11:04 AM Ricardo Ribalda via
> lists.openembedded.org
> <ricardo.ribalda=gmail.com@lists.openembedded.org> wrote:
> > Hi
> > 
> > On Mon, Apr 6, 2020 at 11:00 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2020-04-05 at 17:44 +0200, Ricardo Ribalda Delgado wrote:
> > > > Hi Richard
> > > > 
> > > > Thanks for testing it out. Seems that I am either not very
> > > > clever or
> > > > I
> > > > should not work on Sundays (or both), v1, and v2 where exactly
> > > > the
> > > > same. I am terribly sorry to spam you.
> > > > 
> > > > I know it is abusing your patience, but can you try again. I
> > > > would
> > > > love to try it on my setup , but I cannot replicate the bug.
> > > > 
> > > > As we speak I am running oe-selftest    --run-tests wic.Wic on
> > > > poky/fedora-30...
> > > 
> > > I did re-run it, it took a while since a pseudo change
> > > invalidates
> > > sstate. It passed:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/838
> > > 
> > 
> > Thanks a lot for testing it. I will prepare a new series including
> > that patch.
> 
> I saw that you already queue it for master-next:
> 
> https://git.openembedded.org/openembedded-core/log/?h=master-next
> 
> So I will not resend the series ;)
> 
> 
> 
> I have send the Individual patch to pseudo, lets see if it is merged.
> 
> Thanks!

The pseudo patch is missing an Upstream-Status but I've added one to
the version in master-next.

We're struggling with an active maintainer for pseudo right now but
I'll make sure itsin the queue. I've mentioned it to Peter just in case
he can spot anything.

Cheers,

Richard


