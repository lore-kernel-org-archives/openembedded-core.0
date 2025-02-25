Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA2C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:51:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.8206.1740491461782643216
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VbU+Eae4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f6287649eso4426105f8f.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 05:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740491460; x=1741096260; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ik8CT6ksvg6DgnR5p4gM7MbSGfDe01LRDMKGsTk5KO0=;
        b=VbU+Eae44wHMymDDeWowHPUXmzDxyqiq+2e7yIvvXrgDvCGaPaLAiqFWEF69S7Sdje
         vOhcVWcTzgG6KCD88f58SiLzaEoHEVwazJFa8tFX+jTlp3gCYvHqOizmXx1pVdPPQLH8
         LMGQ2qgzQjaetQ37kfHTFnoPpP38jWq8NxxLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740491460; x=1741096260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ik8CT6ksvg6DgnR5p4gM7MbSGfDe01LRDMKGsTk5KO0=;
        b=U11yUa/q8JvoQdAKrCgnOa9yYwHseCRl76meaeTyy9NBjE7+43UEPRilUEuS6t34Kd
         ezjWjH4v31tJqdfBo/tvfKpZIqBbicxnaWXY/RVoJhMLio/3SFEpQZsY4R34D3LpwQrM
         mKuV8KYuPJwlQKtoC9cNfObzvOsqi0/vvqhM5cKV9QnDToHRaxIjYauVLwJeaXK6GpfH
         SPxFtDZcF96lT9l6jb0LyCwJZW9jE/xJAHdAl030QLg6OVrRTDcnhShIEkp6SK4f9fDr
         lzUSdXwgBxxXzakpFjhivnGfDGbl6YQbEArhT8IvUuZ8aZXGbitefe/OiFRG+Art69M3
         ckRA==
X-Forwarded-Encrypted: i=1; AJvYcCUO7IwixZeJBEiqL8O68w6Or35wCTfIqwz+ANkZnx/L+TvERBTzDrpB2XDBUmcEMh1YsiZfZKOEcrWa2MOS+Af8gg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxT/AF6ZK6EetTWI+30mFe3NJ2mN6J4DWZFXPb+tzNRMcXEA5Uy
	aPWZwESOVxM+drGt+AH30lZFAD4vwUm74CqRd8R0WXSKlbUjbWLmepeTSTmRj44=
X-Gm-Gg: ASbGnctXaHevXwkIyjMGOMt9FMBxDxCoM/k2AUKbnEB1AG2/VqMLV2p7QWpYz1OHV01
	tE/okqu9zc4vLtLVI25pNwzBVlePxxa0c9wTkXsJZiF8SZitpV1qomT38Uu3A2dplsYLOtRg0eR
	uC6J8x/sTjzUYaO5LMJoOoYXjY/LlTx33jxWsoENsX+HUzJkHt+WShxR9rnXK77gPuUxqU7dIcy
	n0Ae8lbY2l4zo9yQu7XwwnkKb/xGKOAkF4IIgrFPu81von1CtxaisYhpBZTqwDMsd9pe2Iy/YwU
	YkWa07YDRcdvcWA2SChr+2v7uAIshbgtQv6zpFxmKeDG2oln333K7UXRF3mVQRPMEhBXB07Q6Z2
	VBRhRWkXofI4ew8M=
