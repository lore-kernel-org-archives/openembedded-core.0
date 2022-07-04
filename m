Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC07C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:24:41 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.72615.1656944676818209620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jVwkjuDk;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id a13so16040759lfr.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=igDsvvty9eRtvPI0x0gUWMtZ1nxAzqugMQC2a781COU=;
        b=jVwkjuDkPivBN7m3aqkIe+s3Tl+/Lhglzipa4snXRes0IKNUQFwbWTMnOnGMO9MwfG
         m62vGuKXehJODTlSPPYhTzoCHVR5C/ud2ACuJB8tn7jYL7e4hQgTsjmg3tRrJL3A6hbB
         juVm1KF/yAS9Qm5a1S5onFM/SNoscqNwvqXfppXiKftVE7w93CwORQkBNLx9foD0JScB
         C8BnYJfp25uKulor28ivjpFYxI+SwDnt2JGefnhL0aputU2fu82i+LO6bug2mR+lMLY3
         SOI+Emex2l7Y1eoOXzMqFUkqMbkOKc4cNx2FNE83i6vhtJIu15nhIk8dLXYQ1EogRLx0
         SuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=igDsvvty9eRtvPI0x0gUWMtZ1nxAzqugMQC2a781COU=;
        b=OkHIMMzgTbMIIAYdZtFGGyCSU4j4QG49eIXiF/Ec2zyrC0boh+3xaXGZ32XCIyZeuP
         0ouRKNv9L0iQlv0LJRL6seJAh0uaLnv3giO4RZQpKvgviYtGROKU3QNETJc6X1YkGZpX
         3U0gFN+ItvBvfaluVN4y5XiPBPsJ7RZlLz5/q6GcT4GGsgdSz30ag5xIGFl7P8sGHdW2
         I1YDBDNfGRe8Ehq/qycEHz57CeOyU/LOQCq8UINvLaVVBsynoXI/QEoVMRFeQYTNKmD7
         cY+io+n0k2/mazF5Q3I5KoSdXOemn3823EGK+2J8AJ5GkuXnR0DLNihguJd5FVnhkpRu
         gPRg==
X-Gm-Message-State: AJIora+R72MqovvDQCjTKvyb4M2rdEPkGxao68lfZITEcbpiNwMnFGJo
	qrh4uIW+QymmBl4xVQuyrvh8pSSbOXq6eI32evM=
X-Google-Smtp-Source: 
 AGRyM1sGb68360NnQXSrXc34zT67ec0G7Obs27dmoQZ9pib4/NNdK4+WapO5RFP4jfr1sRxO5rU1LOqjKG0BYIbOcGM=
X-Received: by 2002:a05:6512:3b21:b0:47f:665a:bf50 with SMTP id
 f33-20020a0565123b2100b0047f665abf50mr19427561lfv.673.1656944674755; Mon, 04
 Jul 2022 07:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
 <CANNYZj_vu9dY==pXQE6VMB_cYKuq3T0TK-g0U4jv2kKHTzuA+g@mail.gmail.com>
 <576a6c208bd89721228fa201212a557778f01079.camel@linuxfoundation.org>
In-Reply-To: 
 <576a6c208bd89721228fa201212a557778f01079.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Jul 2022 16:24:23 +0200
Message-ID: 
 <CANNYZj_2ZJXOotiROS72EsSAspU3oRDAgA-t37kjipQVQMyA6A@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:24:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167616

On Mon, 4 Jul 2022 at 15:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I guess the go one might, and using it as a template for some of our
> other workarounds might also help some of the other patches upstream
> but I have no connection to golang so help there from anyone with
> better connections might help.
>
> The gperf one is a workaround, I doubt it would be accepted upstream
> unfortunately but I'm also not sure what else we can do about the
> issue.

Right, I was just asking to go through the mechanics of the upstream
submission. Basically trying to keep that weekly pending number from
going up :) Maybe just the gperf patch then? If they don't want the
patch, that's fine.

Alex

