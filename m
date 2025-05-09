Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE91C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 08:28:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9577.1746779280725907201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 01:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PGVRwxzm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so568030f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746779279; x=1747384079; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nsuOh9K9AYlPWZRHctSOrKC84SfJCeFULrWYxr9Y0U4=;
        b=PGVRwxzmbGiozxHU7TX6ReoBGelxeLMihJCmpy0e+hc5Ac/Iyj5cLyMpd8LnzkaM/W
         B0RL1fFQJpmKFJq7Oq4jTm8xD2NliSB1TviTno72W048XfeVFsAwMAkBIYqcO7z3YixR
         ffXHz7ztd99cWv8yanxdbo3GzBolxWzq+aFxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746779279; x=1747384079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsuOh9K9AYlPWZRHctSOrKC84SfJCeFULrWYxr9Y0U4=;
        b=EQSfiUpRL2z4JVcR5igC19ehIvLwSKtBHfJhYm1aZMqOaFQOhfXX2KMBIaIpGD5qan
         WjoNZN1crNkShZptQ5VB1QAwc0RwozPKK1yfDUjQV+PaDCSNPBrXuFr0jyMQdPJOGpDV
         jV7epYCLIDQksC3FoOUpHKz8ejjsIdbiuDlFBF60bGZ8LP008HiyjmvOgCf3jLCjPfL/
         FbK63PAPPMjANLCRHLMeZsoNwKWWa1vOq/StjMeS0lgXZDON2Oty6pnyE8F+VLevYOhN
         bZcgplqFOp5OuX9iiskSwfRh8jeI4cIFy5Oa6EYFaFulWgek4OSZwTwfaSgQDHeNSuCm
         AHvw==
X-Forwarded-Encrypted: i=1; AJvYcCUNzAyF7O81JlFYIvuDKXrWDQDN/s47XiHivThgt92Wa8lm/aKeiZZk6Q7yrr7kkhSpQSGBDPJUayoEb8JzEREOSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqRLIPDVh9dx9Bfr7IQQGt8rowSgiyyRJLgwtQsSIoClenQdpi
	n/CtD2nIQ3xmHuOtbT47JnEMGA0Jg1bruMgJrPp3LtJJIpJTa0GAXoPbvPCKTPI=
X-Gm-Gg: ASbGncuP+lMQRwSLn76aRIQVPmbKK8ag2p68iB48tgeKlTZQnCP9PBc+vph+4x0ikAj
	aDtye2Lz7hNFrMjqSO2lYmnjS4v3uYaNbLVucdbLIt7HPF8lazVxl+4L5NzqWEeK2+FbyY6faHQ
	1m6H5jYe0Sd1+X0OEMZlOS2XNJau8cb5kEIda11qarro7WTKe8FTOKdti97zboEye6sIwCfEfXu
	JycsnTXFQjMUgvZOLu4BqgNPnU5ViGV6KoTONQ2FC0DUS4+vwx8sC/Itkjrj80m3Nl8iBgmdXCW
	Rnwp8GpoJw/AZKyUJdS2m597rouPAlH8mUAqS37BsZw2nDD3H1j/HDLLI2+js2V/QXTLfWc70yO
	RUWl4ygxtRu9jp0pn/5TRzqqP04GlYg==
X-Google-Smtp-Source: AGHT+IG5j9mrXisKKKF5ogZmMWyE4EVZeVK2VFPvlhfPCuLog6ShoywP2Pz4Wth/wHYgSX9EmbEpxQ==
X-Received: by 2002:a05:6000:2284:b0:3a1:f537:9064 with SMTP id ffacd0b85a97d-3a1f6443c25mr2099792f8f.25.1746779278750;
        Fri, 09 May 2025 01:27:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b9fd:97ba:4403:f351? ([2001:8b0:aba:5f3c:b9fd:97ba:4403:f351])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm2454595f8f.89.2025.05.09.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:27:57 -0700 (PDT)
Message-ID: <c03db64ceaff78ae2c7fdcf31144ae4d22501395.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2 0/3] Display manager proposal for x11 and
 wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randolph Sapp <rs@ti.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Date: Fri, 09 May 2025 09:27:56 +0100
In-Reply-To: <D9R2IAEKL6IZ.37PWD38041XCA@ti.com>
References: <20250505224801.3181046-1-rs@ti.com>
	 <D9OWUBHID8JT.3FJEJAXYPMT2W@bootlin.com>
	 <D9PGBHDAZ7RF.16SWU58NCK9NV@ti.com>
	 <CANNYZj8xD66nTL7=oJr8fqknYyDjU+kjkY8i8Kok7xVH6tciTw@mail.gmail.com>
	 <183D59758C0F13FA.9842@lists.openembedded.org>
	 <D9R2IAEKL6IZ.37PWD38041XCA@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216187

On Thu, 2025-05-08 at 15:39 -0500, Randolph Sapp wrote:
> On Wed May 7, 2025 at 3:42 PM CDT, Randolph Sapp via lists.openembedded.o=
rg wrote:
> > On Wed May 7, 2025 at 8:37 AM CDT, Alexander Kanavin wrote:
> > > On Wed, 7 May 2025 at 01:03, Randolph Sapp via lists.openembedded.org
> > > <rs=3Dti.com@lists.openembedded.org> wrote:
> > >=20
> > > > Ah, this is the first I hearing about the gnux32 triplet. Well, tha=
t is being
> > > > filtered out by COMPATIBLE_HOST in the goarch bbclass. Some of thos=
e values seem
> > > > to be invalid now (powerpc64 is supported upstream). That being sai=
d, I don't
> > > > see any mention of the new x32 ABI upstream. Not entirely sure how =
to address
> > > > that at the moment.
> > >=20
> > > There are two options:
> > >=20
> > > - set up the x32 build as specified in [1], replicate the fail, tweak
> > > COMPATIBLE_HOST as needed (in a separate commit) and see if any
> > > further issues come up.
> > >=20
> > > - correct [1] to no longer build core-image-sato for x32, and replace
> > > it with core-image-full-cmdline, reducing x32 to non-graphical
> > > targets. It's been a controversial target for a long time, as no one
> > > has ever seen actual usage of it, and there's been a stream of
> > > graphical related crashes and build failures. We keep it around for
> > > now, but I'd fully support dropping the graphics and leaving only the
> > > console images.
> > >=20
> > > [1] https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config=
.json#n867
> > >=20
> > > Alex
> >=20
> > Alright, well I did a little work poking around go. It has no understan=
ding of
> > the x32 ABI currently. Dropping the x32 tests from core-image-sato to
> > core-image-full-cmdline can work, but that does mask a bit of a regress=
ion.
> >=20
> > As useful as a display manager will be, I'm not sure I can justify that=
 much of
> > a regression for an entire ABI. I know the linux kernel has debated abo=
ut
> > dropping x32 support a number of times, GCC seems to be the only compil=
er that
> > has fully implemented it, and Yocto is one of 3 listed distro solutions=
 that
> > currently support it. Still feels a little rough. I don't know.
> >=20
> > Anyone got any strong opinions here?
>=20
> Well, I guess we'll go with a old fashioned scream test. Let me know if t=
here
> are any other issues that need to be addressed or if I need to resubmit t=
his
> series if the following is accepted.
>=20
> https://lists.yoctoproject.org/g/yocto-patches/message/1539

Sadly, people don't pay attention and simply won't see this to know
they need to scream. I've just gone ahead and merged it. We're not
seeing much use of x32 as far as I can tell.

Cheers,

Richard


