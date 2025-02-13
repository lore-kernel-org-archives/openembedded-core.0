Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C577C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:16:42 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.13422.1739459795345428779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tj7ByHbr;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e660740061so4638726d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739459794; x=1740064594; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxqK7KWrx2+/FH9htGeIxaPfkYNNLoKCRSkpX25BWfw=;
        b=Tj7ByHbraHcZr5BLECqSVUEDR4bvWlSD/KBIfy8JTFlUrxQA7VlBmWKUJLRodUHiir
         ihBXWsI9JMFU2B3XSd7/dGOw7HWwOZgnTOreUyU1mZmTXhic2Ai0MQGSFJZMUZStYfVD
         7mgNcPZGCECnPtFLp9jgdpB9eEtn9fORhPOMfbedcMHuqHIENkgZ2u1sUyQe9hrlLb9y
         oEDgDneU/CY6OGtiU29xhVZqnPOOyFYNwdVPi8soIBbhAO0hCBE87BP0X4o9/h9TQW6P
         E6UqufWrxiCer4ZJCEJeaVMNjEfUQqp0ZvQk+jbt2yUMPiN2DUnasVsLISnHlWPIXiTm
         OiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459794; x=1740064594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxqK7KWrx2+/FH9htGeIxaPfkYNNLoKCRSkpX25BWfw=;
        b=CjPy+BSPOdZLfKkr2+/a5SaMAa5CN5pNT8OPypxvQhVFDjOO3PHRH4ny+Z9zPtmvgF
         2zfh1naf2ndqYOQpio8JLvKC925HrdltNjE1drohtvaACrajis0abYLuJpNY31kdvuu2
         bdd5nFDYqjzneyDy940ErIaxBvNlf3oHaI8TyBXP184b3FSB4kiC9mlQEx2zPV07sOs+
         hzR7EpI444C3UZpetcmIlZvunP+z3DzIe5PiSjmqHZyZA41fNDXS8SSl3mh00PM5Q64f
         Ag6sb3lGFI63ggBMnv5loAAuUReeurBoTOx0iYsJsFgH/nZPUko+KdVpSHW9YhjIhDJZ
         p7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWsVna2i7iD9jjKbEeL0vkzXLnb4h5sAjAg3ZuNWhvAsm51xWKooZZIHKneQBgVJCL9/radGl7k7ruHwewbj9qmLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3YgmHmwCKt1VecubjmqNPKcBalen9iwhfgVpPS3eirsVPqkVu
	D0SPpUqiC8ukDahWZ2eH4uDqW6IgFErs+9w72XboRO+e3JD8vUo+uhQKjVHsANjH6kntnLYMSaX
	+yDQCIpsioSDopnGfsYHuxHS+DaQ=
X-Gm-Gg: ASbGncsErO6QKqFT+4BcAgS0EE5pWipt5Y7V8cla7fmZiIhziaG2kq/CicVQNlXFHUz
	SqkhoCOcsJXUG859T+NxFwokYVJg8aLJ/kj4/S/m4Az+ZhNrnY04ULDggz69G6zFu5o6AWkObUR
	l9iD/Q7l90hJdbVx690wLf22a7tMevPH8=
X-Google-Smtp-Source: AGHT+IHoc+/2rNT1AQ8w1Rm3xEyQA8qeqwFFtNXeBso7DX22owRR1z6UKCzipJylG4TbKKohU5Sw3NlxdXQVa5q1K/I=
X-Received: by 2002:a05:6214:501d:b0:6e6:61a5:aa4c with SMTP id
 6a1803df08f44-6e661a5ac10mr21475176d6.31.1739459794387; Thu, 13 Feb 2025
 07:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20250212043532.1258912-1-zboszor@gmail.com> <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
 <1823CA649EDDAA06.9844@lists.openembedded.org> <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
 <aaee021d000c6419c813d9b095f3e092aec15a72.camel@linuxfoundation.org> <3cd9d088-f691-4252-88d9-74fbd6ef80eb@gmail.com>
In-Reply-To: <3cd9d088-f691-4252-88d9-74fbd6ef80eb@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2025 16:16:22 +0100
X-Gm-Features: AWEUYZmnJA8XpXjTyZs2DBVjacXqlmRsoC3mN2v3g2-j-NaTboNZ406C6eVpA-0
Message-ID: <CANNYZj_-7X7bbXwX0hcj68R7z7YqaFQ=5gwZKE3dQiGpubaMqg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211347

Generally it's best to resend the whole patchset, as sending
individual follow up patches doesn't scale for maintainers, they can
easily lose track of how to combine everything into a non-broken set
of commits if many people start sending partial patches at the same
time.

Alex

