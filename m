Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71764C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 21:01:19 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.15216.1644008478115248584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 13:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VhGYP3ML;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id g145so5789436qke.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 13:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=079PSV4WFa0IM6iIshXG2LGB3+h+SkH1zw1n5oKx7qo=;
        b=VhGYP3MLIZDFoXQAM1UG1iV5PK/L99Fp++5OVfqSCaEewMrTtOJsU9BabFLCYx9kS7
         zE11p02aED6ua1fu5wSQtHzhnbEwhhZ0Dv3Xxms5is2JQEpKHSlF17cpyS2zt3XJuhLN
         xBSqb0TWFMO+/qH9RwzbWKkue7eb/n0hFBua81BmsDGs6tG95wpXGeZbzFHQ8gd9I9Zz
         k51zlB4pjflwZMIl3ceHWNZMP3q1TBwANEN9aPGdcIgG0LxzjJ9AYuEjzbrJ3ygC9KwF
         daLPzriARiOEobx8Kfu6TLQKtds/hPY0dlQt3jQGiAp9qUAxp81N+X7Hft43NzUIsyW3
         J66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=079PSV4WFa0IM6iIshXG2LGB3+h+SkH1zw1n5oKx7qo=;
        b=oGIlvh8iDj+ostpf76yxR+z61Ddl50BztKDN04VVibWj09RSsO0fSQwf4xfz4qtOyO
         GK+xHoBPHK+2yBp2tnwSR081/HcsuHZ18Z1yqZ697OebeFftVG5UtpbVUQV94QAxzoQK
         3Bjks+fVaCGq+STRD+ACpRPJ0A3KG78fg6c+IOWNczCax0uIetBoTodgoar/4zBNmtL8
         MuVLa7phayrNQFN9R99gwKoHjuNE6uk0CO6CkP7UePuJJlpmjrYueQoHKO/0K2FJ8q/5
         RqWMw11ObBFB6OLjXcj6AkSzShlFbzhhVH2VdoT0bk1faKxnmDJwC8TqTgqb8g4YroFE
         Ifrw==
X-Gm-Message-State: AOAM532FtyCV/xboTK2UNHFwL5BMSP7v+yty3lhjvaNbM2Z3WY3HMVz8
	U1s0HMFBJKf8zW/P1pCZPYZL7vKSRkkXa36QLbY=
X-Google-Smtp-Source: 
 ABdhPJxbhFyV58vnt3VOgYhdgmI2LDg3YX/1dpD6DUY9ovDaHfKeZmaMluM2FUWM5Bca1huFI3wqTrNF84e4fiqP9UU=
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr561121qka.149.1644008477192;
 Fri, 04 Feb 2022 13:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
 <daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
 <ly5ypujw2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly5ypujw2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Feb 2022 13:00:51 -0800
Message-ID: 
 <CAMKF1sr8==+NapSKVChz6NYBpqm0Nc6rbnHzLeGqMt5VdiauTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 21:01:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161383

On Fri, Feb 4, 2022 at 11:00 AM Enrico Scholz via
lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>
> >>   | lto1: internal compiler error: original not compressed with zstd
> >>
> >>  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> >> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> >> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
> >>
> >>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> >>
> >
> > Should we be passing some flag to gcc explicitly to configure this
> > deterministicly?
>
> Both '--with-zstd' and '--without-zstd' make it deterministic (require
> zstd.h and abort when non-existing resp. ignore it when existing).
>
> Perhaps '--without-zstd' should be added in the hardknott and honister
> branches to prevent pollution by host environment.
>

yes makes sense.

>
>
> Enrico
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161379): https://lists.openembedded.org/g/openembedded-core/message/161379
> Mute This Topic: https://lists.openembedded.org/mt/88888010/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

