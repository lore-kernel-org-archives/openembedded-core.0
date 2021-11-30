Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C754EC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 21:20:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.83070.1638307245985339748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 13:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=21th0kjI;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id v11so47379478wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 13:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSlvqvJ34fiMcADjSobDCDcOjMMjQwCFCjnRcK7PhKk=;
        b=21th0kjIuSPsoeoIDk6fLgG3ITFdO5UA7inrSsgld2Nwv+09qni9ETaqKVVacqiWyW
         Q0RxNXHot7DRBhJo85fcgQdl8r6x9e79K4ilnZ+BSL4KyTMnd1DUyQlE1kEgOWXHHmpS
         4AiyvaQD8/GiNs6xb321uVNElf/HLtvhUfj14oULgkL6EueyDO5WawoH6KxHkBtwsw4c
         DqoOb3KtLuLrd7S2XfZrQmohM217lsnqPt9CqaGuGSv6uu1O+mxD7olTBRiu/FptzESa
         iMn0zX3gk+qSJ47V/5AW9S9R1dJLS1clE6Fq8a9hcC2KjOaB5iQE8Be/Yq6McC5z8urp
         1deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSlvqvJ34fiMcADjSobDCDcOjMMjQwCFCjnRcK7PhKk=;
        b=DkM0uPtRaqZH3lkUeXbiKS5eGb8dlIjtecMfeddNOOoHJgArXzOaTbs1tzqfIh/i5N
         PFuie+UqYakC6Pfog6wlZsvX6PFzjvw0lNJqvjsqHGd9DwgN/bGi7nxfdOnRqXwgeXbj
         rfPTAi15TR1SXSxvYCjkRpDcvruSrzsFKT1g/wxslESQnuP7oN8HDIDKcqUb86fdV6mB
         3iqpdwAb99vFhG1oQL4wGKz25jodRvX8iLwx93HhaxBn0K6Hw5Jlvz8AGINmwqoeMKAQ
         IUkJfWXvTQpPdnP1e298g/RzEo0RMHTcZNxlREHbcmetcKVcdYht3Fiwl8IY5wOeEFfD
         FEJQ==
X-Gm-Message-State: AOAM533lRnLgFUr95wa5AAFb1cpu14PfoQWoxcrGeaOE1tnadmX7Pyi1
	qNbb4O4rG8m6mt6C+ti8IjyYyDtKuHo0Rmj4eSL5LWdM3IuAnQ==
X-Google-Smtp-Source: 
 ABdhPJxXiOsKDlsNhZy9lw6VG4n1AMeX8x4D49jArNPP1Q1gJxD20/A5sJzOiUfHZU5K4k1UhYE9tYal1yPY4iUCy4Y=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr1712503wri.376.1638307244428;
 Tue, 30 Nov 2021 13:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 30 Nov 2021 21:20:33 +0000
Message-ID: 
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 21:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158996

On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> This isn't equivalent - it will cause a change in behaviour for anyone
> using PACKAGECONFIG += "foo" from a .bbappend.

Correct, but this is likely the only recipe in the greater ecosystem
which has this behaviour, so I'm not that bothered to be honest. :)

Ross