On Thu, 13 Feb 2025 at 16:14, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2025. 02. 13. 16:06 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > On Thu, 2025-02-13 at 15:43 +0100, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n wrote:
> >> 2025. 02. 13. 15:20 keltez=C3=A9ssel, Zoltan Boszormenyi via
> >> lists.openembedded.org =C3=ADrta:
> >>> 2025. 02. 13. 14:36 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta=
:
> >>>> On Wed Feb 12, 2025 at 5:35 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi wrote:
> >>>>> This ships a crypto policy file for rpm-sequoia.
> >>>>>
> >>>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> >>>>> ---
> >>>> Hi Zolt=C3=A1n,
> >>>>
> >>>> I believe we have a new issue with this version:
> >>>>
> >>>>> python/build-crypto-policies.py --reloadcmds policies output
> >>>>> /tmp/tmpqvyryz80: line 5: Bad configuration option:
> >>>>> pubkeyacceptedalgorithms
> >>>>> /tmp/tmpqvyryz80: line 6: Bad configuration option:
> >>>>> hostbasedacceptedalgorithms
> >>>>> /tmp/tmpqvyryz80: line 8: Bad configuration option:
> >>>>> requiredrsasize
> >>>>> /tmp/tmpqvyryz80: terminating, 3 bad configuration options
> >>>>> There is an error in OpenSSH server generated policy
> >>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1=
027/steps/11/logs/stdio
> >>>>
> >>>>
> >>>>
> >>>> Can you have a look at this error please?
> >>> I tested the recipe on Fedora 41 with:
> >>> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
> >>> * faking uninstalling it by renaming /usr/bin/nss-policy-check
> >>>
> >>> Both worked.
> >>>
> >>> Some of your build hosts where nss was not installed complained
> >>> about executing nss-policy-check unconditionally, which is now
> >>> fixed.
> >>>
> >>> I think this is on a build host with a very old nss version
> >>> installed.
> >>> Can you uninstall it?
> >> I found an alternative solution but it involves patching out
> >> most of the policy generators:
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> $ git diff python/policygenerators/__init__.py
> >> diff --git a/python/policygenerators/__init__.py
> >> b/python/policygenerators/__init__.py
> >> index 0e3013e..180fb2a 100644
> >> --- a/python/policygenerators/__init__.py
> >> +++ b/python/policygenerators/__init__.py
> >> @@ -3,34 +3,8 @@
> >>    # Copyright (c) 2019 Red Hat, Inc.
> >>    # Copyright (c) 2019 Tom=C3=A1=C5=A1 Mr=C3=A1z <tmraz@fedoraproject=
.org>
> >>
> >> -from .bind import BindGenerator
> >> -from .gnutls import GnuTLSGenerator
> >> -from .java import JavaGenerator
> >> -from .krb5 import KRB5Generator
> >> -from .libreswan import LibreswanGenerator
> >> -from .libssh import LibsshGenerator
> >> -from .nss import NSSGenerator
> >> -from .openssh import OpenSSHClientGenerator, OpenSSHServerGenerator
> >> -from .openssl import (
> >> -    OpenSSLConfigGenerator,
> >> -    OpenSSLFIPSGenerator,
> >> -    OpenSSLGenerator,
> >> -)
> >> -from .sequoia import RPMSequoiaGenerator, SequoiaGenerator
> >> +from .sequoia import RPMSequoiaGenerator
> >>
> >>    __all__ =3D [
> >> -    'BindGenerator',
> >> -    'GnuTLSGenerator',
> >> -    'JavaGenerator',
> >> -    'KRB5Generator',
> >> -    'LibreswanGenerator',
> >> -    'LibsshGenerator',
> >> -    'NSSGenerator',
> >> -    'OpenSSHClientGenerator',
> >> -    'OpenSSHServerGenerator',
> >> -    'OpenSSLConfigGenerator',
> >> -    'OpenSSLFIPSGenerator',
> >> -    'OpenSSLGenerator',
> >>        'RPMSequoiaGenerator',
> >> -    'SequoiaGenerator',
> >>    ]
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> That should work with this old nss version according to
> >> the log.do_compile output.
> >>
> >> I can't see an easy way to make these imports and list conditional,
> >> so the patch would be "Upstream-Status: Inappropriate".
> >>
> >> Since it should only happen for the native build, the patch can be
> >>
> >> SRC_URI:append:class-native =3D "..."
> >>
> >> As far as I know, /usr/bin is filtered from target builds but not
> >> from native builds.
> > We only allow access to things from HOSTTOOLS, nothing else is meant to
> > be used, even for native builds.
>
> As I wrote, I misdiagnosed it. There's no problem with nss-policy-check.
>
> Does HOSTTOOLS include /usr/bin/ssh and /usr/bin/sshd?
> Because the test_config() class method only fails for openssh and openssh=
server.
> They can be ignored with an envvar.
>

