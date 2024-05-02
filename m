Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C02C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 09:33:45 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.1170.1714642421058586819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 02:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6LKTFUc;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51ef64d051bso1047338e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 02:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714642419; x=1715247219; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3wMAP1i4GLs32F1eOa9ofXQffxI1ta62Bw04OwIysrg=;
        b=O6LKTFUc84CLrR0DiSC/kUE4P9/WGkaI569Ay74eoMB6Pe9MTowy8E21InvPz5jDa6
         P//eWBPrtXSA3RJXypQ/A3gHp5eBqYzneiVq3mJdmPcv1JU7yIP1lyrNF1loWI8AmfrM
         NKEL2FL/jq+FWguY7bXwJyK2ls4+V/CbDvllz5djwCH8uJ1FXSmtUIHtEHnpPLi32lHC
         OlZWNpXzbVop+kwtJ+JXUQa9Az1FCxCQUX29OrLZZdt2P9s9fD2vKc95sZmNbtrEPYYA
         cJki8cVlZ4khWlvqEIN8weCwURn9s6dw+3zF9vYbBkO7cwx4wpk3A7pBZLr4bysJ4C7h
         Le4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714642419; x=1715247219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wMAP1i4GLs32F1eOa9ofXQffxI1ta62Bw04OwIysrg=;
        b=GOuU7GDvGJS/Afab2JrMMXNNroSxdogDaxHY6R10Hx6Q3h3sqBErpmOL+DnbbD7nTs
         BrifUYTKiIhjs89K24noMX2MSztZxtm5lv7xY2tTKMkN452RPzk1qAJ2bDxSLlP6aIMM
         GCvwmtcbWzMvwZTdgqJA89DQVJqLv/8rUxqocFDpKxDitUOXxQ96P7/RTnqE+oymgO43
         yjmpz4uweM0frdven9JDFJYbwlQE+cj1FpREwS4Ze12w2FYGU51zVrUAJFDBMxInXhui
         Iop4AkoJoAUtffTRTnAT8HnDwN5NnvwrFgYcmJrY3o3eLUM6VMzyAyhn7R7cxJbDoeWP
         22Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXyQpmLoYw3KU+XiygDtXg3HznjptHRvp09g+rxYwby9ScgyIYZGeqhjo1TL/Y/8yg+WIyZ2hTBisfdzwOjEoV69bCUbDyOK9fo52cSqXw6VkZzDC187/8v
X-Gm-Message-State: AOJu0Yy4162YRYrEzujLtIS0NBo5CnVHsZSY9tb21PGqF9dGk1wmhEdq
	Q91BPjmxtJoLf9J8ghIswUFzRTbhjU6G1tw9npAb5ZIx/zt5J3o+GJF7v0v6dYChGbLYG4D3uC5
	QrIGhDsRl/hALvhy5Rw5TYjINizM=
X-Google-Smtp-Source: AGHT+IEHkvPP3pix3U5Br8jnLAgBcLflZjNlRo9PYlyWl1GaNdzJly3MRoGRv+N8g143agJmq1HWsj3j0OgSLnfznQQ=
X-Received: by 2002:ac2:5f06:0:b0:51b:d3a2:9d85 with SMTP id
 6-20020ac25f06000000b0051bd3a29d85mr2449612lfq.9.1714642418923; Thu, 02 May
 2024 02:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
 <AS1PR10MB569747BB183FCC2B2704775AFD182@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <42a41730981a22e3e7fc86b0971835f3c15a1488.camel@linuxfoundation.org>
In-Reply-To: <42a41730981a22e3e7fc86b0971835f3c15a1488.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 11:33:27 +0200
Message-ID: <CANNYZj_marSHb44R1QaOMTWfDha2kidJ_hEs_N2qaHCB1_u9fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] base/bitbake.conf: Introduce UNPACKDIR
To: richard.purdie@linuxfoundation.org
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 09:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198907

On Thu, 2 May 2024 at 09:48, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> Personally, I do like the idea but I'm not sure it aids
> readability/discoverability of the code.
>
> I've assumed people would shoot down the idea as the short vars do have
> a relatively negative following but if the majority were in favour...
>
> We could force an audit of all WORKDIR references by changing it to W
> too :) (I'm only half joking).

I think one-letter variables belong only in counters used by nested
for loops or code doing pure math and everywhere else one should take
the trouble to spell them out. It's a relic of archaic computers and
mathematicians programming them.

Alex

