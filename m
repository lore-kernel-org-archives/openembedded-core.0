Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3199C41513
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 15:00:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.12873.1715266791972906832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 07:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ez/2r3tT;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-518931f8d23so1046378e87.3;
        Thu, 09 May 2024 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715266790; x=1715871590; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDJAW1M7LqgaN8MJMzs9DA87j2QjFk6WXu55OF1ZFe0=;
        b=ez/2r3tT2A69dRgktDKha5ooWhGFf0UTf8Sb6ENro7MK13Fb1Z43GmxtvhhccxgbHi
         6QPk8OHrvpM1Xgmmyf7Cbama0HCIukpfogWndj5PRJRatYcu83Y7QsRSjFg6r3k7ZiD6
         qxiLSimcm45IuUBmoDhuT5AAOKJk3C3OSCg/3ZRzxCoVhU7t9txO+2EIT6koyp57lBPe
         cCVAFYZPkae6A7tbx46mWNN5fHLjqgu6aby85U6Prii8uEOAamN9jNGttwUWaFV/Kt/3
         mZUjWjb6iWzO6o6XKHglniwuBUihJpGNQD/iuSThxjA83HXr39ybF6oBPDuL1LY00TOw
         Xsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715266790; x=1715871590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDJAW1M7LqgaN8MJMzs9DA87j2QjFk6WXu55OF1ZFe0=;
        b=eIZb74M1ZPwi9IFwn5NWH531bDeJM+CDU3vpbi2i7PEeR1AB0EgrVj0q6BwN0mGPVA
         8LlhmPqnHf++9P2WlFZENu5YSyOA8RXgsUdiEiRYMKKDwxRGFsjDA+rhk+KhrekvxPhS
         iE4EtVyGPRkvrB3/CYRY6c3PIrNti1aM3eTzz+uODgWJT3BYAsRX+BjYwPkxxO4Kthoj
         9b6+kV3dR9at6tH03NrxUVH0eiy2+quk4688r4+fYpXcL0ubfiyYu+gLxtKz9MU4ZczO
         MocLQdf4RNyWdoTpNdVEyqZEs5HLm4O4OdNxVpCOptE2Mum77GTew0bkbA5ViBBO5r//
         /94A==
X-Forwarded-Encrypted: i=1; AJvYcCVFxyOjfStS0PfKa323vikzb2mCkeiq+rsGsghtgLjk7wDiauiykC6ngfjxBxdxDoQawKnaNAKXVuRCoqxs8pDRxiaxaV+Ne/mbqaQAIHFxt0yt0ZvBuXzj1yJX/6zLr9fcpLuE3VEt+b25F5p+q5r5BL+EUA+mALRGSgiQlDm/67rCk+zY0wI+Se0=
X-Gm-Message-State: AOJu0YxkAvudcGnLqi8sbLFZTXpXe6IE1iSgvTzLunBD0hjSCA0y+YXE
	vCtE4VEuhwV29CBFjbnXNCoWZWtAz++TcoFqx+S/35cGIe/mdnoLDq920f5om10rZz+CuhJspLR
	/nPn9RMLgNKDwssuAvcjsA9p6pIs=
X-Google-Smtp-Source: AGHT+IHWEPYvEJQyAOpcrjUudp/eh0k6uREdq1yTpQNAHbu1ROOs00AGLEcPk9UshC3ZDTDNZNgYYGUzVSYhqIP1BZ8=
X-Received: by 2002:ac2:5e2d:0:b0:51b:567e:7ea4 with SMTP id
 2adb3069b0e04-5217c46c284mr3331621e87.26.1715266789938; Thu, 09 May 2024
 07:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <737087f797ecd87620bc96abab014d4fac6bb1e5.camel@linuxfoundation.org>
 <IA0PR14MB6188558226DBC7D15C1B36EF85E62@IA0PR14MB6188.namprd14.prod.outlook.com>
In-Reply-To: <IA0PR14MB6188558226DBC7D15C1B36EF85E62@IA0PR14MB6188.namprd14.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 May 2024 16:59:38 +0200
Message-ID: <CANNYZj8JtpUOxwV+B1uc5m-byUOkbmroAX-Lp=nbHNyr0s5pbg@mail.gmail.com>
Subject: Re: [yocto] Where are we at?
To: yocto@lists.yoctoproject.org, janne.kiiskila@izumanetworks.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 15:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199176

On Thu, 9 May 2024 at 14:50, Janne Kiiskila via lists.yoctoproject.org
<janne.kiiskila=3Dizumanetworks.com@lists.yoctoproject.org> wrote:
> Also, as is with things & the pain being in the right place - the people =
in power (i.e. people who can actually fund things) - are not going to ramp=
 up the funding, unless they start feeling the pain. This might be one way =
to getting that done. Or the more optimistic outlook being - some people wi=
ll step up & start helping more.

It would take something particularly drastic for the pain to even
register slightly. Such as:
- RP takes a leave of absence for an entire release cycle
- there's no release in the autumn
- all patches are rejected with that message

I strongly suspect this is both not feasible and at the same time not
enough, as the people in power will be able to ship their products
based on existing LTS versions, pile up patches in private trees and
derive an income from that for quite some time before their own
technical debt starts to sting.

Alex

