Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF37C3271E
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 11:36:27 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.15394.1720179379221222453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 04:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLV1uefe;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so400776e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720179377; x=1720784177; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n33JePdK8PsZiWpgExk05sdqDO4u0ZyuvsYROZ5Ov+E=;
        b=aLV1uefeGXCZl2/SpsL7EUJ6I8biJtrsRKTnrems+HHk/76koAlggEmqpp0drPmtVc
         Ocmbd6bFh1ViRMmqBVDL1MYbzSAkguu4Sx8PRE0ZmBSt71+p3abB/iEwknW+igLyeJq+
         vNN9ukUXiu5Ni0r5BPw+KrD46uod757aBYlp/QRFSihQ2HjT3mg7ao1n1qKQnQ7CRo92
         Qw4uMYWzkbODtVZFLKwdNPH1aIjM17X7qEY6CDnPlZDDcf0ujC3iD1367cGv+iN8bzWv
         9Ygv0xccZYmCT2gZtSiA9NXf65MwaapozS9mwfGSxX7aE8E+fZydMYfB7lULdeMAfbek
         1QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720179377; x=1720784177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n33JePdK8PsZiWpgExk05sdqDO4u0ZyuvsYROZ5Ov+E=;
        b=rtXFiVYtJTtRJsc9LH16IUdWvQ0IkU4pxH+uZE1sHK7CldUKR0tLEe3FqTWZ1RrNSa
         kCqX/r98x1GUkic9WABnjHyys0L5aDjUzlMBdW6r8455LsoutkCQyVj8F1sILzoSvKtZ
         alfoWOnhZ4catC3+6KANj4vSFSc/jfMg7xBTlP8y8GlkgzeSw4tAlvgqA72ZU7N7re87
         hn3frmPzJmVhy99VdqObXwOm8J18dEedXksaSZBFmwNm0Y4agLBlMy/VYGh9YdbXfSsn
         4usmsmzEXcAsnPUPku4yfh3gCwJtfireJbm72Z9ANrtxQhmWojOpmHJrYaR8m1c7CO60
         21sg==
X-Forwarded-Encrypted: i=1; AJvYcCWId+EZuESiU+lCkvarRIC7CJsjeBQiGmUQ3wI24Jr1hdaEN8wa5YMh9rvEe5KGEwqoGgRLEZ0NDLMkHo5ki0ZWkNpPdsbOEIoMrYdRLY5OwzVebWJ4a7fw
X-Gm-Message-State: AOJu0YxqcpoggaBSMODA3vlLxxzbkHARZXLCdzo9CVkMQg+edYJRuJGz
	bITPdSewqOkDTWHwKl4qBm5cvP32b3z1vBNba3Z/fXYvoQs3yJjVspwUGxca3IZZdXQfVE6TlJu
	UUAPJfnP0WDQ1hCZID5k+annFaW4=
X-Google-Smtp-Source: AGHT+IF/JF3UkzwpFiBNBVG0tSLh1A09h6OrbTEnD5RKCRBwIGrCEY3yvQDHTDDt1+ph3dcaXDRvtefBpr7/WdIpx/o=
X-Received: by 2002:a19:f51a:0:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-52ea063a4a8mr2696779e87.25.1720179376808; Fri, 05 Jul 2024
 04:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-m-m+B3iaNLHeEq5C9w5Rfg28fGY+U8ezaZS6N33P4Ag@mail.gmail.com>
 <31491.1720105991184445170@lists.openembedded.org> <CANNYZj9vSOdetOTfghRN4r9iOpai1zwSPkUU7_pJRoaYoEZL2g@mail.gmail.com>
 <5c10b742-459f-4912-8260-aeb7699e2f29@windriver.com>
In-Reply-To: <5c10b742-459f-4912-8260-aeb7699e2f29@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jul 2024 13:36:04 +0200
Message-ID: <CANNYZj-Vr6UT9L1oh+3eRHGOxGGMmnfJD17=WuFZM5BRSgD2yA@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 11:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201602

On Thu, 4 Jul 2024 at 18:47, Randy MacLeod <randy.macleod@windriver.com> wrote:
> That's true, but it's always nicer to be able to reproduce a problem locally so one can tests fixes properly.
> Richard and I suggested that we at least get the distro and list of packages identified so that Sundeep
> could see if he can reproduce the problem independently.
>
> You're right that it's not essential but we're also trying to avoid putting too much extra
> load on the autobuilders and the people who run builds there.
>
> It's a long-standing problem that the Rust updates are done  and  pass all local tests only
> to fail on one or more of the YP AB systems. We'd like to understand why that happens
> so if you could share the info that Sundeep requested, that may help for this bug and for
> future Rust work as well.

The host distro is Debian 12, but I still do not think this is
relevant, here's why. I spent much of yesterday and today figuring out
how to trigger non-reproducibility reliably, and a few options were
ruled out:

- re-running the build in the same build directory (mv tmp tmpN &&
bitbake -c install rust) is reproducible

- running two builds in two adjacent build directories with names of
same length (build-1/ and build-2/) is reproducible

- what seems to be *not* reproducible is having two different build
directories with significantly different names (e.g. build/ and
build-rustreprolongdir/). I've seen this in build/ vs build-2/ as
well, but e.g. build-2/ and build-3/ are reproducible.

Such experiments are very expensive time-wise (each option needs to be
tried several times to ensure the issue is not intermittent with
reasonable confidence), so I'd appreciate if you try the third option
locally.

Cheers,
Alex

