Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A3F73610A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:44:31 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n17so7239288qtv.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h0iTcFz2awIRAgACqp6aoKB6lpsDgmHNay2hvAsBANY=;
	b=Ozv5fyWkpVgc2niIMt+k6jD7tT0dZoj/cV9ScA3JJIEIgqOD5XK9ilUTE+nxgNyhh8
	RHpRMU80wrUEMbN+UUTJ1FqYxDa7Qt41VjsXKucFPVVwgorMqzBu/eRFxPyepj39fwsf
	VT0IbS8lHXU4tBpjfF+icDnY+7+AIEHcZTUTJG23ISA0mEnXrNHgE1xJiF2GW5yxXwE5
	4cHbbOoMxrqbl4W/cXnK8392pwmfVz8PDPLrJqLM9vMtIzik08nAK7as50NHxZ2nQNJB
	xOW6xIoe06ZbV32lndo81o2xJqaDz8Tkb8z+6lZdIzWT9ikbm3TDeQsOJWHM5VZwLsyF
	Kqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h0iTcFz2awIRAgACqp6aoKB6lpsDgmHNay2hvAsBANY=;
	b=Fz168gBRJyGMg18agpX8TV0pdfb5P5S+QWFvsnZMZMA4UWEBscFK3SaNlhHPcfuwa9
	eJXHp5x8qmItFGxtfCrTLf+rGEN0P7oBJrzSFaHVP3mHt9VY27UkyEoWa5k1QS21BlEI
	AD6WrRgnJcwLmFYQUZ1KqkEmFxrOejx/OhbgQ76oBYu3GTI99c1R2f2QvtnWlTv8xui7
	kezCIlRicvq3pO/GXciegRa6tpIqX7Aaemk7uhuVxhuArY9O/c+ABdfxC1QrK3zRE7ei
	G0QYwzELYQrMHh8hArAuAnKOf7Cvnm0VdvtY/9gYhkzkqmmmObmG+u5gGYF5mBqApBHF
	7wDQ==
X-Gm-Message-State: APjAAAUukMhRCU4xdiuCMpo2Gikn/feh4m6lAEF6jYOb6CYXIWqQymHg
	xeFQDCh5/WMaz9fZAS/2e+ytIZBUCTTBWfU6BcDSxD11VHU=
X-Google-Smtp-Source: APXvYqwXMTlIzZYAkQ1Pm4ur0ceXDIMDUznrq8q3fa8BfkQo7irXEWLZWx0Het4fDUdVEVbWl1pTKvPbYLW2k5MriOY=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr3037962qtn.378.1581695072065; 
	Fri, 14 Feb 2020 07:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sqnFuCbDiRZi9=Cok9+9_+coVb8U6ot+CKSrD60rcp_hQ@mail.gmail.com>
	<5ba479f630c8dbfb0516ee9a960acfab4fa0d4f5.camel@linuxfoundation.org>
In-Reply-To: <5ba479f630c8dbfb0516ee9a960acfab4fa0d4f5.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 07:44:04 -0800
Message-ID: <CAMKF1srVRQXgHTxjOp9ZDmR=dcip9BjJXOakUHdWF8sBUmhBQQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Handle races between binaries and their libs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2020 15:44:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 6:51 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-02-14 at 06:46 -0800, Khem Raj wrote:
> > On Fri, Feb 14, 2020 at 5:03 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > There is a long standing issue where a binary could be installed
> > > into the
> > > sysroot before its library dependencies. We've always argued
> > > nothing should
> > > use the binary until its been installed by a dependency but there
> > > are issues
> > > around binaries which conflict with the host system, for example
> > > patch,
> > > python3, gzip and more.
> > >
> > > With the recent patch changes we've see issues like:
> > > ERROR: gdb-cross-canadian-powerpc-8.3.1-r0 do_patch: Command Error:
> > > 'quilt --quiltrc /home/pokybuild/yocto-
> > > worker/qemuppc/build/build/tmp/work/x86_64-nativesdk-pokysdk-
> > > linux/gdb-cross-canadian-powerpc/8.3.1-r0/recipe-sysroot-
> > > native/etc/quiltrc push' exited with 0  Output:
> > > Applying patch 0009-Change-order-of-CFLAGS.patch
> > > patch: /lib64/libattr.so.1: version `ATTR_1.3' not found (required
> > > by patch)
> > > Patch 0009-Change-order-of-CFLAGS.patch does not apply (enforce
> > > with -f)
> > >
> > > which is a symptom of this issue (libattr-native is a dependency of
> > > patch-native).
> > >
> >
> > ah so this was the problem I wondered
>
> Its one problem we're seeing, I'm still not sure those two other
> patches of yours apply cleanly though... :/
>

I have resent the patches for musl upgrade using git send-mail instead
of ./scripts/send-pull-request, can you try these from mailing list ?

> Cheers,
>
> Richard
>

