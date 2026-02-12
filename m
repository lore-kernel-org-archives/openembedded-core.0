Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3715EEA86E
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 23:00:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58829.1770937232811871956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 15:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=emhNjYQZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso2672895e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 15:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770937231; x=1771542031; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XHiI61P0tUVR2orR1m4rJ+jc0cCwh2eg4rihgpkMmI=;
        b=emhNjYQZD3Bl5EyeJAMU1glo5QEGIGbexn1knYxRkE4Rb3I4t2o9PyGCIfBRq0pmJi
         0KgokCrFxKd1/PkOCXvt5P9jU1A7wJm684cBDdJazvpuXGnqPrX5FuA7hN5apVAXLYHL
         0rpoHclnNDQGEvIxDnYCbXxIVeHQcD8/oAmBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770937231; x=1771542031;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XHiI61P0tUVR2orR1m4rJ+jc0cCwh2eg4rihgpkMmI=;
        b=W+T8vRgZBl79Ed1BC9wz8ZPmVeansaCtv/8850L+Mv9e5GFP2swpunZVfZcLCT2gan
         etMFwVmuWZzA4+3/OiVcyZDVojoaIV2dlKlCFvSgRT0iXcw6YZ+luvd40kai/h/190tc
         LedWet6UzsqSXB7UFqdm2/A8/M3uL0l6eMQO78qxd1UE6z+EqlMBZxr9qRQGzrqEExyd
         489aiD72MKecm+vrWx6X2ABDwdVuq+HzX338M0QINP58FDri+5SJXIZulv+TUzxHEtGk
         1Dlh2h08Hhr2NgIP+PNulSznVydFXYj9tMBlWkumTgOatAGhWsMpr7h0SeIQcWgXOv6h
         Pwiw==
X-Forwarded-Encrypted: i=1; AJvYcCXnK2ekoUkAtJHcvPon4VuXw3GxYge+T3AoCx91Vj9CgcZTH6pn5IZc5EkLXUb82d03B0hvIKOoh9lpKha5CsTZHA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwGylJig6KWVfTVr+MIlV1uz+Zj33KLJx52Kvw8WTGiJQUBuZrB
	rLbT/BmoB+CkHiaUqyne4NOPf6Zw/VtmYdVd75dNGjLzhbPuEfIL68mjtLJnch4rUtM=
X-Gm-Gg: AZuq6aKKjLAL1ZPyxQGV+n+yam0YxmZRGd2LWqb+wNs+amj5kDCQwd8weTcnKsUnxBS
	GaC71yt44uD1MkiomfrP+2nMvWBjoeOslXFO8Q2ddUWd9YVXYdcCTDJK2stX/vStdT9adM1ztw8
	BbdrJOngX5MQ6fWSu95biMVuI5jYL9RPhVszWTEsv7ZmsTGX2/rlIZfV7CL7V6no5Sdkq1eQMxh
	gyBC2Me7Ci7erZd3ejYZhojIM3AxyZ/mlAbw6Ymt2hHryDRMpQY97lGppS5jU7DpvapOylh8YHV
	z4/mS7wvfkHnoezDV1xZmlg9T23E934h8scWmybhiYf8SbnpsNzKlRwyKoBmwkq9iM1JNPLpJUx
	X5OZbGDETwvm/dtDGsdT8SzScx/Bb0vGlF9/cH9QVbXMrW6ZxBi+aB0pkbpOWVskvLiqP6Qbllw
	PVDG5pwtprapFQeB70rMWx7b1nah/KoKEAskScJk2s+59dIZaPqIGWYmV9h1lMlvMBG7FJMLdLh
	52dbuZutN9qe5zel4bPZzU=
X-Received: by 2002:a05:600c:3b8b:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-4837104071fmr11587485e9.30.1770937231169;
        Thu, 12 Feb 2026 15:00:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb2e:ed0:9938:b670? ([2001:8b0:aba:5f3c:bb2e:ed0:9938:b670])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dfb4bd4sm157722075e9.7.2026.02.12.15.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 15:00:30 -0800 (PST)
Message-ID: <7b1f6dbbe4f5d46525b46d2099a9c4e5320df069.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randolph Sapp <rs@ti.com>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>, alex@linutronix.de, 
	otavio@ossystems.com.br, kexin.hao@windriver.com
Cc: afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com, 
	openembedded-core@lists.openembedded.org, vijayp@ti.com
Date: Thu, 12 Feb 2026 23:00:29 +0000
In-Reply-To: <DGDCOWXIISMT.3QVFP5TSU5QCN@ti.com>
References: <20260203012028.4008229-1-rs@ti.com>
	 <20260203012028.4008229-2-rs@ti.com>
	 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
	 <DGDCOWXIISMT.3QVFP5TSU5QCN@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 23:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231075

On Thu, 2026-02-12 at 16:52 -0600, Randolph Sapp wrote:
> On Thu Feb 12, 2026 at 10:45 AM CST, Mathieu Dubois-Briand wrote:
> > On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedded=
.org wrote:
> > > From: Randolph Sapp <rs@ti.com>
> > >=20
> > > Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
> > > relatively lightweight display manager that supports x11 as well as
> > > wayland through both a CLI and an automatic login mechanism.
> > >=20
> > > This can effectively replace the custom init scripts for both x11
> > > (xserver-nodm-init) and wayland (weston-init) with a single tool with
> > > more verbose logging capabilities.
> > >=20
> > > This is split into two recipes. The emptty package provides the binar=
y
> > > and various agnostic configs while the emptty-conf package provides t=
he
> > > default configuration for the application itself. This RPROVIDES
> > > virtual-emptty-conf, allowing other recipes to provide their own
> > > configurations to override the default behavior.
> > >=20
> > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > ---
> >=20
> > Hi Randolph,
> >=20
> > This patch has been in my branch for a week now, but we are seeing some
> > intermittent reproducibility issues.
> >=20
> > I opened a bugzilla entry by error, as for a second I thought this patc=
h
> > was merged, so details can be found here:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171
> >=20
> > Diffoscope output is here:
> > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-ssslv=
z6_/packages/diff-html/
> >=20
> > Can you have a look at what is going wrong please?
> >=20
> > Thanks,
> > Mathieu
>=20
> Hey Mathieu, I'm at a serious loss here. The only differences I see are f=
ile
> creation dates and intermediary archive sizes (normally only a difference=
 of 2-4
> blocks), which I assume are being changed by the creation dates as there =
are no
> content diffs reported. I don't have direct control over either of these
> components.
>=20
> I agree that this is an issue, but I have no idea what is expected from m=
e here.
> I see some weird workarounds using touch in xorg-minimal-fonts and e2fspr=
ogs,
> but from what I understand that should not be required.
>=20
> Shouldn't all packages get hit with the same SOURCE_DATE_EPOCH enforcemen=
t? One
> of those packages is literally just a single text file that is installed =
with:
>=20
> install -DZ res/conf -m 644 -T ${DESTDIR}/etc/${DISTFILE}/conf
>=20
> On top of that, a local "oe-selftest -r reproducible" doesn't seem capabl=
e of
> reproducing it. Are there any other logs you can share?

Those dates are probably controlled by SOURCE_DATE_EPOCH for the
recipe. That is probably not stable for some reason in all builds. Why,
I'm not sure but I thought I'd at least point where to look.

We pull SDE from different places depending on the type of sources and
so on.

Cheers,

Richard

