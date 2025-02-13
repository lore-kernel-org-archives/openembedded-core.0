Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A88CC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:17:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.13436.1739459825256242509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XjSpJzqV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43956fcd608so6753005e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739459823; x=1740064623; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GD6zUhvSTIhebTqWySOV8EPwAlb285T7LoN6RM2Ue5g=;
        b=XjSpJzqViy1mSpxDa86TZlMsEgR2VUfWRRmNO3zM8kvPIED9jcqtHlNAvYgRpRBBu1
         IgmqeNP9nZ//cQ3hdBt/r28Ay+vSSu9bqioG24sSJQ3NKFX+ahhvFR+J8qBQBRgl07pJ
         yfRDFMCXyE7ID9nXydOKKapoTwEPcm6yFr4lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459823; x=1740064623;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GD6zUhvSTIhebTqWySOV8EPwAlb285T7LoN6RM2Ue5g=;
        b=KHcYJaGctJATcCE9VREouguy/La3b3Mo5QQPESKyM1B74P9KRxhYi15u/eMFvaSsKW
         V54Yv8+N4cmnN/7Hf9q9GGATg1FlRiZWJo9Qk/oJP9eHRO2VP36G11CqfJHqR09arVXX
         PXSSKbBXj0uMw9r/8JYwOWTcSGTWErY01tKgw/EcqjXA5VsXWXjJ91dMWnb59mtHIa1r
         C8kc2B36glHYkLDWBUCB2Z8DgnIptGd4Cy98EuHdYox4wd5WT5lTPmSlz2K4JqxGiqe4
         PYKuye4+zSETZbFRIYbuaJDav+WTLl0PG7tjvwkTPk8KcTo9q1fTQah0kTKeL0ATD0wx
         Ch6A==
X-Forwarded-Encrypted: i=1; AJvYcCU8QoCdDta7kZQi9yQ9jWEjnNiupmpRqmXH+8Wy05yk1KLMfJVrT2xDjYmQlp+0Udi69P9m/9GtdgOC+/dX6GlllQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1UzZO6SmDujyhOgayfaTw+NgmYhmV7foaX+pkQjjMb/HIKAl0
	YdSa0nY9jWqxsTAPB8F+mdIxrLPgHdNgrltV+Me+pOZUife1R/8ikvBXWgJJzu4=
X-Gm-Gg: ASbGnctZZs7wDZsNu5q1Deii6BfIU+CINt566XEzSuJQ5uxSppoEAICpU4gpdfX33Tu
	YeSG8Eds2PenuAzC0Z/B0eIGN1DoJZEfO8umiQkrNVD/CfDuruajB1QWIWdYtJTLNMMSELQKUkl
	YTvJABSq4G1jTqNRvIEzj/P9hl7MuIDRgwY5+qGZedlegfBpNVgotct17GUZzNce87Rrvpka5d8
	xRSHQ418pJyg2IjwJPd4pgiz2BlocrADyGFfT5GxBwZJ8Q33Yy0Brjj1K45NW3Llvnfghl9QkR2
	vsJbk1zRsROny/brApBK0xwOCoMSwI2JWCitg36XfbmKymTxHN6PzOws+IhELIEB7dWwwY8HyeP
	EShj0
