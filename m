Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19989D1CDC0
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 02:45:32 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33688.1764816326445838109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 18:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aUO4DNta;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6593155d8d6so280176eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 18:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764816326; x=1765421126; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3MQVbX/Z1kmjiJAfPrb0ebP4p86UTp/UNqQHtFAtPo=;
        b=aUO4DNtaknnVtS+HEzSC73VRmP/H3YlQzKRf0uVh6cRGhbMJdiq+XoUaHAeiSHJrGw
         2m90w6KbbvP30VtZWLmSAub56p3smjJ9gQlRy9Y2jydsa3+Cf5ev6AEAc2oxb/MHHuZS
         Na03NO7OV5u+9pEC4dQe2cGGTDFww9kRBuKGoUoVEGAdpIyOw6g2BAYaAiGPjDf7l+DH
         jcJyOK/8K7qmmjweeJKMmImp+jl6CJ9mZe8yapt6nPxl3QsOSrt6M1GHzBcDkC6YjRGW
         97o+8bAeFUstKYWikbmao2gLKmSNDjuMOkP4rPl95Mpb1bwYjIVIQvSBqkR5GGna+EV0
         znnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816326; x=1765421126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3MQVbX/Z1kmjiJAfPrb0ebP4p86UTp/UNqQHtFAtPo=;
        b=qKFuqiOP8ivfTVMjRSGrW+1T+xd8zI4/zqNRs28pnYPaK27RzQOD5kBwcmQst3xqjw
         fJM/pav51P9Zn4+ByCuoN7NxDdxmNrtkz1JXw9A3w7bjyWmHVwL8HYCZIeVMvr983M8E
         S16umT98wv9D1E6o1+tPzOx4tUTAnhgGEW5OtNQOYx1hQVqN3SubZEdQ1IZquSQLffmc
         bkEZFMlRU8SmdAilZFADvskZv9zg7W3bJU2EuCZJCMDHmic2WuyM0eIFHaS2SCbrh+0O
         b0GBTHaZDgyNq5HOgrH04FrXeHmoZoX11p6mW6WCP4LT3Qx0CphkfVT6wChxD92aCXtG
         aF5Q==
X-Gm-Message-State: AOJu0YxGxe9aTdD4IC70G+2+ZaNjxmv55aBfBfLRas3U7HAwNQu23ElP
	tmB/LRSl2iTgV//2GYBR9RNtZcUmPBmUNvz8LVwP9hMAhzEdkq1KhYR0yMfQdl7Cq3mcOuj8Gbu
	raqsg992ux8wn2ueDqg8dG+W3qv/m3YLpiZtgEFk=
X-Gm-Gg: ASbGncvupdTHGt3DUwlrHuzdKJzcoZbqzWa9l/7E0tYyfP9tLBxV6kmriClAn/iUYMv
	bm+AtuldZDEZ6NJ0+SNl2YM/zN6o+27oB/JJW7SGBeuZ52dnVij3Rl6cYO0Ulikbs9ndo7RlG4h
	SHMvg+fFyoty6m2Uc20tPK1HCVT/+KFhPiV/6qKi2WvHJhKVOVsde4sbmM6jir4cBv/+Lub75wk
	QBUvvX9eVwmliuO/Pw3zcOg9vW9ZbYX30rGSYnYnTd82QVlansQAkfLU3RqyC61268ulxqvuMdz
	ANhNNpJHxLJjAWYPKQOyNGs2v49kgYJBqpT4
X-Google-Smtp-Source: AGHT+IF/lSrMv5d4XSg8mXZ5JzsuqullXmbovO/zCI0se2nHPqlG0gkNPvxm9ZxaNJjthw5nZgbtnNucQAqnvv7pNoA=
X-Received: by 2002:a05:6820:201:b0:657:6103:4929 with SMTP id
 006d021491bc7-659727cdea7mr2215147eaf.7.1764816325268; Wed, 03 Dec 2025
 18:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20251202151032.15053-1-schonm@gmail.com> <20251202151032.15053-2-schonm@gmail.com>
 <DEOKWAS5XALU.VTBEZYEYZL1J@bootlin.com>
In-Reply-To: <DEOKWAS5XALU.VTBEZYEYZL1J@bootlin.com>
From: "J. S." <schonm@gmail.com>
Date: Wed, 3 Dec 2025 21:45:14 -0500
X-Gm-Features: AWmQ_bkMt-U_HTbbo8c7OD_2ETwkzI_W3min0ge7d0kGV5tHdIHIn9QjNX-f0-Q
Message-ID: <CABTo8gDkybOgXP0ot4iOyJtnezNbMghuhSf9yLLewH4YkLVdOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] perl: upgrade 5.40.2 -> 5.42.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 02:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227248

In the log files, I find

Failed to load or import from ExtUtils::ParseXS (version 3.57). Please
check that ExtUtils::ParseXS is installed correctly and that the
newest version will be found in your @INC path

I note that the version of libextutils-parsexs-perl provided by
meta-openembeded is  3.35.  Which I guess is far out of date.
Metacpan would suggest that is from a 2017 time frame.

Jason.

On Wed, Dec 3, 2025 at 7:26=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Dec 2, 2025 at 4:10 PM CET, J. S. via lists.openembedded.org wrote=
:
> > License-Update: Checksum changed because in the license, the physical a=
ddress
> >   of the Free Software Foundation has been exchanged for a web address.
> >
> > Changes in perl 5.42.0: https://perldoc.perl.org/5.42.0/perldelta
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
>
> Hi Jason,
>
> Thanks for your patch.
>
> It looks like some selftests are now failing:
>
> AssertionError:
> Failed ptests:
> {'libmodule-build-perl': ['t/xs']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2708
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/798
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2664
>
> Ptest logs can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemux86=
-64-ptest/core-image-ptest-libmodule-build-perl/
> https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemuarm=
64-ptest/core-image-ptest-libmodule-build-perl/
> https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemuris=
cv64-ptest/core-image-ptest-libgpg-error/
>
> Can you have a look at these failures?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

