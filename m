Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0854CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:39:33 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.web10.6091.1759171171294534247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZVMOLbH;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63605347eeeso3389949d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759171170; x=1759775970; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb4zNfpiuQ1Ykig6ri3yhZLxuDeHdmHjn6RsWiVIKNc=;
        b=MZVMOLbHMvY9Q3Aw1Bg5fFoUW+p580S7qTYL0aVAVBa83jL1txfqFrFhJdOuniqsD3
         11gl8nmjCPKzJHX0PXvIiz4Qz+LqvRNLVwzl3iSQ2AHx1pDocvkg/L8Z8qGClRsVye8a
         P5lq4mbqrI5gfUGjz7w/jWhPyt0DwgxpbR62a6YzmszEaJY8PEDUNCglEl/T3m+iKBgJ
         vWLDfGBMSrwywIwsm3q4TJhPie8d9gzFHPNSZTC4vBR91+NUfL2bAYR9JooF/Q7pSJC7
         DFLqpOpEFpkwATMfinuetlbV9kaHeA0XFymGZl88LlJvqNb5m1HhpDqJyfVTwCDClY04
         fBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759171170; x=1759775970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yb4zNfpiuQ1Ykig6ri3yhZLxuDeHdmHjn6RsWiVIKNc=;
        b=POZLsCI/mUqLE72/mLk1Sre0a4uxjZlhg4K5KvesLX95m1/5YonBu2JdMZJEnYChMO
         3LrxZjVha+iNi7xkcS/ftNGayqn94wNqA2cU7OaWb9YOMFkIsYDbC2HR3m6WJXm/QCac
         jOvsa3708c5ymwGI1jUa5X553jKPXiZwTXHLR7wANuiTHbFI4MpP5EAXKgQsJzlkqqfV
         zKlqg+fl2ljYIKFGiEpZXgNxj7XW9rvkbLlq6fJWqL/JnpObh/InDohltouGJGLGwIsJ
         GoFeaQzO7cawCJfZqIhSsHKHOO5vyavMLP3KjbMavmCOSiN1VxzxOTDsOB80O4SWKI6W
         xXLg==
X-Forwarded-Encrypted: i=1; AJvYcCWO+tU9dyjIXZuj0xFS3brJuvG2sl71JVZC54HRpGNMpza85lteFKT7NuAbHmDoHJ0OwvVguL936iIYTtXGdeNDDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUZJzcjSnIMulpcmYelhIMuzPSEb9gadgezQzT4SyS3k07yxZN
	U7gW9naCKWm9QeTu7P1Eskox4boCBsoEIbmOSBNhsG6H9C+NN3l3cp+HYtBL+zgjihkG4UDaoU8
	fPTucNlXvk6cT952tMbenGP4MR5AqI5Y=
X-Gm-Gg: ASbGncvVpj0ylCMOjCB/4IVOKnmlfCd02NIwL+5ExX2Z9clAZG7tD7bnnzs594Sohb2
	Sjv5y7NBY3C2JpBNf9EqdgYI6cbPB6UWniuobCAo6c2+Vl4MZ7Yk5k5VS/kloF1estN7pjKiHrA
	q+ktNZZ2l/vkW5hH9/2Og62U8tH+t53XR0FFd21Oh30W17QrVKGKXn8JmnutiQ5f+lXD94O2CP/
	ZfFPxJ+i6yjyOwXyMev2TBojQn+H/fZP7CsJbTh/u/l+yM6Y/fOvPqmYAouti2m1hcZjywjTBtj
	lz102sxamOWrVyT70C9Yl4Yfl6kqaCQeoRB6NpuLZPW+Ld+WAHAh2w==
X-Google-Smtp-Source: AGHT+IGB7Ob/qkNf8ttF682MRIwE4f4CH4HwSLz9VXTBzS3WchT3Q8zJRxRg4sKcg4FMQn26wSVI10KFBWZ1abovkP0=
X-Received: by 2002:a05:690e:1652:b0:636:18cc:fefb with SMTP id
 956f58d0204a3-6361a70dee8mr16596920d50.5.1759171170265; Mon, 29 Sep 2025
 11:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250925152651.3059868-1-ross.burton@arm.com> <DD54UINT52DH.VW1D1BWNHWD6@bootlin.com>
In-Reply-To: <DD54UINT52DH.VW1D1BWNHWD6@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 11:39:03 -0700
X-Gm-Features: AS18NWDCg9dntXJbQ2fTTatPzn6iqH5och-lsFMFwveINDsdVR8S4-p5xJTMDJY
Message-ID: <CAMKF1sqsuY3ngnAGPVdUvhB+yjW4C8GkdQRQm80e+ExGAmCkpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: do builds in a clean build tree
To: mathieu.dubois-briand@bootlin.com
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224163

On Mon, Sep 29, 2025 at 1:14=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On Thu Sep 25, 2025 at 5:26 PM CEST, Ross Burton via lists.openembedded.o=
rg wrote:
> > Set B to WORKDIR/build and clean that on configure so we ensure that th=
e
> > build tree is clean.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
>
> Hi Ross,
>
> It looks like this is breaking some arm64 builds:
>
> ERROR: perf-1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/=
qemuarm64-alt/build/build/tmp/work/qemuarm64-poky-linux/perf/1.0/temp/run.d=
o_compile.221036' failed with exit code 1
> ...
> | make[2]: *** No rule to make target 'tools/arch/arm64/include/uapi/asm/=
unistd.h', needed by '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build=
/tmp/work/qemuarm64-poky-linux/perf/1.0/build/arch/arm64/include/generated/=
asm/syscalls.c'.  Stop.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2440
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2487
>

I wonder if we now need to define KERNEL_SRC in EXTRA_OECONF as well.

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224123): https://lists.openembedded.org/g/openembedde=
d-core/message/224123
> Mute This Topic: https://lists.openembedded.org/mt/115432523/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

