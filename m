Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26073C5B572
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 15:01:05 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8018.1787410854997498414
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 08:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BP3c+7Bd;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e65e18969so141537785a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787410854; x=1788015654; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=50FPVkwRcqPxEOcaxWQ7SJ3gwEe/T3s4nfJwM2QpXw8=;
        b=BP3c+7Bd4Y2lqaV83oX0F840OovsittYfMAwMC4Tq/pMF6HFR6uocZcVrEm83HMI5y
         F4mIZT5K1KggYKxq7rkMMdro8VWC2q5nPfqJWbB1W4MqYrx/JHQIqHKu8oi/5VHjevo5
         zLoPd8WQ8viwxJG93vB9NfrayACUKG8/SPY+CQ5yMMFLHSZ6y3yfb+lUS16RVP4i1SFw
         KcRLeWmtw+WDrwo5zqn6P4RV/RpgVx1IeS8LAdFdsmqXkfHL49M8+YPypFisS6mfDTUw
         kV6SPZMas1LPzCG1sMqNOsKnMJgSycy7G0UYAvdzzjYKKPiFLhzKZwrJfX+n4qsuugXv
         dOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787410854; x=1788015654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50FPVkwRcqPxEOcaxWQ7SJ3gwEe/T3s4nfJwM2QpXw8=;
        b=bpQF6RY31id9t4GgTZxaoUpBBuN1IcvtzeVnWRLntpXy9SsBumBbJBkR4CPKTPUc9K
         3Qx6UkIgP+TlrFE4uEHTGl67HHKi6OLvPwLaLcbTNGsabIb4GALHvLIy0DjB3fAVtB2d
         lNySnRkcLj3Sg8jngWRvyX8dyxL0G+I3krK38kKdLEcIGET/W/jKcoGAl+HV/5ncCfzs
         0mXHGUPcrXwJJ5UfqgzSp2c4gqTlr88zh+xbRq5RVv3pi/IyTAb0T2i7w0PPXDeGTmNr
         PZRTLSWi2ITUBDEaK09CWdvAINgxkY6C1WWXzqG6rhatgsM9w+abNkRLbheFrMfNSD7Y
         R7/w==
X-Forwarded-Encrypted: i=1; AHgh+Rokll/IudeaNK1ZfVY7xcfRn9eRl3jDnVSSqeR5u8UXkyK0Z+4Va5tyej5DxL1L6JbrHvBunKvLAQ71rUjP8evVkw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kbJFkAtE9UTxbRFTc/gkUnVXup9AilmKZ/aWIh5dRW1wyButEL
	mQc1q2FWL3VoiwUjpwjXQjrrVPbaEmKToE+esfRneRYMs5OwQDuFJTA/KaSpP937
X-Gm-Gg: AR+sD10sHuXSkdnmbrGjvlfCN7mrCCgsnVRCRtJ1BwkVocIHW+yRvl80GIf3FH/fA6k
	BjIjbIu6ks2VsdpZiwtoecDhVQUu0tYbOq+obfKf+xlSWJvzYz7mN9f+TMjWoB/n/okpTN3cCRM
	zVgXimLOerdR+cRhu6DcKBWd98t9zMZ68fgLvO97ydMhUS6m2ckYed+q3J1UWqEFyfLFJjC7k4Q
	STKKgVdOrvihyDk5f8pEasZorli2KRJaC2sEDV2CwimLxC/rwvIWGF/1QMggM7zcnATR02Us9fG
	G3yvzkZMheReEUvLSCHxlP9L8l0cn8PHTZab93yiaKsHIcgwit9B3EnFLtrp8CaijgTqe0gjX+B
	FAH4/sLEIlNpAKB7+ULoNgEPkSD+3g9qTx80lRplki2qkdpNJaanUp7rq2BGEtzrHMEhes3J15X
	jcIUjjNISvf9mXQoAbCKRS4uAoUgfXt1W2KBlunnlwJz/XWiKz1pk73dcorPLyVLhhzMqsfRsnB
	kqMUPOZyyIzr2Z+eTYfABGed1oZUtE=
