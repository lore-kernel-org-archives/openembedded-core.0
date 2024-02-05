Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8545C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 21:17:00 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.6003.1707167810349179234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 13:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=coLoSVWk;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a26f73732c5so706930366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 13:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707167809; x=1707772609; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ABI/BDR4HoxLP3HwVESNJfVuatjCmxtSdmRGYA6vUk=;
        b=coLoSVWkeD6RnqMPTfY8PAmDYDxLYJEaE2HtERjvOJBOyUsR3asTw9uyfngbj9Cw/3
         SaZ6pyHNUKN+0YLffUNAutPy/um9LJv7v2AC6p/HCnCg2+HxpzsMOJh3OnQ5u1gOBrGv
         cLKttO3idg15IcaAE4pYvfgO13eRLsWcU6SvZXXXIEcI3RtCkUbHvyMBQlL9hvmO0mRx
         IcyhQ9VFxPSdcRgZrmHpgtqypmfMAGCVNo2pbFeTHTGY8hK1oNBgqoItvsFwgQOuVPQ2
         qTcoSUQORbkNcoC5B8AlFkGqk28kOdYpiuTelRflM6AsfuiwcP6pfoNNCGUBkh2FM71B
         lf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707167809; x=1707772609;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ABI/BDR4HoxLP3HwVESNJfVuatjCmxtSdmRGYA6vUk=;
        b=D5qsI7nXEt/5j90lLUqnQLM46ao217w5QujHdH8OmL50oIrpk1q2F8YeZl6x/S8W5j
         +1I9i+RMeYodgQD05t9b8TMYqDwzuUCmtqcdHqhG/eHx1ZLgZUDQVSj0zSyP+s49YFfn
         fzIVqWt2SnKesYcuxjAC9swUIl9TBRsEzuw7sog900aYQI/hujew1ubOvo/pL3dbSVUX
         P/1a0pHmCaBRyjyUMOg/+bxjSzNx2hWrRpiq97mt2rJsXwcjYKakV8/PhTzNVoHK5kP0
         jWzIxslhv55JyQReX3VufeqQjZY/ZhoHxWkrwFxBIeK86Cxi0stgvYx2qArfoADse2H6
         hg0g==
X-Gm-Message-State: AOJu0YxlQp+PUKBXAdHfJPlv/rX8a4qt74FpN/pzmirzyRKxetkEBaHJ
	cm0D6+9QBlyCFxSWYnQ5XQyFI+yu2NQ6RvZMxkEnCGqCj+INpOY/
X-Google-Smtp-Source: AGHT+IG4ZCbdAduidO29R5DfdA6Faw71z7pCiIuo38EJWtInUxOernI/vK5f/e9qdiywyjl9T1V3Gw==
X-Received: by 2002:a17:907:7810:b0:a38:14a5:31ef with SMTP id la16-20020a170907781000b00a3814a531efmr118094ejc.26.1707167807870;
        Mon, 05 Feb 2024 13:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVvlbx/rJXopn3eLCDkVVsJ4LX8cekmTyf5epPZOoTuyXWjSSSGqhP4lSYWjTct13kAeccqRfZEqG3WnlrnOpIGvbn2JtnLBR/nWuhzts25Vq5BR2HEHZzu0hmWIyTKB7VVpDlJzgJfIWFV7RzLwqTh6oPXBYEAfUYZyfLHViOVzzMKkLE=
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id hu13-20020a170907a08d00b00a3819395edasm21405ejc.62.2024.02.05.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 13:16:47 -0800 (PST)
Date: Mon, 5 Feb 2024 22:16:44 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20240129
Message-ID: <20240205211644.GD246472@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240131183243.30223-1-petr.vorel@gmail.com>
 <202402021507535468a87c@mail.local>
 <20240203235247.GA163430@pevik>
 <c6b68e4d96108645ffcfdac875e6081c57bdf7a1.camel@linuxfoundation.org>
 <20240205104342.GB166229@pevik>
 <8d09eca8e65d69bc9d79da3a0c271a05097ebe9e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d09eca8e65d69bc9d79da3a0c271a05097ebe9e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194970

> On Mon, 2024-02-05 at 11:43 +0100, Petr Vorel wrote:
> > > Hi Petr,

> > > On Sun, 2024-02-04 at 00:52 +0100, Petr Vorel wrote:
> > > > Hi Alexandre, all,

> > > > > On 31/01/2024 19:32:43+0100, Petr Vorel wrote:
> > > > > > Removed patch accepted upstream as
> > > > > > 8c53cc947 ("testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE")

> > > > > > Rebase runtest/mm patch.

> > > > > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > > > > > ---
> > > > > > Hi Richard, Daniel, Khem,

> > > > > > could anybody please test this update if build (it should).

> > > > > > Also, it'd be good nice to rerun proc01 -m 128 and report me with the
> > > > > > details, maybe we can fix it. If still problematic, it'd be nice to turn
> > > > > > disable_hanging_tests.patch into proper git patch (makes rebasing patch
> > > > > > on new LTP version easier).

> > > > > This fails on the autobuilders:

> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5957/steps/12/logs/stdio
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5917/steps/12/logs/stdio


> > > > Thanks for testing this, you probably mean the warning before python stack trace:

> > > > scp: /opt/ltp/results/connectors: No such file or directory
> > > > WARNING: core-image-sato-1.0-r0 do_testimage: File could not be copied. Output: scp: /opt/ltp/results/connectors: No such file or directory

> > > > The problem is not due packaging, but simply runtest/connectors was removed [1],
> > > > thus your tooling has to be fixed not to expect it (not trying to run it).
> > > > I'm sorry, we sometimes do cleanup which brings incompatibility issue
> > > > (here it did not make sense to start SUT just for single test, thus we moved the
> > > > test to runtest/kernel_misc).

> > > I did try again with that removed:

> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5929/steps/12/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5968/steps/12/logs/stdio

> > > which comes down to:

> > > scp: /opt/ltp/results/fsx: No such file or directory

> > > so I'll remove that and try again.

> > > Are there any additions we should be considering too? This all feels a
> > > little fragile so I'm wondering if we should be reworking the way we
> > > handle this?

> > I forget that also this one was removed in fb2b6a0b3 ("fs: Remove fsx runtest
> > suite") [1], therefore not a real error.

> Thanks, with that removed we had successful runs so I've merged it.

Thank you for testing and fixing these groups in
meta/lib/oeqa/runtime/cases/ltp.py, I completely overlooked this file.
BTW there are move groups which could be added to ltp_groups:

cve, crypto, ima, net.nfs, net_stress.ipsec_icmp, net.ipv6, numa, uevent,
ltp-aiodio.part1, ltp-aiodio.part2, ltp-aiodio.part3, ltp-aiodio.part4

(There are more, thus list mostly the most important ones)

> I appreciate we need to try and re-enable that test that was hanging
> but I'm a bit stretched with other issues at the moment to dive into
> that one unfortunately.

Understand. Test has been rewritten to new API in 2017, I would expect they
would work properly. But the patchset removal was done in 2020.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13802

But looking at
https://git.yoctoproject.org/poky/commit/?id=529bb922c786f1acd041ff9a8d2b675d067e2ae3
linked via:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13802#c68

The tests found a real bug
https://lore.kernel.org/lkml/20210616125157.438837-1-paul.gortmaker@windriver.com/

While I understand the pain when test breaks whole testing, removing valid tests
means the functionality is not tested and we blindly believe kernel works.

Kind regards,
Petr

> Cheers,

> Richard



