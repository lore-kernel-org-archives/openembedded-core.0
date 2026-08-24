Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1F3C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 17:10:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2628.1787591405277049170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 10:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q46H2mhU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so33722255e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787591403; x=1788196203; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2+IxCl5V1W4F/pCxkTYr9T4C6FOMJBkM+tU5rzNFk9U=;
        b=Q46H2mhUPrk2E8HkvU5EYhwYzpTdv3laz4DFIWIp0/i/Jf1w6kqwDEdKYMlSCMXnBb
         c0kAwWNQHQcVwVu/II+1axMk8NJ0X732iZka00evdE4YgLJ8+2/3GoWlUCsNSrVFMEMF
         hyZFvc3zjaX2GNGFc2fIQonV5yG3glVd6smjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787591403; x=1788196203;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+IxCl5V1W4F/pCxkTYr9T4C6FOMJBkM+tU5rzNFk9U=;
        b=ON0K8lx8wZup2YqQCNpnHPsAk/bJyX8tp1W6H0QjVXXNqfzwoA9rwSXN76knwqPJWE
         KB9g6WMvcoYnoQOkYAz1MWYyxVVvbu0aZb3DdqyYFHrnhd5j9+9M6XlEYrgPiMU27njI
         Ujseqy41x2ub8wLKaq54ZpV8aPl6LDfgu6f7O6dVNWf6PMrr4L5GlM1BV5K2LmarwFOI
         ZEDFptqghL/nKf7k0ITu7nPWB+8ymHiejZJH16FfmwsYAFc6JweSTlgoq6aGeHDLDmLX
         OrVyVTsF0djBcVbntmFFuL6JPZ49WIWeyqb6pFsvfpqBph82EqUwqdpSWzboIywRdjpa
         qlrA==
X-Gm-Message-State: AFuF++kI2SeptL0t5CXrjgBCL89bfuw2IhmSD8va+0y/VkuIlR7ytljy
	LmFk50wQKneWYSv55u8OetdsY0EoJO86jJLR8bF0ptNaw7+IzGtLf0qukcQf8bfvrnU=
X-Gm-Gg: AR+sD10ds/UNzYJoUC2sRGzy6H5gWkcB37X7umSebVz8FVF8juccYwvO521SkZj5DBP
	DeYPLbpaP+ODz23LQzA8QCFcdtzTveeS5UnDkXD9aKZZtHr/PrcukFNM8+fxFiHJGTdvbrEnMsF
	srcBs6O1QHXSH2hyQqkG9tB+w+j4U1/X/QFW/wNY2RedKM56Y5ySbnDowHuGPsXjk1iY9eLqSEi
	fse79/JHrgPZTRm6UwDkg378mDgO6I/Hf7JrMkJz7inYwf9adDthrOfcHGUzOHxQ7449Zdxx7bG
	MFNVKtYFYte0vBJVxcKrw2p1k+EiK6NJe5Q0KzH1Ewume4U2z6emUYUpFQLrfgomWYIUwtqLynD
	YFE8/fmK4yYDOFK1khVBGYj15hst6ZEm4dkrC32VLiFbfbyDFkb7Mf+5WYJ1C2I1fz2gGKFtVfo
	2hhpHY9k70lAVJzfjy3SiGqh25v1qnT/9zpqFMpdtf2SmVKu4L2CHc2zPD5U9g4EseKjlha5M7g
	rkMxHojcsXNP9mFXSVUT58Tjnpl16Mvrp2/Rd7uQghRHMdTCJkN6A==
X-Received: by 2002:a05:600c:4e56:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-499c19d5cf2mr246854285e9.14.1787591403401;
        Mon, 24 Aug 2026 10:10:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f? ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d634b780sm2366515e9.6.2026.08.24.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:10:00 -0700 (PDT)
Message-ID: <e9f73756611edc1054571655ff5ee041e71bb515.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>, "rs@ti.com" <rs@ti.com>
Date: Mon, 24 Aug 2026 18:10:00 +0100
In-Reply-To: <aoxfc-dRzSygEkAb@navimatix.de>
References: 
	<ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
	 <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
	 <AS8PR10MB50735EBE95086FAA8CE99FEBFDA02@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
	 <aoxfc-dRzSygEkAb@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244144

On Mon, 2026-08-24 at 17:17 +0200, J=C3=B6rg Sommer via lists.openembedded.=
org wrote:
> Marko, Peter schrieb am Mo 24. Aug, 13:11 (+0000):
> > [You don't often get email from peter.marko@siemens.com. Learn why this=
 is important at https://aka.ms/LearnAboutSenderIdentification=C2=A0]
> >=20
> > systemd recipe has:
> > REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> > So the changes in systemd recipe can be made unconditional.
>=20
> I can update the commit, but with the current version, if someone doesn't
> like the bin-merge he can revert it and stay with usr-merge only.
>=20
> But does really someone want this? Maybe somewhen systemd will require th=
e
> bin-merge, too.
>=20
> Any votes for or against hard-coding bin-merge?

I have wondered about changing the sdk layout (i.e. nativesdk) to merge
all the bin directories. That should really be independent of any of
the target layout/sysroot options.

I'm not sure where the patch would stand with regard to that...

Cheers,

Richard