X-Google-Smtp-Source: AGHT+IEyfRWL4oVALnvePwaHiw+RyFQ1m2/jpVJKxAyyYSAUYsHT5hVnNN1JrffJ32vfo/wTOfM0rA==
X-Received: by 2002:a5d:5f8f:0:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-38f70799c53mr14208847f8f.15.1740491460123;
        Tue, 25 Feb 2025 05:51:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:92c7:7a17:f809:bc92? ([2001:8b0:aba:5f3c:92c7:7a17:f809:bc92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc8adsm2370743f8f.98.2025.02.25.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:50:59 -0800 (PST)
Message-ID: <4068132b7608c95c679e3ef1a9d876896273833f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: alex.kiernan@gmail.com, uvv.mail@gmail.com, Jon Mason
 <Jon.Mason@arm.com>,  Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>, Ross Burton <Ross.Burton@arm.com>, 
 "Openembedded-core@lists.openembedded.org"	
 <Openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2025 13:50:58 +0000
In-Reply-To: <Z722L5ZlyawC1clp@nuoska>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
	 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
	 <1825F47182B39BA0.23135@lists.openembedded.org>
	 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
	 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
	 <73881478fdd87961e0b3252ac973327874aeba80.camel@linuxfoundation.org>
	 <Z722L5ZlyawC1clp@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 13:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211879

On Tue, 2025-02-25 at 14:23 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, Feb 25, 2025 at 11:21:59AM +0000, Richard Purdie via lists.openem=
bedded.org wrote:
> > On Thu, 2025-02-20 at 16:03 +0000, Alex Kiernan via lists.openembedded.=
org wrote:
> > > On Thu, Feb 20, 2025 at 3:52=E2=80=AFPM Vyacheslav Yurkov via
> > > lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
> > > wrote:
> > > >=20
> > > > From meta/classes-recipe/rootfs-postcommands.bbclass:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 # 20:12 < mezcalero> koen: you have three =
options: a) run
> > > > systemd-machine-id-setup at install time, b) have / read-only and a=
n
> > > > empty file there (for stateless) and c) boot with / writable
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touch ${IMAGE_ROOT=
FS}${sysconfdir}/machine-id
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > >=20
> > > > We could think of further improvements. One thing that comes to min=
d is
> > > > changing systemd-systemctl-native to systemd-tools-native and enabl=
e the
> > > > build of systemd-machine-id-setup.
> > > >=20
> > > > Slava
> > > >=20
> > >=20
> > > I do know that it was a horrible thing to get right when I rewrote th=
e
> > > shell script in python (which I'm very glad to see the back of):
> > >=20
> > > =C2=A0=C2=A0=C2=A0 # If we populate the systemd links we also create =
/etc/machine-id, which
> > > =C2=A0=C2=A0=C2=A0 # allows systemd to boot with the filesystem read-=
only before generating
> > > =C2=A0=C2=A0=C2=A0 # a real value and then committing it back.
> > > =C2=A0=C2=A0=C2=A0 #
> > > =C2=A0=C2=A0=C2=A0 # For the stateless configuration, where /etc is g=
enerated at runtime
> > > =C2=A0=C2=A0=C2=A0 # (for example on a tmpfs), this script shouldn't =
run at all and we
> > > =C2=A0=C2=A0=C2=A0 # allow systemd to completely populate /etc.
> > >=20
> > > It may be that this behaviour was wrong in some cases, but at the sam=
e
> > > time, I remember spending a lot of time getting this right!
> >=20
> > I just wanted to add that we've been seeing an odd failure on meta-arm =
on the autobuilder:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1032
> >=20
> > and when I did into this, I see this in the logs:
> >=20
> > [=C2=A0=C2=A0=C2=A0 3.700441] systemd[1]: Hostname set to <sbsa-ref>.
> > [=C2=A0=C2=A0=C2=A0 3.704040] systemd[1]: System cannot boot: Missing /=
etc/machine-id and /etc is mounted read-only.
> > [=C2=A0=C2=A0=C2=A0 3.704488] systemd[1]: Booting up is supported only =
when:
> > [=C2=A0=C2=A0=C2=A0 3.705023] systemd[1]: 1) /etc/machine-id exists and=
 is populated.
> > [=C2=A0=C2=A0=C2=A0 3.705349] systemd[1]: 2) /etc/machine-id exists and=
 is empty.
> > [=C2=A0=C2=A0=C2=A0 3.705651] systemd[1]: 3) /etc/machine-id is missing=
 and /etc is writable.
> > [=C2=A0=C2=A0 10.206513] systemd[1]: Populated /etc with preset unit se=
ttings.
> > [=C2=A0=C2=A0 13.034155] systemd[1]: Queued start job for default targe=
t Graphical Interface.
> > [=C2=A0=C2=A0 13.149568] systemd[1]: Created slice Slice /system/getty.
> >=20
> > We therefore need to fix the issue with machine-id before we can merge
> > this patch. I will drop it from master-next in the meantime due to this
> > issue.
>=20
> I think option 2) should be simple. IMO this could also be done by image/=
rootfs
> classes or base-files when systemd is the init.
>=20
> Where is build https://autobuilder.yoctoproject.org/valkyrie/#/builders/7=
5/builds/1032
> adding "read-only-rootfs" to IMAGE_FEATURES?

It isn't a read only image, just that it seems the filesystem is
mounted ro at this point in the boot. Maybe timing related?

> The failures log from step 22, full log in
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1586278/raw_inl=
ine
> only shows issues with sshd server, which IMO is not installed to any of =
the
> built images.  The builds are IMO missing IMAGE_FEATURES +=3D "ssh-server=
-dropbear"
> which in meta-arm kas builds is set with ci/testimage.yml.

Those images do contain an ssh server, it just isn't taking connections
for some reason.


> Even the core-image-minimal tests are passing without any communication w=
ith
> target qemu machine:
>=20
> =C2=A0* ping.PingTest.test_ping with slirp pings localhost, not target ma=
chine
> =C2=A0* parselogs.ParseLogsTest.test_get_context doesn't talk with booted=
 qemu machine
>=20
> How to get to the qemu boot log which shows the systemd errors above?

I had to ssh into the autobuilder worker in question to obtain it
unfortunately.

> I don't see the connection between the systemd error and the build above.
> I could propose patches to the issues if I can figure out where :/

Ross was able to reproduce by including the patch in this thread,
building and then running testimage against core-image-sato/core-image-
weston. I'd note those tests are using slirp which may or may not be
related. The issue is therefore reproducible to some degree at least.

Cheers,

Richard



