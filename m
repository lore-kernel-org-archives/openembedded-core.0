Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEF2CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 10:25:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.72293.1756802254253504871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 01:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IwJf/K1k;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso18518405e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756802253; x=1757407053; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Dmd7dPzmeN/vUb2SPNdq5YAp0+ouCR60w2KxVI/bn0=;
        b=IwJf/K1kljBH2qNIRPPvuTh/0IvDYAklRA7gbjBvOjOLVp9OhFo3d6UJntvQ8kiVke
         OtA5Kun8PzmLAO5fhwE4t8HGnCVc3lQdSVl+jNW6dZZp+h2Ajc4voBU8GGjwoXzaEdOi
         ypAcfcdHu2IoXstaiyXahszDKgSsx7MmUdXJHb3JuJ+iCKW5BWwSkkgqLn8YC0kWOVoq
         659wg6Cx4L+ShHeSBHOrwW0rd0Y0/b/ZZBqCplicfv6kT+T82RfqYkm+C8gF3UyH8Qa0
         d1wysUY9PbwUoRv57YE6r5mXhlZHzE3CimdYKQWjE2jsugi/Km6xQa1HSSYWnJ/lmw6v
         y4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802253; x=1757407053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Dmd7dPzmeN/vUb2SPNdq5YAp0+ouCR60w2KxVI/bn0=;
        b=CMvJTSXqSiklapsQJtpFhbVcZXzWTTVvaNfF/GzpawvAJhN6CjMaajWwzhNplTAlgb
         sWSsK/gZjlT2y5XKKGjursRl3rHYssqD2g9SHBUlM+T+MghLmiAPnE0G8smPil7UUr8e
         uwLuIn4mv4pAhpMq2feP1aHLhLjtaPrHmh/ZpOrBYXmE/z9rfVHxrIl0fAVQTlHfgc4w
         XQiS/sRBhs9a918LdYffkJVYHrm+wrnARUQiqP09+HEOsykbgIXMJNJufi4kRuAM3Vcm
         uLYj0GSvWj+FVOw/z+bE8E1iK5S6kF2wm77ymCzMqi3CYUCY6lbdZ/jxh/6ecjkcsuKt
         IBiA==
X-Gm-Message-State: AOJu0Ywy5HKejk9slchPIx3ioedEjQmj/zZZeYcwKmjtWyTHRdXmasaN
	XzG1u2UBOBtT11dvRo+AEg1pnVvNTGclqxKxKxM56mI1NABDQoYJ/JiSrvbHVg==
X-Gm-Gg: ASbGncvxwwmskPnZr6rMvocPqqCfWFJ1bwlB0OLGrIoO02Rp4EFrKGtGdPGYxIjMi3Z
	+GZDYm1gJYpUlNJdRLqY9J4TYYgxurjGq0EyPU8I8K0WWwMMJrF6kD+yScIQCMrmKorAZ8t8hcB
	mm1HVxrl+JN+li7hPrI3C1CWQJglXuTReeKmFR9TnJFjQLUMIFfC748Q4yFd8RK9ZX+xxudNfGu
	yWg9eZ4KyVOl6yxXMwcK1POMLhLBqFbRnksN2u420H4Uj+7trYGw0NPgHGK4Fi2oW5C6LAcJLq+
	3ENYV5E7io+cKg4BODmilw10eecFfUGnbop/RKJqomPlGGa4PcZ9UleT0HxpYBeZ2kEMhVBIBid
	iSEIqaYEN9uowmvYFEsss0t/5Ia9mVndvXjTquCi/arv4aCgGzQPslNTqB7aM
X-Google-Smtp-Source: AGHT+IGF1KVcoKHXSTxWkP+mSba37B0OfNgE3f6wGwMr1j43Vkw22bcbgiaZGsrwqE+rwoZHQp3bxQ==
X-Received: by 2002:a05:6402:34c1:b0:61c:d457:e559 with SMTP id 4fb4d7f45d1cf-61d26c3fb81mr10329178a12.23.1756801769334;
        Tue, 02 Sep 2025 01:29:29 -0700 (PDT)
Received: from archlinux (77.241.136.27.bredband.3.dk. [77.241.136.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc20f344sm9048707a12.12.2025.09.02.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 01:29:28 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:29:30 +0200
From: Frede Braendstrup <frederikbraendstrup@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH] fix: use pkgconf instead of pkg-config
Message-ID: <v35ken4iqoico42so2cxcligxiinng5u2k5k3ucio53xgcd2v4@bmrrl5bgiegm>
References: <20250829114713.1577609-2-frederikbraendstrup@gmail.com>
 <3E66023C-C680-49BB-AE29-38D4623AA29D@arm.com>
MIME-Version: 1.0
In-Reply-To: <3E66023C-C680-49BB-AE29-38D4623AA29D@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 10:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222723

On Mon, Sep 01, 2025 at 05:01:31PM +0000, Ross Burton wrote:
> On 29 Aug 2025, at 12:47, Frederik Brændstrup via lists.yoctoproject.org <frederikbraendstrup=gmail.com@lists.yoctoproject.org> wrote:
> > 
> > As a preface, I know this is probably a bit of an aggressive move. But
> > pkg-config doesn't build on newer GCC and Clang compilers due to a lot
> > of hardening. The old K&R style C code is deprecated and cannot compile
> > in the gcc default mode.
> > 
> > pkgconf is a modern and compatible (although not necessarily bug
> > compatible) alternative that is maintained, and has more features
> > that are not available in the old pkg-config. I've been using this patch
> > for a while now, and it has worked flawlessly.
> > 
> > Signed-off-by: Frede Braendstrup <frederikbraendstrup@gmail.com>
> 
> First, I’m 100% on board with this.  But the last time I did a test build with pkg-config vs pkgconf there were some differences in the output.
> 
> Have you done a world build with and without this change, and verified that the output is identical?
> 
> Also, this should go to openembedded-core@lists.openembedded.org <mailto:openembedded-core@lists.openembedded.org> so can you follow-up on there?
> 
> Thanks,
> Ross
>

Hi Ross

I must admit, that I've only experimented with this in my own
embedded projects, so there's not really much evidence that this "just
works". The issue I ran into, which was fixed by this, was that
pkg-config just didn't build on modern compilers as I wrote initially.

I'm willing to put in some time to making this work though, but I will
probably need some guidance in respect to what level of similarity we
need and how to verify it properly. Currently I just know that all of 
the recipes I've built produce a binary, but I haven't given much 
thought to binary equivalence.

I'll start by kicking off a world build, and seeing where that goes.

/Frede

