Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C004C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:20:10 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.140.1646846407598737860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XVlqR8pK;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id 11so2434256qtt.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AH5r++PL4HKfraki+uRs7bkuq0GFo0X/pltbz1v8EWs=;
        b=XVlqR8pKGs585HZ2McgX+FAAjQAhDbu6owzOnXgB3QDfBZU3iL+kI9cjHXdXSj/0Fp
         aT9XHHP0KGykGSzR4vtp2gWCGHZs2TaDMhSOPMgppCeFRJiL3CaMC2t27IFBjVXg+oPs
         W1+/bKN6gfR0b1sS13gbuI1Pfu0NTJS0SPjBaJbxtAewMeN1YLbp5wl39RS//xIP4jCs
         8FJin83RdMCc/Mzo8+SoGt5+pLOJnCMlnaZTwtUjN0Hu2qu0wO38Uw1HGdHpvUfDUOla
         /idIw5RdUz7Wp0WJYT+KIT1UjsEo47pp+jNtt3FrzJMrX9akWDnoBh6YCYUoIjAK41Hr
         JQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AH5r++PL4HKfraki+uRs7bkuq0GFo0X/pltbz1v8EWs=;
        b=0K+KM2JRWiPvDFLJU+rDRv8jnvvhS3t9VvJSUcVlYUa5+YRiXUVxcFsfWUlN3AR5hO
         hdiELrfYDjpAIPY5ZkeDspPSbAJ3/IuNyTYfH4j/KBbXaGEENVjyR1z9IeeADuHhzUAC
         VGCnSCgQQd2C9cp9yj0VjTf26syUNKhDEkPKWlQMxwQ3jj8OvXty7dAkWHp/m41891g3
         Z4sCz7EBaoSds6O5tzVmJ4SyABAgX/hz3cOI5Q1WH8Z/I7DVJnLxu9VRsRsWp5NO/H1z
         ylpH+qUby5Awb5rQtyO9Tt/Hs/GBbA4PjqE1vWy2xSDP/GoQhhpHJ7fUmmVcoX/vZyGp
         vy8A==
X-Gm-Message-State: AOAM532pPSZtJYYHX6CEJ0L9O6GPAcwspKpr38tLkPstK9+Lv+Xju6Hi
	NQ7aACPLxi2vjdaelzOKhaAzpxT8N0kqP5YZHB4=
X-Google-Smtp-Source: 
 ABdhPJy+exIQ+DOnUC2WzNvYQYbf8tIXXAmVa79/jonq5HAvocNeOM7yzbBU7edX8PMYJCdvVB8bC8fjCRgwOArmeRE=
X-Received: by 2002:a05:622a:1042:b0:2e1:378b:e200 with SMTP id
 f2-20020a05622a104200b002e1378be200mr610843qte.229.1646846406584; Wed, 09 Mar
 2022 09:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20220309150224.2661618-1-ross.burton@arm.com>
 <AM9PR09MB4642C97B03C03260CDB40D66A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTspNY6Davnnh1A+E3awnz4q4_=E2OdCZx_VbVZeLMtQLg@mail.gmail.com>
 <AM9PR09MB4642BB663E7CF8E1324DE136A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642BB663E7CF8E1324DE136A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 09:19:40 -0800
Message-ID: 
 <CAMKF1spMok7M-7oFS0FN2SE1e2BzYaF00pccDr_2NDe1LQohFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pip_install_wheel: install wheel with a glob
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:20:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162982

On Wed, Mar 9, 2022 at 7:57 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 09.03.22 16:53, Ross Burton wrote:
> > On Wed, 9 Mar 2022 at 15:47, Konrad Weihmann <kweihmann@outlook.com> wrote:
> >> Can we, for the very unlikely case that do have more than one wheel in
> >> this dir, bbfatal out here as well - otherwise I'm worried that this
> >> will never get noticed
> >
> > I'm undecided on this.  In the unlikely case (impossible, by design)
> > that a number of wheels are built for a single package, wouldn't we
> > want to install all of them as we're building the package?
>
> Classic assertion case IMO - as you said there shouldn't more than one,
> but in the event of having more than one, I would just terminate the
> build, as likely something is very wrong (like people playing around if
> task appends or custom tasks in between compile and install).
>
> I'm just concerned that this here would create a blind spot, where there
> none needed

will install work if there are more than one .whl file expected ?
I think we will get install failures, in that case it maybe just an
over optimization

>
> >
> > Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162968): https://lists.openembedded.org/g/openembedded-core/message/162968
> Mute This Topic: https://lists.openembedded.org/mt/89664344/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

