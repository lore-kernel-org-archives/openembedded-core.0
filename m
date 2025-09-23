Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D841CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 09:03:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.12204.1758618189450783468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 02:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fd998exE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2318298f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758618187; x=1759222987; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0rgDnbvjx5qV+MCG6waMEhmPQ+BuVJkVjybhWDwAwoM=;
        b=Fd998exE/FMq1EIXNdvYzeS/4ynJblomiKevTyTC53ns4xnk4njJaVAat1R+woEgpH
         NwRydm9x1oTf3QyDj5l1RMzMtKSXiIdDqUoPrxP4Axiw4ET8ZQp4U6odDi87CYAL6qHC
         S2Dw/pkUnGcKLVttavpvC93xIKWg4J6oywsKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758618187; x=1759222987;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rgDnbvjx5qV+MCG6waMEhmPQ+BuVJkVjybhWDwAwoM=;
        b=R89EmDoaZaUDdECtmTc2OdjD+DeNxHmZGcVKU8G3+zQMWNIgoShBA3M7Swq6xHB0XE
         CWjoVlCCG6DmkX1A+8sTGvgkWhMifOKmlDLhAwo/ZIRoWVKq/PhhxM9olaCuWAkcPv59
         +akwZLfN+u6H5Lny0aSkBYKEGT2/lAhOBqb+yWazJK6QufSVgb20keNRlCvkCnmsFtkJ
         nZoVzhbXcY3RP8CAUCKqUeoTcqVQ0SEKO4HVWUAa/sKajsCvzYYPoQxabGv0iPJU8QWV
         /Ts0a+op8ovuQ7+GUDzRo/V38jaYlsjpXybaJrqkUzfQY/U9csIUB7HxROcPxMbQggd8
         k9uw==
X-Gm-Message-State: AOJu0Yy5P3gRwVrR1PjcEllFYvmeqgNQHTbLmr0qfGq00yoagmAD0zsf
	d34v0Sjgnsomu5ehGfORcKfcHY4FGFXCdRcGXpMHP/uX/k8ntiiuNKMMiaaQeUojd4s=
X-Gm-Gg: ASbGncvaFAjBKWoSuXznPU7q1LJXmuzlcxWGK1WDW6vuvkqcWgriLPq2sRqlBhFkOC2
	277nSqiBsgHxFm8isPole9DuZY3uiRwhtm1//u0CmfQDT7HwAkT5r3PeN9czDCjwoLLAAbBaPoT
	+oDJ5plsjlpdL/aapR6UQjV/JkoMU6EfvejQtki5182vBistCIAuzfkObFYJd0hLdWDJq3CFywr
	QtGnb4RU8CRTA+0rA5UOI7kOyNG57EHqInnLEo+8AsnRPK7TB8X+X6M+o4LKAdYgzwBpkS9hJx3
	6+ZNx2ZD0hiGgcgYnxQOt9QQjZXh4T5/gj/YFj39IFA1gp1MP1q0asKKTpmJZUGBn3U1I8Esq1H
	bJt4FNE1nCMDhoQUoTvDPda0pogWvmyRoyllJr/CBm7J1tAEshyhEtUKAyW3c38uLyPEF9GC8f8
	t+o/TnYRglvVk=
X-Google-Smtp-Source: AGHT+IH+XCs56mR3+/zE3cfMdhDGutymva+rsTJeqiIaDaz10GJ6sOM3SlGUJBpExhLYHD4zSHvRBg==
X-Received: by 2002:a5d:5f82:0:b0:3f5:453:77ea with SMTP id ffacd0b85a97d-405cc9ed248mr1322048f8f.58.1758618186843;
        Tue, 23 Sep 2025 02:03:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe09:3ae7:900c:f751? ([2001:8b0:aba:5f3c:fe09:3ae7:900c:f751])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1bc00695sm34363595e9.4.2025.09.23.02.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 02:03:06 -0700 (PDT)
Message-ID: <cee4b39698f8607acf3f396e06d94a713a66d134.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randolph Sapp <rs@ti.com>, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>, ross.burton@arm.com,
 alex@linutronix.de, 	otavio@ossystems.com.br, kexin.hao@windriver.com,
 afd@ti.com, detheridge@ti.com, 	denis@denix.org, reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org, vijayp@ti.com
Date: Tue, 23 Sep 2025 10:03:04 +0100
In-Reply-To: <DCZPMZBQPTOP.2OZDXN58O263N@ti.com>
References: <20250918214903.341452-1-rs@ti.com>
	 <DCYH5V5GB1LB.1KAPRIVKZGTWO@bootlin.com>
	 <1867B951D10D3F9C.23856@lists.openembedded.org>
	 <1867BAF5F353054B.23856@lists.openembedded.org>
	 <DCZPMZBQPTOP.2OZDXN58O263N@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223870

