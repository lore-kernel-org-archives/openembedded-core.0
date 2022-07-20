Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8A7C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 15:46:57 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.55564.1658332006747910931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 08:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pd6qxTXY;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a10so21575507ljj.5;
        Wed, 20 Jul 2022 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1No8H5MzrY/xOjBojMr7b4EpPyrKpEgLksi/Yr0pJkA=;
        b=Pd6qxTXYdbVUFMBO2aEWrwn2bZZgE0K1WW2rT6hyP5SFr2d0zSQmamrE4A1WKZorOK
         i4AnxL39/Uxn4Dg4UBvpdSqU5YYaa6LhNiJMHMIqkiN+AoNrSvapij3z47FUqc0ifcMv
         3bcPIC5v03atMsSduj+x6qJ24ucll8xFF4BqRURo6Nttc4TOG63tWA1/ckTJ09Y1sHjW
         fZIqFtQBgvIGzsVSP9gWuWi9wPs4hmga+yJ8ma0ZEkIzmHv7Y30USSLuDMdnILSEEWe/
         BIsWRJi8z980LBaWSJYcMSkxgF/80+0Mp6+HOlBKEfGCa5aOrtU9TZrKpp+aHmCZ+Jl9
         bOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1No8H5MzrY/xOjBojMr7b4EpPyrKpEgLksi/Yr0pJkA=;
        b=kW7laN/d0E9dnt4keIEF/9OWA0Hzkm8oZcAs7fpyJ6mkqsQrXQ1Fnv1Qr7YJO1LMap
         OiCxATFVV6ukW0rGRR2/J0GMvsT8F9wOh+lvVzfk0LYWB9XkFoCaYu0KM2QXCwOX40qD
         m70OrHrTLX4Cy6sJWg33v5r0NmrIrbUS1BKsny3YWPxHVFSfP4sHwCFM3SHm92Y/Zhm+
         88Rib6xCNP6SsF2Y72JwPafgWBJ17A71ZSZqcEtzlIGFKQ1YxGR0YQDk7fUMa4lF8o7A
         E5QOthUuDgy5CktduPubMie/NoCe66eAnJahi/NGw5jXIyxT/efEoUkkfPzHcbfA9STT
         yLlQ==
X-Gm-Message-State: AJIora+9zKKzLeA57NM+TJaHf8memxIJRoeJkXWPzzNzM5KamalU1TRV
	NclBWHZ2/gPeCbyfJ1fSt+TcBsBdudIjCpxs3iE=
X-Google-Smtp-Source: 
 AGRyM1u3DShfnCDvtH7NMmZKAGo9Xk2+CQTYANuvy3QEv1nAWDQdoUfUzjpVluUn/fCcLkMhZQp9H7igqM4IeKy68uE=
X-Received: by 2002:a05:651c:385:b0:25d:d821:e0e with SMTP id
 e5-20020a05651c038500b0025dd8210e0emr1138903ljp.56.1658332004980; Wed, 20 Jul
 2022 08:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <17037D268C38CE83.21682@lists.openembedded.org>
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
 <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
 <CANNYZj_kuU9GQMYwQyPjvqv47PYq=o8LXNbHzAVWdOwN7DFeNQ@mail.gmail.com>
 <7092d96e020932ff7c32a78b7862502bb0faddcc.camel@intel.com>
In-Reply-To: <7092d96e020932ff7c32a78b7862502bb0faddcc.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 17:46:33 +0200
Message-ID: 
 <CANNYZj_NsdbOXwnTTy27ME57MLV1yLv-f8tLQ9Jrz71aissONQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "Ross.Burton@arm.com" <Ross.Burton@arm.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 15:46:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168367

On Wed, 20 Jul 2022 at 17:41, Mittal, Anuj <anuj.mittal@intel.com> wrote:
> I don't know if there are any Yocto users of it who might notice.
>
> Instead of dropping the testing completely, may be we should switch to
> building/testing just the core-image-minimal image on autobuilder and
> keep at least some minimal support for now.

There's actually already a patch for that :)
https://lists.yoctoproject.org/g/yocto/message/56880

Alex

