Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED89EE14D0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 20:28:34 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.621.1694032108005310686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 13:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BYGOAdMf;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so4756051fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694032106; x=1694636906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8snct2zl26fRWjcPbnTC8AAOAsgRZL9g7xGNq5L1aHU=;
        b=BYGOAdMfVTZe+cWZmwlS3/iZdFxWdKKl7rSkZzQUsX0TANtBRg4kL2m9Z3xnF8iF/4
         oQCq+AdxdunkIU1yrfAs+ZaOG1bAMBxqrGcCLd38/7vgz4AfzX7hJ1AHi/OPjs2Q6sAA
         orgCENdZG6+QpY70+bKDcXmYDKjy8OcUFX4GgixkfyeEZvunn4FEpZ5qd17nHLB549Ie
         yKaiOop1orCabfF7awwRkcmHjuGlW8bdSKRvpIj7f47adBRLV2esClsrrPUxMfTY/fTV
         2ZZY8dey8csovvbjAK3ydlbRYUaFNGkoccgfGTFD3o4+hOXKKoQU9uZn3rqJK7qZMTki
         QU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694032106; x=1694636906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8snct2zl26fRWjcPbnTC8AAOAsgRZL9g7xGNq5L1aHU=;
        b=K8Te6q1Eq8NtYNQt3nd1Z5IgZQOZvMC0wXXn8VZCPEtEkxy7RZh+ZPyQ+7jWGf0EBz
         vinBC6FA+RX3iKDIbacVnP4Ox9HwCoTV3LpZxLHMN3XIabSh2hQuTv6fUhplrZXD0325
         QfeDvZiGtayV9eOJjq+xHnQuUYLByk+8HFt/4se5Mba1BqeNfPuRvuNnTRJV7L2ez34s
         CX2m/7w7sV7GAE6zWvKUKItbycdQX7ny0apB+KGdnGsclznJu+L6wmoD8Ew/kLgAthCT
         mwB69gH1vn8rulNvBWkP3Z900TeRNytAdat9MhT+Irx4y5Wkr/jDwX8MZywaREQ+elE2
         srvw==
X-Gm-Message-State: AOJu0YyCyDjeLUS+0f1VcynW1Tzgz5VIGKc/jQS76OY804DuqcwmVvSW
	0fwKYpaJLhEjucty3q4rvK/j+jKEDFxig2oIDYQ=
X-Google-Smtp-Source: AGHT+IGeYlk+MPlYfcjpeRlHrfwK/tljm4bwMtTPtaseqljANcNWeDnZ2U79IfppiFQiF6CKoUjvgtPjNMUJrTNhW9U=
X-Received: by 2002:a2e:9788:0:b0:2bc:b54b:c024 with SMTP id
 y8-20020a2e9788000000b002bcb54bc024mr3003732lji.29.1694032105923; Wed, 06 Sep
 2023 13:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com> <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
In-Reply-To: <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 22:28:14 +0200
Message-ID: <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 20:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187354

On Wed, 6 Sept 2023 at 22:13, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Firstly, that recipe was a bit of a hack. In bygone times, we had a
> shared sysroot and this was effectively creating it for the places we
> hadn't converted to use recipe specific sysroots. There should only be
> a small number of places it is used where we haven't found a better
> way.
>
> When you use it, the calling code first has to ensure the things it
> wants in the sysroots have been built. The caller is therefore expected
> to build the right set of dependencies.
>
> Putting ordering constraints into the recipe is going to make people
> think it all happens by magic. It doesn't and the caller has to be
> careful.
>
> I'm reluctant to add any dependencies when it should be clear the
> caller is entirely responsible for this.

This commit was prompted by seeing these intermittent races with the
upgraded shadow:

https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/468/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/467/steps/12/logs/stdio

What happens here is:
- target sysroot population relies on being able to run useradd
without errors. It will also skip the useradd execution if useradd is
not present.
- useradd comes from the native sysroot
- native sysroot is being populated at the same time as target sysroot
is because the build-sysroots recipe doesn't constrain that
- this can result in races where useradd executable is already there,
but the libraries it needs (libbsd, libattr, libmd) are not

How would the caller ensure this doesn't happen? I think it's
reasonable to assume 'bitbake build-sysroots' should complete without
intermittent failures.

Alex