On Mon, 2025-09-22 at 18:16 -0500, Randolph Sapp wrote:
> On Mon Sep 22, 2025 at 5:21 PM CDT, Randolph Sapp via lists.openembedded.=
org wrote:
> > On Mon Sep 22, 2025 at 4:51 PM CDT, Randolph Sapp via lists.openembedde=
d.org wrote:
> > > On Sun Sep 21, 2025 at 7:25 AM CDT, Mathieu Dubois-Briand wrote:
> > > > On Thu Sep 18, 2025 at 11:48 PM CEST, rs wrote:
> > > > > From: Randolph Sapp <rs@ti.com>
> > > > >=20
> > > > > We've recently run into some issues with weston-init attempting t=
o start Weston
> > > > > prior to all drm devices being registered. There's not really a g=
ood, scriptable
> > > > > mechanism to listen in to device registration events that works w=
ith the
> > > > > existing weston-init package. Well, at least one that doesn't inv=
olve polling
> > > > > files or introducing more dependency on the init system being use=
d.
> > > > >=20
> > > > > I also see there is also a lot of scripting around starting X11,
> > > > > xserver-nodm-init, that (from my limited review) should experienc=
e the same
> > > > > issue.
> > > > >=20
> > > > > I'd like to introduce the following display manager for oe-core, =
emptty [1].
> > > > > This display manager is, as described upstream, a "Dead simple CL=
I Display
> > > > > Manager on TTY". It supports both x11 and wayland sessions, with =
togglable build
> > > > > parameters to completely remove x11 and pam dependencies. It's li=
censed MIT,
> > > > > which shouldn't be an issue for any users. (It is written in Go, =
if you have
> > > > > opinions about that.)
> > > > >=20
> > > > > With this, both weston-init and the xserver-nodm-init packages ca=
n be re-tuned
> > > > > to leverage this display manager and simply add a user and emptty=
 config for an
> > > > > autologin session. This can resolve the current behavior across i=
nit systems
> > > > > without additional scripting, and move some development out of th=
is layer.
> > > > >=20
> > > > > This lists myself as a maintainer of emptty as well as xserver-no=
dm-init and
> > > > > xuser-account since these are currently unassigned and I've rewor=
ked them
> > > > > significantly here.
> > > > >=20
> > > > > Sorry for the delay on this series. I found a few bugs in emptty =
that I wanted
> > > > > to address before submitting this officially.
> > > > >=20
> > > >=20
> > > > Hi Randolph,
> > > >=20
> > > > Thanks for your patch.
> > > >=20
> > > > I took this series, but it looks like we have a build issue, maybe =
only
> > > > with altcfg distro:
> > > >=20
> > > > Traceback (most recent call last):
> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib=
/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib=
/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib=
/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> > > > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> > > > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib=
/oeqa/runtime/cases/xorg.py", line 31, in test_xorg_running
> > > > =C2=A0=C2=A0=C2=A0 self.assertEqual(status, 0, msg=3Dmsg)
> > > > AssertionError: 1 !=3D 0 : Xorg does not appear to be running=C2=A0=
=C2=A0 PID USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSZ STAT COMMAND
> > > > ...
> > > > 2025/09/21 11:59:34 Closing PAM auth
> > > > 2025/09/21 11:59:34 Failure setting user credentials
> > > > 2025/09/21 11:59:34 Authentication failure
> > > > ...
> > > > RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.41s)
> > > >=20
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/=
2402
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2=
407
> > > >=20
> > > > Can you have a look at it please?
> > > >=20
> > > > Thanks,
> > > > Mathieu
> > >=20
> > > In the past auth issues can occur if the user was created after the c=
urrent
> > > system time (of which the default would be the kernel build time if i=
t is unable
> > > to get a value from NTP).
> > >=20
> > > I've already tested this series with an equivalent config to poky-alt=
cfg, with
> > > both root and rootless x11. I reset my cache and did another local bu=
ild to
> > > match that CICD failure and it still works for me.
> > >=20
> > > My local.conf for my test build was:
> > >=20
> > > MACHINE ??=3D "qemux86"
> > > DISTRO ??=3D "poky-altcfg"
> > > BBMULTICONFIG ?=3D ""
> > > IMAGE_CLASSES +=3D "testimage"
> > >=20
> > > Other variables were dictated by templateconf.cfg:
> > >=20
> > > meta-poky/conf/templates/default
> > >=20
> > > Is that automation setting anything that could possibly play with the=
 build time
> > > or system time values for the testimage? I'm not seeing anything in t=
he logs,
> > > but I'm also not seeing anything that reports the current config outr=
ight.
> > >=20
> > > I guess I should add some messages for that as part of the test funct=
ion
> > > regardless.
> >=20
> > Whoops, I see the issue now. v10 inbound.
>=20
> Well, I know what the issue is, but I guess I should ask how people want =
to
> address it. Currently, that test expect a root x11 instance to autostart.=
 I have
> it attempt to do that currently, and my old test images were being built =
with
> "empty-root-password allow-empty-password allow-root-login" features enab=
led,
> allowing it to proceed as usual. The password auth is what is currently f=
ailing.
>=20
> 1. We can do passwordless root auth for these by adjusting the pam rule f=
or
> emptty to allow auth as root for that application.
>=20
> 2. I would suggest that we instead make sure the root user is in the
> nopasswdlogin group, as it makes it clear that the user has unprotected G=
UI
> access.
>=20
> I'm not sure either of these should really be allowed in a production
> environment though. Technically we can disable this behavior outright whe=
n
> ROOTLESS_X is set, but it's still a little odd to me.
>=20
> 3. Should the test images explicitly enable the empty-root-password
> allow-empty-password? That means the x11 test will have to move from an
> arbitrary runtime test to something like the way locales are currently te=
sted.
>=20
> Seems like solution 2 is the easiest and preserves the expected behavior =
for
> that test, assuming people are okay with that behavior.

Ideally, we'd create a normal user and have the tests use that normal
user. The "root" based tests are historical and were done as testing
something was better than nothing. The world expects better security
practises and it would be good to ideally update the tests to better
match real world usage.

I say ideally since I appreciate it sometimes can be too much work but
in this case it might not be, I haven't dug into the details though and
I'm a bit distracted. I just thought that info might be helpful for
direction.

Cheers,

Richard