X-Google-Smtp-Source: AGHT+IHyBfLxOLOfmtHgAzrYtDc1Q+1n7iNbYv0EJJnSSyf5ovgUlQnTef++zR6+clcLcBwmGd3ZTQ==
X-Received: by 2002:a05:6000:1848:b0:38d:e334:972c with SMTP id ffacd0b85a97d-38dea2568a6mr7977290f8f.3.1739459822302;
        Thu, 13 Feb 2025 07:17:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e? ([2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5f4fsm2145174f8f.78.2025.02.13.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:17:01 -0800 (PST)
Message-ID: <a1e329d6ecdc83b16c2fc9d92122829d55f914b8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2025 15:17:01 +0000
In-Reply-To: <3cd9d088-f691-4252-88d9-74fbd6ef80eb@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
	 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
	 <1823CA649EDDAA06.9844@lists.openembedded.org>
	 <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
	 <aaee021d000c6419c813d9b095f3e092aec15a72.camel@linuxfoundation.org>
	 <3cd9d088-f691-4252-88d9-74fbd6ef80eb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211348

On Thu, 2025-02-13 at 16:14 +0100, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> 2025. 02. 13. 16:06 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > On Thu, 2025-02-13 at 15:43 +0100, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n wrote:
> > > 2025. 02. 13. 15:20 keltez=C3=A9ssel, Zoltan Boszormenyi via
> > > lists.openembedded.org =C3=ADrta:
> > > > 2025. 02. 13. 14:36 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADr=
ta:
> > > > > On Wed Feb 12, 2025 at 5:35 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=
=C3=A9nyi wrote:
> > > > > > This ships a crypto policy file for rpm-sequoia.
> > > > > >=20
> > > > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@=
gmail.com>
> > > > > > ---
> > > > > Hi Zolt=C3=A1n,
> > > > >=20
> > > > > I believe we have a new issue with this version:
> > > > >=20
> > > > > > python/build-crypto-policies.py --reloadcmds policies
> > > > > > output
> > > > > > /tmp/tmpqvyryz80: line 5: Bad configuration option:
> > > > > > pubkeyacceptedalgorithms
> > > > > > /tmp/tmpqvyryz80: line 6: Bad configuration option:
> > > > > > hostbasedacceptedalgorithms
> > > > > > /tmp/tmpqvyryz80: line 8: Bad configuration option:
> > > > > > requiredrsasize
> > > > > > /tmp/tmpqvyryz80: terminating, 3 bad configuration options
> > > > > > There is an error in OpenSSH server generated policy
> > > > > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/build=
s/1027/steps/11/logs/stdio
> > > > > =C2=A0=20
> > > > >=20
> > > > >=20
> > > > > Can you have a look at this error please?
> > > > I tested the recipe on Fedora 41 with:
> > > > * nss 3.107.0 installed with /usr/bin/nss-policy-check present,
> > > > and
> > > > * faking uninstalling it by renaming /usr/bin/nss-policy-check
> > > >=20
> > > > Both worked.
> > > >=20
> > > > Some of your build hosts where nss was not installed complained
> > > > about executing nss-policy-check unconditionally, which is now
> > > > fixed.
> > > >=20
> > > > I think this is on a build host with a very old nss version
> > > > installed.
> > > > Can you uninstall it?
> > > I found an alternative solution but it involves patching out
> > > most of the policy generators:
> > >=20
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > $ git diff python/policygenerators/__init__.py
> > > diff --git a/python/policygenerators/__init__.py
> > > b/python/policygenerators/__init__.py
> > > index 0e3013e..180fb2a 100644
> > > --- a/python/policygenerators/__init__.py
> > > +++ b/python/policygenerators/__init__.py
> > > @@ -3,34 +3,8 @@
> > > =C2=A0=C2=A0=C2=A0# Copyright (c) 2019 Red Hat, Inc.
> > > =C2=A0=C2=A0=C2=A0# Copyright (c) 2019 Tom=C3=A1=C5=A1 Mr=C3=A1z <tmr=
az@fedoraproject.org>
> > >=20
> > > -from .bind import BindGenerator
> > > -from .gnutls import GnuTLSGenerator
> > > -from .java import JavaGenerator
> > > -from .krb5 import KRB5Generator
> > > -from .libreswan import LibreswanGenerator
> > > -from .libssh import LibsshGenerator
> > > -from .nss import NSSGenerator
> > > -from .openssh import OpenSSHClientGenerator,
> > > OpenSSHServerGenerator
> > > -from .openssl import (
> > > -=C2=A0=C2=A0=C2=A0 OpenSSLConfigGenerator,
> > > -=C2=A0=C2=A0=C2=A0 OpenSSLFIPSGenerator,
> > > -=C2=A0=C2=A0=C2=A0 OpenSSLGenerator,
> > > -)
> > > -from .sequoia import RPMSequoiaGenerator, SequoiaGenerator
> > > +from .sequoia import RPMSequoiaGenerator
> > >=20
> > > =C2=A0=C2=A0=C2=A0__all__ =3D [
> > > -=C2=A0=C2=A0=C2=A0 'BindGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'GnuTLSGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'JavaGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'KRB5Generator',
> > > -=C2=A0=C2=A0=C2=A0 'LibreswanGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'LibsshGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'NSSGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'OpenSSHClientGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'OpenSSHServerGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'OpenSSLConfigGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'OpenSSLFIPSGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'OpenSSLGenerator',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RPMSequoiaGenerator',
> > > -=C2=A0=C2=A0=C2=A0 'SequoiaGenerator',
> > > =C2=A0=C2=A0=C2=A0]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >=20
> > > That should work with this old nss version according to
> > > the log.do_compile output.
> > >=20
> > > I can't see an easy way to make these imports and list
> > > conditional,
> > > so the patch would be "Upstream-Status: Inappropriate".
> > >=20
> > > Since it should only happen for the native build, the patch can
> > > be
> > >=20
> > > SRC_URI:append:class-native =3D "..."
> > >=20
> > > As far as I know, /usr/bin is filtered from target builds but not
> > > from native builds.
> > We only allow access to things from HOSTTOOLS, nothing else is
> > meant to
> > be used, even for native builds.
>=20
> As I wrote, I misdiagnosed it. There's no problem with nss-policy-
> check.
>=20
> Does HOSTTOOLS include /usr/bin/ssh and /usr/bin/sshd?
> Because the test_config() class method only fails for openssh and
> opensshserver.
> They can be ignored with an envvar.

Yes, those could be pulled in as we use them in qemu testing so we
should probably set the envvar...

Cheers,

Richard

