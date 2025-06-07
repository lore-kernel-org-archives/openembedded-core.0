Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC80DC5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 21:49:13 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.26936.1749332943683251660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 14:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i71samam;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2349f096605so37905275ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749332943; x=1749937743; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WqMAIQxqstM93bXyx2TyYnoJGO+EeZT1rfwn6xnofF8=;
        b=i71samamF60THvhKzgnCMDUu3tyqCxc+n3O/tDenEntJfQfq/GJuomays3lQdIuHJd
         ygnv2bjf7o0XXp80ysgN6JbGidmj0JZ7U1F9G1tQWBT+/Pzzf2JzYqOMyLy/7jItd5gU
         F5Fd6nUFGqg26yRhD1btg24yz8HMJQXCQc+/vRcSRPwuxQl8i/GJMcM5Ms4vIh3mepK1
         TQurRmb332aqS9Ua2fG+gpGSZR4vsYSIzE8oIiE1j38KoYNGsb5j+e0JhrwU2Msa5Z96
         /1pGIT4m4ySJNfWGi7aDHeAO+iF+PmyxgiDRSxzK58WV8X3WvRVHQkx0vvw1+5rwTRB9
         44MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749332943; x=1749937743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqMAIQxqstM93bXyx2TyYnoJGO+EeZT1rfwn6xnofF8=;
        b=OHOG+5VYL2z6udQHSlIh3/wheSlo8fiIycPpGV2DD/DnWuCC+OgZXigrm85LmRi82A
         Joneef39jNfOedxAHj7FNQZn7kItprxHPeoUtBR0Fq3GyHBmRys+E83W736LNC4uj7f6
         WtY0NTV++69TolmnJkI6b2n2Lnje4Gt5+D+G5+Rsm8bXf4A+zzuMebjt9h+eDaKz04sN
         BdcJwGcvV/xx6Lk6p5DKXkXyGznuD56fLeEFNPEiwrSTjxj32S9cDGYOJE3o+quSkXnZ
         GHFXlkKAZY40is8HdB2iAfRlbEyitVmRGaqP+3KLntoeXMOWT8oGcqwfaYCF9caHC6EK
         IOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXocseAt1YjQqTL86RM9jGGIkgrTfuCfjuo7CnpuH4MWeqBF+6D1OlzKkFH9n0kEVLULR1RLbPRnzuZ1b0hdNuRfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7czi/ZSvmG6BXP+DwKT9Ekxm/vsTWybdcutv+YAd2OyFJ3iQ5
	WObMQlecsC6GOjqYI6jqY+MttGVh4dOo7jHWiZ7Cnys974BLq/3UW9j+
X-Gm-Gg: ASbGncu+uwiq/Wl5fIoATEE3Jsa/2M6nRTX97kURBvLjZrNr8VkkDwm/Ixc7ob8kd02
	LC44TjApcer2Yu2CNSSQR5n5FM12iVD4KnBeRD5Ijs+lUY6p+j/WJpbq6hh4tAX/I3/TtSu3NCL
	+elS+NMPaTo9wUBYMhsbtaEtIYOYRboyBL6jIBRINbx61je6n2jJcJ3iTc/viHQ7SnIht3yFtPp
	3PNYiCbwxeOwZ9t1e+im5gpWLyyLpFV7K1Dzmi3HJxFJkXT7lv5ZedztvbllDubqQgvQ5O9ZpYh
	E5pFwNChDmS10LcAchXX8+3EqidntyV7kEe/DuboO5hPMFd32S4T8/e6FPsCDw==
X-Google-Smtp-Source: AGHT+IHroZUIc4jf76+oPdTHCKD8W7PcejdJb/cSi/RXIE8HOM3Y2uhNhGDPsO2kLBw0CckIVrVq4Q==
X-Received: by 2002:a17:902:e5ca:b0:235:f18f:2924 with SMTP id d9443c01a7336-23601d0705cmr130471535ad.15.1749332943027;
        Sat, 07 Jun 2025 14:49:03 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c2:b9de:b2a8:1ba7:3dec:719a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236035068f3sm31028675ad.236.2025.06.07.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 14:49:02 -0700 (PDT)
Date: Sat, 7 Jun 2025 18:48:59 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
Message-ID: <20250607214859.xtgkq6sirsvnweyo@hiago-nb>
References: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com>
 <440c4178-40b0-47c7-b7dc-1e0ee9cf65b0@gmail.com>
 <20250605194043.nzlanfitchaedeyb@hiago-nb>
 <CAMKF1srYrrHALtb3MzfdPKZOBv_Vc9CvDbK9oXv=bK+echkugg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1srYrrHALtb3MzfdPKZOBv_Vc9CvDbK9oXv=bK+echkugg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 21:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218206

On Thu, Jun 05, 2025 at 12:53:23PM -0700, Khem Raj wrote:
> On Thu, Jun 5, 2025 at 12:40 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > Hi Ross, Khem,
> >
> > On Thu, Jun 05, 2025 at 01:44:08PM +0000, Ross Burton wrote:
> > > On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > Currently the libgcrypt-native build is failing with the following
> > > > error:
> > > >
> > > > | ld: t_thread_local-t-thread-local.o: in function `main':
> > > > | t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
> > > > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'
> > > >
> > > > Backport the fix from upstream and add "-lpthread" to
> > > > "t_thread_local_CFLAGS" to make the compilation successfull, similar to
> > > > what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> > > > does.
> > >
> > > This has been merged but I’m curious: in what situations does this fail? The commit talks about NetBSD and we’re not seeing this on the autobuilder cluster.
> >
> > The NetBSD part is from the commit I backported, because I saw this was
> > fixed upstream. Looks they were the first to see this issue.
> >
> > I am not sure why the autobuilder was not able to catch it, we do
> > nightly builds of oe-core master with our hardware and the upgrade of
> > libgcrypt recipe introduced a regression were all our machines were
> > broken.
> >
> > I attached the do_compile log failure, but the issue happends here:
> >
> > build/tmp/hosttools/ld: t-thread-local.o: in function `main':
> > t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
> > /build/tmp/hosttools/ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'
> >
> 
> 
> My guess is that you are using glibc before pthread merge into libc.so
> which could be alma-8 distro or some such
> we do have alma-8 nodes on AB but I guess this escaped building on alma-8 hosts.
> 
> Whats your build distro  and version of glibc on it
> 

In this case we are using a custom distro, and an image based on
core-image.

For glibc, we use the one from oe-core:

$ bitbake-getvar -r virtual/libc --value PN
glibc
$ bitbake-getvar -r virtual/libc --value PV
2.41+git

[...]

Best Regards,
Hiago

