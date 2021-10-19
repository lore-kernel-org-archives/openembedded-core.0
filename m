Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE260C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 17:03:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.12817.1634663013696732160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=hmogmAGG;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso4181161wms.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=emtT2eUFtvndGyLLxPyPtqKtjCDMIvSlhBnjZrIUT2w=;
        b=hmogmAGG4HdvucqtC7GsUw9aQH7tIXFx7bEL0PqFd5y8ACHz3JkccQpcSb8AVY4oDh
         xAsXDDCIzDhYAw0Oh7JYX2z3olexCdQTM1G+N64GFsb0VhfP3nY27sclPoeZZKK+csVW
         IZopHP5rh4SwKa6SvogANIIXViVDinwvceW4ylQbIWZYlfC/bFzIQmvTpgFIf8pRW1VJ
         dFxGTB4x3LIVxFelyosl4Cu0AehzBz6a3eXe/Wd7Ok9Fo7LUDi77m/hs6FDLfPODyS+D
         J/GqpRJCChBxXMHnFBorVS4M20RhptdO2A+aG5q+HL9jPUhCVuMajaFwehX9W6/bjKF0
         5Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=emtT2eUFtvndGyLLxPyPtqKtjCDMIvSlhBnjZrIUT2w=;
        b=qzMC6uFObhutNE8jc2uKNLimAfNz8Z9nSeXzxm8NQs4EkuWWfgQsypXMyTOp1W0I+Q
         pFhvgD+6gqXEQ9rtqGNxv14HyZzvLewBh95SpYbY5YLvHzmwsDQ9FMwtcCrAB0qH8jb2
         62ASd6aArFOZ6hZG1k0BjJglAlhG8plNh0K2NxnHi91mEF1nx1PsQ6AYth6LRc6L0HFE
         x+q9jXBNyziXqR3r4D2OnLPwywINb4p50yI25ltwxea2CgrFQ69/KqpjWFdPGJB94rYo
         GM+B8OXpEGyClhmkeQvw6tPG9lblzcVaPuuIKmR6ciHIXgf3pQA4aOrgTsHYbRpefr4g
         4cbg==
X-Gm-Message-State: AOAM532CX9NVpE5pYxazQ3GbikVL4ylfBDkOygYCKqAoE8FRFVnFFKrc
	fP6lGrIOna4IryJ3VJL8VbMA7roq0nKPBVaJGwxGbA==
X-Google-Smtp-Source: 
 ABdhPJy0e6kj1Kwdvi5fVN8wtquJElCeq7ZwqaKZaw+RmnWzILwTVUHxlIVX+TRF4ukT60Tu2EL/OJCpgI5kzLpiGr8=
X-Received: by 2002:adf:f48d:: with SMTP id l13mr45472611wro.94.1634663011635;
 Tue, 19 Oct 2021 10:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211019113529.1612190-1-ross.burton@arm.com>
 <20211019113529.1612190-2-ross.burton@arm.com>
 <ffc3f889-17ad-2195-08b9-52322577a832@gmail.com>
In-Reply-To: <ffc3f889-17ad-2195-08b9-52322577a832@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 19 Oct 2021 18:03:20 +0100
Message-ID: 
 <CAAnfSTskjcD0qyZ0Af0fi0zt2x0UYSSBv=4YJMYkYpxjNCzn_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gawk: reduce strictness of the time test
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 17:03:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157189

On Tue, 19 Oct 2021 at 13:04, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> I would have removed the test. These load-sensitive tests are gonna fail
> occasionally, whatever limit you put there.

I'm split on this.

Removing the test obviously means that it can never fail, whereas a
timeout will fail given potentially huge load.  But the bounds on a
timeout could be sufficiently large (say, up to 10 seconds instead of
1) to be fairly sure that the underlying code is in fact still
working, which is better than not testing at all.

Ross

