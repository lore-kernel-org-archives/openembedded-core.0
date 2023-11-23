Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B93DC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:35:18 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.91994.1700750113072521079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OiBLWvZB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c897ba4057so11154791fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700750111; x=1701354911; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d/HagTMo26lOmghsqXo+0btT6RZLGsIHcOlhJmv0coU=;
        b=OiBLWvZBjLbe219+2+I5hS0UB1mO1ogNPgl+WFfZvLnVGBwffjkNmjmK+SYQet40OR
         z2ALKgYD1ag1V46zZ7zJ3mBZafcudLM4/MVhq9lLw8YZUgXepYx/9NSkAdM3yhWm2NM1
         ks00NlFL4+hgPEW0Sl0s1gGHovyCAMkmeVJJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750111; x=1701354911;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/HagTMo26lOmghsqXo+0btT6RZLGsIHcOlhJmv0coU=;
        b=AhBhK+zYKH2trB5698wDPcv3sUtpuODQcuHxICa0b+IGpaQLwRSFI0Ck+SVKPNlI7f
         OY45QE52lcifSyhfRe+5P/890lnhofBc9UJd7oKq8/qQtBvzTqKfRaF0F0m/y06tTQJ1
         R/WuJ2/03XckG2m+jbdLOEpwokG5vqMFXmddjxgntD6v2QsrkXl3xUdh8iJB9A4HozDV
         AYY577sAiLhZpkPueRGgacnOPpVtZsHJEFyn6XXPH/VxOrg4QsOp8EHD1s40IZryODKp
         7vuy1PEOkcueTbaDGtgX+cRsk6IZp2mFpAeaM7MdRPpTz0HaRQaT+LxDiQxDliQApHCB
         Eiaw==
X-Gm-Message-State: AOJu0YwdWXtpMfLcuWaWUjn9q5Rv4RL53ayuoE2u2QNoEe/LpfYBRYnj
	C1T3xXThS4lDeVktBfSFO0cTqg==
X-Google-Smtp-Source: AGHT+IG6MPU7NilalvyQRM2FdBmKZqUJ6aR92Qt3o5E3COfZfjgMR1cpaGIoknyjc/5gdp3+Jcs4hA==
X-Received: by 2002:a2e:b549:0:b0:2c8:34e7:b8ff with SMTP id a9-20020a2eb549000000b002c834e7b8ffmr3769458ljn.20.1700750111101;
        Thu, 23 Nov 2023 06:35:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b004053e9276easm2857821wms.32.2023.11.23.06.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:35:10 -0800 (PST)
Message-ID: <9b74bca0d48fba228e89efa7a1e7b4c32c204ab9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Jose Quaresma
	 <quaresma.jose@gmail.com>
Cc: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 14:35:09 +0000
In-Reply-To: <CANNYZj8_mfVEY5Q6LMAdifXcFnMYJ-y-UekpZRpVzuyqpg76qQ@mail.gmail.com>
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
	 <20231120144628.52664-3-adrian.freihofer@siemens.com>
	 <17996456E4E8A103.7061@lists.openembedded.org>
	 <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com>
	 <d9c8d5ec4c8ae98f8b065501292fbe2d32fbbfe6.camel@gmail.com>
	 <CANPvuRnvgaH1_RMhcgSXcWen-+Dz6dv2RbqBNyMq0bsGQVTQMQ@mail.gmail.com>
	 <CANNYZj8_mfVEY5Q6LMAdifXcFnMYJ-y-UekpZRpVzuyqpg76qQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191162

On Tue, 2023-11-21 at 12:21 +0100, Alexander Kanavin wrote:
> On Tue, 21 Nov 2023 at 12:12, Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
> > > I was using it for running Unit Tests on the host before I deployed
> > > them to the target device as ptest. This worked well. It is well
> > > integrated with cmake and therefore also with IDEs. So I thought that
> > > there are certain use cases where it would be nice to have it opt-in.
> > >=20
> > > meson offers qemu-user as well (because of gobject). So if qemu-user =
is
> > > not usable there will be other challenges as well.
> > >=20
> > > There is also a MACHINE_FEATURE which allows to support it for ARCHs
> > > where it works well but not for ARCHs where qemu-user is known to be
> > > broken.
> > >=20
> > > I think it would be a nice optional feature.
> >=20
> >=20
> > I agree without any doubt on that part.
> >=20
> > But I believe this doesn't work for applications that are using the for=
k system call.
> > So consider this will also break any ptest using fork, giving the wrong=
 impression the test is failing.
>=20
> I think this needs to be double checked. I find it odd that qemu
> usermode would fail on such a basic thing, and it would not show up
> anywhere in places where it's used in core (not just g-i - all the
> various postinst utilities for generating indexes etc.).

It is more that the exec() calls are problematic so it depends what the
code is doing after the fork().

exec*() can be made to work under usermode emulation if you setup
binfmt_misc and enable it properly. This can be setup and gets into the
territory of what scratchbox tried to do for example but it does
usually need more permissions that our build user would typically have.

We have no desire to need that level of system access.

We do also want to maintain the ability to bring up/build platforms
that do not have qemu user mode support.

Cheers,

Richard



