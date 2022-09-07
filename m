Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A47ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:19:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.5606.1662542391419697680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=doga//4Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id c10so5742126ljj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=y8Pbt0RCdxMkxkZ8M6VqRlsLzSzkYTwLdeGXfvYYGso=;
        b=doga//4Y/tS1rYKbcvFbudOq3WP0RCdT+4MZNfMMKxjwK1OjUUzVL8/9B6A4vFgG8k
         cLBh86mNEZrYdZUk8H87LZQUNM/TZVdcCGNt/Q1V9tZyRBt9WprCKOyzDNuR7oycoB0v
         pLvuK81KdqsQz/Vca5Qeb09nzLjFBdXeftBAUfM2FaYg32iZtFYAAxs/CJZd8qQOVXn4
         1Kn9ropDjnhaH9FHeSIz1m0zfsEhzqB6kGFKZ2FhJvlq1Dn/60SUPK3g/ej/vQ/7Hos9
         XwCreKK2ZjXUCunKAX5zRKK+QPtOx+fimxQGlG1h2vDQhAQ8lsnDlVsdZznKe9bwdisj
         dd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=y8Pbt0RCdxMkxkZ8M6VqRlsLzSzkYTwLdeGXfvYYGso=;
        b=1JYPK6Ab7YEp5eZbmMW0sjpYMa4lSw/G3fb61F84BDxaPOnfuhDsiH8wD85Akxol2l
         WZEhf/5mON9iYHG93a44qlLrJob6rIyig+F0QIR57Z1Fu0LOBZzK18CWHM+Q9R41pF3x
         1IOve0W6yAjYPIQQ6TgwNZBG52q4aDZQYkf76Jz8JqM/e2Zb9sRYjyka1xqab3ZZRjdP
         pLaA2jj/tcY4pm7Dc2dfcccAUnraXM2TqS6hvh2iHp7OMHyeg0mkd2jzCMnD9iPEC4jc
         spi4CbK5WAgUea1UAaB9cU5nALXYXUbd2JpnsFQpL73xueBvxhOCdmzJkwtIG6ye2vJn
         CkVQ==
X-Gm-Message-State: ACgBeo1RRWHOkXsMOMdW1WeXfWB1mP9XM3hkYwNvJAw/A0MPuGTxtffY
	WEiHHKIWojgkcdREUBcpjK4nd5CZnvfohfhBKM4=
X-Google-Smtp-Source: 
 AA6agR5sGqB0fmMUpKcU6Kj4XaCR9PPu1VaQE248orXbhwNoJyAekgdWb+Fwvp2pa+gU8dCV5sKo+2KWE8ujn1ecTSg=
X-Received: by 2002:a2e:95c3:0:b0:26a:ca27:e7c3 with SMTP id
 y3-20020a2e95c3000000b0026aca27e7c3mr751835ljh.191.1662542389446; Wed, 07 Sep
 2022 02:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182141.1091053-1-alex@linutronix.de>
 <86b2113a64d9432126fe69f7fa15d7372ee5460d.camel@linuxfoundation.org>
In-Reply-To: 
 <86b2113a64d9432126fe69f7fa15d7372ee5460d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Sep 2022 11:19:37 +0200
Message-ID: 
 <CANNYZj_TVq=JZjdQK7D769bc=zpM1y62cByrmFM0yvTgseTxTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:19:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170378

On Wed, 7 Sept 2022 at 11:15, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> To set expectations, I'm probably not going to merge this for 4.1. I
> think we've taken some really good steps in the direction we need so
> far but we don't want to rush this. I haven't had the time needed to
> look at these patches properly due to everything else that was
> breaking.
>
> That doesn't stop review ad refining the patches ready for 4.2 opening.
> I'm open to representations if everyone thinks this is ready but I get
> the feeling many are distracted atm.

I'm fine with that; I'd like to add config fragments to it as well, to
make the case for this tool stronger. The plan is to split up
local.conf.sample.extended into those fragments as a showcase/testbed
for the feature.

The other two patches should be trivial to merge.

Alex

