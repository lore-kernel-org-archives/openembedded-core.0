Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F19D6552E
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:06:04 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.51328.1732640762314509266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J2HmXTtu;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: danismostlikely@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4af32b09521so463427137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732640761; x=1733245561; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WoLa4OR6W7ZEB5bABZy3QPN/cZWlScsu+WmRzzr1Njw=;
        b=J2HmXTtuCakVi51UpoFRK2thG30r7iqwiL1cA35wjKrrObbo/HSyjPHSQ5Up7jNDAm
         6EACgK8Igm4y7wqKf3XhYovkhARbU5ik93+OHi/eoYFjpHibPJTyMYHJBTKfICDuAb0o
         3/0i18ophi63FKKh3TTMtn7CzcSWkKUeaauemxMu9z1cnC3Ppglcw7kviPk25MfpIQeS
         AryjuUMq1TSOlZk+qO0jBO0695NbkzQlUgMXOvxZvGKQr0+NgxLdeynLnBpCPcwAcO++
         X9i9BH64xQe9RbCYItI9v1LsM2W16BukTuLasFYKdreUDj1UipopmAu5E3DDfNqoRK1j
         ZZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732640761; x=1733245561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoLa4OR6W7ZEB5bABZy3QPN/cZWlScsu+WmRzzr1Njw=;
        b=PXCiuOUkyOSJdNVd65+joh7uAYqU3VlOfoyUmPzvLdyJwqmWeX2TRgJIw3DoLs0vYo
         +9jLxSWOOsBG5YP1yC5bv+PbB38s6UnHtRugo0mcT/mCr/FXwf9SiH6nOXEstW3vmzVm
         LU+lQHtlSq1170zEKPFx+MGrEk5C8FR1kY4qBgBFV8s4/PMStUkPLAzkusGW78SHUqfI
         +ZkANCylcZcf4c+GC8OAnKPPqocktokyrZ0He9TZKdBzMrtRCUwNzi8rosJPZplj3sYA
         0OIrfdalDJguioxUAlGpYJHKOQeOxeVmHHSAhqxVstqzOmg+tWD6WT8kxcriKXXgNeEm
         deuQ==
X-Gm-Message-State: AOJu0YzMwDNoLCeT0jX0EVyV5QEr+64B987afPK8Cx3XD5ejdxifhhD9
	O4gRGtWfuyLFNw1l6K40pEFLimcvyGFMFG7jMtkOYtIQS1iiwVFsbSECi0iMYDbK3gKIMqg75DZ
	1vAyHGyRnlbITMywHu4IEva77cMHEMA==
X-Gm-Gg: ASbGnctlB/fMuvlZJ2wx7uxhdT5TFpA9aFybirOE/jaOFpfPu3vEOoQYrY08Apv3ONc
	v64j6/qAzDkFxtraRRSjyEx8B8NnUokiV
X-Google-Smtp-Source: AGHT+IHLp2xTR7jKSZbOE9GvAhWepNRzkOS6fmH6HOWhwPEhKKT2LFl3zRpaVPJkfRxrjKL+bFr34FRMozGuhtScokY=
X-Received: by 2002:a05:6122:1e15:b0:50d:869a:e542 with SMTP id
 71dfb90a1353d-51556a023bamr246874e0c.9.1732640761203; Tue, 26 Nov 2024
 09:06:01 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
 <180B91BA7D0ACFD7.7301@lists.openembedded.org> <CACS+7ZQmmD8G2jomCq0313=83EuYy9Ekhz=bNXrzdLDX+ktk2Q@mail.gmail.com>
 <CANNYZj8FMNf3ZscHhqGPdKn38ULtdZkSXWr_hmUc8m=URgWX8A@mail.gmail.com>
In-Reply-To: <CANNYZj8FMNf3ZscHhqGPdKn38ULtdZkSXWr_hmUc8m=URgWX8A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 26 Nov 2024 11:05:49 -0600
Message-ID: <CACS+7ZQksvu_DFJ-rphq1TmMPznCZHKbeJfCJ=AUUevJDVLKvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: package tkinter's shared objects
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207871

On Tue, 26 Nov 2024 at 10:48, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> You need to find out why is that. FILES setting in a recipe should not
> be replaced by what's in the manifest but only added to it.

Okay, that's actually obvious. It's resetting the FILES:${PN}...
variables explicitly in the manifest parsing. Didn't know the history
of that, so didn't want to touch it. If the intent is to append to
what's in the recipe then that's an easy change.

>
> Alex
> On Tue, 26 Nov 2024 at 17:45, Dan McGregor via lists.openembedded.org
> <danismostlikely=gmail.com@lists.openembedded.org> wrote:
> >
> > Nevermind, this didn't work, my initial optimistic test was wrong, I
> > had disabled the tk packageconfig again before I ran this :(
> > The original patch so far is the only one that I have that's working.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207868): https://lists.openembedded.org/g/openembedded-core/message/207868
> Mute This Topic: https://lists.openembedded.org/mt/109792534/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