X-Received: by 2002:a05:620a:6083:b0:930:9533:5e32 with SMTP id af79cd13be357-937283bae62mr2047108485a.7.1787410853682;
        Sat, 22 Aug 2026 08:00:53 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a5e82asm15592776d6.40.2026.08.22.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 08:00:52 -0700 (PDT)
Date: Sat, 22 Aug 2026 11:00:50 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alex.kanavin@gmail.com, paul@pbarker.dev,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa/sdk: update cryptodev to a
 revision that builds on kernel 6.18
Message-ID: <aom5olXslkDa44p8@localhost.localdomain>
References: <20260813030515.1028627-1-twoerner@gmail.com>
 <20260813030515.1028627-2-twoerner@gmail.com>
 <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
 <CANNYZj9SqJ8CdKO6MruFqJ1mx3=NMEyx9wovrTe_QOYyRNFQpw@mail.gmail.com>
 <597b689f434fa7eb1b763db08652e393f2f71d18.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <597b689f434fa7eb1b763db08652e393f2f71d18.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 15:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243988

On Mon 2026-08-17 @ 01:48:55 PM, Richard Purdie wrote:
> On Mon, 2026-08-17 at 12:51 +0200, Alexander Kanavin via lists.openembedded.org wrote:
> > On Sun, 16 Aug 2026 at 13:12, Paul Barker via lists.openembedded.org
> > <paul=pbarker.dev@lists.openembedded.org> wrote:
> > 
> > > I'm wondering why we haven't spotted this issue previously, we've been
> > > using Linux 6.18 for months now. Are we missing a test case?
> > 
> > I suspect it's because the execution of useful cases for sdk and image
> > runtimes tends to regress due to 'soft-skip', e.g. if a needed package
> > isn't present, the test isn't run. I don't think this is quite right,
> > and each particular image and sdk should check that particular tests
> > do run, and if they aren't, that's a fail in itself. I'm not yet sure
> > how to technically implement this.
> 
> I've worried about this for a while too.
> 
> We really need to mark up the images with the lists of tests we expect
> to pass. It is tricky as that list can vary depending on distro
> features and package classes but should be possible.

Agreed on the goal. Having gone through what the cases actually do, I
want to be careful about how much of it one mechanism can cover, because
the skips are not all the same shape.

Some are a stated requirement. cmake, gtk3, kmod, maturin, meson, perl
and python each name a package and skip when the SDK's manifest does not 
list it. Those are already machine-readable, and one narrow check on
them looks worth having by itself: if a case names a requirement, the 
manifest satisfies it, and the case skips anyway, that is a bug rather
than a configuration. That is exactly what the twelve above were, and 
catching it needs no per-image expected list.

The rest are not declarations at all. autotools, cmake, gcc, makefile
and meson skip on "SDK doesn't contain a supported C library"; gcc, go
and rust skip on not finding a cross-canadian toolchain; go also skips
when the command raises. Those are runtime probes of the SDK that was 
installed, and marking up an image cannot say in advance what they will
decide. The go and rust cases are among the ones that skip on a default
SDK, so this is not a rare shape.

So I do not think declarations on their own produce the expected-test
list, and I would rather say that now than discover it half way through.
The configuration-dependence you name looks like the hard part, and I do
not have a design for it. 

What I am willing to commit to is the narrow check above, since the 
oeqa/sdk change it builds on is already written. If that seems useful I
will send it as its own patch and we can see whether it earns its keep
before anyone builds anything larger on top.

> The other option is to have resulttool have more checks where it
> compares to a list of tests we should see running. The regression
> report is supposed to partly handle that but if you miss a regression,
> the difference will no longer show it...
> 
> Cheers,
> 
> Richard

