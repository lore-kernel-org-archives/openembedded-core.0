Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24C4C6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 19:16:08 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.138.1663010166480990329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 12:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HcgP02gk;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id u9so22531068ejy.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 12:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3HQFyBD/58ejkbMNiov3IiO1aKDcx9IgacGdMAdGVtk=;
        b=HcgP02gkU0qGQywhTAt8EFzx/5gQsthnilIBU3bNnDyv0C9Opmv7grnxjZCrKhC6zj
         7v+oEhvZ5oS5Ol+d0TfJg6ZKqV6ojvfE2UARJA+mf2i4bgBr94t+13tkq/9dpTIaQnmn
         aKXqIFZ7RsRI8c1fi7+r3Y6YPRNf8yUKZn7spsQ5sVq8AYOcfSMPfIpgualsqptOWisG
         nglxc+W85wTIYXq37xkjmCG9WcxITHVpBp5y6/VExVzJi5ytY5WD6gbWS6UVYDLpzP5g
         5xpeHDH4jjnjBs63/B8azL8ZrECrRtGOrTX/XU/8PWNRY9loptH3McUgbe+OqWCwn3Np
         woMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3HQFyBD/58ejkbMNiov3IiO1aKDcx9IgacGdMAdGVtk=;
        b=4EF2hb8he8u7Yy3UZMmkDAL1IzAWb3u65uaeffdSVZTeLM566+GDU1t79bs8gVjmcr
         3Gl4MVwMCF3NHlHbmswHHTo6t/ce57NG3YkNUw+a8MSa64J16C1BYaL9nGhZ7UbtPFbb
         uwczy4jv9B11qtl7Gyw2BAJB2/CYBNirFQ8/0OUmMjMXdq+Onwogq9+ZoAY49aBekDdI
         2lj6Nh/Kd/PofddvdLTDEo7Onb478Tur6uCKYgsCDYQDiJaO63XZR3kdno9P2+2nhuTd
         VsF7aKb6rHPMMR9Lwc8OHVfLG9YI8hu92xhRGl34Lkgc+x7Y0SEz16zVFTQdlOZsbuyS
         +JsQ==
X-Gm-Message-State: ACgBeo3lG12Al3A0dMvb94F5osX8dwynQtkfrE1IWonI0Rv7HDcjhMx7
	2D0P3q0csF6WaR/3NumOG+DEXkNkhRZNdwMitpblWw==
X-Google-Smtp-Source: 
 AA6agR6jbVkC+u00Qv+fT+YZB8hs6OB5B0dGcdffFiMLPRs6t0T2zK33yWtkipBiKkIz0V+8PRX3QIzpU4yFNtuQ3tk=
X-Received: by 2002:a17:907:628a:b0:72f:678d:6047 with SMTP id
 nd10-20020a170907628a00b0072f678d6047mr19115951ejc.456.1663010164450; Mon, 12
 Sep 2022 12:16:04 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
 <CAApg2=RssQ94dKngx=5ph_QbyZsWnqS7LRJ9rg67Q6b6bZbMWw@mail.gmail.com>
 <CA+chaQcks8Dmpp0zgizGfqSsRbp+YxMMvsgmae6YutVP5mar4A@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcks8Dmpp0zgizGfqSsRbp+YxMMvsgmae6YutVP5mar4A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Sep 2022 09:15:53 -1000
Message-ID: 
 <CAOSpxdbSd4RwWPmw3mDq6KBjrbhEqNhUpcH-hNCcKkMTLQQJ9A@mail.gmail.com>
Subject: Re: [OE-core] CVE raffle: collision avoidance
To: Martin Jansa <martin.jansa@gmail.com>,
 Marta Rybczynska <rybczynska@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 19:16:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170543

On Mon, Sep 12, 2022 at 8:57 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> You mean this list?
> https://lists.yoctoproject.org/g/yocto-security/message/655

Yes, I assumed everyone was aware of the weekly CVE list!  Did you
have something else in mind?

Steve

> On Mon, Sep 12, 2022 at 8:56 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>>
>>
>>
>>
>> On Mon, 12 Sept 2022, 17:55 Steve Sakoman, <steve@sakoman.com> wrote:
>>>
>>> Reply to this thread noting which CVE you plan to work on.  Please
>>> don't claim one unless you really intend to follow through!
>>>
>> Hello Steve,
>> What about sending the list of pending CVEs (from the existing dunfell/kirkstone/master lists) for easier tracking?
>>
>> Kind regards,
>> Marta
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#170540): https://lists.openembedded.org/g/openembedded-core/message/170540
>> Mute This Topic: https://lists.openembedded.org/mt/93637108/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

